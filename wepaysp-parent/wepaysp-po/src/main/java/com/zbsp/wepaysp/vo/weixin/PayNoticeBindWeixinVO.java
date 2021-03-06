package com.zbsp.wepaysp.vo.weixin;

import java.sql.Timestamp;

/**
 * 微信支付（门店/收银员级别）通知绑定收银员VO
 * 
 * @author 孟郑宏
 */

public class PayNoticeBindWeixinVO
    implements java.io.Serializable {

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 3801534516962277126L;
    private String iwoid;
    private String payDealerEmployeeOid;
    private String payDealerEmployeeId;
    private String payDealerEmployeeName;
    private String storeOid;
    private String storeId;
    private String storeName;

    private String dealerOid;
    private String dealerId;
    private String dealerName;

    private String bindDealerEmployeeOid;
    private String bindDealerEmployeeId;
    private String bindDealerEmployeeName;
    private String openid;
    private String nickname;
    private Integer sex;
    private String type;
    private String state;
    private Timestamp createTime;

    public PayNoticeBindWeixinVO() {
    }

    public String getIwoid() {
        return iwoid;
    }

    public void setIwoid(String iwoid) {
        this.iwoid = iwoid;
    }

    public String getPayDealerEmployeeOid() {
        return payDealerEmployeeOid;
    }

    public void setPayDealerEmployeeOid(String payDealerEmployeeOid) {
        this.payDealerEmployeeOid = payDealerEmployeeOid;
    }

    public String getStoreOid() {
        return storeOid;
    }

    public void setStoreOid(String storeOid) {
        this.storeOid = storeOid;
    }

    public String getBindDealerEmployeeOid() {
        return bindDealerEmployeeOid;
    }

    public void setBindDealerEmployeeOid(String bindDealerEmployeeOid) {
        this.bindDealerEmployeeOid = bindDealerEmployeeOid;
    }

    public String getBindDealerEmployeeId() {
        return bindDealerEmployeeId;
    }

    public void setBindDealerEmployeeId(String bindDealerEmployeeId) {
        this.bindDealerEmployeeId = bindDealerEmployeeId;
    }

    public String getBindDealerEmployeeName() {
        return bindDealerEmployeeName;
    }

    public void setBindDealerEmployeeName(String bindDealerEmployeeName) {
        this.bindDealerEmployeeName = bindDealerEmployeeName;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPayDealerEmployeeId() {
        return payDealerEmployeeId;
    }

    public void setPayDealerEmployeeId(String payDealerEmployeeId) {
        this.payDealerEmployeeId = payDealerEmployeeId;
    }

    public String getPayDealerEmployeeName() {
        return payDealerEmployeeName;
    }

    public void setPayDealerEmployeeName(String payDealerEmployeeName) {
        this.payDealerEmployeeName = payDealerEmployeeName;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getDealerOid() {
        return dealerOid;
    }

    public void setDealerOid(String dealerOid) {
        this.dealerOid = dealerOid;
    }

    public String getDealerId() {
        return dealerId;
    }

    public void setDealerId(String dealerId) {
        this.dealerId = dealerId;
    }

    public String getDealerName() {
        return dealerName;
    }

    public void setDealerName(String dealerName) {
        this.dealerName = dealerName;
    }

}
