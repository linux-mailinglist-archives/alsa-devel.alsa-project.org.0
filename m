Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AD94C578
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 21:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D54DEB76;
	Thu,  8 Aug 2024 21:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D54DEB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723146692;
	bh=k7ul0/j8TS7mfjggsBFF5jrVcxlu1jhMPaAa/bNdtHI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u4m+9uIui4aRm9ej/JHvWOMvme4WkHajuwc04vO4vUp1QJ8JJmujQkNaRgsFs5eaA
	 hD9CZ4q9kOdenOP+wbntGs+TzvvY71XSb+WlBLuxzgHHlt9ot1yXW5ny92NC/j7ife
	 cKNeQb0dUdbqi64fSpeJKOH8m2Lw4xMxzvD8iU/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26461F805B1; Thu,  8 Aug 2024 21:51:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BDE6F805B1;
	Thu,  8 Aug 2024 21:51:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25BBFF802DB; Thu,  8 Aug 2024 21:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47DFEF800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 21:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DFEF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=jROdtspL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47894XJ8007960;
	Thu, 8 Aug 2024 19:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7ul0/j8TS7mfjggsBFF5jrVcxlu1jhMPaAa/bNdtHI=; b=jROdtspLhY9CdpPI
	kneaiF4XII7PPwYayivSpG5xKaa+IUPAOO5GNejwyz1k56op4q/dQ0LD6Y02fVBT
	Ap3g5Iuz80oVJEcZg/9lHBSDeF3nFROUVH+TUxlTcoeHpsVFjoN5Bal2uYqLS+gM
	Z/dyYsFIVqkQXAfxWTRAlZmYnC38Y6PbJIFvA8EAMwAQEr9qWCAU/kNXdK9/zhpf
	IfRgT5zKsDEmxioDR6t145Zd8TAdnAmZe7KUpHCXGbH/oWj9PP3/1LOQ1GgEWjpN
	pEMEpu5Ynx8DvaezucZgD+R6xZ38pgpPw+4G/RxTzIpmTmahNr1hETUO21KFZ/VI
	Ac3lWg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfy5b6v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 19:47:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 478JlMMg027917
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 19:47:22 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 Aug 2024
 12:47:21 -0700
Message-ID: <ed17a6ac-ff9b-4b1d-9275-ebfb62979a34@quicinc.com>
Date: Thu, 8 Aug 2024 12:47:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
 <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
 <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
 <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
 <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
 <e5cd1a9d-0a16-4c80-b9b9-1c63b8e818cc@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e5cd1a9d-0a16-4c80-b9b9-1c63b8e818cc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sZ3EWb4BY250xogQoumQmdBT50dEBlro
