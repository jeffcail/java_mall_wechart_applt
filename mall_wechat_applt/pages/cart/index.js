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
    address:{},
    baseUrl: '',
    cart:[],
    allChecked:false,
    totalPrice:0,
    totalNum:0
  },

  handleChooseAddress(){
    wx.chooseAddress({
      success: (result) => {
        console.log(result)
        wx.setStorageSync('address', result)
      },
    })
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
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    console.log("show")
    const address=wx.getStorageSync('address');
    const cart=wx.getStorageSync('cart')||[];
 
    this.setData({
      address
    })

    this.setCart(cart);
  },

  // 商品选中事件处理
  handleItemChange(e){
    const {id}=e.currentTarget.dataset;
    let {cart}=this.data;
    let index=cart.findIndex(v=>v.id===id);
    console.log(index)
    cart[index].checked=!cart[index].checked;

    this.setCart(cart);
  },

  // 商品全选事件处理
  handleItemAllCheck(){
    let {cart,allChecked}=this.data;
    console.log(cart,allChecked)
    allChecked=!allChecked;
    cart.forEach(v=>v.checked=allChecked);
    this.setCart(cart);
  },

  // 商品数量的编辑功能
  handleItemNumEdit(e){
    const {id,operation}=e.currentTarget.dataset;
    console.log(id,operation)
    let {cart}=this.data;
    let index=cart.findIndex(v=>v.id===id);
    if(cart[index].num===1 && operation === -1){
      wx.showModal({
        title:'系统提示',
        content:'您是否要删除？',
        cancelColor: 'cancelColor',
        success:(res)=>{
          if(res.confirm){
            cart.splice(index,1);
            this.setCart(cart);
          }
        }
      })
    }else{
      cart[index].num+=operation;
      this.setCart(cart);
    }
  },


  // 设置购物车状态 重新计算 底部工具栏 全选 总价 总数量 重新设置缓存
  setCart(cart){
    let allChecked=true;
    let totalPrice=0;
    let totalNum=0;
    cart.forEach(v=>{
      if(v.checked){
        totalPrice+=v.price*v.num;
        totalNum+=v.num;
      }else{
        allChecked=false;
      }
    })
    allChecked=cart.length!=0?allChecked:false;
    this.setData({
      cart,
      allChecked,
      totalNum,
      totalPrice
    })

    // cart设置到缓存中
    wx.setStorageSync('cart', cart);
  }


})