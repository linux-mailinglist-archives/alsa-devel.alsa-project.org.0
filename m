Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BD17A2CA0
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Sep 2023 02:44:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B4AE81;
	Sat, 16 Sep 2023 02:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B4AE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694825097;
	bh=qYuaxLpuBD6SWTiOL15L65sYKEfMQaSvYdpud9o7j0g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjBYIHTPzNlBTSgXCl4JEWtfDSEIGdX+4qDFZz35pifjIjOS2+an9Lg35/eb647tU
	 WYrrqV1HC09+j5SmPefWo4c/FVK3XRaPGChBxi5Y4Z4brTZ6BAE3OTyBUluGhzF7KD
	 f3POcTtEWdd3FA4qr5yrX14mKYtNm2+rBciO/o/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2CFAF80558; Sat, 16 Sep 2023 02:43:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5140F80246;
	Sat, 16 Sep 2023 02:43:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62B6FF80425; Sat, 16 Sep 2023 02:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63C2AF80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 02:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C2AF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=HC9TCVKN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38G0WYRs006163;
	Sat, 16 Sep 2023 00:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3RkcHkz/RqEQYzAgNc+OyrMFiy+C3rdEa+GFAH8Iggw=;
 b=HC9TCVKNsmkCLv53c6oiJb14Yt19Y4sIsXQmkVYAT1LbdrPCrZLWsoiIu67t96mYpYWU
 VkNDVDLs0Aq87PPomvTBmyNsgsJCOYM/hZ0I0KAwgDog83chwXsEeebriMN1pJ0WoDts
 YnbsYRVjPCoJtt0XwoXvEnN7uuvcmPe5oAITBR1Xmz4+6F3b6AK30Kqt9ZdpaVcDvCfK
 0RhwPA3wm56nfst6lzV/tsekQSMyuSOSkVZp9yN8Elp+SdhRmPjHgTDLXOMADzgl5WFA
 ApjmLIH3IuPFymlWcYznIyc1Y0egDr+xdWKq5XjYBX9WCOrCL1zRaNF2XRYdpcnvMyp5 Mw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g3gtebq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:43:48 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38G0hl6W027389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Sep 2023 00:43:47 GMT
Received: from [10.110.47.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 17:43:45 -0700
Message-ID: <ef3731af-5b58-3dcb-9a6f-7e8755a13895@quicinc.com>
Date: Fri, 15 Sep 2023 17:43:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 13/33] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-14-quic_wcheng@quicinc.com>
 <6e66d821-1275-4830-a898-bb82c333dcc5@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <6e66d821-1275-4830-a898-bb82c333dcc5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9YQLvUHgRrnTow5tETBSW-Ct60vH8DnN
X-Proofpoint-ORIG-GUID: 9YQLvUHgRrnTow5tETBSW-Ct60vH8DnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxlogscore=564 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309160003
Message-ID-Hash: YNJZRISF3UQYIBYLHMYENFVK3US45HYJ
X-Message-ID-Hash: YNJZRISF3UQYIBYLHMYENFVK3US45HYJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNJZRISF3UQYIBYLHMYENFVK3US45HYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Konrad,

On 9/15/2023 5:35 PM, Konrad Dybcio wrote:
> On 16.09.2023 02:10, Wesley Cheng wrote:
>> Add a new definition for specifying how many XHCI secondary interrupters
>> can be allocated.  XHCI in general can potentially support up to 1024
>> interrupters, which some uses may want to limit depending on how many
>> users utilize the interrupters.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
> Any reason for a DWC3-specific property? Why not just
> use the XHCI-common one from patch 14 and error out if
> a value of more than 8 is found?
> 

Not every XHCI plat user is going to be DWC3.  In case DWC3 is used, the 
DWC3 host driver is the one that populates and adds the XHCI plat device 
(no separate device node for XHCI), so that requires the DWC3 host to 
also populate properties for the XHCI device. (dwc3_host_init())

Thanks
Wesley Cheng


