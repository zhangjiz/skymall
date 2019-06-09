package com.zcf.world.controller.api;


import com.zcf.world.pojo.Item;
import com.zcf.world.service.ItemService;
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
* @author 许宝予
* @date 2019/06/05
*/
@RestController
@RequestMapping("item")
@Api(value = "商品表控制器", tags = {"商品表接口"})
public class ItemController {

    @Autowired
    private ItemService itemService;

    @ApiOperation(value = "新增")
    @PostMapping(produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParams(value = {
            @ApiImplicitParam(name = "id", value = "", dataType = "Integer"),
                @ApiImplicitParam(name = "itemTitle", value = "商品标题", dataType = "String"),
                @ApiImplicitParam(name = "itemDetails", value = "商品详情", dataType = "String"),
                @ApiImplicitParam(name = "itemPurchase", value = "商品进价", dataType = "Date"),
                @ApiImplicitParam(name = "itemPrice", value = "售价", dataType = "Date"),
                @ApiImplicitParam(name = "takeDeliveryPrice", value = "提货券价格", dataType = "Date"),
                @ApiImplicitParam(name = "itemImg", value = "商品列表图片", dataType = "String"),
                @ApiImplicitParam(name = "creatTime", value = "", dataType = "Date"),
                @ApiImplicitParam(name = "updateTime", value = "", dataType = "Date"),
                @ApiImplicitParam(name = "deleted", value = "", dataType = "String"),
                @ApiImplicitParam(name = "remark", value = "", dataType = "String"),
    })
    public ResponseEntity<Void> addItem(Item item) {
        this.itemService.addItem(item);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @ApiOperation(value = "删除")
    @DeleteMapping(value="/{id}",produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParam(name = "id", value = "主键", dataType = "Integer")
    public ResponseEntity<Void> deleteItemById(@PathVariable Integer id) {
        this.itemService.deleteItemById(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @ApiOperation(value = "修改")
    @PutMapping(produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParams(value = {
            @ApiImplicitParam(name = "id", value = "", dataType = "Integer"),
            @ApiImplicitParam(name = "itemTitle", value = "商品标题", dataType = "String"),
            @ApiImplicitParam(name = "itemDetails", value = "商品详情", dataType = "String"),
            @ApiImplicitParam(name = "itemPurchase", value = "商品进价", dataType = "Date"),
            @ApiImplicitParam(name = "itemPrice", value = "售价", dataType = "Date"),
            @ApiImplicitParam(name = "takeDeliveryPrice", value = "提货券价格", dataType = "Date"),
            @ApiImplicitParam(name = "itemImg", value = "商品列表图片", dataType = "String"),
            @ApiImplicitParam(name = "creatTime", value = "", dataType = "Date"),
            @ApiImplicitParam(name = "updateTime", value = "", dataType = "Date"),
            @ApiImplicitParam(name = "deleted", value = "", dataType = "String"),
            @ApiImplicitParam(name = "remark", value = "", dataType = "String"),
    })
    public ResponseEntity<Void> updateItem(Item item) {
        this.itemService.updateItem(item);
        return ResponseEntity.ok(null);
    }

    @ApiOperation(value = "获取单个")
    @GetMapping(value = "/{id}",produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParam(name = "id", value = "主键", dataType = "Integer")
    public ResponseEntity<Item> getItem(@PathVariable Integer id) {
        return ResponseEntity.ok(this.itemService.getItem(id));
    }

    @ApiOperation(value = "获取所有")
    @GetMapping(produces = {"application/json;charset=UTF-8"})
    public  ResponseEntity<List<Item>> getAllItem() {
       return ResponseEntity.ok(this.itemService.getAllItem());
    }

    @ApiOperation(value = "根据关键字模糊查询商品")
    @GetMapping(value = "itemTitle", produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParams(value = {
           @ApiImplicitParam(name = "userid", value = "用户id", dataType = "Integer"),
            @ApiImplicitParam(name = "itemTitle", value = "商品标题", dataType = "String"),
        })
    public ResponseEntity<List<Item>> getitem(Integer userid,String itemTitle) {
        return ResponseEntity.ok(this.itemService.getitem(userid,itemTitle));
    }

    @ApiOperation(value = "根据用户id获取首页查询历史")
    @GetMapping(value = "searchHistory", produces = {"application/json;charset=UTF-8"})
    @ApiImplicitParam(name = "userid", value = "用户id", dataType = "Integer")
    public ResponseEntity<List<Item>> searchHistory(Integer userid) {
        return ResponseEntity.ok(this.itemService.searchHistory(userid));
    }

}
