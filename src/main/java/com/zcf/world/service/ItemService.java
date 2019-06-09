package com.zcf.world.service;

import com.zcf.world.common.exception.CommonException;
import com.zcf.world.common.exception.ExceptionEnum;
import com.zcf.world.mapper.ItemMapper;
import com.zcf.world.pojo.Item;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
/**
* @author 许宝予
* @date 2019/06/05
*/
@Service
public class ItemService{

    @Resource
    private ItemMapper itemmapper;
    @Resource
    private RedisTemplate redisTemplate;
    /**
     * 新增一条数据
     *
     * @param item item对象
     */
    public void addItem(Item item) {
        if (item.getCreatTime() == null){
            item.setCreatTime(new Date());
        }
        if (item.getUpdateTime() == null){
            item.setUpdateTime(new Date());
        }
        item.setDeleted("N");
        int count = this.itemmapper.insertSelective(item);
        if(count != 1){
             throw new CommonException(ExceptionEnum.SAVE_FAILURE);
        }
    }

    /**
     * 根据主键删除数据
     *
     * @param id 主键
     */
    public void deleteItemById(Integer id) {

        Example example = new Example(Item.class);
        example.createCriteria().andEqualTo("id",id);
        List<Item> list = this.itemmapper.selectByExample(example);
        if (list.size() != 1){
            throw new CommonException(ExceptionEnum.NULL_LIST);
        }
        Item item = new Item();
        item.setId(list.get(0).getId());
        item.setDeleted("Y");
        item.setUpdateTime(new Date());
        updateItem(item);
    }

    /**
     * 根据主键更新非空数据
     *
     * @param item item对象
     */
    public void updateItem(Item item) {
        item.setUpdateTime(new Date());
        int count = this.itemmapper.updateByPrimaryKeySelective(item);
        if(count != 1){
             throw new CommonException(ExceptionEnum.UPDATE_FAILURE);
        }
    }

    /**
     * 获取所有表中数据
     *
     * @return Item对象集合
     */
    public List<Item> getAllItem() {
        Example example = new Example(Item.class);
        example.createCriteria().andEqualTo("deleted","N");
        List<Item> list = this.itemmapper.selectByExample(example);
        if(CollectionUtils.isEmpty(list)){
            throw new CommonException(ExceptionEnum.DATA_DOES_NOT_EXIST);
        }
        return list;
    }

    /**
     * 根据主键获取单一数据
     *
     * @param id 主键
     * @return Item对象
     */
    public Item getItem(Integer id){
        Item Item = this.itemmapper.selectByPrimaryKey(id);
        if (Item == null) {
            throw new CommonException(ExceptionEnum.DATA_DOES_NOT_EXIST);
        }
        return Item;
    }

    /**
     * 商品名称模糊查询
     * @param itemTitle
     * @return
     */
    public List<Item> getitem(Integer userid,String itemTitle) {
        Example example=new Example(Item.class);
        example.createCriteria().andLike("itemTitle","%" + itemTitle + "%");
        List<Item>list=this.itemmapper.selectByExample(example);
        redisTemplate.opsForList().leftPush("searchHistory"+userid,itemTitle);
        return list;
    }


    public List<Item> searchHistory(Integer userid) {
        List<Item> list = (List<Item>)redisTemplate.opsForList().range("searchHistory"+userid,0,5);
        return list;
    }
}
