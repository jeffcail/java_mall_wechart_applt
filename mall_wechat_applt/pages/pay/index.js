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
    })
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
    
    const token = result.token;
    if (result.code === 0) {
      wx.setStorageSync('token', token);
    }
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