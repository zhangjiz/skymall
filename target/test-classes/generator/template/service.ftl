package ${basePackage}.service.layui;

import ${basePackage}.pojo.${modelNameUpperCamel};
import ${basePackage}.mapper.${modelNameUpperCamel}Mapper;
import ${basePackage}.common.layui.LayUiResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import tk.mybatis.mapper.entity.Example;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
/**
* @author ${author}
* @date ${date}
*/
@Service
public class LayUi${modelNameUpperCamel}Service{

    @Resource
    private ${modelNameUpperCamel}Mapper LayUi${modelNameUpperCamel}Mapper;

    /**
    *新增数据
    */
    public boolean add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        if (${modelNameLowerCamel}.getCreatTime() == null){
            ${modelNameLowerCamel}.setCreatTime(new Date());
        }
        if (${modelNameLowerCamel}.getUpdateTime() == null){
            ${modelNameLowerCamel}.setUpdateTime(new Date());
        }
        ${modelNameLowerCamel}.setDeleted("N");
        return this.LayUi${modelNameUpperCamel}Mapper.insert(${modelNameLowerCamel}) == 1;
    }
    /**
    *根据主键删除数据
    */
    public boolean delete(Integer id) {
        Example example = new Example(${modelNameUpperCamel}.class);
        example.createCriteria().andEqualTo("id",id);
        List<${modelNameUpperCamel}> list = this.LayUi${modelNameUpperCamel}Mapper.selectByExample(example);
        if (list.size() != 1){
            return false;
        }
        ${modelNameUpperCamel} ${modelNameLowerCamel} = new ${modelNameUpperCamel}();
        ${modelNameLowerCamel}.setId(list.get(0).getId());
        ${modelNameLowerCamel}.setDeleted("Y");
        ${modelNameLowerCamel}.setUpdateTime(new Date());
        return this.update(${modelNameLowerCamel});
    }

    /**
    *根据主键更新非空数据
    */
    public boolean update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}.setUpdateTime(new Date());
        return this.LayUi${modelNameUpperCamel}Mapper.updateByPrimaryKeySelective(${modelNameLowerCamel}) == 1;
    }

    /**
    *分页查询表中数据
    */
    public LayUiResult query(Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<${modelNameUpperCamel}> list = this.LayUi${modelNameUpperCamel}Mapper.selectAll();
        return new LayUiResult("0", "查询成功", new PageInfo<>(list).getTotal(), list);
    }

    /**
    *分页并搜索关键字
    */
     public LayUiResult search(Integer page, Integer limit,String keywords) {
        Example example = new Example(${modelNameUpperCamel}.class);
        example.createCriteria().andLike("${modeListDetails[0].name}", "%" + keywords + "%");
        PageHelper.startPage(page, limit);
        List<${modelNameUpperCamel}> list = this.LayUi${modelNameUpperCamel}Mapper.selectByExample(example);
        return new LayUiResult("0", "查询成功", new PageInfo<>(list).getTotal(), list);
    }
}
