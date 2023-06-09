// 请求跟路径
const baseUrl="http://localhost:9090";

// qps
// let requestNum = 0;

/**
 * 返回请求根路径
 */
export const getBaseUrl=()=>{
  return baseUrl;
}

/**
 * wx login
 */
export const getWxLogin=()=>{
  return new Promise((resolve, Object) => {
    wx.login({
      timeout: 5000,
      success: (res) => {
        resolve(res)
      },
      fail:(err) => {
        reject(err)
      }
    })
  })
}

/**
 * wx getUserProfile
 */
export const getUserProfile=()=>{
  return new Promise((resolve, Object) => {
    wx.getUserProfile({
      desc: '获取用户信息',
      success: (res) => {
        resolve(res)
      },
      fail:(err)=>{
        reject(err)
      }
    })
  })
}

/**
 * promise形式的 小程序微信支付
 */
export const requestPay=(pay)=>{
  return new Promise((resolve,reject)=>{
    wx.requestPayment({
      ...pay,
      success:(res)=>{
        resolve(res)
      },
      fail:(err)=>{
        reject(err)
      }
    })
  });
}



/**
 * 后端请求工具类
 * @param {*} params 
 */
export const request=(params)=>{
  // var start = new Date().getTime();
  // console.log(start);

  // requestNum++;
  // wx.showLoading({
  //   title: '网络开小差儿了...',
  //   mask: true
  // })

  // 模拟网络延迟加载
  // while(true) {
  //   if (new Date().getTime-start>0.2*1000) break;
  // }

  let header={...params.header};
  if (params.url.includes("/my/")) {
    header["token"] = wx.getStorageSync('token');
  }

  return new Promise((resolve, reject)=>{
    wx.request({
      ...params,
      header,
      url: baseUrl+params.url,
      success:(result)=>{
        resolve(result.data)
      },
      fail:(err)=>{
        reject(err)
      },
      // complete:()=>{
      //   requestNum--;
      //   if(requestNum==0) {
      //     wx.hideLoading();
      //   }
      // }
    });
  })
}