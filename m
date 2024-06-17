Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC790B74F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 19:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF20AE8;
	Mon, 17 Jun 2024 19:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF20AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718643804;
	bh=3JGhG02vtoZ1ijfk8c3Nd/z5OHJyc03LsZJnbgNIDQ8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DhNEoX+L2+PImb2vZm4rDpjnBxL2e4HwzTHCUT9uLIFsVoSgMy4slFy/X+G3P/gDH
	 hNPYwSoPHmZc0rXByvYQ3XQUFyCW1SyzEmVH4Cu0b2Tl4MMoRrHn+hlsTmjkZ+qu35
	 G3Q7aRcij6RsSMg0JW/waaJ5ohPIRjhcYbzdn+AY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9F8DF805AF; Mon, 17 Jun 2024 19:02:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A8DF80587;
	Mon, 17 Jun 2024 19:02:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1378DF8023A; Mon, 17 Jun 2024 19:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19493F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 19:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19493F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ZQMnO/q2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45HE3k1v030595;
	Mon, 17 Jun 2024 17:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAb0X9XKILevg0s3K1b3t7RQbb42+rkRZsD2p+B37jg=; b=ZQMnO/q2rII2ut1J
	sjiucoFbxhEcoBC0oYgZ3OpSJyrdGi+yi2zyKbBWeS0bKhUWe8Mtgc2YxZcfnncl
	POodabHi8Z/cmIyCGtGFe1TWG2v1YJWQ6HSMTX/Y+C99qsM1ylNl2MX4KhS5bPxr
	5x7PN0ZFDgquFKgeW2skSgI5WEWGoyu+HW3kxmv7BKPChIeS5jNGSuBh2XBzNSCs
	ta2hNKHfJeFGjKhXAT3SdIYGGH73uwqeo6BNu1CRwmdA0fB5ILD1yalVwdqDFlTV
	zWiEY8yjwlPsB9CIZtgFw6235R22FBQj+RZ1hijkFGqD7/YDnTltdlyhHATLIMyD
	0kEzdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytfut1ej8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 17:02:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45HH2SH9008951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 17:02:28 GMT
Received: from [10.110.93.116] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 10:02:27 -0700
Message-ID: <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
Date: Mon, 17 Jun 2024 10:02:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6iEKt_voJesWSGLnIJI_1RjB-WcfLNX5
X-Proofpoint-GUID: 6iEKt_voJesWSGLnIJI_1RjB-WcfLNX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170131
Message-ID-Hash: VZDBDXTGGE27V3OJKK4QYRAHDKOHD2VF
X-Message-ID-Hash: VZDBDXTGGE27V3OJKK4QYRAHDKOHD2VF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZDBDXTGGE27V3OJKK4QYRAHDKOHD2VF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

