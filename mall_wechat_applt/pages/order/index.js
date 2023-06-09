// 导入request请求工具类
import {
  getBaseUrl,
  request
} from '../../utils/request.js';
import regeneratorRuntime from '../../lib/runtime/runtime';
Page({

  /**
   * 页面的初始数据
   */
  data: {
    orders:[],
    tabs:[
      {
        id:0,
        value:"全部订单",
        isActive:true
      },
      {
        id:1,
        value:"待付款",
        isActive:false
      },
      {
        id:2,
        value:"待收货",
        isActive:false
      },
      {
        id:3,
        value:"退款/退货",
        isActive:false
      },
    ]
  },

  // 接口参数
  QueryParams:{
    type:0
  },

  /**
   * tab点击事件处理
   * @param {} e 
   */
  handleItemTap(e){
    const {index}=e.currentTarget.dataset;
    console.log(index)
    // 切换标题
    let {tabs}=this.data;
    tabs.forEach((v,i)=>i==index?v.isActive=true:v.isActive=false);

    // 获取订单列表
    this.QueryParams.type=index;
    this.getOrders();

    this.setData({
      tabs
    })
  },

  /**
   * 获取订单
   */
  async getOrders(){
    const res=await request({url:'/api/my/order/list',data:this.QueryParams});
    console.log(res)
    this.setData({
      orders:res.orderList
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getOrders();
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})