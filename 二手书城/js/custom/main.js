/*
 * @Author: ye 10969759+y2018110@user.noreply.gitee.com
 * @Date: 2022-12-18 16:57:06
 * @LastEditors: ye 10969759+y2018110@user.noreply.gitee.com
 * @LastEditTime: 2022-12-19 17:01:16
 * @FilePath: \二手书城\js\custom\main.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
$(window).on(
  "scroll", 
  (function () { 
    $(this).scrollTop() > 130 ? $(".header-part").addClass("active") : $(".header-part").removeClass("active") })); 
    $((function () { 
      $(".dropdown-link").click((
        function () { 
          $(this).next().toggle(), 
          $(".dropdown-list:visible").length > 1 && (
            $(".dropdown-list:visible").hide(), 
            $(this).next().show()) })) })); 
            $(".header-cate, .cate-btn").on("click", (
              function () { 
                $("body").css("overflow", "hidden"), 
                $(".category-part").addClass("active"), 
                $(".category-close").on("click", (
                  function () { 
                    $("body").css("overflow", "inherit"),
                    $(".category-part").removeClass("active") })) }));
                     $(".header-user").on("click", (function () { 
                      $("body").css("overflow", "hidden"), 
                      $(".mobile-nav").addClass("active"), 
                      $(".nav-close").on("click", (function () { 
                        $("body").css("overflow", "inherit"), 
                        $(".mobile-nav").removeClass("active") })) }));
                         $(".header-cart, .cart-btn").on("click", (function () {
                           $("body").css("overflow", "hidden")
                            
                             })); 
                               $(".coupon-btn").on("click", (function () { 
                                $(this).hide(), $(".coupon-form").css("display", "flex") })); 
                                $(".header-src").on("click", (function () { 
                                  $(".header-form").toggleClass("active"), 
    //搜索框点击事件
    $(this).children(".icofont-ui-search").toggleClass("icofont-close") })); 
    //爱心点击事件
     $(".wish").on("click", (function () { $(this).toggleClass("active") })); 
                                  
                                  
                                  
                                  $(".review-widget-btn").on("click", (function () { $(this).next(".review-widget-list").toggle() })); 
                                  $(".offer-select").on("click", (function () { $(this).text("Copied!") })); $(".modal").on("shown.bs.modal", (function (a) { $(".preview-slider, .thumb-slider").slick("setPosition"), $(".product-details-image").addClass("slider-opacity") })); $(".profile-card.contact").on("click", (function () { $(".profile-card.active").removeClass("active"), $(this).addClass("active") })); $(".profile-card.address").on("click", (function () { $(".profile-card.active").removeClass("active"), $(this).addClass("active") })); $(".payment-card.payment").on("click", (function () { $(".payment-card.active").removeClass("active"), $(this).addClass("active") }));





