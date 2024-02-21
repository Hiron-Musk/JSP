package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
//hello 요청에만 필터 동작
@WebFilter("/hello.do")
public class FilterC implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//필터에서 처리될 로직 수행
		System.out.println("FilterC doFilter()...");
		
		//다음 필터로 요청
		chain.doFilter(request, response);
	}
}
