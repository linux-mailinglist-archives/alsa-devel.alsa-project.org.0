Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C831C877057
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971CD227A;
	Sat,  9 Mar 2024 11:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971CD227A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979633;
	bh=pGPyxY4xey0LpvE+RP3d8bxeSrlEhfkiAYH7RTLqgcA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hPky0ytqDh0Mf+SpY6HD20XPeqnAHfa4eK/EIT39a7xGLe2sJ8VplTokwfzKNuA7F
	 Y+wtcnuqeegRjo7cUGjFpo+NivzRsiwFV0yb6+2ScDxAAtelwz0o6T2JRgZsrwop3G
	 SGRNRpTpDuvdD00Nd30w4CNMF2dzQq1gspaEdBV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7382EF8975E; Sat,  9 Mar 2024 11:14:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC95F8975E;
	Sat,  9 Mar 2024 11:14:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61BCFF8024E; Fri,  8 Mar 2024 13:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24711F80087
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 13:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24711F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=JeABPd+f
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428AjMLW026896;
	Fri, 8 Mar 2024 12:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=nY2VG82b+ivJfZOzlfIERrNz50L7KSM3nXuL3F//TZ4=; b=Je
	ABPd+fplo5kRF4DK0cCV90chBmoasIm28/y3Dy1vvkWFjpGWsnPgiMWxz7et4P5d
	jyshTiDvTKO1qnS0Sh+uQm1OUXYwsNcZp2ioEieKxR7qqbMEy1iWvnZHMdRmwt31
	6fIAtUCbmKlaIb0Uv8RoW+48RehbHbRt9Vj1/rMa4n89cyEB2i07WlPiV/jluauR
	9yEw12d5bLzsqY8PfWpBLWUKjMAirCKYSWkG1QOcM1rgdjKKcA6yTP9xI1app0aD
	3nPLgM9jKNKzsOzZaHZDJNCMNgxi+H/IpreGuIFQ1z8u2Ka2ZEdg06Q9IFbTrMMO
	0n83cFUzbBJvTuvo5WeQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wr16y08dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 12:43:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 428Chc5b003833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Mar 2024 12:43:38 GMT
Received: from [10.216.59.105] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Mar
 2024 04:43:35 -0800
Message-ID: <0fe1374b-318b-4dea-94fc-596c665eab53@quicinc.com>
Date: Fri, 8 Mar 2024 18:13:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
CC: <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>,
        <quic_anupkulk@quicinc.com>, <quic_cchiluve@quicinc.com>
References: <20240304135000.21432-1-quic_vdadhani@quicinc.com>
 <d784e46d-974d-4bf3-a2d3-491e7ad19701@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <d784e46d-974d-4bf3-a2d3-491e7ad19701@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UTP_M8OGb3LdCuB_7DUa4e32perp86ZZ
X-Proofpoint-GUID: UTP_M8OGb3LdCuB_7DUa4e32perp86ZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080102
X-MailFrom: quic_vdadhani@quicinc.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SKJVHLAA5RUKB3PNSFXTIUC6RA2LGNIP
X-Message-ID-Hash: SKJVHLAA5RUKB3PNSFXTIUC6RA2LGNIP
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKJVHLAA5RUKB3PNSFXTIUC6RA2LGNIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/6/2024 2:46 AM, Konrad Dybcio wrote:
> 
> 
> On 3/4/24 14:50, Viken Dadhaniya wrote:
>> Currently we have auto suspend delay of 1s which is
>> very high and it takes long time to driver for runtime
>> suspend after use case is done.
>>
>> Hence to optimize runtime PM ops, reduce auto suspend
>> delay to 100ms.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
> 
> What determines 1s to be high and 100ms to be low enough? Could
> you share some more reasoning?

Right now we don't have exact number which can quantify either power or 
performance. But we are following small window so as to not keep timer 
running longer while having resources like Clock ON. Theoretically and 
testing wise, this is not creating any side effect too.

> 
>>   drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c 
>> b/drivers/slimbus/qcom-ngd-ctrl.c
>> index efeba8275a66..5de45a0e3da5 100644
>> --- a/drivers/slimbus/qcom-ngd-ctrl.c
>> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
>> @@ -81,7 +81,7 @@
>>   #define SLIM_USR_MC_DISCONNECT_PORT    0x2E
>>   #define SLIM_USR_MC_REPEAT_CHANGE_VALUE    0x0
>> -#define QCOM_SLIM_NGD_AUTOSUSPEND    MSEC_PER_SEC
>> +#define QCOM_SLIM_NGD_AUTOSUSPEND    (MSEC_PER_SEC / 10)
> 
> This could be a good opportunity to inline this value..

Updated in v2.

> 
> Konrad
