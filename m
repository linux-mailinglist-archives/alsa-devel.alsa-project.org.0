Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C75877044
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:16:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959F2B71;
	Sat,  9 Mar 2024 11:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959F2B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979380;
	bh=cfxI20d5y5qk2MaaG3XBW6TAX2+iMo5kGMHs5KLDOuQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rm20SFEVhj/cKvyByXjdrbpuwLDJsbmNnL0H4t1Z9v+BvWLVDHAMaFrVPTTslGdZk
	 6Yotsib9lg095X4xgePArtAEVfwOQdmjMjGoxGx88Bjcx/UhONFo7UochIHjtbM43e
	 Ll+SnEF+PZHu3aBbjUB5CigLbyDj0yB6BwU9T/jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B916EF8071F; Sat,  9 Mar 2024 11:13:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7955F8072A;
	Sat,  9 Mar 2024 11:13:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 063CFF8024E; Wed,  6 Mar 2024 10:18:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C88DFF80087
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 10:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C88DFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=KxpyDxY5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4268mK6M001240;
	Wed, 6 Mar 2024 09:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mmJx23rcur9WCYWhXR3zM5xECJQumaTs6Yiz4SRud2A=; b=Kx
	pyDxY54wN3Y+5ZDYaRGYe4oMGaercyIgndTI9WOvSd3Mvg0/gmJvKzjangXITGO0
	XaPfF8dVqj9PbmUlPCXH8rCpGiX/K4MJ7STHrHNNPakgpSnW6LskUcX0NUIPVRRe
	rZNPZ0giPJHAdwujtCWAKyGoDObV6YaLER47JyOlt8SRpy5Ec2GBrM1bwKgdWyn7
	aYVl2EH2U0aKtCoB/tf55+3ZONybjI6ij2YukYgQ9ohBJnIpizhCVWmM1QcQzApu
	GhZmVNEC7F6VqG7J4xj88vEb2Ehc9NQOfWze4SQikBl1Yc7t4Rt3p9EUQnzfn3H0
	pNkhg4cqOu+7JVV+FQpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpgwmrk3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 09:18:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4269Hx7n002862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 09:17:59 GMT
Received: from [10.216.25.241] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Mar
 2024 01:17:55 -0800
Message-ID: <1fafd225-e647-4a60-bd95-af12ad243182@quicinc.com>
Date: Wed, 6 Mar 2024 14:47:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Add timeout for wait operation
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_anupkulk@quicinc.com>, <quic_cchiluve@quicinc.com>
References: <20240304134228.16627-1-quic_vdadhani@quicinc.com>
 <8dbcd393-580b-4c29-9d6f-42988a5e7655@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <8dbcd393-580b-4c29-9d6f-42988a5e7655@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Zft9A-24MaGqR3GARGOpsN3quW_Iwrn8
X-Proofpoint-ORIG-GUID: Zft9A-24MaGqR3GARGOpsN3quW_Iwrn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060073
X-MailFrom: quic_vdadhani@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HLOWHTFDCJ7VU35FF56CYJOYSTGOH465
X-Message-ID-Hash: HLOWHTFDCJ7VU35FF56CYJOYSTGOH465
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLOWHTFDCJ7VU35FF56CYJOYSTGOH465/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/6/2024 2:49 AM, Konrad Dybcio wrote:
> 
> 
> On 3/4/24 14:42, Viken Dadhaniya wrote:
>> In current driver qcom_slim_ngd_up_worker() indefinitely
>> waiting for ctrl->qmi_up completion object. This is
>> resulting in workqueue lockup on Kthread.
>>
>> Added wait_for_completion_interruptible_timeout to
>> allow the thread to wait for specific timeout period and
>> bail out instead waiting infinitely.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
> 
> Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart 
> support")
> Cc: stable@vger.kernel.org
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
>>   drivers/slimbus/qcom-ngd-ctrl.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c 
>> b/drivers/slimbus/qcom-ngd-ctrl.c
>> index efeba8275a66..c27076d8b7db 100644
>> --- a/drivers/slimbus/qcom-ngd-ctrl.c
>> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
>> @@ -83,6 +83,7 @@
>>   #define QCOM_SLIM_NGD_AUTOSUSPEND    MSEC_PER_SEC
>>   #define SLIM_RX_MSGQ_TIMEOUT_VAL    0x10000
>> +#define SLIM_QMI_TIMEOUT_MS        1000
> 
> This could be inlined instead

Updated in v2.

> 
> Konrad
