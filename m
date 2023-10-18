Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874B7CE8B8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 22:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7991B850;
	Wed, 18 Oct 2023 22:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7991B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697660690;
	bh=6O9czxpw5IupV9tSRvCfot57LYS7ncJkvdDz9WmXfRk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bvPjl/D8SxBiRFyNgiDr77Bmgj+7/1eMvvOkORxb7OipWHPsbXpU2KIu1L8PH8q50
	 zy+LjyZavxC7UVU1cPqRavQFzxMcHzbfP5v/gJxvBlap1bmqDqisBSolST8spR4KpX
	 p3Go8czXJqo9KLkG1F38w0M+7+OG3Z+3DygeJ/AY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F37B2F80553; Wed, 18 Oct 2023 22:23:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F0EF8024E;
	Wed, 18 Oct 2023 22:23:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1F59F8027B; Wed, 18 Oct 2023 22:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A758F8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 22:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A758F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bhhDb/aH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39IILcRX025958;
	Wed, 18 Oct 2023 20:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MZK6pqj1ss77uI7PA+Fgrt/RZmQ8X/QTlxXNZEv5AKo=;
 b=bhhDb/aHD/FKRfI30ps4x9K/6Qf4QmWlDHPdYifAxLKyP9W1rEGEru+aEPWg333pITU5
 YXWL3KDM4XQ5PDAkmHT4jv8UA1Tnqz766i1JZizJbePOCgTaUZ0To34E2ioqZDqTcDsL
 l+j2Yu+zlFpTuLwz5xHG/CDp5qWs0GCT3XTwTkS7i5Bvs0u/lNkBlfwTThxt8N48lyMs
 Oi1q+4gsVSfPFyoplc0xhK52S3ZeS4JrwlRJu1T5HD4qo2vjZk4tUVxdr19+7sncbGog
 xpp13+EuCDftUoXCDt3TgZy/h+pJXeyTTLuHxjj+t5yDo3xKk9aD4rxOlSf5+bjXTVtm Mw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttg82s0kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:21:46 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 39IKLjTq000644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:21:45 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 13:21:44 -0700
Message-ID: <7184bb42-4159-8e99-3ab6-56c115873078@quicinc.com>
Date: Wed, 18 Oct 2023 13:21:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 20/34] ALSA: usb-audio: Check for support for requested
 audio format
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-21-quic_wcheng@quicinc.com>
 <ad851c66-5c5f-4bbb-b278-7b0c49b3cb07@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ad851c66-5c5f-4bbb-b278-7b0c49b3cb07@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fFipZuSxrJahsBe5JduYXO9dpd0JE-n_
X-Proofpoint-ORIG-GUID: fFipZuSxrJahsBe5JduYXO9dpd0JE-n_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_18,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310180167
Message-ID-Hash: YTOXOMYF6D3LOLN72BQQSH5PFSSRLMHZ
X-Message-ID-Hash: YTOXOMYF6D3LOLN72BQQSH5PFSSRLMHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTOXOMYF6D3LOLN72BQQSH5PFSSRLMHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 10/17/2023 3:29 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:00, Wesley Cheng wrote:
>> Allow for checks on a specific USB audio device to see if a requested PCM
>> format is supported.  This is needed for support for when playback is
> 
> This is needed for support when playback is
> 

Will fix this typo

>> initiated by the ASoC USB backend path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   sound/usb/card.h | 11 +++++++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index c0b312e264bf..88f431917c15 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -162,6 +162,46 @@ int snd_usb_unregister_platform_ops(void)
>>   }
>>   EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>>   
>> +/*
>> + * Checks to see if requested audio profile, i.e sample rate, # of
>> + * channels, etc... is supported by the substream associated to the
>> + * USB audio device.
>> + */
>> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction)
>> +{
>> +	struct snd_usb_audio *chip;
>> +	struct snd_usb_substream *subs = NULL;
> 
> useless init?
> 

Agreed.

Thanks
Wesley Cheng
