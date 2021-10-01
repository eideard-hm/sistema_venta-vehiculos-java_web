package com.webapp.repository;

import java.util.List;

public interface Repository<T> {
    List<T> findAll();

    T findById(Integer id);

    int save(T t);

    void delete(Integer id);
}
