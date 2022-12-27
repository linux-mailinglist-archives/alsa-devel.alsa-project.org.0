Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0EA656FB6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 22:07:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56A37DEB;
	Tue, 27 Dec 2022 22:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56A37DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672175277;
	bh=Qyp9bxD8Q997MwLFXX8ayGRrZrlfxqmmtQFuXZAmFS4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m1z0RQJIob+S5FnomLxrAOp7laMoq3OYEb+cTO7tbQorpt7evvhHGJUGbOdyDGIjR
	 8Oi1MQ3BtseEO6JHEUhqnxOQMDF4UvWTdH14pAgPqRld87eLEEuLqHwU107tT6UwKp
	 WKCQLsTs4YB/gHLFS1aS5739sdn/6RXChjAB+5KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F6D1F800F0;
	Tue, 27 Dec 2022 22:06:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF8EF8052F; Tue, 27 Dec 2022 22:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91988F804FB
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 22:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91988F804FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hk+QgYsB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRKjb1s019199; Tue, 27 Dec 2022 21:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GutUbXB1IakrXGdBIJC1gfkGpv20AavOAvOUFVw47TY=;
 b=hk+QgYsB02Tjj30JXOrZAvdeOiyRyQLg/J8BA4JewLr48LVHoJj5qUM97xbhxLfBuCQ1
 4+xpqqzaxE4LrH91QK75iowOoKE3RfZ1QncQliCDUFh9x2WSmwcRraxDEU4iAWaoMg6/
 z1lJpW8VWpkAdDyZVvmO+IQdJKMyBPz1GkW0AdaE2oL3+e1o/m7w5smBjiZAHhVe5Ez0
 UqZzF2g/12GzOswxhozlshXQcpmxG8WXt0vZIAiI7cHE/wShZJWU414GdEqFDq/ZJZsU
 7D3m3IQvkmwRINcyUkS3tCU6tBhhxyx2AWf7g1T35Dr8MslUDRZHQadIPAkZNW0MEn9E Ug== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mntkvdfx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:06:46 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRL6jSQ006363
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:06:45 GMT
Received: from [10.110.31.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 13:06:44 -0800
Message-ID: <f5af23da-a89f-3e76-5cd6-1f630e44fcdd@quicinc.com>
Date: Tue, 27 Dec 2022 13:06:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 08/14] usb: dwc3: Add DT parameter to specify maximum
 number of interrupters
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-9-quic_wcheng@quicinc.com>
 <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Td3kYWk33zAaGGtaC1UySb4xRCN-PSWG
X-Proofpoint-ORIG-GUID: Td3kYWk33zAaGGtaC1UySb4xRCN-PSWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_15,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=794 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212270176
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Dmitry,

On 12/24/2022 3:13 AM, Dmitry Baryshkov wrote:
> On Sat, 24 Dec 2022 at 01:33, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>>
>> Allow for the DWC3 host driver to pass along a XHCI property that defines
>> how many interrupters to allocate.  This is in relation for the number of
>> event rings that can be potentially used by other processors within the
>> system.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/dwc3/core.c | 12 ++++++++++++
>>   drivers/usb/dwc3/core.h |  2 ++
>>   drivers/usb/dwc3/host.c |  5 ++++-
>>   3 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 476b63618511..67d6f0ae81d2 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1446,6 +1446,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>          u8                      tx_thr_num_pkt_prd = 0;
>>          u8                      tx_max_burst_prd = 0;
>>          u8                      tx_fifo_resize_max_num;
>> +       u8                      num_hc_interrupters;
>>          const char              *usb_psy_name;
>>          int                     ret;
>>
>> @@ -1468,6 +1469,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>           */
>>          tx_fifo_resize_max_num = 6;
>>
>> +       /* default to a single XHCI interrupter */
>> +       num_hc_interrupters = 1;
>> +
>>          dwc->maximum_speed = usb_get_maximum_speed(dev);
>>          dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>>          dwc->dr_mode = usb_get_dr_mode(dev);
>> @@ -1511,6 +1515,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>                                  &tx_thr_num_pkt_prd);
>>          device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>                                  &tx_max_burst_prd);
>> +       device_property_read_u8(dev, "snps,num-hc-interrupters",
>> +                               &num_hc_interrupters);
> 
> bindings change?
> 

Will add one.  Thanks!

Thanks
Wesley Cheng
