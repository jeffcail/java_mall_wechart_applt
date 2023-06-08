import {request,getBaseUrl} from "../../utils/request.js"
import regeneratorRuntime from "../../lib/runtime/runtime.js"

// pages/product_detail/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    baseUrl: '',
    productOObj:{},
    activeIndex: 0
  },

  productInfo: {},

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    // console.log(options)
    const baseUrl = getBaseUrl();
    this.setData({
      baseUrl
    })
    this.getProductDetail(options.id)
  },

  // Tab点击事件
  handleItemTap(e) {
    const {index}=e.currentTarget.dataset;
    console.log(index)
    this.setData({
      activeIndex: index
    })
  },

  // 购物车处理
  handleCartAdd(e) {
    this.setCardadd();
    wx.showToast({
      title: '购物车添加成功',
      icon: 'success',
      mask: true
    })
  },

  // 加入购物车
  setCardadd() {
    let cart = wx.getStorageSync('cart')||[];
    console.log(cart);
    let index = cart.findIndex(v=>v.id===this.productInfo.id);
    console.log(index);
    if (index === -1) {
      this.productInfo.num = 1;
      cart.push(this.productInfo);
    } else {
      cart[index].num++;
    }
    wx.setStorageSync('cart', cart)
  },

  // 获取商品详情
  async getProductDetail(id) {
    const result = await request({
      url: "/api/product/detail",
      data: {id},
      method: "GET"
    });
    const productOObj = result.message
    this.productInfo=result.message
    this.setData({
      productOObj: productOObj
    })
    console.log(productOObj);
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})