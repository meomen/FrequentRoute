package com.carpooling.frequentroute.controller;

import com.carpooling.frequentroute.entity.ErrorMessage;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

@RestControllerAdvice
public class ExectionController {
    @ExceptionHandler(Exception.class)
    public ErrorMessage TodoException(Exception ex, WebRequest request) {
        return new ErrorMessage(10100, ex.getLocalizedMessage());
    }
}
