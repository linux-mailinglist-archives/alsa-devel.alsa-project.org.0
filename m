Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712B926B3B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 00:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C324410BE;
	Thu,  4 Jul 2024 00:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C324410BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720044389;
	bh=B6bn+IdAVzy7PjyJsRO/2/rruEaHBUOXEVoxMJWgCNU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dXXutj1velrYL/PxS9RLU138EfACabg2gSnrREy3bKwAcy0P/mM5+Y/j9tTqwujdp
	 8Lrt/mO6PgOlJa/xHya746pQcK9atN4slACYBFm4wDV/Cinr8tCnmqe49BBn6VDGLm
	 JHDE8fwci4iyYOL8vb6N+3ZkjjwiMn+kP2ReO+mg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A515BF805AC; Thu,  4 Jul 2024 00:05:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB959F80568;
	Thu,  4 Jul 2024 00:05:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84770F8025E; Thu,  4 Jul 2024 00:05:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 463B8F800FA
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 00:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463B8F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=jW47AWJt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 463AAYpc013722;
	Wed, 3 Jul 2024 22:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6bn+IdAVzy7PjyJsRO/2/rruEaHBUOXEVoxMJWgCNU=; b=jW47AWJtw7FzZ4QS
	alda3BHC4sd8wQ3KVOlbwfBxbeMivv2bVIBaI8AwiMjFbn6vMk+eiRGVL3x8Rr0G
	VHzXsL9A1Ewltug0NfGCbW/PAYhYXv5FwQ/eyxBbBu7qJbUDjGjUpGk+mOiwz0Ul
	zNqJmqADn3QVBDlNYZ50tiLmf+V5kmaiyuLIohQ8lI2iRM//4oG4RgAX/HkrfKWt
	GsH6F/LCXWJu8Xiiky1PJqS8yolnG4F7+5oK+HmxQ/wa7SRVN44GT8nuPu2nVbCB
	Kg1Wxy4Zx7pXKbOEfLbPTTdTFCsX+Vi0Euy7igZx2hCA3cj41i1HyeTgfMqQw6eW
	Os/4EQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4054ndsdnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 22:05:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 463M5Ulw014857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 22:05:30 GMT
Received: from [10.110.8.54] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 15:05:29 -0700
Message-ID: <ccbf9366-f3de-4a80-bffc-e32a8409e1a7@quicinc.com>
Date: Wed, 3 Jul 2024 15:05:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
 <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
 <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
 <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
 <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JDIa4Q4OAlCRprDiFXGZhlSTj4qMpCAJ
