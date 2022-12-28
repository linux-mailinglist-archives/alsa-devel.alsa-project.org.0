Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE76586BF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 21:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD9562ED;
	Wed, 28 Dec 2022 21:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD9562ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672259550;
	bh=nC1iCpmBxPSo1i6FwUXbDtSkPfBdEJlgQfVwla8Ze/s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KcniELWCF3u+vox7E5B2yMUSFbC1DjboZ/KmD6BzLW+uBhedfJML43M4UZRgPxrQj
	 Qba+Vhgbm/W2dOlpLRpEFuoS0iMgWYFCyXAXjNyywkmzooQg9ZnJCAy/2GMzTILS2f
	 bMHw5uFr0t9KdGQSswLiM4u5JPHvNB5x0a8k4sjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 334DAF800F0;
	Wed, 28 Dec 2022 21:31:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C342FF8042F; Wed, 28 Dec 2022 21:31:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D185F800F0
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 21:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D185F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Tblo4UVL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSKQ4vf001927; Wed, 28 Dec 2022 20:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hPQ+xZA2/zQFK/5r/OYDYGZHuiZAzHLvGCCkk6+8BqU=;
 b=Tblo4UVL5I9f+H4Vyb9GQIhGdgvdzrX8xmD9rzwsOcptx1dRfxj8xn43qJDGkELahOxA
 ui+jjqhoYNbmY1Dib2K72bHWVcORa6sZPJGoJda+mU9u0hS7YUdBHwTMRloDuE5pJwsJ
 +7AjRwL27uIo+ZzlC4cB3KDT2hKKiLNfW92jn39zhlTJZ4gtulxpE5uWCSVXVSe6ZF20
 Oa6uRAlRx9EGhESeEnKsQjZmIB7PTXM+1M72RA2bDxBpZi9AduV6m3NFT5MBJ8Ew2oLh
 /nmGXCwxXYVw1VaGZU5Wr98CHXxA+uATZibweArUWPSVKm17R5LHuWybafGr8ri0efl0 7Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrp0yrt3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 20:31:19 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BSKVI3P031506
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 20:31:18 GMT
Received: from [10.110.31.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 28 Dec
 2022 12:31:17 -0800
Message-ID: <559030ff-112b-e0a8-b278-72f909724496@quicinc.com>
Date: Wed, 28 Dec 2022 12:31:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 06/14] usb: core: hcd: Introduce USB HCD APIs for
 interrupter management
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-7-quic_wcheng@quicinc.com>
 <Y6ca8IKLK9g497Qv@rowland.harvard.edu>
 <e1203849-01b4-b196-36f3-76d58dd7c724@quicinc.com>
 <bf1011a8-c746-c465-f161-f0293409d922@suse.com>
 <Y6xd1c3s2XPpOqfi@rowland.harvard.edu>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Y6xd1c3s2XPpOqfi@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: pNo8f1lNCunriSs5wwMKfDcH_pIE4amA
X-Proofpoint-ORIG-GUID: pNo8f1lNCunriSs5wwMKfDcH_pIE4amA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_15,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=346 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280176
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

Hi Alan,

On 12/28/2022 7:16 AM, Alan Stern wrote:
> On Wed, Dec 28, 2022 at 09:59:03AM +0100, Oliver Neukum wrote:
>>
>>
>> On 27.12.22 22:07, Wesley Cheng wrote:
>>
>>>
>>> Hmmm...maybe I should change the name of the API then to avoid the confusion.  Yes, usb_hcd_flush_endpoint() does ensure that URBs submitted to the EP are stopped.  However, with this offloading concept, we aren't actually submitting URBs from the main processor, so the ep->urb_list will be empty.
>>>
>>> This means the usb_hcd_flush_endpoint() API won't actually do anything.  What we need is to ensure that we send a XHCI stop ep command to the controller.
>>
>> That is a concept specific to XHCI, yet you are adding a generic
>> API. The namin should reflect that. usb_quiesce_endpoint() ?
> 
> Or even xhci_send_stop_ep_cmd(), which is what the routine is intended
> to do.
> 

Just to clarify, you're talking about renaming the API that was added in 
the XHCI driver, correct?

Thanks
Wesley Cheng

