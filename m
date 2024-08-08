Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5994B4A0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 03:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BDD2105F;
	Thu,  8 Aug 2024 03:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BDD2105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723080290;
	bh=uY+8Y/Agn+9e5ldI3aoUfK7ieopcbzJ+c8ye/sX78Pg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O9TAM2qSTIJsujA/K9HeNPS8caD1gbcgiy6gewvFFl3OhGVl76QgybwrrdmyzspOf
	 PH2nBiICBEp3fyTOujG8sObLqDT9DwJtJD0ghQVuUNb3HMLXQSZTsb6An4WHnqvjc6
	 8NFy8apjVw9X810bP2CzVy+WmHuSgYbqUwT2CqPo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C575F8023A; Thu,  8 Aug 2024 03:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72113F805AE;
	Thu,  8 Aug 2024 03:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED9C9F8047C; Thu,  8 Aug 2024 03:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32A24F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 03:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32A24F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Ah0E6BPM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4781Mtn8020983;
	Thu, 8 Aug 2024 01:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uY+8Y/Agn+9e5ldI3aoUfK7ieopcbzJ+c8ye/sX78Pg=; b=Ah0E6BPMsdBKq6RV
	MmZxTC2HKx6OHTP45noB3dssMs4+NeqYWO1BfLFLzp372ufe1AcJ6jkkbdnv5ucO
	bgV1/ur4b37m7aBumKlV+6xqSQtWS61H8FfIDxzuVGpWgrJxzR6WOG5AUWiwQWlA
	7hdxt3rtuYgC5Rx0Z6ggbxDwo1I8fbOhXoTVQV12FbkaOKPpT8DKbkVc2IJ1Ob4o
	d32RTAYulbr73bkM9Nh6oX9rte9RlmWEzSRBFAF/g7otuC7sXfuRP0utNvNIvKNa
	n9wbe6K9iH7iAEQFTa1BrngxubQcHufn75GtuEm2d5MakuXg+iTq3QCRyTxrxPbC
	zl3fOg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40v79j9v77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:24:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4781OQl1002152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:24:26 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:24:25 -0700
Message-ID: <847f65bb-3d09-461c-b2dd-7ce5babf76c2@quicinc.com>
Date: Wed, 7 Aug 2024 18:24:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 10/34] ASoC: usb: Create SOC USB SND jack kcontrol
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-11-quic_wcheng@quicinc.com>
 <89b10ddb-9d0e-480e-846f-64f2a4592f6f@linux.intel.com>
 <2141c04d-953b-47a5-a105-8a60ec370371@quicinc.com>
 <5c882055-85d5-41ba-98bf-da375a490c5b@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5c882055-85d5-41ba-98bf-da375a490c5b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -mK0MTBDKPfXCrSUD_CZ12ZRIkve007M
X-Proofpoint-ORIG-GUID: -mK0MTBDKPfXCrSUD_CZ12ZRIkve007M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408080008
Message-ID-Hash: LCBZ22VZLKV2QNEILUJTEPBCYJZIDUOH
X-Message-ID-Hash: LCBZ22VZLKV2QNEILUJTEPBCYJZIDUOH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCBZ22VZLKV2QNEILUJTEPBCYJZIDUOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
> On 8/2/2024 12:43 AM, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 8/1/2024 1:07 AM, Pierre-Louis Bossart wrote:
>>>
>>>
>>>> +static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>>> +                         struct snd_soc_jack *jack)
>>>> +{
>>>> +    return -ENODEV;
>>>> +}
>>>> +
>>>> +static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>>>> +{
>>>> +    return -ENODEV;
>>>> +}
>>> usually fallback functions return 0, is the error code intentional?
>> ACK.
>>>
>>>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>>> +                    struct snd_soc_jack *jack)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
>>> do we need the reference to Playback?
>> No, will remove.
>>>> +                    SND_JACK_HEADPHONE, jack);
>>> wondering if there would be any merit in defining a new type of jack,
>>> e.g. SND_JACK_USB since here the purpose is to notify that there's a USB
>>> device connected. The type of device does not really matter, does it?
>>>
>> Not as of now, but I think we discussed in the past that maybe depending on if playback and capture is supported, we can notify SND_JACK_HEADSET?  That is something I will need to change depending on how we want to handle the comments on patch#9
>>
>
> I agree with Pierre that SND_JACK_HEADPHONE is too specific in this case, adding SND_JACK_USB sounds like good solution, as there are more device types than headset and headphones. Alternatively you could also consider defining some type of USB Audio Class mapping to existing SND_JACK types. (Look for UAC_INPUT_TERMINAL_*, UAC_OUTPUT_TERMINAL_* & UAC_BIDIR_TERMINAL_*.)

Let me take a look at this and get back to you if I have any questions.

Thanks

Wesley Cheng

