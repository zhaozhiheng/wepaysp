package com.zbsp.wepaysp.api.service.edu;

import java.util.Map;

/**
 * 教育缴费账单明细服务 
 * @author mengzh
 */
public interface AlipayEduBillService {

    /**
     * 查询符合条件的列表，查询结果按最后修改时间倒序排列.
     * 查询参数Map中key的取值如下：
     * <pre>
     *      childName:                    String类型，学生姓名，根据此参数模糊查询
     *      userName:       				String类型，家长姓名，根据此参数模糊查询
     *      orderStatus:                  String类型，账单状态，根据此参数精确查询
     * </pre>
     * 
     * @param paramMap 查询参数
     * @param startIndex 记录起始位置
     * @param maxResult 返回记录最大数
     * @return Map
     * <pre>
     *   billList：交易List<AlipayEduBillVO>
     *   <pre>
     */
    public Map<String, Object> doJoinTransQueryAlipayEduBill(Map<String, Object> paramMap, int startIndex, int maxResult);
    
    /**
     * 统计符合条件的总数.
     * 查询参数Map中key的取值如下：
     * <pre>
     *      childName:                    String类型，学生姓名，根据此参数模糊查询
     *      userName:       				String类型，家长姓名，根据此参数模糊查询
     *      orderStatus:                  String类型，账单状态，根据此参数精确查询
     * </pre>
     * 
     * @param paramMap 查询参数
     * @return 符合条件的信息总数
     */
    public int doJoinTransQueryAlipayEduBillCount(Map<String, Object> paramMap);
    
}