X-Proofpoint-ORIG-GUID: JDIa4Q4OAlCRprDiFXGZhlSTj4qMpCAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_16,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030164
Message-ID-Hash: IM7VFL54UBSRTNFZEAEKQIEVCFK7OXQI
X-Message-ID-Hash: IM7VFL54UBSRTNFZEAEKQIEVCFK7OXQI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IM7VFL54UBSRTNFZEAEKQIEVCFK7OXQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/3/2024 2:50 AM, Pierre-Louis Bossart wrote:
>
>
>>>>>>> There are really multiple layers to deal with
>>>>>>>
>>>>>>> a) is the controller able to support the offload path? IIRC this is
>>>>>>> embedded in an obscure XHCI property, it would make sense to
>>>>>>> expose it
>>>>>>> as a control, or component string, of the USB card.
>>>>>> If a component string/tag is desired, I already have some way of
>>>>>> doing that.  I can add it to the USB card.
>>>>>>
>>>>>>> b) is there a companion card capable of dealing with the offload
>>>>>>> path?
>>>>>>> Since the presence of this card may depend on driver probe, there
>>>>>>> should
>>>>>>> be a control on the USB card. userspace could detect changes to this
>>>>>>> control and detect if that path is or is no longer enabled.
>>>>>> So currently, the "USB Offload Playback Capable Card" kcontrol (on
>>>>>> the USB card) will determine if there is an offload path.  However,
>>>>>> this differs than what Amadeusz is suggesting, in that he wants a
>>>>>> single kcontrol created for EACH USB card identified (per USB audio
>>>>>> device), and a simple enable/disable control to determine if the
>>>>>> offload path is enabled for that card/pcm stream.
>>>>>>
>>>>>> It would be a simpler approach for the userspace, and if the card
>>>>>> that handles the offload card isn't present, then these
>>>>>> enable/disable control will be set to "disabled," and even if users
>>>>>> attempt to set the control, it won't go through.
>>>>> Not following. Are you suggesting userspace would modify the
>>>>> enable/disable status?
>>>> Yes, this is the suggestion.  One writeable kcontrol on the USB SND
>>>> audio device that will control if that USB audio device is going to
>>>> be offloaded.  If the kcontrol reads back "enabled" (or 1) then
>>>> userspace knows that the offload path is active.  Else, if it reads
>>>> "disabled" (or 0) after the attempt to set the kcontrol, then the
>>>> offload path was unsuccessfully enabled, ie maybe due to no available
>>>> offload streams.
>>> It's a bit over-engineered IMHO.
>>>
>>> My alternate suggestion is a read-only control reporting that offload is
>>> possible. Then userspace attempts to open a PCM device on the ASoC card,
>>> any failures due to resources would be handled at that point.
>>>
>>>>> I would just have a read-only control that reports what the hardware
>>>>> can
>>>>> do and which other card can deal with offload. It's up to userspace to
>>>>> select the offloaded PCM device or not.
>>>>>
>>>> That is what I have implemented in the previous patch series.  One
>>>> USB SND kcontrol within each USB audio device, which points to the
>>>> ASoC platform card that supports offloading:
>>>>
>>>> "USB Offload Playback Capable Card" --> returns the card index to the
>>>> ASoC platform card
>>>>
>>>> >From there the offloading control is all within the ASoC platform
>>>> card.  This is opposite to what Amaduesz suggested in that, the
>>>> offload control of which USB device to offload should be within USB
>>>> SND (not ASoC)
>>> It's very hard to follow, I don't understand what userspace needs to
>>> 'control' - in the modify sense. What userspace needs is a place to read
>>> from, and then select the PCM device and follow usual ALSA configuration
>>> with hw_params.
>>>
>> From what I've seen I assumed that goal is to allow Offloading of
>> specific stream from USB card. Otherwise I would say controls are not
>> needed at all, as more user friendly solution is Offloading streams in
>> order they are used as long as resources are available.
> That's not great in terms of audio routing, you'd really want more rules
> or controlled behavior where the order in which devices are used does
> not matter.

So to clarify, when I mention to 'control' this is in case userspace does want to modify which USB device is offloaded.  By default, the current behavior is that the latest USB headset is going to be enabled for offloading.  IF say...userspace has some mechanism to switch which USB device is offloaded, they can do so using:

USB Offload Playback Route Card Select

USB Offload Playback Route PCM Select

The above controls are read/write.  read will fetch the current USB card and pcm indexes being enabled for offload.  write will set the USB card and pcm index to enable offload on.  Both reside on the ASoC card that is associated w/ the USB BE DAI link.

