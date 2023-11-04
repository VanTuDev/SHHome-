package com.example.demo.dao;

import com.example.demo.beans.Paying;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.customizer.Define;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;

import java.util.List;
import java.util.Optional;
@RegisterBeanMapper(Paying.class)
public interface PayingDAO extends DAO<Paying>{
    @Override
    @SqlUpdate("INSERT INTO paying (id, numberOfMoney, description, createAt, status) " +
            "   VALUES              (:id, :numberOfMoney, :description, :dateTime, :status) ")
    @GetGeneratedKeys("id")
    long insert(@BindBean Paying Paying);



    @Override
    @SqlUpdate(" UPDATE paying SET status = 'thanh cong' WHERE id = :id")
    void update(@BindBean Paying Paying);

    @Override
    @SqlUpdate("")
    void delete(@Bind("id") long id);


    @Override
    @SqlQuery("SELECT p.id,p.postId,p.numberOfMoney,p.description,p.createAt,p.status  FROM paying p WHERE p.id = :id")
    Optional<Paying> getById(@Bind("id") long id);
    @SqlQuery("SELECT * FROM paying")
    List<Paying> getAll();


    @Override
    @SqlQuery("")
    List<Paying> getPart(@Bind("limit") int limit, @Bind("offset") int offset);

    @Override
    @SqlQuery("")
    List<Paying> getOrderedPart(@Bind("limit") int limit, @Bind("offset") int offset,
                                  @Define("orderBy") String orderBy, @Define("orderDir") String orderDir);
    @SqlQuery("SELECT * FROM paying WHERE description = :description")
    Optional<Paying> getDescription(@Bind("description") String description);
    @SqlQuery("SELECT p.id,p.postId,p.numberOfMoney,p.description,p.createAt,p.status  FROM paying p WHERE p.id = :id")
    Paying getPayingById(@Bind("id") long id);


    @SqlUpdate("INSERT INTO paying (id, postId, numberOfMoney, description, createAt, status) " +
            "   VALUES              (:id, :postId,:numberOfMoney, :description, :dateTime, :status) ")
    void insertNoReturn(@BindBean Paying Paying);
}
