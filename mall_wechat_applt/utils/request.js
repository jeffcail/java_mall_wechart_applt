// 请求跟路径
const baseUrl="http://localhost:9090";

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
  return new Promise((resolve, reject)=>{
    wx.request({
      ...params,
      url: baseUrl+params.url,
      success:(result)=>{
        resolve(result.data)
      },
      fail:(err)=>{
        reject(err)
      }
    });
  })
}