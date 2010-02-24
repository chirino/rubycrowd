# ===========================================================================
# Copyright (C) 2009, Progress Software Corporation and/or its 
# subsidiaries or affiliates.  All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===========================================================================
require 'crowd'
require 'test/unit'

class CrowdTest < Test::Unit::TestCase
  
  def setup
    load_fixtures "users"
    $DEBUG = false
    @crowd = Crowd.new
    ensure_user_exists @user_1
  end
  
  def teardown
    try { @crowd.delete_user! @user_1.name }
    @crowd = nil
  end
  
  def try
    begin
      yield
    rescue SOAP::FaultError
      #p $!
    end
  end

  def ensure_user_exists(u)
    try do
      @crowd.add_user u.user_name, u.email, u.first_name, u.last_name, u.password
      @crowd.add_user_to_group u.name, u.groups[0]
    end
  end

  def ensure_user_does_not_exist(u)
    try do
      user = @crowd.find_by_name u.name
      if user
        @crowd.delete_user! u.name     
      end
    end
  end
    
  def test_authenticate_user
    token = @crowd.authenticate_user(@user_1.name, @user_1.password)
    assert_not_nil token
    # token should end with "00" e.g. Ss6xetFpr681v7jyM85HDg00
    # was "==" but non-alphanumeric are now replaced with 0
    # http://jira.atlassian.com/browse/CWD-385
    assert_equal 24, token.length
    assert_equal "00", token[-2,2]
  end
  
  # helper method
  def assert_soap_fault(message)
    begin
      yield
      fail "*Expecting* SOAP::Fault #{message}"
    rescue SOAP::FaultError => e
      assert_equal message, e.to_s
    end
  end
  
  def test_authenticate_invalid_user
    user_name = "ZZZZZZZZZZZZ"
    assert_soap_fault "Login failed #{user_name}" do
      token = @crowd.authenticate_user(user_name, @user_1.password)
    end
  end
  
  def test_authenticate_invalid_password
    #assert_soap_fault "Failed to authenticate principal, password was invalid" do
    # TODO fix in Custom Java Code
    assert_soap_fault "Login failed #{@user_1.name}" do
      @crowd.authenticate_user(@user_1.name, @user_1.password.reverse)
    end
  end
  
  def test_authenticate_invalid_application
    application_name = "bogus_application"
    assert_soap_fault "Failed to find com.atlassian.crowd.model.application.Application with name: #{application_name}" do
      @crowd.authenticate_user(@user_1.name, @user_1.password, application_name)
    end
  end

  def test_authenticate_unauthorized_application
    application_name = "crowd"
    #assert_soap_fault "Application: #{application_name} Principal: #{@user_1.name}" do
    # TODO fix message in Custom Java Code
    assert_soap_fault "com.atlassian.crowd.manager.application.ApplicationAccessDeniedException: " + \
     "Application: #{application_name} Principal: #{@user_1.name}" do
      @crowd.authenticate_user(@user_1.name, @user_1.password, application_name)
    end
  end
  
  def test_find_by_name
    principal = @crowd.find_by_name(@user_1.name)
    assert_equal @user_1.name, principal.name
    assert_equal @user_1.email, principal.mail
    assert_equal @user_1.first_name, principal.givenName
    assert_equal @user_1.last_name, principal.sn
  end
  
  def test_find_by_token
    token = @crowd.authenticate_user(@user_1.name, @user_1.password)
    user = @crowd.find_by_token(token)
    assert_equal @user_1.name, user.name 
  end
  
  def test_add_user

    u = @user_2
    ensure_user_does_not_exist @user_2

    user = @crowd.add_user(u.name, u.email, u.first_name, u.last_name, u.password, "created_by" => "Ruby" )
    # ensure we can find the new user
    user = @crowd.find_by_name(u.name)

    # make sure they're really the same
    assert_equal u.name, user.name
    assert_equal u.email, user.mail
    assert_equal u.first_name, user.givenName
    assert_equal user.last_name, user.sn
    # Chariot Java Code does to store extra attributes...
    #assert_equal "Ruby", user.created_by

  end
  
  def test_delete_user

    u = @user_2
    ensure_user_exists @user_2

    user = @crowd.find_by_name u.name
    assert_equal u.name, user.name
    assert_equal u.email, user.mail
    assert_equal u.first_name, user.givenName
    assert_equal user.last_name, user.sn

    @crowd.delete_user! u.name     

    assert_soap_fault \
     "Could not find user with name \"#{u.name}\" in any of the assigned directories to application: ruby" do
      @crowd.find_by_name(u.name)
    end  
  end
  
  def test_add_duplicate_user_name
    assert_soap_fault "Principal already exists with name #{@user_1.name}" do
      user = @crowd.add_user(@user_1.name, "X#{@user_1.email}", "X#{@user_1.first_name}", "X#{@user_1.last_name}", "X#{@user_1.password}" )
    end
  end
  
  def test_add_duplicate_email
    assert_soap_fault "PreparedStatementCallback; SQL [INSERT INTO user (user_name, first_name, last_name, email, company, title, phone, country, account_disabled, password, created) VALUES (?,?,?,?,?,?,?,?,?,?,?)]; Duplicate entry 'jane.test@chariotsolutions.com' for key 3; nested exception is com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException: Duplicate entry 'jane.test@chariotsolutions.com' for key 3" do
      user = @crowd.add_user("X#{@user_1.name}", @user_1.email, "X#{@user_1.first_name}", "X#{@user_1.last_name}", "X#{@user_1.password}" )
    end
  end
  
  def test_update_attribute
    
    user = @crowd.find_by_name @user_1.name
    assert_equal @user_1.email, user.email
    
    new_email = "#{@user_1.first_name}.#{@user_1.last_name}@localhost"
    @crowd.update_user_attribute @user_1.name , "mail", new_email

    # fetch the user again to check for updated attributes
    updated_user = @crowd.find_by_name(@user_1.name)

    # ensure the email address got updated
    assert_equal new_email, updated_user.email
        
  end
  
  def test_crowd_user    
    user = @crowd.find_by_name(@user_1.name)

    assert_equal @user_1.name, user.name
    assert_equal @user_1.first_name, user.attributes["givenName"]
    assert_equal @user_1.email, user.mail
  end
  
  def test_user_valid_token
    token = @crowd.authenticate_user(@user_1.name, @user_1.password)
    assert (@crowd.valid_user_token? token)    

    user_agent = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.4) Gecko/20070515 Firefox/2.0.0.4"
    remote_address = "127.0.0.1"
    token = @crowd.authenticate_user(@user_1.name, @user_1.password, "ruby", user_agent, remote_address)
    
    # the actual token value is server dependant
    # assert_equal "o0QzCi5jBhNL03oKtkBCDg00", token
    assert (@crowd.valid_user_token? token, user_agent, remote_address)
  
    assert (not @crowd.valid_user_token? token, user_agent, "238.0.0.1")
    assert (not @crowd.valid_user_token? token, "Mozilla/5.0 (compatible; Yahoo! Slurp China; http://misc.yahoo.com.cn/help.html)", remote_address)
  end
  

  # DISABLED - I don't undestand what invalidate_user_token does
  # def test_invalidate_user_token
  #   token = @crowd.authenticate_user(@user_1.name, @user_1.password)
  #   assert (@crowd.valid_user_token? token)
  #   @crowd.invalidate_user_token(@user_1.name)
  #   assert (not @crowd.valid_user_token? token)
  # end
  
  def test_group
    
    user = @user_1
    group = 'customer-test'
    
    assert (not @crowd.group_member? user.name, group), "#{user.name} is already a member of group #{group}"

    @crowd.add_user_to_group user.name, group    
    assert (@crowd.group_member? user.name, group)    

    groups = @crowd.find_group_memberships user.name
    assert (groups.length > 0)
    assert (groups.include? group)

    @crowd.remove_user_from_group user.name, group    
    assert (not @crowd.group_member? user.name, group)

    groups_after_remove = @crowd.find_group_memberships user.name

    # ensure the user in one less group 
    assert_equal groups.length - 1, groups_after_remove.length
    
  end
  
  def test_change_password
    new_password = "QQQ#{@user_1.password}"
    @crowd.change_password @user_1.name, new_password
    token = @crowd.authenticate_user @user_1.name, new_password
    user = @crowd.find_by_token token
    assert_equal @user_1.email, user.email
  end
  
  def test_search_by_name
    users = @crowd.search_users "principal.name" => @user_1.name
    assert_equal 1, users.length
    assert_equal users[0].name, @user_1.name 
    assert_equal users[0].email, @user_1.email
    
    users = @crowd.search_users "principal.name" => Time.now
    assert_equal 0, users.length    
  end
  
  def test_search_by_email
    users = @crowd.search_users "principal.email" => @user_1.email
    assert_equal 1, users.length
    assert_equal users[0].name, @user_1.name 
    assert_equal users[0].email, @user_1.email
    
    users = @crowd.search_users "principal.email" => Time.now
    assert_equal 0, users.length
  end
  
  def test_search_multiple_results
    users = @crowd.search_users "account.disabled" => false
    assert users.length > 1
  end
  
  def test_reset_password
    @crowd.reset_password! @user_1.name
    assert_soap_fault "Login failed #{@user_1.name}" do
      token = @crowd.authenticate_user(@user_1.name, @user_1.password)
    end
  end
  
  #-- this is overkill, could have just hardcoded user objects into the test
  def load_fixtures(name)
    data = YAML.load_file File.join(File.dirname(__FILE__), "#{name}.yml")
    # hmm, how do I dynamically add instance variables? data.each { |k,v| @`k` = User.new data[k] }
    @user_1 = User.new data['user_1']
    @user_2 = User.new data['user_2']
  end

end

class User

  def initialize(attributes)
   @attributes = attributes 
  end
  
  def method_missing(attribute_name)
    @attributes["#{attribute_name}"]
  end
  
  def name
    @attributes['user_name']
  end
  
end