Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DD84A75A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 22:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37FD83B;
	Mon,  5 Feb 2024 22:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37FD83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707168525;
	bh=5lrum/AjuJwqk20RkwGk9tqExlYNgPl6td00iapqChA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D35IDyJET0dtMZctSALBIPqb02x4TLiYr1fQyTKXxnzf8xGNpT2XNWuJ0DWE2UIUn
	 l5IGnkroal+Mq5bE/D0asuili1f9EN2dI9lZtl9vQGMscjwgRZKOTLfJViv9mozqjh
	 jBCkCbXMtPKoWbrOv4ENTKjiz4QZaqGNd7MdwNRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED6FF80548; Mon,  5 Feb 2024 22:28:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B76F8016E;
	Mon,  5 Feb 2024 22:28:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C735F801EB; Mon,  5 Feb 2024 22:28:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41C4AF8016E
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 22:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41C4AF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=iaXU7vLr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 415LASOj014430;
	Mon, 5 Feb 2024 21:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zUMiOKcNb14lRNC0PHgjnPf539O7z/gNiVeRfyHYiCg=; b=ia
	XU7vLrUjhuLqT39+iCG6Wem2p9KvnCKurTv96O1oN1ZPATRdOwCtKTWtyauoxOz+
	y1pASrsqIrWMpXq+GiYzsF/S7iRE1XTX1JOLv9Zj/8UeY7NyqthiOMXSKj6ZLjUg
	dIDxFBsTyRgcDR/fHFyKo+zDwKcI6pAav/6wFjD2sTZqSovIbrSI4pSlMjSuJRMW
	vJhkZKxQwtnmfBSGduZux9uMHXSthdWo8btz8/60el/vHuYE/5M24vSlGmU7AC0X
	KW9vJaAtNARfIkxC2HiE1pnHIMDlp0NRIQrbOq10qx1qc0Yg2Jr4IskqRo3YMEHd
	Cl/BZWSpmj9jfgzZYTYg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w2t9wswnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 21:27:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 415LRsX1010093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Feb 2024 21:27:54 GMT
Received: from [10.110.7.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 5 Feb
 2024 13:27:52 -0800
Message-ID: <4d03b2cf-3b97-a066-15a5-245228813253@quicinc.com>
Date: Mon, 5 Feb 2024 13:27:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v13 50/53] ALSA: usb-audio: Allow for rediscovery of
 connected USB SND devices
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-51-quic_wcheng@quicinc.com>
 <aaa76d7a-4299-4e1c-83f1-cbbea763927f@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <aaa76d7a-4299-4e1c-83f1-cbbea763927f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Fhx4-0QTJ2jvgXTCbibMBpUNgQgwTlk5
X-Proofpoint-ORIG-GUID: Fhx4-0QTJ2jvgXTCbibMBpUNgQgwTlk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_15,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050161
Message-ID-Hash: ZRX2VXM7D4SQT45RRWTI4TOLHJLCP2HC
X-Message-ID-Hash: ZRX2VXM7D4SQT45RRWTI4TOLHJLCP2HC
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRX2VXM7D4SQT45RRWTI4TOLHJLCP2HC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 2/5/2024 1:01 AM, Amadeusz Sławiński wrote:
> On 2/3/2024 3:36 AM, Wesley Cheng wrote:
>> In case of notifying SND platform drivers of connection events, some of
>> these use cases, such as offloading, require an ASoC USB backend 
>> device to
>> be initialized before the events can be handled.  If the USB backend 
>> device
>> has not yet been probed, this leads to missing initial USB audio device
>> connection events.
>>
>> Expose an API that traverses the usb_chip array for connected devices, 
>> and
>> to call the respective connection callback registered to the SND platform
>> driver.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c                  | 19 +++++++++++++++++++
>>   sound/usb/card.h                  |  2 ++
>>   sound/usb/qcom/qc_audio_offload.c |  2 ++
>>   3 files changed, 23 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 11b827b7a2a5..995b2df676ab 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -202,6 +202,25 @@ struct snd_usb_stream 
>> *snd_usb_find_suppported_substream(int card_idx,
>>   }
>>   EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>> +/*
>> + * in case the platform driver was not ready at the time of USB SND
>> + * device connect, expose an API to discover all connected USB devices
>> + * so it can populate any dependent resources/structures.
>> + */
>> +void snd_usb_rediscover_devices(void)
>> +{
>> +    int i;
>> +
>> +    mutex_lock(&register_mutex);
>> +    for (i = 0; i < SNDRV_CARDS; i++) {
>> +        if (usb_chip[i])
>> +            if (platform_ops && platform_ops->connect_cb)
>> +                platform_ops->connect_cb(usb_chip[i]);
> 
> if inside if, it can just be && or maybe move callback check before 
> mutex lock and just return early if it is not present?
> 

Thanks for pointing that out.  Makes sense, and will update it.

Thanks
Wesley Cheng
