package com.proje.socialmedia.app.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.proje.socialmedia.app.model.Subscribe;

@Repository
public interface SubscribeDAO extends CrudRepository<Subscribe, Integer>{

}
