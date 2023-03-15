<!-- 员工信息-->
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="static/js/jquery-3.4.1.min.js"></script>
    <script src="static/layui/layui.js"></script>
    <link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<body>
<h1>员工信息</h1>
<table class="layui-hide" id="employee-table" lay-filter="employee-table"></table>

<script type="text/html" id="positionTpl">
    <select id="position-select" name="position" lay-verify="required">
        <#if positionList?? && positionList?size gt 0>
            <#list positionList as position>
                <option value=${position.id}
                        {{#if (d.position.id == ${position.id}) { }}
                        selected
                        {{# }}}
                >
                    ${position.name}</option>
            </#list>
        </#if>
    </select>
</script>

<script type="text/html" id="departmentTpl">
    <select id="department-select" name="department" lay-verify="required">
        <#if departmentList?? && departmentList?size gt 0>
            <#list departmentList as department>
                <option value=${department.id}
                        {{#if (d.department.id == ${department.id}) { }}
                        selected
                        {{# }}}
                >
                    ${department.name}</option>
            </#list>
        </#if>
    </select>

</script>

<script type="text/html" id="educationTpl">
    <select id="education-select" name="city" lay-verify="required">
        <#list ["本科", "硕士", "博士"] as education>
            <option value=${education_index}
                    {{#if (d.education == ${education_index?c}) { }}    <#-- 这里需要类型转换?c-->
                    selected
                    {{# }}}
            >
                ${education}</option>
        </#list>
    </select>
</script>

<style type="text/css">
    .layui-table-cell{
        height:36px;
        line-height: 36px;
    }
</style>

</body>
<script>

    var tableContent = [];
    layui.use('table', function(){

        var table = layui.table;
        table.render({
            elem: '#employee-table',
            url:'/employees',
            toolbar: '#toolbar',
            parseData: function (res) {
                console.log(res);
                tableContent = res.data;
                return {
                    "code": 0,
                    "msg": "",
                    "count": res.size,
                    data: res.data
                }
            }
            ,cols: [[
                {field:'id', width:30, title: 'ID'},
                {field:'name', width:120, title: '姓名'},
                {field:'sex', width:50, title: '性别', templet:function (row) {
                        return [
                            '<div>',
                            row.sex == 0 ? '男' : '女',
                            '</div>'
                        ].join('');
                    }},
                {field:'phone', width: 120, title:'电话', edit: true},
                {field:'email', width: 160, title:'邮箱', edit: true},
                {field:'education', width: 100, title:'学历', templet: '#educationTpl'},
                {field:'idcard', width: 160, title:'身份证', edit: true},
                <!--{field:'address', width: 140, title:'地址', edit: true},-->
                // {field:'position.name', width: 150, title:'职位', templet: '#positionTpl'},
                /*{field:'position.name', width: 110, title:'职位', templet: function (d) {
                    if (d.position == null) return "未分配";
                    return d.position.name
                }},*/
                // {field:'department.name', width: 120, title:'部门', templet: '#departmentTpl'},
                /*templet: function (d) {
                    if (d.department == null) return "未分配";
                    return d.department.name
                }},*/
                {field:'createdTime', width: 120, title: '创建时间', sort: true},
                // {fixed: 'right', title: '操作', align:'center', toolbar: '#barTpl'}
            ]]
            ,page: true
            ,done: function (res, curr, count) {
                // 支持表格内嵌下拉框
                $(".layui-table-body, .layui-table-box, .layui-table-cell").css('overflow', 'visible')
                // 下拉框CSS重写 (覆盖父容器的CSS - padding)
                $(".laytable-cell-1-0-5").css("padding", "0px")
                $(".laytable-cell-1-0-7").css("padding", "0px")
                $(".laytable-cell-1-0-8").css("padding", "0px")
                $(".laytable-cell-1-0-5 span").css("padding", "0 10px")
                $(".laytable-cell-1-0-7 span").css("padding", "0 10px")
                $(".laytable-cell-1-0-8 span").css("padding", "0 10px")

                $("td").css("padding", "0px")
            }
        });
    });
</script>
</html>