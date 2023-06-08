// 导入request请求工具类
import {
  getBaseUrl,
  request,
  getWxLogin,
  getUserProfile
} from '../../utils/request.js';
import regeneratorRuntime from '../../lib/runtime/runtime';
Page({

  /**
   * 页面的初始数据
   */
  data: {
    address:{},
    baseUrl: '',
    cart:[],
    totalPrice:0,
    totalNum:0
  },

  async handlePay() {
    // let res = await getWxLogin();
    // console.log(res.code)

    // let res2 = await getUserProfile();
    // console.log(res2)

    const token = wx.getStorageSync('token');
    if (!token) {
      Promise.all([getWxLogin(), getUserProfile()]).then((res)=>{
        // console.log(res[0].code);
        // console.log(res[1].userInfo.nickName, res[1].userInfo.avatarUrl)
        let loginParam = {
          code: res[0].code,
          nickName: res[1].userInfo.nickName,
          avatarUrl: res[1].userInfo.avatarUrl
        }
        // console.log(loginParam)
  
        wx.setStorageSync('userInfo', res[1].userInfo);
        this.wxlogin(loginParam);
        // 创建订单
        this.createOrder();
      })
    } else {
      console.log(token);

      // 创建订单
      this.createOrder();
    }
  },

  /**
   * 请求后端获取用户token
   * @param {*} loginParam 
   */
  async wxlogin(loginParam) {
    const res = await request({
      url: '/api/wx/user/login',
      data: loginParam,
      method: "POST",
    });
    console.log(res)
    
    const token = res.token;
    if (res.code === 0) {
      wx.setStorageSync('token', token);
      // console.log('--------------------------------',wx.getStorageSync('token'))
    }
  },

  /**
   * 创建订单
   */
  async createOrder() {
    const totalPrice=this.data.totalPrice;
    const address=this.data.address.provinceName+this.data.address.cityName+this.data.address.countyName+this.data.address.detailInfo;
    const consignee=this.data.address.userName;
    const telNumber=this.data.address.telNumber;
    let goods=[];
    this.data.cart.forEach(v=>goods.push({
      goodsId:v.id,
      goodsNumber:v.num,
      goodsPrice:v.price,
      goodsName:v.name,
      goodsPic:v.proPic
    }))
    const orderParam={
      totalPrice,
      address,
      consignee,
      telNumber,
      goods
    }
    const res = await request({url:"/api/my/order/create", method:"POST", data:orderParam});
    console.log("orderNo="+res.orderNo)
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    const baseUrl = getBaseUrl();
    this.setData({
      baseUrl
    })
  },

  
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    console.log("show")
    const address=wx.getStorageSync('address');
    let cart=wx.getStorageSync('cart')||[];
    cart=cart.filter(v=>v.checked);
    let totalPrice=0;
    let totalNum=0;
    cart.forEach(v=>{
      totalPrice+=v.price*v.num;
      totalNum+=v.num;
    })
  
    this.setData({
      cart,
      totalNum,
      address,
      totalPrice
    })
  }

})