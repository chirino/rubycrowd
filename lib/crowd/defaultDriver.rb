require 'crowd/default.rb'
require 'crowd/defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class SecurityServerPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://localhost:8095/crowd/services/SecurityServer"

  Methods = [
    [ "",
      "findPrincipalByName",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByName"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByNameResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "authenticateApplication",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticateApplication"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticateApplicationResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthenticationException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthenticationException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "addPrincipalToGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findRoleByName",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleByName"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleByNameResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "addRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidRoleException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidRoleException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findPrincipalByToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findPrincipalByTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "isGroupMember",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isGroupMember"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isGroupMemberResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "searchGroups",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchGroups"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchGroupsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "removeAttributeFromPrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeAttributeFromPrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeAttributeFromPrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "getDomain",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getDomain"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getDomainResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "isRoleMember",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isRoleMember"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isRoleMemberResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "removeRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "removePrincipalFromRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "addGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidGroupException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidGroupException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "updateGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updateGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updateGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "createPrincipalToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "createPrincipalToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "createPrincipalTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"InactiveAccountException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InactiveAccountException", :ns=>"urn:SecurityServer", :namespace=>nil}, "RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthenticationException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthenticationException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findRoleMemberships",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleMemberships"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findRoleMembershipsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "getCacheTime",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getCacheTime"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "getCacheTimeResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "removePrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "resetPrincipalCredential",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "resetPrincipalCredential"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "resetPrincipalCredentialResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidCredentialException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidCredentialException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findAllRoleNames",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllRoleNames"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllRoleNamesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "addPrincipalToRole",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToRole"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalToRoleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "invalidatePrincipalToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "invalidatePrincipalToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "invalidatePrincipalTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "searchPrincipals",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchPrincipals"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchPrincipalsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findGroupByName",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupByName"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupByNameResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findAllGroupNames",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllGroupNames"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllGroupNamesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "addAttributeToPrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addAttributeToPrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addAttributeToPrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "removePrincipalFromGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removePrincipalFromGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findGroupMemberships",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupMemberships"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findGroupMembershipsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "updatePrincipalCredential",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalCredential"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalCredentialResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidCredentialException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidCredentialException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "authenticatePrincipalSimple",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipalSimple"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipalSimpleResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"InactiveAccountException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InactiveAccountException", :ns=>"urn:SecurityServer", :namespace=>nil}, "RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthenticationException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthenticationException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "updatePrincipalAttribute",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalAttribute"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "updatePrincipalAttributeResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "findAllPrincipalNames",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllPrincipalNames"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "findAllPrincipalNamesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "searchRoles",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchRoles"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "searchRolesResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "isCacheEnabled",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isCacheEnabled"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isCacheEnabledResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "addPrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "addPrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidPrincipalException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidPrincipalException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidCredentialException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidCredentialException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "isValidPrincipalToken",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isValidPrincipalToken"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "isValidPrincipalTokenResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "removeGroup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeGroup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "removeGroupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ObjectNotFoundException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ObjectNotFoundException", :ns=>"urn:SecurityServer", :namespace=>nil}, "ApplicationPermissionException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"ApplicationPermissionException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ],
    [ "",
      "authenticatePrincipal",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipal"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "urn:SecurityServer", "authenticatePrincipalResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal,
        :faults => {"InactiveAccountException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InactiveAccountException", :ns=>"urn:SecurityServer", :namespace=>nil}, "RemoteException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"RemoteException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthorizationTokenException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthorizationTokenException", :ns=>"urn:SecurityServer", :namespace=>nil}, "InvalidAuthenticationException_"=>{:encodingstyle=>"document", :use=>"literal", :name=>"InvalidAuthenticationException", :ns=>"urn:SecurityServer", :namespace=>nil}} }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

