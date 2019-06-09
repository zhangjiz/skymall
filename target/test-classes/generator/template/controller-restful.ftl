package ${basePackage}.controller.api;


import ${basePackage}.pojo.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import java.util.List;

/**
* @author ${author}
* @date ${date}
*/
@RestController
@RequestMapping("${modelNameLowerCamel}")
@Api(value = "${remarks}控制器", tags = {"${remarks}接口"})
public class ${modelNameUpperCamel}Controller {

    @Autowired
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @ApiOperation(value = "新增")
    @PostMapping(produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParams(value = {
    <#list modeListDetails as iteam>
        <#if iteam_index == 0>
            @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Integer"),
        <#else>
            <#if iteam.type =="int">
                @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Integer"),
            <#elseif iteam.type =="varchar">
                @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "String"),
            <#elseif iteam.type =="bigint">
                @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Long"),
            <#else>
                @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Date"),
            </#if>
        </#if>
    </#list>
    })
    public ResponseEntity<Void> add${modelNameUpperCamel}(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        this.${modelNameLowerCamel}Service.add${modelNameUpperCamel}(${modelNameLowerCamel});
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping(value="/{id}",produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParam(name = "id", value = "主键", dataType = "Integer")
    public ResponseEntity<Void> delete${modelNameUpperCamel}ById(@PathVariable Integer id) {
        this.${modelNameLowerCamel}Service.delete${modelNameUpperCamel}ById(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @ApiOperation(value = "修改")
    @PutMapping(produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParams(value = {
        <#list modeListDetails as iteam>
            <#if iteam_index == 0>
            @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Integer"),
            <#else>
                <#if iteam.type =="int">
            @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Integer"),
                <#elseif iteam.type =="varchar">
            @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "String"),
                <#elseif iteam.type =="bigint">
            @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Long"),
                <#else>
            @ApiImplicitParam(name = "${iteam.name}", value = "${iteam.remark}", dataType = "Date"),
                </#if>
            </#if>
        </#list>
    })
    public ResponseEntity<Void> update${modelNameUpperCamel}(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        this.${modelNameLowerCamel}Service.update${modelNameUpperCamel}(${modelNameLowerCamel});
        return ResponseEntity.ok(null);
    }

    @ApiOperation(value = "获取单个")
    @GetMapping(value = "/{id}",produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParam(name = "id", value = "主键", dataType = "Integer")
    public ResponseEntity<${modelNameUpperCamel}> get${modelNameUpperCamel}(@PathVariable Integer id) {
        return ResponseEntity.ok(this.${modelNameLowerCamel}Service.get${modelNameUpperCamel}(id));
    }

    @ApiOperation(value = "获取所有")
    @GetMapping(produces = {"application/json;charset=UTF-8"})
    public  ResponseEntity<List<${modelNameUpperCamel}>> getAll${modelNameUpperCamel}() {
       return ResponseEntity.ok(this.${modelNameLowerCamel}Service.getAll${modelNameUpperCamel}());
    }
}
