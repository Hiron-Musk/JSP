package sub3;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

@WebListener
public class MySessionListener implements HttpSessionAttributeListener {

	int count=0;
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {

		//세션에 추가될 때 호출(session.setAttrubute시 호출)
		
		System.out.println("attributeAdded()...");
		count++;
		
		System.out.println("현재 로그인 총 사용자 : "+count);
	}
	
	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {

		//세션에 해제될 때 호출(session.invalidate()시 호출)
		System.out.println("attributeRemoved()...");
		
		count--;
		System.out.println("현재 로그인 총 사용자 : "+count);
		
	}

}
