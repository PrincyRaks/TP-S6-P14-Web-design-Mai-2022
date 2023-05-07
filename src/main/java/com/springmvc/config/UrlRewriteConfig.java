package com.springmvc.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.tuckey.web.filters.urlrewrite.UrlRewriteFilter;

@Configuration
public class UrlRewriteConfig extends UrlRewriteFilter {
    @Bean
    public FilterRegistrationBean urlRewriteFilter() {
        final FilterRegistrationBean filterRegBean = new FilterRegistrationBean();
        filterRegBean.setFilter(this);
        filterRegBean.addUrlPatterns("/*");
        filterRegBean.setName("UrlRewriteFilter");
        filterRegBean.setOrder(1);
        return filterRegBean;
    }
}