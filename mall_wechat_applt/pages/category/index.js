import {request,getBaseUrl} from "../../utils/request.js"
import regeneratorRuntime from "../../lib/runtime/runtime.js"

// pages/category/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // 左侧菜单数据
    leftMenuList:[],
    // 右侧商品数据
    rightProductList:[],
    baseUrl: '',
    currentIndex: 0, // 当前选中左侧菜单的索引
    scrollTop: 0
  },
  // 所有数据
  Cates:[],

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    const baseUrl = getBaseUrl();
    this.setData({
      baseUrl
    })

    this.getCatesList();
  },

   // 分类数据
   async getCatesList() {
    const result = await request({
      url: "/api/bigType/findCategories",
      method: "GET"
    });
    this.Cates = result.message;
    let leftMenuList = this.Cates.map((v) => {
      return v.name
    })
    let rightProductList = this.Cates[0].smallTypeList;
     this.setData({
       leftMenuList,
       rightProductList
     })   
  },

  async getCatesList2(index) {
    const result = await request({
      url: "/api/bigType/findCategories",
      method: "GET"
    });
    this.Cates = result.message;
    let leftMenuList = this.Cates.map((v) => {
      return v.name
    })
    let rightProductList = this.Cates[index].smallTypeList;
     this.setData({
       leftMenuList,
       rightProductList,
       currentIndex: index,
       scrollTop: 0
     })  
    },
  handleMenuChange(e) {
    const {index} = e.currentTarget.dataset;
    let rightProductList = this.Cates[index].smallTypeList;
    this.setData({
      currentIndex: index,
      rightProductList,
      scrollTop: 0
    })
  },

  onShow: function() {
    const app=getApp();
    const {index} = app.globalData;
    
    if (index != -1) {
      this.getCatesList2(index);
      app.globalData.index=-1;
    }
  }
})