X-Proofpoint-ORIG-GUID: sZ3EWb4BY250xogQoumQmdBT50dEBlro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_19,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080140
Message-ID-Hash: TA44ZVMC5R4J5IHGBTANY2YFARYMJFR5
X-Message-ID-Hash: TA44ZVMC5R4J5IHGBTANY2YFARYMJFR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TA44ZVMC5R4J5IHGBTANY2YFARYMJFR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/8/2024 7:54 AM, Amadeusz Sławiński wrote:
> On 8/8/2024 2:36 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 8/8/24 14:11, Amadeusz Sławiński wrote:
>>> On 8/8/2024 3:19 AM, Wesley Cheng wrote:
>>>> Hi Amadeusz,
>>>>
>>>> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>>>>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>>>>> With USB audio offloading, an audio session is started from the ASoC
>>>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>>>> still
>>>>>> readily available for use, in case the non-offload path is desired.  In
>>>>>> order to prevent the two entities from attempting to use the USB bus,
>>>>>> introduce a flag that determines when either paths are in use.
>>>>>>
>>>>>
>>>>> How can this happen? Can you provide some example with list of
>>>>> devices and which one should block the other? If I recall correctly
>>>>> devices are already exclusive unless you support substreams which
>>>>> ASoC does not at the moment.
>>>>>
>>>>   From past discussions, I think so far everyone is on board with the
>>>> idea of having both the USB sound card and PCM devices exist in
>>>> conjunction w/ the USB offload path, which is going to be done over
>>>> the ASoC platform card.  So for example,
>>>>
>>>
>>> Sorry, I must have missed that and examples in documentation could
>>> probably be a bit better, it is bit late at patchset 24 that I
>>> understood about this now. And is part of a reason why I was confused
>>> about kcontrol implementation.
>>>
>>>> / # cat /proc/asound/cards
>>>>    0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>>                         SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>>    1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>>                         Plantronics Plantronics C320-M at usb-xhci-
>>>> hcd.1.auto-1.2, full speed
>>>>
>>>> This device currently has the following sound cards within the system:
>>>>
>>>> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
>>>>
>>>> - card#1 - USB SND card: card created for interacting with the
>>>> connected USB device.
>>>>
>>>> So now, with USB offloading in the picture, there are basically two
>>>> paths that can start attempting to utilize the same USB device
>>>> endpoints.  Let's keep it simple and assume the device only has one
>>>> playback substream (which means only one PCM device)
>>>>
>>>> /proc/asound/card1 # cat stream0
>>>> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full
>>>> speed : USB Audio
>>>>
>>>> Playback:
>>>>     Status: Stop
>>>>     Interface 2
>>>>       Altset 1
>>>>       Format: S16_LE
>>>>       Channels: 2
>>>>       Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>>>>       Rates: 8000, 16000, 24000, 32000, 44100, 48000
>>>>       Bits: 16
>>>>       Channel map: FL FR
>>>>
>>>> So the patch here will prevent transfers from happening from both the
>>>> offload path and directly over the USB SND PCM device, which
>>>> correlates to the following paths:
>>>>
>>>> - offload: card#0 pcm#0
>>>>
>>>> - USB SND: card#1 pcm#0
>>>
>>> Well, it's one way to do that.
>>>
>>> Personally I would just reuse USB FEs and when opening one check if it
>>> can be offloaded:
>>> * check if someone disabled Offload on FE
>>> * check if it is connected to HW that can do Offload at all
>>> * check if Offload streams are available on backing HW
>>> * check if audio formats are supported by above HW
>>> * do any other checks that may be needed
>>> and then just redirect FE setup to relevant driver doing offload if
>>> able, otherwise just go standard path.
>>
>> How would userspace know which 'USB FE' to use?
>>
>
> That's my point, the same one as it would use doing normal playback/capture on systems which don't have Offload.
>
> If I attach USB Headphones, as a user my expectation would be to use playback FE on USB card it exposes, not to spend time setting some controls and telling it to use some FE from other card.
>
IMO I think the user should have the ability to choose whether or not to enable the offload path, since there are a lot of different USB audio devices in the market.  Obviously, the audio DSP will try its best to support every device we check for, but there might be a few outliers that may behave differently.  In addition, the code complexity that would be involved in bridging the PCM device exposed by USB SND into ASoC will be much more invasive to SND core code.  At least as of now, if the offload code is added, and userspace doesn't know anything about it, then the default USB SND path is taken and that won't break any current userspace applications.

Now, if we go and add some kernel based offload routing, and forcing that onto every userspace application, and we break that use case, that would be a problem.  In the end, I think if userspace wants to enable offloading they should need to have some changes implemented to account for it.  In discussions with Pierre, maybe enabling the offload path can be on a policy based condition, such as a "low power/power aware" audio path, and not something that is always enabled.

Thanks

Wesley Cheng

> With current design there are _two_ separate FEs, on _two_ separate cards, which are linked by kcontrol and which block each other. I'm rather confused how basic userspace application knows which one to use in this case. (By now of course I know that it needs to read kcontrol to see if and where it is offloaded and then open the FE on the card, but in my opinion it is unnecessarily convoluted.)
>
>> The discovery and mapping between cards and devices is the main problem.
>>
>
> And "offloading" decision to the user/sound server/HAL doesn't help in my opinion.
>
>> It's much simpler to start from a generic "USB-Audio" card, and check if
>> the functionality exposed by one PCM device is offloaded to another
>> ASoC-based card. Then all the interaction can start with this offloaded
>> device without any guesswork on the mapping between cards/devices.
>>
>
> That's the point, currently there needs to be some guesswork involved, because you need to check kcontrols to see if the endpoint can be offloaded and open the other FE it points at, instead of directly opening the one you usually would, and having it Offloaded by kernel. It is adding more work on userspace side, which will require special handling to work correctly.
>
>> The point is that the USB-Audio card will always be there, whereas those
>> ASoC cards will have different names and implementation restrictions. In
>> the example we have here, if you want to capture audio you *have* to use
>> the USB-Audio card.
>>
>
> Yes and with the description above it would be just one of the checks after which it would decide that it can't do Offload on capture path and open it in standard way, I see no problem?
>
>> In other words, it's just an endianness type of debate with no clear
>> difference between solutions and a matter of personal preference. The
>> reality is that there's a clear asymmetrical pattern. The USB-Audio card
>> is always present and usable, the ASoC offloaded cards are only present
>> in specific implementations and only usable if conditions are met.
>
> In my opinion even if it is specific use case, there is no reason to make it more complicated than it needs to be. From my point of view problem with current design is that instead of being mostly transparent to userspace (when it could be), it adds more work for it.
>
