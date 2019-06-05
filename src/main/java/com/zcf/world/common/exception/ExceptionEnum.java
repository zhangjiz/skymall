package com.zcf.world.common.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 全局异常的枚举
 *
 * @author yuan
 * @date 2018/11/6 0006
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExceptionEnum {

    INVALID_PAY_TYPE(400, "暂不支持的支付类型"),
    PAY_NO_MONEY(400, "金额不足"),
    ALI_PAY_IS_ALREADY_EXISTED(400, "该支付宝账号已被注册"),
    WE_CHAT_IS_ALREADY_EXISTED(400, "该微信号已被注册"),
    CITY_BE_NULL(400, "未选择城市"),
    INVALID_FILE_TYPE(400, "无效文件类型"),
    PHONE_STORY_BE_NULL(404, "没有查到该故事"),
    PHONE_NUMBER_BE_NULL(400, "手机号不能为空"),
    PHONE_NUMBER_IS_REGISTERED(400, "手机号已注册"),
    REGISTER_CODE_MISMATCH(400, "验证码不匹配"),
    USER_PASSWORD_MISMATCH(400, "用户密码不匹配"),
    USER_KET_MISMATCH(400, "用户ID不能为空"),
    PHONE_NUMBER_IS_NOT_FOUND(404, "该手机号不存在"),
    USER_IS_NOT_FOUND(404, "该用户不存在"),
    HOUSE_LISTING_BE_REPEAT(404, "没有查到该房源"),
    GOODS_LISTING_BE_REPEAT(404, "没有查到该分类"),
    HOUSE_LABEL_BE_REPEAT(404, "没有查到该房源"),
    HOME_PAGE_GROUPS_BE_NULL(404, "没有找到首页分组"),
    HONE_BANNER_BE_NULL(404, "没有找到轮播图"),
    SAVE_FAILURE(500, "创建失败"),
    UPDATE_FAILURE(500, "更新失败"),
    DELETE_FAILURE(500, "删除失败"),
    PARAMETER_CAN_NOT_BE_EMPTY(400, "参数不能为空"),
    WE_CHAT_PAY_FILE(400, "微信下单失败"),
    SIGN_IS_INCORRECT(400, "微信签名异常"),
    DATA_DOES_NOT_EXIST(404,"没有查询到该数据"),
    THE_DEFAULT_ADDRESS_DOES_NOT_EXIST(404,"默认地址不存在"),
    NULL_LIST(404,"未查询到数据"),
    LIST_THROW(100,"数据异常"),
    REGISTER_CODE_FILE(400,"发送验证码失败"),
    OLDPWDNO(100,"旧密码错误")
    ;
    private int code;
    private String msg;
}