>>>>>>> c) which PCM device is actually offloaded? This could be plural
>>>>>>> for some
>>>>>>> implementations. The mapping between PCM devices exposed by the USB
>>>>>>> card, and those exposed by the companion card, should be known to
>>>>>>> userspace. I am not sure how this would be done though, a variable
>>>>>>> number of controls is a sure way to confuse userspace.
>>>>>> Expanding on Amadeusz's suggestion, my idea is to have an
>>>>>> enable/disable kcontrol per USB stream.  For example, one USB card
>>>>>> could have multiple PCM devices (USB streams).  So we would have
>>>>>> something like:
>>>>>>
>>>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>>>
>>>>>> PCM Offload Playback Enable Stream#1  enable/disable
>>>>>>
>>>>>> ....
>>>>> are those read-only or not?
>>>> No, writable and readable.
>>> The writable part introduces a complicated error handling, e.g. what
>>> happens if you have an offloaded stream and then this control is changed
>>> with amixer while streaming?
>>>
>> -EBUSY? and keep old value
> That would require a stop, fw_free, close, reopening of the
> non-offloaded device and restart. Best to avoid interrupting streams, if
> there are no resources that should be detected with an early fail during
> open/hw_params. Once the stream is flowing, it should not be interrupted
> - unless the USB device is removed of course.
I agree.  We don't want to interrupt streams if some reason someone tries to switch the offload path.  If there is already an active offload stream, then any attempt to switch/control which USB card/pcm stream is offload is going to be ignored.
>
>>>>>> So we'd know which USB card and PCM device is selected for USB
>>>>>> SND.  However, I see what you're getting at in case there are
>>>>>> multiple supported streams, because userspace needs to know which
>>>>>> ASoC card/pcm combination corresponds to which USB device/combination.
>>>>> I don't understand how this would help map the two parts? There's
>>>>> got to
>>>>> be an additional mapping...
>>>> It won't help with the mapping.  That is something which we'd need to
>>>> add, suggestion below.
>>>>>> What do you think about having a USB card kcontrol to display the
>>>>>> mapped ASoC card and PCM indexes?
>>>>>>
>>>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0,
>>>>>> PCM device#1)
>>>>>>
>>>>>> To summarize, if we did this, I'd plan to remove all the kcontrols
>>>>>> in ASoC card, and have the following in the USB card for an USB
>>>>>> audio device that supports one USB stream:
>>>>>>
>>>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>>>
>>>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0,
>>>>>> PCM device#1)
>>>>> ... which is suggested here.
>>>>>
>>>>> Assuming these are read-only controls, we would need to know which PCM
>>>>> device on the USB card can be optimized with the use of which PCM
>>>>> device
>>>>> on the ASoC card. That means a set of three values. You would also want
>>>>> a number of streams to make the guesswork on controls less painful.
>>>> OK, so now to just figuring out something that both you and Amadeusz
>>>> can agree on before I put time implementing it.  So I've implemented
>>>> the "enable/disable" path that Amadeusz suggested, which is
>>>> highlighted in my previous response, for evaluation purposes.  The
>>>> overall question is which layer should control the devices that will
>>>> be offloaded.  In my submissions up until now, the control was given
>>>> to the ASoC platform card to determine which USB device to offload. 
>>>> Amadeusz mentioned that it might be beneficial to move the control to
>>>> the USB SND devices, because what if the offloading is NOT backed by
>>>> ASoC. (highlighted in [1])  However, IMO the current implementation
>>>> assumes there is ASoC involved, which should mean that there is some
>>>> platform "card" that is backing the offload path.  Please let me know
>>>> if my understanding is incorrect, @Amadeusz.
>>> I still fundamentally don't get why userspace would try and modify any
>>> controls, this makes the flows more complicated IMHO since you also have
>>> the PCM open/hw_params stages.
>>> I really think it'd be more than enough if the USB card exposed
>>> read-only values showing that offload is possible and which card/device
>>> to map to. Then userspace uses the ASoC PCM device and errors are
>>> handled at that level.
Just so I understand...is it really desired that userspace doesn't have the flexibility to choose which USB device is offloaded?  I know it complicates what needs to be done, but it could be just an additional feature that can be added later on.  Again, by default, we select the last USB headset plugged in to be enabled for offload by default.
>> I tend to agree, less values to change, less chance something breaks.
>> However I think that there should be some way to disable Offload in case
>> something doesn't work properly. (It doesn't have to be control, one can
>> go with module parameter or sysfs toggle or something.)
> Agree with this, a 'static' configuration to disable offload would be
> just fine. Module parameter is fine.
>
> A control to read if offload is possible and what the mapping is would
> be good. From there on, userspace may open the offloaded PCM and deal
> with all events (hw_params not supported, xruns, removal, etc).

I can look into adding this mapping part to the USB SND card, so we know which ASoC card/pcm devices are associated to the USB SND device for offloading.  Thank you for the discussions and input!

Thanks

Wesley Cheng

