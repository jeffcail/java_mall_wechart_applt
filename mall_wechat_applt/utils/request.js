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

  return new Promise((resolve, reject)=>{
    wx.request({
      ...params,
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