On 6/13/2024 12:46 AM, Amadeusz Sławiński wrote:
> On 6/12/2024 9:28 PM, Wesley Cheng wrote:
>> Hi Amadeusz,
>>
>> On 6/12/2024 7:47 AM, Amadeusz Sławiński wrote:
>>> On 6/11/2024 1:58 AM, Wesley Cheng wrote:
>>>
>>> (...)
>>>
>>>> +In the case where the USB offload driver is unbounded, while USB 
>>>> SND is
>>>
>>> unbounded -> unbound
>>>
>>> (...)
>>>
>>>> +SOC USB and USB Sound Kcontrols
>>>> +===============================
>>>> +Details
>>>> +-------
>>>> +SOC USB and USB sound expose a set of SND kcontrols for 
>>>> applications to select
>>>> +and fetch the current offloading status for the ASoC platform sound 
>>>> card. Kcontrols
>>>> +are split between two layers:
>>>> +
>>>> +    - USB sound - Notifies the sound card number for the ASoC 
>>>> platform sound
>>>> +      card that it is registered to for supporting audio offload.
>>>> +
>>>> +    - SOC USB - Maintains the current status of the offload path, 
>>>> and device
>>>> +      (USB sound card and PCM device) information.  This would be 
>>>> the main
>>>> +      card that applications can read to determine offloading 
>>>> capabilities.
>>>> +
>>>> +Implementation
>>>> +--------------
>>>> +
>>>> +**Example:**
>>>> +
>>>> +  **Sound Cards**:
>>>> +
>>>> +    ::
>>>> +
>>>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>> +                     SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>> +      1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>> +                     Plantronics Plantronics C320-M at 
>>>> usb-xhci-hcd.1.auto-1, full speed
>>>> +
>>>> +
>>>> +  **Platform Sound Card** - card#0:
>>>> +
>>>> +    ::
>>>> +
>>>> +      USB Offload Playback Route Card Select  1 (range -1->32)
>>>> +      USB Offload Playback Route PCM Select   0 (range -1->255)
>>>> +      USB Offload Playback Route Card Status  -1 (range -1->32)
>>>> +      USB Offload Playback Route PCM Status   -1 (range -1->255)
>>>> +
>>>> +
>>>> +  **USB Sound Card** - card#1:
>>>> +
>>>> +    ::
>>>> +
>>>> +      USB Offload Playback Capable Card         0 (range -1->32)
>>>> +
>>>> +
>>>> +The platform sound card(card#0) kcontrols are created as part of 
>>>> adding the SOC
>>>> +USB device using **snd_soc_usb_add_port()**.  The following 
>>>> kcontrols are defined
>>>> +as:
>>>> +
>>>> +  - ``USB Offload Playback Route Card Status`` **(R)**: USB sound 
>>>> card device index
>>>> +    that defines which USB SND resources are currently offloaded. 
>>>> If -1 is seen, it
>>>> +    signifies that offload is not active.
>>>> +  - ``USB Offload Playback Route PCM Status`` **(R)**: USB PCM 
>>>> device index
>>>> +    that defines which USB SND resources are currently offloaded. 
>>>> If -1 is seen, it
>>>> +    signifies that offload is not active.
>>>> +  - ``USB Offload Playback Route Card Select`` **(R/W)**: USB sound 
>>>> card index which
>>>> +    selects the USB device to initiate offloading on.  If no value 
>>>> is written to the
>>>> +    kcontrol, then the last USB device discovered card index will 
>>>> be chosen.
>>>
>>> I see only one kcontrol, what if hardware is capable of offloading on 
>>> more cards, is it possible to do offloading on more than one device?
>>>
>>>> +  - ``USB Offload Playback Route PCM Select`` **(R/W)**: USB PCM 
>>>> index which selects
>>>> +    the USB device to initiate offloading on.  If no value is 
>>>> written to the
>>>> +    kcontrol, then the last USB device discovered PCM zero index 
>>>> will be chosen.
>>>> +
>>>> +The USB sound card(card#1) kcontrols are created as USB audio 
>>>> devices are plugged
>>>> +into the physical USB port and enumerated.  The kcontrols are 
>>>> defined as:
>>>> +
>>>> +  - ``USB Offload Playback Capable Card`` **(R)**: Provides the 
>>>> sound card
>>>> +    number/index that supports USB offloading.  Further/follow up 
>>>> queries about
>>>> +    the current offload state can be handled by reading the offload 
>>>> status
>>>> +    kcontrol exposed by the platform card.
>>>> +
>>>
>>>
>>> Why do we need to some magic between cards? I feel like whole 
>>> kcontrol thing is overengineered a bit - I'm not sure I understand 
>>> the need to do linking between cards. It would feel a lot simpler if 
>>> USB card exposed one "USB Offload" kcontrol on USB card if USB 
>>> controller supports offloading and allowed to set it to true/false to 
>>> allow user to choose if they want to do offloading on device.
>>>
>>> (...)
>>
>> Based on feedback from Pierre, what I understood is that for some 
>> applications, there won't be an order on which sound card is 
>> queried/opened first.
>>
> 
> Yes if you have multiple cards, they are probed in random order.
> 
>> So the end use case example given was if an application opened the USB 
>> sound card first, it can see if there is an offload path available.  
>> If there is then it can enable the offload path on the corresponding 
>> card if desired.
>>
> 
> This still doesn't explain why you need to link cards using controls. 
> What would not work with simple "Enable Offload" with true/false values 
> on USB card that works while you do have above routing controls?
> 

Sorry for the late response.

I think either way, even with the "Enable Offload" kcontrol in USB SND, 
we'd need a way to link these cards, because if you have multiple USB 
audio devices connected, and say... your offload mechanism only supports 
one stream.  Then I assume we'd still need to way to determine if that 
stream can be enabled for that USB SND device or not.

Since the USB SND isn't really the entity maintaining the offload path, 
I went with the decision to add that route selection to the ASoC 
platform card. It would have access to all the parameters supported by 
the audio DSP.

Thanks
Wesley Cheng

>>>> +Mixer Examples
>>>> +--------------
>>>> +
>>>> +    ::
>>>> +
>>>> +      tinymix -D 0 set 'USB Offload Playback Route Card Select' 2
>>>> +      tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0
>>>> +
>>>> +
>>>> +    ::
>>>> +
>>>> +      tinymix -D 0 get 'USB Offload Playback Route Card Select'
>>>> +      --> 2 (range -1->32)
>>>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Select'
>>>> +      --> 0 (range -1->255)
>>>> +
>>>> +    ::
>>>> +
>>>> +      tinymix -D 0 get 'USB Offload Playback Route Card Status'
>>>> +      --> 2 (range -1->32)   [OFFLD active]
>>>> +      --> -1 (range -1->32) [OFFLD idle]
>>>> +      tinymix -D 0 get 'USB Offload Playback Route PCM Status'
>>>> +      --> 0 (range -1->255)   [OFFLD active]
>>>> +      --> -1 (range -1->255) [OFFLD idle]
>>>> +
>>>> +    ::
>>>> +
>>>> +      tinymix -D 1 get 'USB Offload Playback Capable Card'
>>>> +      --> 0 (range -1->32)
>>>>
>>>
>>> Yes, looking at examples again, I'm still not sure I understand. 
>>> There are two cards and you do linking between them, this feels 
>>> broken by design. From my point of view USB Offload should be 
>>> property of USB card and not involve any other card in a system.
>>>
>>
>> Main benefit to having two cards (keeping one for USB SND and another 
>> for the ASoC platform sound card) is that current applications won't 
>> break.  The behavior is the same, in that if something opens the USB 
>> sound card, it will go through the same non-offloaded path.  During 
>> initial reviews, I think this was a big point where folks wanted the 
>> USB PCM path to still be an option.
>>
> 
> I'm not against having two cards, in fact I hope that USB card looks and 
> behaves the same as before this patch set, with only difference being 
> controls for enabling offload.
> 
>> If applications want to add the offload capabilities to its 
>> environment, they can enable it as an additional feature.
> 
> That sounds fine to me.
> 
