
var NgbBodyStart = new function __NgbBodyStart()
{
	var _ngb_bodystart_redirecturl = null;
	this.setRedirectURLAfterLogout = function ( strRedirect ) 
	{
		_ngb_bodystart_redirecturl = strRedirect;
	}
	
	this.checkRedirectAndLogout = function () 
	{
		if( _ngb_bodystart_redirecturl == null )
			NgbLogin.Logout();
		else
			NgbLogin.Logout( _ngb_bodystart_redirecturl );
	}
}

function doUpdateSession()
{
	if( NgbMember.IsLogin() 	// 웹세션이 존재하는 경우만, Auth Server 에 UpdateSession
	&& location.href.toLowerCase().indexOf( "/localhost/" ) == -1  
	&&  location.href.toLowerCase().indexOf("?url=_comp/login_notlogin") == -1
	&&  location.href.toLowerCase().indexOf("?url=login/logout") == -1
	&&  location.href.toLowerCase().indexOf("?url=login/loginproc") == -1)
	{
		AuthSystem.UpdateSession( onUpdateResponse );
	}
}

var objUpdateInterval = null;
function onUpdateResponse( resultObject, responseXML )
{
	if( resultObject.ErrorCode == undefined 
	|| resultObject.ErrorCode == AuthSystemError.SessionDataNotExist )	// Auth Server 에 Session 이 존재하지 않으므로, 로그아웃 처리
	{
		NgbLogin.Logout();
	}
	else if( resultObject.ErrorCode == CommonError.NoError )		// OK
	{
		window.clearInterval( objUpdateInterval );
		objUpdateInterval = setInterval( "doUpdateSession()", resultObject.UpdateInterval * 1000 );	// ExpireLimit(Second) 이후, UpdateSession
	}
	else if( resultObject.ErrorCode == AuthSystemError.Disconnected )
	{
		alert( "다른 브라우저에서 로그인을 시도하여 로그아웃 됩니다." );
		NgbLogin.Logout();
	}
	else if( resultObject.ErrorCode == AuthSystemError.InvalidUserIP ) {
		alert( "로그인한 IP주소와 현재 IP주소가 일치하지 않아 로그아웃 됩니다.\r\n넥슨ID 보호를 위해 다시 로그인 해주세요.\r\n(IP 변경이 일어날 수 있는 서비스나 기능을 사용하는 경우,\r\n해제 후 이용해주세요.)" );
		NgbLogin.Logout();
	}
	else if ( resultObject.ErrorCode == AuthSystemError.ProtectedAccount ) {
		alert("고객님의 넥슨ID가 보호모드로 적용되어 로그아웃 되었습니다.\r\n다시 로그인하시면 보호모드 해제 후 안전하게 서비스를\r\n이용할 수 있습니다.");
		NgbLogin.Logout();
	}
	else if ( resultObject.ErrorCode == AuthSystemError.BlockedByAdmin ) {
		alert("관리자에 의해 서비스 이용이 제한되어 로그아웃 되었습니다.\r\n넥슨 고객센터로 문의해주세요.");
		NgbLogin.Logout();
	}
	else if ( resultObject.ErrorCode == AuthSystemError.InvalidHWID ) {
		alert("브라우저 정보가 변경되어 로그아웃 됩니다.\r\n다시 로그인 후 서비스를 이용해주세요.");
		NgbLogin.Logout();
	}
	else if ( resultObject.ErrorCode == AuthSystemError.InvalidReferer 
		|| resultObject.ErrorCode == AuthSystemError.GetSessionRepositoryError
		|| resultObject.ErrorCode == AuthSystemError.SetSessionRepositoryError) {
			//bypass
	}
	else
	{
		// Error 상황으로 Debeg 를 위한 정보 출력
/*
		Debug.Print( 'onUpdateResponse(' + resultObject._cs + ')<br>\r\n'
				+ 'resultObject.ErrorCode = ' + resultObject.ErrorCode + '<br>\r\n'	// 결과(0 이 아니면 에러, 에러 코드 참조)
				+ 'resultObject.ErrorMessage = ' + resultObject.ErrorMessage + '<br>\r\n'
				+ 'resultObject.NewPassport = ' + resultObject.NewPassport + '<br>\r\n'
				+ 'resultObject.UnreadNoteCount = ' + resultObject.UnreadNoteCount + '<br>\r\n'
				+ 'resultObject.StatusFlag = ' + resultObject.StatusFlag + '<br>\r\n'
				+ 'resultObject.UpdateInterval = ' + resultObject.UpdateInterval + '<br>\r\n' );
*/
		alert( "넥슨 웹사이트에서 로그아웃 되었습니다. " );
		NgbBodyStart.checkRedirectAndLogout();
	}
}

setTimeout( "doUpdateSession()", 1 );	// ExpireLimit(Second) 이후, UpdateSession


