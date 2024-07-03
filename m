Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78B92563B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 11:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 746C8162D;
	Wed,  3 Jul 2024 11:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 746C8162D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719998188;
	bh=b0Ks2Ke6NHTc4lwe39WA97RrPkDs5pSotWBmLU26ivo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eM9LJQ+dnzsUwbV9jGbDgJrrFaDnhjo38pnR1sjex/t34K4l15jo9UlsIJnk4lzrI
	 5X/Qu9KH65OuuZrOXYAcP69QflHSGibIxtSQKIlPn2O0lEoV7fbakAAwHLUSUIdoIk
	 a80q3/n1ocPR87dVKS4MhijJabzzsr+63YQ3tDt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0282BF805B4; Wed,  3 Jul 2024 11:15:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35571F805AF;
	Wed,  3 Jul 2024 11:15:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F427F80272; Wed,  3 Jul 2024 11:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D51B4F800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 11:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D51B4F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CR1QjAao
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719998032; x=1751534032;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b0Ks2Ke6NHTc4lwe39WA97RrPkDs5pSotWBmLU26ivo=;
  b=CR1QjAaoG2zmlOGER4yXJspjpWlkZGGBebDvMbuKr8i6UnFF58lqUdEP
   fRHKaSqaROjg/JE+Gd0ktWjRhz1c8lYsP8eObgRyqPvOl+O1Nz7t6F2bH
   fMrXjUGN/WzE9EWKvaULdcch66K41dtO0estupKIP8b9cKIO6u0l6ztZD
   YES56mJpeb1hyOGssm2WqmC6dNBshkh+3vixL02FaUzPwRy+fPVY0NoTo
   Jn3rqSbV8LBOMPyb2RvLQsIr1p02mTyMzHbsDVCc2Rw3zRcxuDh0h/wlf
   N6+nGd3sE3ZzA7A+5C21SsIcElEFYExHEW0YU4+8wBGpu32pJxZFan4qI
   g==;
X-CSE-ConnectionGUID: Ihs8K6NPRPSMaBot7fPpkw==
X-CSE-MsgGUID: Nk74rTQISKOHsOLDdHf16g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20981451"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800";
   d="scan'208";a="20981451"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 02:13:33 -0700
X-CSE-ConnectionGUID: njoHw9wSSFOLCqZa155++A==
X-CSE-MsgGUID: GqzTB32oQgaSsCOv3//1SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800";
   d="scan'208";a="46851624"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 02:13:27 -0700
Message-ID: <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
Date: Wed, 3 Jul 2024 11:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FPZNSZUC4LOO6TQTVWJCIXWLNOEBB3DO
X-Message-ID-Hash: FPZNSZUC4LOO6TQTVWJCIXWLNOEBB3DO
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPZNSZUC4LOO6TQTVWJCIXWLNOEBB3DO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/3/2024 10:49 AM, Pierre-Louis Bossart wrote:
> 
> 
>>>>> There are really multiple layers to deal with
>>>>>
>>>>> a) is the controller able to support the offload path? IIRC this is
>>>>> embedded in an obscure XHCI property, it would make sense to expose it
>>>>> as a control, or component string, of the USB card.
>>>> If a component string/tag is desired, I already have some way of doing that.  I can add it to the USB card.
>>>>
>>>>> b) is there a companion card capable of dealing with the offload path?
>>>>> Since the presence of this card may depend on driver probe, there should
>>>>> be a control on the USB card. userspace could detect changes to this
>>>>> control and detect if that path is or is no longer enabled.
>>>> So currently, the "USB Offload Playback Capable Card" kcontrol (on the USB card) will determine if there is an offload path.  However, this differs than what Amadeusz is suggesting, in that he wants a single kcontrol created for EACH USB card identified (per USB audio device), and a simple enable/disable control to determine if the offload path is enabled for that card/pcm stream.
>>>>
>>>> It would be a simpler approach for the userspace, and if the card that handles the offload card isn't present, then these enable/disable control will be set to "disabled," and even if users attempt to set the control, it won't go through.
>>> Not following. Are you suggesting userspace would modify the
>>> enable/disable status?
>>
>> Yes, this is the suggestion.  One writeable kcontrol on the USB SND audio device that will control if that USB audio device is going to be offloaded.  If the kcontrol reads back "enabled" (or 1) then userspace knows that the offload path is active.  Else, if it reads "disabled" (or 0) after the attempt to set the kcontrol, then the offload path was unsuccessfully enabled, ie maybe due to no available offload streams.
> 
> It's a bit over-engineered IMHO.
> 
> My alternate suggestion is a read-only control reporting that offload is
> possible. Then userspace attempts to open a PCM device on the ASoC card,
> any failures due to resources would be handled at that point.
> 
>>> I would just have a read-only control that reports what the hardware can
>>> do and which other card can deal with offload. It's up to userspace to
>>> select the offloaded PCM device or not.
>>>
>> That is what I have implemented in the previous patch series.  One USB SND kcontrol within each USB audio device, which points to the ASoC platform card that supports offloading:
>>
>> "USB Offload Playback Capable Card" --> returns the card index to the ASoC platform card
>>
>> >From there the offloading control is all within the ASoC platform card.  This is opposite to what Amaduesz suggested in that, the offload control of which USB device to offload should be within USB SND (not ASoC)
> 
> It's very hard to follow, I don't understand what userspace needs to
> 'control' - in the modify sense. What userspace needs is a place to read
> from, and then select the PCM device and follow usual ALSA configuration
> with hw_params.
> 

 From what I've seen I assumed that goal is to allow Offloading of 
