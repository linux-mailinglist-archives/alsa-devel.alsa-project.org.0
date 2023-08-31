Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD078F352
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 21:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1996741;
	Thu, 31 Aug 2023 21:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1996741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693510048;
	bh=AGaOtO2g8I5ci9OLFLt20r1BihY72e55RVDeZgJXda4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kBqhKmnK3ItjBgtN8GM9qtgjhF5TRKvSyS7aCbH4sbTQoFMuh0Z9deazDi94TrC1h
	 fiy51nxZOBcWR0EIPh6jkc+J+nmXqZwHgfZNU1sJrsxbWPF6WsVm9DQaxueUHpIMEF
	 b3cCCE8gC1cKOTke13W75u85FPOL0PbTVrb9jB94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1877FF80236; Thu, 31 Aug 2023 21:26:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F566F800F5;
	Thu, 31 Aug 2023 21:26:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E66EF80155; Thu, 31 Aug 2023 21:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90A53F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 21:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90A53F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=mn7YO8v0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VIxiHZ014585;
	Thu, 31 Aug 2023 19:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KJZIA2tDsMsYLt1Yscsua7zldn6z73pHDwRWVxjgHmc=;
 b=mn7YO8v0nrhdcdmbKi55yIIXX6+92O5wKUBtIT1vpx4bksh1YASD7WLyLvf2OYgLBgcr
 UQyQ57JacTnu49UX2Tkqk8bALmWAer4NvlRL6NzW77aUZPeJJi4Xb5is5ORDF/Sj4aL6
 lQWGXYN/jWTRJsVqsqSw1nvnsnuYZ1eG7zyFhr5pejYdMv+EG5RvYPMjhWQhgwXdDBIA
 X0VbLhTJybLKWb9hyCyKmnR7ziFTn/plQPIKkIdw3aRS342/5sv3jhAI5uxLBvm0dTkm
 bFTy2w1DzgcKLex9gvaqSemSSsTtiLczwCDiwNJS2hxHrykoVhLxyFWQwL7hjG3NOVaO Pg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stv5n94hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 19:26:03 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37VJQ3SJ015310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Aug 2023 19:26:03 GMT
Received: from [10.71.114.68] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 12:26:02 -0700
Message-ID: <67e199a9-0e65-a142-f1bf-03d3d91ef46a@quicinc.com>
Date: Thu, 31 Aug 2023 12:25:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 13/32] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <agross@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-14-quic_wcheng@quicinc.com>
 <20230831172413.GB2460067-robh@kernel.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20230831172413.GB2460067-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0IPdhZSVNG7HtNWwVNUglvEcjBj6LYXN
X-Proofpoint-ORIG-GUID: 0IPdhZSVNG7HtNWwVNUglvEcjBj6LYXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_17,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310173
Message-ID-Hash: UMPI2GRUDRCTZATJG7ZB3JQNRK3WIOMH
X-Message-ID-Hash: UMPI2GRUDRCTZATJG7ZB3JQNRK3WIOMH
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMPI2GRUDRCTZATJG7ZB3JQNRK3WIOMH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On 8/31/2023 10:24 AM, Rob Herring wrote:
> On Tue, Aug 29, 2023 at 02:06:38PM -0700, Wesley Cheng wrote:
>> Add a new definition for specifying how many XHCI secondary interrupters
>> can be allocated.  XHCI in general can potentially support up to 1024
>> interrupters, which some uses may want to limit depending on how many
>> users utilize the interrupters.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> index a696f23730d3..596762ef9b9f 100644
>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> @@ -376,6 +376,19 @@ properties:
>>       items:
>>         enum: [1, 4, 8, 16, 32, 64, 128, 256]
>>   
>> +  snps,num-hc-interrupters:
> 
> Why do you still have this when you defined a common property?
> 
> If you want to limit it here, just do:
> 
> num-hc-interrupters:
>    maximum: 8
> 

Thanks for the review, and apologies for missing your response in the 
previous revision.

Currently, the DWC3 driver creates and populates the XHCI platform 
device properties from the DWC3 host driver.  Properties need to be 
propagated from DWC3 --> XHCI plat, and is currently done this way for
"snps,usb3_lpm_capable"
"snps,usb2-lpm-disable"

XHCI plat can be used for other non-DWC3 implementations as well, which 
would have their own way of creating the XHCI plat platform device. 
This is the reason we'd need to have these two definitions.

Thanks
Wesley Cheng
