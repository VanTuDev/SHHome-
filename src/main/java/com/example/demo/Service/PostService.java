package com.example.demo.Service;



import com.example.demo.beans.Post;
import com.example.demo.dao.PostDAO;

import java.util.List;

public class PostService extends Service<Post, PostDAO> implements PostDAO {

    public PostService() {
        super(PostDAO.class);
    }

    @Override
    public int count() {
        return jdbi.withExtension(PostDAO.class, PostDAO::count);
    }

    @Override
    public int countByQuery(String query) {
        return jdbi.withExtension(PostDAO.class, dao -> dao.countByQuery(query));
    }

    @Override
    public List<Post> getByQuery(String query, int limit, int offset) {
        return jdbi.withExtension(PostDAO.class, dao -> dao.getByQuery(query, limit, offset));
    }
    @Override
    public List<Post> getPostByRoomType(long id, int limit, int offset) {
        return jdbi.withExtension(PostDAO.class, dao -> dao.getPostByRoomType(id, limit, offset));
    }

    @Override
    public int countByQueryType(long id) {
        return jdbi.withExtension(PostDAO.class, dao -> dao.countByQueryType(id));
    }

    @Override
    public List<Post> getPostByDistrictCode(String districtCode, int limit, int offset) {
        return jdbi.withExtension(PostDAO.class, dao -> dao.getPostByDistrictCode(districtCode, limit, offset));
    }

    @Override
    public int countByQueryDistrictCode(String districtCode) {
        return jdbi.withExtension(PostDAO.class, dao -> dao.countByQueryDistrictCode(districtCode));
    }



}
