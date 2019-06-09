package ${basePackage}.service;

import ${basePackage}.pojo.${modelNameUpperCamel};
import ${basePackage}.mapper.${modelNameUpperCamel}Mapper;
import tk.mybatis.mapper.entity.Example;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import com.zcf.world.common.exception.CommonException;
import com.zcf.world.common.exception.ExceptionEnum;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
/**
* @author ${author}
* @date ${date}
*/
@Service
public class ${modelNameUpperCamel}Service{

    @Resource
    private ${modelNameUpperCamel}Mapper ${modelNameLowerCamel}mapper;

    /**
     * 新增一条数据
     *
     * @param ${modelNameLowerCamel} ${modelNameLowerCamel}对象
     */
    public void add${modelNameUpperCamel}(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        if (${modelNameLowerCamel}.getCreatTime() == null){
            ${modelNameLowerCamel}.setCreatTime(new Date());
        }
        if (${modelNameLowerCamel}.getUpdateTime() == null){
            ${modelNameLowerCamel}.setUpdateTime(new Date());
        }
        ${modelNameLowerCamel}.setDeleted("N");
        int count = this.${modelNameLowerCamel}mapper.insertSelective(${modelNameLowerCamel});
        if(count != 1){
             throw new CommonException(ExceptionEnum.SAVE_FAILURE);
        }
    }

    /**
     * 根据主键删除数据
     *
     * @param id 主键
     */
    public void delete${modelNameUpperCamel}ById(Integer id) {

        Example example = new Example(${modelNameUpperCamel}.class);
        example.createCriteria().andEqualTo("id",id);
        List<${modelNameUpperCamel}> list = this.${modelNameLowerCamel}mapper.selectByExample(example);
        if (list.size() != 1){
            throw new CommonException(ExceptionEnum.NULL_LIST);
        }
        ${modelNameUpperCamel} ${modelNameLowerCamel} = new ${modelNameUpperCamel}();
        ${modelNameLowerCamel}.setId(list.get(0).getId());
        ${modelNameLowerCamel}.setDeleted("Y");
        ${modelNameLowerCamel}.setUpdateTime(new Date());
        update${modelNameUpperCamel}(${modelNameLowerCamel});
    }

    /**
     * 根据主键更新非空数据
     *
     * @param ${modelNameLowerCamel} ${modelNameLowerCamel}对象
     */
    public void update${modelNameUpperCamel}(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}.setUpdateTime(new Date());
        int count = this.${modelNameLowerCamel}mapper.updateByPrimaryKeySelective(${modelNameLowerCamel});
        if(count != 1){
             throw new CommonException(ExceptionEnum.UPDATE_FAILURE);
        }
    }

    /**
     * 获取所有表中数据
     *
     * @return ${modelNameUpperCamel}对象集合
     */
    public List<${modelNameUpperCamel}> getAll${modelNameUpperCamel}() {
        Example example = new Example(${modelNameUpperCamel}.class);
        example.createCriteria().andEqualTo("deleted","N");
        List<${modelNameUpperCamel}> list = this.${modelNameLowerCamel}mapper.selectByExample(example);
        if(CollectionUtils.isEmpty(list)){
            throw new CommonException(ExceptionEnum.DATA_DOES_NOT_EXIST);
        }
        return list;
    }

    /**
     * 根据主键获取单一数据
     *
     * @param id 主键
     * @return ${modelNameUpperCamel}对象
     */
    public ${modelNameUpperCamel} get${modelNameUpperCamel}(Integer id){
        ${modelNameUpperCamel} ${modelNameUpperCamel} = this.${modelNameLowerCamel}mapper.selectByPrimaryKey(id);
        if (${modelNameUpperCamel} == null) {
            throw new CommonException(ExceptionEnum.DATA_DOES_NOT_EXIST);
        }
        return ${modelNameUpperCamel};
    }

}
