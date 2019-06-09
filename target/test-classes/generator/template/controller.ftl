package ${basePackage}.controller.console;

import ${basePackage}.common.layui.LayUiResult;
import ${basePackage}.common.utils.FileUploadUtils;
import ${basePackage}.pojo.${modelNameUpperCamel};
import ${basePackage}.service.layui.LayUi${modelNameUpperCamel}Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import java.util.Map;
/**
* @author ${author}
* @date ${date}
*/
@RestController
@RequestMapping("${baseRequestMapping}")
public class LayUi${modelNameUpperCamel}Controller {

    @Autowired
    private LayUi${modelNameUpperCamel}Service LayUi${modelNameLowerCamel}service;

    @RequestMapping(value ="add",produces = {"application/json;charset=UTF-8"})
    public boolean add(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        return this.LayUi${modelNameLowerCamel}service.add(${modelNameLowerCamel});
    }

    @RequestMapping(value ="delete",produces = {"application/json;charset=UTF-8"})
    public boolean delete(@RequestParam Integer id) {
        return this.LayUi${modelNameLowerCamel}service.delete(id);
    }

    @RequestMapping(value ="update",produces = {"application/json;charset=UTF-8"})
    public boolean update(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        return this.LayUi${modelNameLowerCamel}service.update(${modelNameLowerCamel});
    }

    @RequestMapping(value ="query",produces = {"application/json;charset=UTF-8"})
    public LayUiResult query${modelNameUpperCamel}(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "20") Integer limit) {
        return this.LayUi${modelNameLowerCamel}service.query(page,limit);
    }

    @RequestMapping(value ="search",produces = {"application/json;charset=UTF-8"})
    public LayUiResult search(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "20") Integer limit,
        @RequestParam String keywords) {
        return this.LayUi${modelNameLowerCamel}service.search(page,limit,keywords);
    }

    @RequestMapping(value ="upload",produces = {"application/json;charset=UTF-8"})
    public Map UploadBrand(@RequestParam("file") MultipartFile file){
        return FileUploadUtils.uploadLayUiImg(file,"img/");
    }
}
