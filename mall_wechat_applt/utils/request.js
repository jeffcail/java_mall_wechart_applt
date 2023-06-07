/**
 * 后端请求工具类
 * @param {*} params 
 */
export const request=(params)=>{
  return new Promise((resolve, reject)=>{
    wx.request({
      ...params,
      success:(result)=>{
        resolve(result.data)
      },
      fail:(err)=>{
        reject(err)
      }
    });
  })
}