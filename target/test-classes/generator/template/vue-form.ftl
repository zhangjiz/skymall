<template>
    <v-form v-model="valid" ref="my${modelNameUpperCamel}Form">
        <#list modeListDetails as iteam>
            <#if iteam.type !="datetime">
                <#if iteam_index != 0>
        <v-text-field v-model="${modelNameUpperCamel}.${iteam.name}" label="${iteam.remark}" required />
                </#if>
            </#if>
        </#list>
        <v-layout class="my-4" row>
            <v-spacer/>
            <v-btn @click="submit" color="primary">提交</v-btn>
            <v-btn @click="clear">重置</v-btn>
        </v-layout>
    </v-form>
</template>

<script>
    export default {
        name: "${modelNameUpperCamel}-form",
        props: {
            old${modelNameUpperCamel}: {
                type: Object
            },
            isEdit: {
                type: Boolean,
                default: false
            }
        },
        data() {
            return {
                valid: false, // 表单校验结果标记
            ${modelNameUpperCamel}: {
                    message: '', // 品牌名称
                }
            }
        },
        methods: {
            submit() {
                this.$http({
                    method: this.isEdit ? 'put' : 'post',
                    url: '${modelNameLowerCamel}',
                    data: this.$qs.stringify(this.${modelNameUpperCamel})
                }).then(() => {
                    // 关闭窗口
                    this.$emit("close");
                this.$message.success("保存成功！");
            })
            .catch(() => {
                    this.$message.error("保存失败！");
            });
            },
            clear() {
                // 重置表单
                this.$refs.my${modelNameUpperCamel}Form.reset();
            }
        },
        watch: {
            old${modelNameUpperCamel}: {// 监控oldBrand的变化
                handler(val) {
                    if (val) {
                        // 注意不要直接复制，否则这边的修改会影响到父组件的数据，copy属性即可
                        this.${modelNameUpperCamel} = Object.deepCopy(val)
                    } else {
                        // 为空，初始化该组件
                        this.${modelNameUpperCamel} = {
                            massage: '',
                     <#list modeListDetails as iteam>
                         <#if iteam.type !="datetime">
                            <#if iteam_index != 0>
                        ${iteam.name}: '',
                             </#if>
                         </#if>
                     </#list>
                        }
                    }
                },
                deep: true
            }
        }
    }
</script>

<style scoped>

</style>
