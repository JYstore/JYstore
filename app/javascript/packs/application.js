// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'


 .carouseljava{
/**
 * 事件绑定
 * 1、页面加载完，自动循环翻页
 * 2、翻页按钮，翻页
 * 3、定点翻页
 * 4、翻页时同步圆点状态
 * 5、鼠标进入，停止自动翻页
 * 6、快速点击翻页的bug(加 isPaging 标志)
 */

/**
 * 0、自动轮播
 */

/**
 * 一些可以设置的参数
 */
var PAGE_WIDTH = 1300,
    PAGE_SLIDE_TIME = 1300,    //单页滑动时间
    PAGE_INTERVAL = 2600 + PAGE_SLIDE_TIME,    //换页间隔时间
    curIndex = 1,    //合法取值 1 ~ 5(0 表示左边假的，6表示右边假的)
    isPaging = false    //是否正在翻页(用来处理连续点击翻页产生的bug)

var intervalId;
$(function(){
    intervalId = setInterval(next,PAGE_INTERVAL)
})

/**
 * 1、页面按钮
 */
$("#next").click(function(){
    next()
})

$("#prev").click(function(){
    next(false)
})

$("#index li").click(function(){
    next($(this).index() + 1)
})

/**
 * 2、鼠标出入
 */
$("#container").hover(function(){
    clearInterval(intervalId)
},function(){
    intervalId = setInterval(next,PAGE_INTERVAL)
})

/**
 * 翻页核心功能
 * next(boolean|number])
 *
 *         boolean:    表示前后翻页
 *         number:        表示定点翻页
 */
function next(flag=true){

    if(isPaging){
        return
    }
    isPaging = true;

    var tempIndex = curIndex;

    //1 确定要翻过去的页码,计算 left 值
    typeof flag === "boolean" && (curIndex += flag ? 1 : -1)
    typeof flag === "number" && (curIndex = flag)
    left = - curIndex * PAGE_WIDTH

    //2 执行翻页动画
    $("#imgs").animate({"left":left},PAGE_SLIDE_TIME,function(){
        if(curIndex == 0 || curIndex == 6){
            //页码校正
            curIndex == 0 && (curIndex = 5);
            curIndex == 6 && (curIndex = 1)

            left = - curIndex * PAGE_WIDTH
            $("#imgs").css("left",left)
        }
        //清除正在翻页标志
        isPaging = false
    })

    //3 同步点的状态
    if(curIndex == 0 || curIndex == 6){
        curIndex == 0 && updateIdxState(0,4);
        curIndex == 6 && updateIdxState(4,0);
    }else{
        updateIdxState(tempIndex -1,curIndex -1)
    }

    function updateIdxState(oldIdx,newIdx){
        $("#index li").eq(oldIdx).removeClass("active")
        $("#index li").eq(newIdx).addClass("active")
    }
}
}
