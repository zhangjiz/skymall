<title>${remarks}列表</title>
<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">主页</a>
        <a>
            <cite>${remarks}管理</cite>
        </a>
        <a>
            <cite>${remarks}管理</cite>
        </a>
    </div>
</div>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="lay-admin-${modelNameLowerCamel}-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">关键字</label>
                        <div class="layui-input-block">
                            <input type="text" name="keywords" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="LAY-${modelNameLowerCamel}-back-search">
                            <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div style="padding-bottom: 10px;">
                <button class="layui-btn ${modelNameLowerCamel}-form" data-type="add">新增</button>
            </div>
            <table id="LAY-${modelNameLowerCamel}-list" lay-filter="LAY-${modelNameLowerCamel}-list"></table>
            <script type="text/html" id="Img">
                <img style="display: inline-block; width: 50%; height: 100%;" src={{ d.avatar }} onclick="previewImg(this)">
            </script>
            <script type="text/html" id="table-${modelNameLowerCamel}-toolbar">
                <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"> <i class="layui-icon  layui-icon-del"></i>删除</a>
            </script>
        </div>
    </div>
</div>
<script>
    //----------图片弹出开始-------------
    function previewImg(obj) {
        var img = new Image();
        img.src = obj.src;
        var imgHtml = "<img src='" + obj.src + "' width='500px' height='500px'/>";
        //弹出层
        layer.open({
            type : 1,
            shade : 0.8,
            offset : 'auto',
            area : [ 500 + 'px', 550 + 'px' ],
            shadeClose : true,
            scrollbar : false,
            title : "图片预览", //不显示标题
            content : imgHtml, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
            cancel : function() {
                //layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', { time: 5000, icon: 6 });
            }
        });
    }
    //----------图片弹出结束-------------
    //============使用外部引入的JS===========
    layui.use('${modelNameLowerCamel}', layui.factory('${modelNameLowerCamel}')).use('${modelNameLowerCamel}')
</script>

