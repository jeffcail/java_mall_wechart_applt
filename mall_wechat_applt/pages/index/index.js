import {request,getBaseUrl} from "../../utils/request.js"
import regeneratorRuntime from "../../lib/runtime/runtime.js"

Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 轮播图数组
    swiperList:[],
    // baseUrl
    baseUrl: '',
    // 金刚区
    bigTypeList:[],
    bigTypeListRow1:[],
    bigTypeListRow2:[],
    // 热门商品
    hotProductList:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    const baseUrl = getBaseUrl();
    this.setData({
      baseUrl: baseUrl
    })

    this.getSwiperList();
    this.getBigTypeList();
    this.getHotProductList();
    // wx.request({
    //   url: 'http://localhost:9090/api/product/findSwiper',
    //   method: 'GET',
    //   success: (result) => {
    //     // console.log(result);
    //     this.setData({
    //       swiperList:result.data.message
    //     })
    //   }
    // })
  },

  async getSwiperList(){
    const result = await request({
      url: '/api/product/findSwiper',
      method: 'GET'
    });
    this.setData({
      swiperList:result.message,
    })
    // request({url: '/api/product/findSwiper',method: 'GET',})
    // .then(result=>{
    //   const baseUrl = getBaseUrl();
    //   this.setData({
    //     swiperList:result.message,
    //     baseUrl: baseUrl
    //   })
    // })
  },

  async getBigTypeList() {
    const result = await request({
      url: "/api/bigType/findAll",
      method: "GET"
    });
    // console.log(result)
    const bigTypeList = result.message;
    const bigTypeListRow1 = bigTypeList.filter((item, index) => {
      return index<5;
    })
    const bigTypeListRow2 = bigTypeList.filter((item, index) => {
      return index>=5;
    })
    this.setData({
      bigTypeList,
      bigTypeListRow1,
      bigTypeListRow2
    })
  },

  // 热门商品
  async getHotProductList() {
    const result = await request({
      url: "/api/product/findHot",
      method: "GET"
    });
    const hotProductList = result.message
    this.setData({
      hotProductList: hotProductList
    })
    // console.log(hotProductList);
  },

  // 金刚区点击跳转
  handleTypeJump(e){
    console.log(e)
    const {index}=e.currentTarget.dataset;
    const app=getApp();
    app.globalData.index=index;
    wx.switchTab({
      url: '/pages/category/index'
    })
  },

})