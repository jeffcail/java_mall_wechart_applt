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
    baseUrl: ''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getSwiperList()
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
    const baseUrl = getBaseUrl();
    this.setData({
      swiperList:result.message,
      baseUrl: baseUrl
    })
    // request({url: '/api/product/findSwiper',method: 'GET',})
    // .then(result=>{
    //   const baseUrl = getBaseUrl();
    //   this.setData({
    //     swiperList:result.message,
    //     baseUrl: baseUrl
    //   })
    // })
  }

})