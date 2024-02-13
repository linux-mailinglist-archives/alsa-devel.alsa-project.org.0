Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D25853F4D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 23:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E68EC0;
	Tue, 13 Feb 2024 23:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E68EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707865169;
	bh=5GZjg5DkIYbt13jrl4mBTCYCb0dRu3ZBmp2agCG9D2k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BqQhAFyq6sRxIAXPwcFvMm81RpCEDcdGiET2CMie7HcCORx7JyuxbYiqLOc5pEZ7N
	 691vh+KqQCFECMMCfebsmZjEI6JhIzfP12RVn6yRxNdOmo8f8Uh3b9Uo3k424XnZ1a
	 F8c+Nz+dzEwinw+bhqw8o+Cp6kjskkVldLvDHjRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE6D8F805AA; Tue, 13 Feb 2024 23:58:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD49F805A0;
	Tue, 13 Feb 2024 23:58:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEDF8F80238; Tue, 13 Feb 2024 23:58:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7173F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 23:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7173F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DbTtKKru
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41DK9qi9014988;
	Tue, 13 Feb 2024 22:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6EmYNtRmbGEYRyUXFF7l3ex2WkY1Ic6WX4gLszPjpLM=; b=Db
	TtKKruMCpWe0Wa0h3biQsBw0j1apSzb6VjG+VXXpr8Eo51b7jFOai58wY4o/+dEL
	3fkso2QAwrRpphdGJAWaF2ig9kpGY70ogk11tNMnkkdC32logT82XGyLD0PbC8dG
	bHvR/1/5m3OVEVNUe3za2JC5rzBaxZ/1V5OKwosmrfritWqWOSpHMNzAWn0e4Q/M
	rhZXm+2cv7AEiWiZVxBfAZApt+FW+IGWknk3RFAmy+tFoQ9D7RosP9hIX9WLTLKC
	iUqJ8HEdQ2T+lVmUBWYKzhcKWjJ2YQMKa2uL78ViPVa97K0VjZgk7VGlBFtbi76i
	RVV+x/fSQLQaCm+xTPwA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7gse45hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 22:58:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41DMwgYg021602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 22:58:42 GMT
Received: from [10.110.76.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 13 Feb
 2024 14:58:41 -0800
Message-ID: <5b7af169-1fc0-265c-5253-c82010388e82@quicinc.com>
Date: Tue, 13 Feb 2024 14:58:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 41/50] ASoC: Add SND kcontrol for fetching USB offload
 status
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
 <20240213005422.3121-42-quic_wcheng@quicinc.com>
 <87plx0y37z.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87plx0y37z.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4LQsJgrgUhNL98vd3cVNsTKE56avszOU
X-Proofpoint-ORIG-GUID: 4LQsJgrgUhNL98vd3cVNsTKE56avszOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_14,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=939 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130181
Message-ID-Hash: P5KETNAKDCDBWIO77XP6NTJ7G3S4PXG6
X-Message-ID-Hash: P5KETNAKDCDBWIO77XP6NTJ7G3S4PXG6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5KETNAKDCDBWIO77XP6NTJ7G3S4PXG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/13/2024 4:10 AM, Takashi Iwai wrote:
> On Tue, 13 Feb 2024 01:54:13 +0100,
> Wesley Cheng wrote:
>>
>> Add a kcontrol to the platform sound card to fetch the current offload
>> status.  This can allow for userspace to ensure/check which USB SND
>> resources are actually busy versus having to attempt opening the USB SND
>> devices, which will result in an error if offloading is active.
>>
>> An example of fetching the USB offloading status would look like:
>> tinymix -D 0 get 'USB Offload Playback Route Status'
>> -1, -1 (range -1->32) --> [Offload is idle]
>>
>> tinymix -D 0 get 'USB Offload Playback Route Status'
>> 1, 0 (range -1->32)  --> [Offload active on card#1 pcm#0]
> 
> Ah, I didn't notice until now that the second value is the PCM index.
> 
>> +static int snd_soc_usb_offload_status_info(struct snd_kcontrol *kcontrol,
>> +			      struct snd_ctl_elem_info *uinfo)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
>> +
>> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
>> +	uinfo->count = 2*ctx->num_supported_streams;
>> +	uinfo->value.integer.min = -1;
>> +	uinfo->value.integer.max = SNDRV_CARDS;
> 
> Then it's bogus to set SNDRV_CARDS as max.  The PCM index number is
> independent from the card number.  In theory, it can be even more than
> the card max (very unlikely, though).
> 

I don't think its technically capped anywhere :).  I just used 
SNDRV_CARDS to cap the sound card number.  If I split this as a separate 
entity, then I'll need to change the max value for the PCM dev.

> Wouldn't it be more intuitive to provide two different controls, one
> for card number and one for PCM index number?
> 

Sure, I can split this up.

Thanks
Wesley Cheng
