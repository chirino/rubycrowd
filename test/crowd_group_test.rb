require 'crowd'
require 'test/unit'

class CrowdGroupTest < Test::Unit::TestCase
  
  def setup
    load_user_fixtures "users"
    $DEBUG = true
    @crowd = Crowd.new
    ensure_user_exists @user_1
    ensure_user_exists @user_2
    
    @group_1 = "delete-me"
    @crowd.add_group(@group_1)
    @crowd.add_user_to_group(@user_1.user_name, @group_1)
    @crowd.add_user_to_group(@user_2.user_name, @group_1)
    
  end
  
  def teardown
    try { @crowd.delete_group! @group_1 }
    try { @crowd.delete_user! @user_1.name }
    try { @crowd.delete_user! @user_2.name }
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
    end
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
  
  #-- this is overkill, could have just hardcoded user objects into the test
  def load_user_fixtures(name)
    data = YAML.load_file File.join(File.dirname(__FILE__), "#{name}.yml")
    # hmm, how do I dynamically add instance variables? data.each { |k,v| @`k` = User.new data[k] }
    @user_1 = User.new data['user_1']
    @user_2 = User.new data['user_2']
  end
  
  def test_look_ups
    rc = @crowd.find_all_group_names();
    rc = rc.find_all{|item| item == @group_1 }
    assert rc.length==1
    
    users = @crowd.find_users_in_group(rc[0]);
    p users
    assert_equal [@user_1.name, @user_2.name].sort, users.sort
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