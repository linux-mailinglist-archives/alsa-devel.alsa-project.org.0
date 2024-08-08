Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF54794BDA5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 14:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB20EC7;
	Thu,  8 Aug 2024 14:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB20EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723120682;
	bh=+1zgwuPLaGGXFLlOPK3YlsrRj/fXoTmWsgP9AuzOAh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=meb9KWzDAhZPgbqKtOlvMTrIz+DEItjrWWw6iZSfH+uN49SiISqs0kkTrGjN7/oeO
	 Lq/a/M0I8Jl9iU1Q3my+GdkIapSm/vZMSKPhFFDDUIztDHwxZDb5+8gmqaYj3i1vi6
	 2yHxHFlwaeYJ5tsf9z5bI+/D31ucNqibBSOFV3vY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 495C4F805AA; Thu,  8 Aug 2024 14:37:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78650F805AA;
	Thu,  8 Aug 2024 14:37:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC95DF802DB; Thu,  8 Aug 2024 14:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82522F800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 14:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82522F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ty/btFqb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723120627; x=1754656627;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+1zgwuPLaGGXFLlOPK3YlsrRj/fXoTmWsgP9AuzOAh0=;
  b=Ty/btFqbOARfRESMlA+xZs+Ft0h3jDnI3FgFhViMBs3mUh2IQcepg81G
   aBmWXxCZ9m3feQWdu/eh7EJ8eUJc2YEe+QkArQERDPqBhCjAQnkxoEzz+
   28PDBpRrDW35FLe9fjy2A0V+NVEP1o3IgIC+728xpRKLu1A7mXSnY3ULb
   2FH4ok7a48oODmxNbxaTqCojNAeI+IxtgD62u1Rr7Z1O4Chg5d69mAl0X
   W1hQ+sDpQyRVE9V7yQbPA++Dny5Wq9uRDAkao1MoaidtjygaPgWP5gj3A
   CYsLEPcoFxznNbDUTRGXPmpbz4qO1DbrORnPh99O4/1kvKf6JxTAWyCo4
   Q==;
X-CSE-ConnectionGUID: AWAOwnHwShS2PNHiD9EJ7w==
X-CSE-MsgGUID: 9D58oy20QeWuLAUwR03bTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21402080"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800";
   d="scan'208";a="21402080"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 05:37:03 -0700
X-CSE-ConnectionGUID: DLlP2L6vSLK84RGk9nzFCA==
X-CSE-MsgGUID: UrorykPvR/mKGCuBEVdsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800";
   d="scan'208";a="62054611"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.169])
 ([10.245.246.169])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 05:36:56 -0700
Message-ID: <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
Date: Thu, 8 Aug 2024 14:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-24-quic_wcheng@quicinc.com>
 <186ae30f-678c-423a-a56f-74510a184f99@linux.intel.com>
 <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
 <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3U4377AF7X5RPMB6VRD5MBAQY6SRPPHG
X-Message-ID-Hash: 3U4377AF7X5RPMB6VRD5MBAQY6SRPPHG
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3U4377AF7X5RPMB6VRD5MBAQY6SRPPHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/8/24 14:11, Amadeusz Sławiński wrote:
> On 8/8/2024 3:19 AM, Wesley Cheng wrote:
>> Hi Amadeusz,
>>
>> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>>> With USB audio offloading, an audio session is started from the ASoC
>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>> still
>>>> readily available for use, in case the non-offload path is desired.  In
>>>> order to prevent the two entities from attempting to use the USB bus,
>>>> introduce a flag that determines when either paths are in use.
>>>>
>>>
>>> How can this happen? Can you provide some example with list of
>>> devices and which one should block the other? If I recall correctly
>>> devices are already exclusive unless you support substreams which
>>> ASoC does not at the moment.
>>>
>>  From past discussions, I think so far everyone is on board with the
>> idea of having both the USB sound card and PCM devices exist in
>> conjunction w/ the USB offload path, which is going to be done over
>> the ASoC platform card.  So for example,
>>
> 
> Sorry, I must have missed that and examples in documentation could
> probably be a bit better, it is bit late at patchset 24 that I
> understood about this now. And is part of a reason why I was confused
> about kcontrol implementation.
> 
>> / # cat /proc/asound/cards
>>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>   1 [C320M          ]: USB-Audio - Plantronics C320-M
>>                        Plantronics Plantronics C320-M at usb-xhci-
>> hcd.1.auto-1.2, full speed
>>
>> This device currently has the following sound cards within the system:
>>
>> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
>>
>> - card#1 - USB SND card: card created for interacting with the
>> connected USB device.
>>
>> So now, with USB offloading in the picture, there are basically two
>> paths that can start attempting to utilize the same USB device
>> endpoints.  Let's keep it simple and assume the device only has one
>> playback substream (which means only one PCM device)
>>
>> /proc/asound/card1 # cat stream0
>> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full
>> speed : USB Audio
>>
>> Playback:
>>    Status: Stop
>>    Interface 2
>>      Altset 1
>>      Format: S16_LE
>>      Channels: 2
>>      Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>>      Rates: 8000, 16000, 24000, 32000, 44100, 48000
>>      Bits: 16
>>      Channel map: FL FR
>>
>> So the patch here will prevent transfers from happening from both the
>> offload path and directly over the USB SND PCM device, which
>> correlates to the following paths:
>>
>> - offload: card#0 pcm#0
>>
>> - USB SND: card#1 pcm#0
> 
> Well, it's one way to do that.
> 
> Personally I would just reuse USB FEs and when opening one check if it
> can be offloaded:
> * check if someone disabled Offload on FE
> * check if it is connected to HW that can do Offload at all
> * check if Offload streams are available on backing HW
> * check if audio formats are supported by above HW
> * do any other checks that may be needed
> and then just redirect FE setup to relevant driver doing offload if
> able, otherwise just go standard path.

How would userspace know which 'USB FE' to use?

The discovery and mapping between cards and devices is the main problem.

It's much simpler to start from a generic "USB-Audio" card, and check if
the functionality exposed by one PCM device is offloaded to another
ASoC-based card. Then all the interaction can start with this offloaded
device without any guesswork on the mapping between cards/devices.

The point is that the USB-Audio card will always be there, whereas those
ASoC cards will have different names and implementation restrictions. In
the example we have here, if you want to capture audio you *have* to use
the USB-Audio card.

In other words, it's just an endianness type of debate with no clear
difference between solutions and a matter of personal preference. The
reality is that there's a clear asymmetrical pattern. The USB-Audio card
is always present and usable, the ASoC offloaded cards are only present
in specific implementations and only usable if conditions are met.



