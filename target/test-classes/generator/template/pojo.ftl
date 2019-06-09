package ${basePackage}.pojo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
/**
* @author ${author}
* @date ${date}
*/
@Data
@Table(name = "${tableName}")
@ApiModel(value = "${remarks}模型", description = "${remarks}信息")
public class ${modelNameUpperCamel}{
<#list modeListDetails as iteam>
<#if iteam_index == 0>
    @Id
    @ApiModelProperty(value = "主键", required = true, position = 1)
    private Integer ${iteam.name};
<#else>
        <#if iteam.type =="int">
    @ApiModelProperty(value = "${iteam.remark}", position = ${iteam_index+1})
    private Integer ${iteam.name};
        <#elseif iteam.type =="varchar">
    @ApiModelProperty(value = "${iteam.remark}", position = ${iteam_index+1})
    private String ${iteam.name};
        <#elseif iteam.type =="bigint">
    @ApiModelProperty(value = "${iteam.remark}", position = ${iteam_index+1})
    private Long ${iteam.name};
        <#else>
    @ApiModelProperty(value = "${iteam.remark}", position = ${iteam_index+1})
    private Date ${iteam.name};
        </#if>
 </#if>
</#list>
}