specific stream from USB card. Otherwise I would say controls are not 
needed at all, as more user friendly solution is Offloading streams in 
order they are used as long as resources are available.

>>>>> c) which PCM device is actually offloaded? This could be plural for some
>>>>> implementations. The mapping between PCM devices exposed by the USB
>>>>> card, and those exposed by the companion card, should be known to
>>>>> userspace. I am not sure how this would be done though, a variable
>>>>> number of controls is a sure way to confuse userspace.
>>>> Expanding on Amadeusz's suggestion, my idea is to have an enable/disable kcontrol per USB stream.  For example, one USB card could have multiple PCM devices (USB streams).  So we would have something like:
>>>>
>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>
>>>> PCM Offload Playback Enable Stream#1  enable/disable
>>>>
>>>> ....
>>> are those read-only or not?
>>
>> No, writable and readable.
> 
> The writable part introduces a complicated error handling, e.g. what
> happens if you have an offloaded stream and then this control is changed
> with amixer while streaming?
> 

-EBUSY? and keep old value

>>>> So we'd know which USB card and PCM device is selected for USB SND.  However, I see what you're getting at in case there are multiple supported streams, because userspace needs to know which ASoC card/pcm combination corresponds to which USB device/combination.
>>> I don't understand how this would help map the two parts? There's got to
>>> be an additional mapping...
>> It won't help with the mapping.  That is something which we'd need to add, suggestion below.
>>>> What do you think about having a USB card kcontrol to display the mapped ASoC card and PCM indexes?
>>>>
>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
>>>>
>>>> To summarize, if we did this, I'd plan to remove all the kcontrols in ASoC card, and have the following in the USB card for an USB audio device that supports one USB stream:
>>>>
>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>
>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)
>>> ... which is suggested here.
>>>
>>> Assuming these are read-only controls, we would need to know which PCM
>>> device on the USB card can be optimized with the use of which PCM device
>>> on the ASoC card. That means a set of three values. You would also want
>>> a number of streams to make the guesswork on controls less painful.
>>
>> OK, so now to just figuring out something that both you and Amadeusz can agree on before I put time implementing it.  So I've implemented the "enable/disable" path that Amadeusz suggested, which is highlighted in my previous response, for evaluation purposes.  The overall question is which layer should control the devices that will be offloaded.  In my submissions up until now, the control was given to the ASoC platform card to determine which USB device to offload.  Amadeusz mentioned that it might be beneficial to move the control to the USB SND devices, because what if the offloading is NOT backed by ASoC. (highlighted in [1])  However, IMO the current implementation assumes there is ASoC involved, which should mean that there is some platform "card" that is backing the offload path.  Please let me know if my understanding is incorrect, @Amadeusz.
> 
> I still fundamentally don't get why userspace would try and modify any
> controls, this makes the flows more complicated IMHO since you also have
> the PCM open/hw_params stages.
> I really think it'd be more than enough if the USB card exposed
> read-only values showing that offload is possible and which card/device
> to map to. Then userspace uses the ASoC PCM device and errors are
> handled at that level.

I tend to agree, less values to change, less chance something breaks. 
However I think that there should be some way to disable Offload in case 
something doesn't work properly. (It doesn't have to be control, one can 
go with module parameter or sysfs toggle or something.)


