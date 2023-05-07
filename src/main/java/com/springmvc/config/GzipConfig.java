package com.springmvc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.zip.GZIPOutputStream;

@Configuration
public class GzipConfig implements WebMvcConfigurer {
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new GzipInterceptor());
//    }
//
//    private class GzipInterceptor extends HandlerInterceptorAdapter {
//
//        @Override
//        public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//            String encoding = request.getHeader("Accept-Encoding");
//            if (encoding != null && encoding.contains("gzip")) {
//                GZIPOutputStream gzipOutputStream = new GZIPOutputStream(response.getOutputStream());
//                response.addHeader("Content-Encoding", "gzip");
//                response.setContentLength(-1);
//                gzipOutputStream.finish();
//                gzipOutputStream.flush();
//            }
//        }
//
//    }

}