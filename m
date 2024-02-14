Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9C8556D2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 00:03:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3045850;
	Thu, 15 Feb 2024 00:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3045850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707951784;
	bh=02cTatai7GPs5v344TM5mzOOIQyekqpuUW+YGxDlxWc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V0V2pDuZ6zk89MtGu4h8r7VEz5gF451opMt4OT5720ZuripdaevFyv4KX5OPr6xOR
	 OT7W6Qft7FqX2VDJhSUMIAa9lqDdyrq3TBzT5qQbP8j/x8VDi5tNH5SZ72B1XGu6CU
	 y2+BrWQEGksesONGsN2BZveQhCMhDslc/TvToZwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E21AF805AA; Thu, 15 Feb 2024 00:02:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C55E5F805A0;
	Thu, 15 Feb 2024 00:02:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3673DF80238; Thu, 15 Feb 2024 00:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E48F3F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 00:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48F3F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=cNlDOk92
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EMgIAO019540;
	Wed, 14 Feb 2024 23:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1GW05LxH0VvnJ9ProNTCf0P2xyJXWnAWLMy2YLNh4qY=; b=cN
	lDOk92LIR99xrpamA8sz0N5ArCaopS2VM6101BwkMQV9VtFEtMk+439Pv0GJdjCn
	5EnGX2PuyNMBj49ZAtlAXWT0bpje8q6kPF1jL4obmzPLTnGaoYsVS6lPQSXGaRUO
	R5Hu3aiL7396cMOxq+Pj/unHa3ODbvd3KoO3JnPTylLQCrKy5yJElTkhgkghUODB
	oEZwZER9tOwAup7MjL/Ukrv+iXiIE4oGNJ6cVIsWAxIWsh9Rt1vStwaGRa0wv49n
	a7pASPZdkHGKvE1vgu6v1Ht2QH6Gy109tjOjjFtCy89RkmzqsfAzbW30KhZsNaLq
	eGatDCHoqL67tKyOPhKg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8kkrjet8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 23:02:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 41EN2KvH011166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 23:02:20 GMT
Received: from [10.71.114.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 15:02:19 -0800
Message-ID: <afccaa50-74a4-d7e9-2aa5-e5c3c1d55bff@quicinc.com>
Date: Wed, 14 Feb 2024 15:02:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 46/50] ALSA: usb-audio: Add USB offloading capable
 kcontrol
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
 <20240213005422.3121-47-quic_wcheng@quicinc.com>
 <87o7cky2va.wl-tiwai@suse.de>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87o7cky2va.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WGJlsDvBg2gCWujv_N8iCh27crL-0SHj
X-Proofpoint-ORIG-GUID: WGJlsDvBg2gCWujv_N8iCh27crL-0SHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_14,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140174
Message-ID-Hash: DHKMYT3W3Y2W44X7OS3SIKRAGTXIRQQ6
X-Message-ID-Hash: DHKMYT3W3Y2W44X7OS3SIKRAGTXIRQQ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHKMYT3W3Y2W44X7OS3SIKRAGTXIRQQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 2/13/2024 4:18 AM, Takashi Iwai wrote:
> On Tue, 13 Feb 2024 01:54:18 +0100,
> Wesley Cheng wrote:
>>
>> --- a/sound/usb/Makefile
>> +++ b/sound/usb/Makefile
>> @@ -22,6 +22,7 @@ snd-usb-audio-objs := 	card.o \
>>   			stream.o \
>>   			validate.o
>>   
>> +snd-usb-audio-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>>   snd-usb-audio-$(CONFIG_SND_USB_AUDIO_MIDI_V2) += midi2.o
>>   snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
> 
> This puts the code into snd-usb-audio driver, and that causes a
> dependency mess, since...
> 

I see what you mean after moving some things into modules, etc... Will 
fix this accordingly.

>> +snd_usb_offload_available_get(struct snd_kcontrol *kcontrol,
>> +		      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
>> +	int ret;
>> +
>> +	ret = snd_soc_usb_device_offload_available(sysdev);
> 
> ... here you call snd_soc_usb_*() stuff that belongs to snd-soc-usb.
> That is, with this patch, snd-usb-audio driver will depend on
> snd-soc-usb, while snd-soc-usb also depends on snd-usb-audio for its
> helpers again.
> 
> I believe the better way would be to move this whole miser_usb_offload
> code into sound/usb/qcom/.  You need only usb_device and snd_card
> objects at the creation, and you can get them in qcom driver side,
> too.
> 

Yes, plan is just to compile this as part of the overall offload module 
if the config is enabled.

Thanks
Wesley Cheng
