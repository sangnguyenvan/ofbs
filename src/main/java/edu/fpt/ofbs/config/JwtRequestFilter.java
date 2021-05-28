package edu.fpt.ofbs.config;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import edu.fpt.ofbs.service.UserService;
import io.jsonwebtoken.ExpiredJwtException;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {
	@Autowired
	private UserService userService;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {

//		final String requestTokenHeader = request.getHeader("Authorization");
//
//		String username = null;
//		String jwtToken = null;
//
//		jwtToken = requestTokenHeader;
//		System.out.println(jwtToken);
//		try {
//			username = jwtTokenUtil.getUsernameFromToken(jwtToken);
//		} catch (IllegalArgumentException e) {
//			System.out.println("Unable to get JWT Token");
//		} catch (ExpiredJwtException e) {
//			System.out.println("JWT Token has expired");
//		}
//		if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
//
//			UserDetails userDetails = this.userService.loadUserByUsername(username);
//
//			if (jwtTokenUtil.validateToken(jwtToken, userDetails)) {
//
//				UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
//						userDetails, null, userDetails.getAuthorities());
//				usernamePasswordAuthenticationToken
//						.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
//				SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
//			}
//		}
//		chain.doFilter(request, response);
//		
//		if (jwtToken != null) {
//			String credentials = jwtToken.substring("Basic".length()).trim();
//			System.out.println(credentials);
//			if (!credentials.equals("")) {
//				byte[] decoded = DatatypeConverter.parseBase64Binary(credentials);
//				String decodedString = new String(decoded);
//				String[] actualCredentials = decodedString.split(":");
//				if (actualCredentials.length == 2) {
//					String ID = actualCredentials[0];
//					String Password = actualCredentials[1];
//					System.out.println(ID);
//					System.out.println(Password);
					chain.doFilter(request, response);
//				}
//			}
//		}
	}
}