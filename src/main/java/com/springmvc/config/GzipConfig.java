package com.springmvc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

@Configuration
public class GzipConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new GzipInterceptor());
    }

    private class GzipInterceptor extends HandlerInterceptorAdapter {
//        @Override
//        public void afterCompletion(HttpServletRequest request, HttpServletResponse response) throws IOException {
//            String encoding = request.getHeader("Accept-Encoding");
//            if(encoding !=null && encoding.contains(("gzeip"))){
//                GZIPOutputStream gzipOutputStream = new GZIPOutputStream(response);
//                response.addHeader("Content-Encoding","gzip");
//                response.setContentLength(-1);
//                gzipOutputStream.finish();
//                gzipOutputStream.flush();
//            }
//        }
    }
}
