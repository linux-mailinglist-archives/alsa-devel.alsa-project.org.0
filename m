Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A109B94C098
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 17:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC1F6A4D;
	Thu,  8 Aug 2024 17:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC1F6A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723129866;
	bh=r985UfwqL1h8K9aokwCyDd3V5rJtD93Nf43KfmOuQsk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CKOD91GuOsOkauspLel96iHbaet+oHyffrHtfaosjgiJMQcPj+I8k6gWPFtrbz2QM
	 YRYF+XplA9kjJNoMs8sLcrY1BtYkASMARwRvH1AUQPjfWdSgR7YP5aYRHRV8pGkfje
	 W9emHdUH5r/V/V/UTimlD+Mnbk8VUttgINPpkMt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B57A2F805AC; Thu,  8 Aug 2024 17:10:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC50F805B0;
	Thu,  8 Aug 2024 17:10:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F4C4F802DB; Thu,  8 Aug 2024 16:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE1B1F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 16:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1B1F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=blQGnBV4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723128862; x=1754664862;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r985UfwqL1h8K9aokwCyDd3V5rJtD93Nf43KfmOuQsk=;
  b=blQGnBV4vInC83rMb0kNz2sgw+gFB1mcfri0nryIwrRY/fmAduiORt5u
   xizEv++b2BmyWhPar8pmYYd+jXgM8rNZuzg7kUA0X147WOho/QsDe9JFe
   KdDMWVa+nI6n6QdFFeMQeu5+QKpz7DIosROGkumqvUEvW7ujyjppHpeHd
   IiQjDse8EbGydcKuDMVIfCIfdwR9U8JT6vLeSHJTxt2wh+o8keJA9xxZU
   K8ovnR1hy/Wm1lp7dMStJyEYWJjZwyC16ZjDMYqI7Jy85X1zNjfIz92z6
   DOt/UChGFKkQ3hpnfXBAe2t0sxcroFahGJ/l5EE0g8wP0TEAO+Cq8kCwy
   w==;
X-CSE-ConnectionGUID: 5OJZy8tZSMWdncgZn4DIxg==
X-CSE-MsgGUID: CgH10hCPT2Gc3fFIwEjLGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21427409"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800";
   d="scan'208";a="21427409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 07:54:16 -0700
X-CSE-ConnectionGUID: vAjEFa4ERGyjqZz2qHyCrg==
X-CSE-MsgGUID: IlJ73vWWTuWjDaL6uohR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800";
   d="scan'208";a="57486370"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 07:54:11 -0700
Message-ID: <e5cd1a9d-0a16-4c80-b9b9-1c63b8e818cc@linux.intel.com>
Date: Thu, 8 Aug 2024 16:54:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
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
 <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <24a224a2-0600-4ee2-989e-02224ef849ba@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XSN52KKRXO4QY56X434U2AN7ZMN244J2
X-Message-ID-Hash: XSN52KKRXO4QY56X434U2AN7ZMN244J2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSN52KKRXO4QY56X434U2AN7ZMN244J2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/8/2024 2:36 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 8/8/24 14:11, Amadeusz Sławiński wrote:
>> On 8/8/2024 3:19 AM, Wesley Cheng wrote:
>>> Hi Amadeusz,
>>>
>>> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>>>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>>>> With USB audio offloading, an audio session is started from the ASoC
>>>>> platform sound card and PCM devices.  Likewise, the USB SND path is
>>>>> still
>>>>> readily available for use, in case the non-offload path is desired.  In
>>>>> order to prevent the two entities from attempting to use the USB bus,
>>>>> introduce a flag that determines when either paths are in use.
>>>>>
>>>>
>>>> How can this happen? Can you provide some example with list of
>>>> devices and which one should block the other? If I recall correctly
>>>> devices are already exclusive unless you support substreams which
>>>> ASoC does not at the moment.
>>>>
>>>   From past discussions, I think so far everyone is on board with the
>>> idea of having both the USB sound card and PCM devices exist in
>>> conjunction w/ the USB offload path, which is going to be done over
>>> the ASoC platform card.  So for example,
>>>
>>
>> Sorry, I must have missed that and examples in documentation could
>> probably be a bit better, it is bit late at patchset 24 that I
>> understood about this now. And is part of a reason why I was confused
>> about kcontrol implementation.
>>
>>> / # cat /proc/asound/cards
>>>    0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>                         SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>>    1 [C320M          ]: USB-Audio - Plantronics C320-M
>>>                         Plantronics Plantronics C320-M at usb-xhci-
>>> hcd.1.auto-1.2, full speed
>>>
>>> This device currently has the following sound cards within the system:
>>>
>>> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
>>>
>>> - card#1 - USB SND card: card created for interacting with the
>>> connected USB device.
>>>
>>> So now, with USB offloading in the picture, there are basically two
>>> paths that can start attempting to utilize the same USB device
>>> endpoints.  Let's keep it simple and assume the device only has one
>>> playback substream (which means only one PCM device)
>>>
>>> /proc/asound/card1 # cat stream0
>>> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full
>>> speed : USB Audio
>>>
>>> Playback:
>>>     Status: Stop
>>>     Interface 2
>>>       Altset 1
>>>       Format: S16_LE
>>>       Channels: 2
>>>       Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>>>       Rates: 8000, 16000, 24000, 32000, 44100, 48000
>>>       Bits: 16
>>>       Channel map: FL FR
>>>
>>> So the patch here will prevent transfers from happening from both the
>>> offload path and directly over the USB SND PCM device, which
>>> correlates to the following paths:
>>>
>>> - offload: card#0 pcm#0
>>>
>>> - USB SND: card#1 pcm#0
>>
>> Well, it's one way to do that.
>>
>> Personally I would just reuse USB FEs and when opening one check if it
>> can be offloaded:
>> * check if someone disabled Offload on FE
>> * check if it is connected to HW that can do Offload at all
>> * check if Offload streams are available on backing HW
>> * check if audio formats are supported by above HW
>> * do any other checks that may be needed
>> and then just redirect FE setup to relevant driver doing offload if
>> able, otherwise just go standard path.
> 
> How would userspace know which 'USB FE' to use?
> 

That's my point, the same one as it would use doing normal 
playback/capture on systems which don't have Offload.

If I attach USB Headphones, as a user my expectation would be to use 
playback FE on USB card it exposes, not to spend time setting some 
controls and telling it to use some FE from other card.

With current design there are _two_ separate FEs, on _two_ separate 
cards, which are linked by kcontrol and which block each other. I'm 
rather confused how basic userspace application knows which one to use 
in this case. (By now of course I know that it needs to read kcontrol to 
see if and where it is offloaded and then open the FE on the card, but 
in my opinion it is unnecessarily convoluted.)

> The discovery and mapping between cards and devices is the main problem.
> 

And "offloading" decision to the user/sound server/HAL doesn't help in 
my opinion.

> It's much simpler to start from a generic "USB-Audio" card, and check if
> the functionality exposed by one PCM device is offloaded to another
> ASoC-based card. Then all the interaction can start with this offloaded
> device without any guesswork on the mapping between cards/devices.
> 

That's the point, currently there needs to be some guesswork involved, 
because you need to check kcontrols to see if the endpoint can be 
offloaded and open the other FE it points at, instead of directly 
opening the one you usually would, and having it Offloaded by kernel. It 
is adding more work on userspace side, which will require special 
handling to work correctly.

> The point is that the USB-Audio card will always be there, whereas those
> ASoC cards will have different names and implementation restrictions. In
> the example we have here, if you want to capture audio you *have* to use
> the USB-Audio card.
> 

Yes and with the description above it would be just one of the checks 
after which it would decide that it can't do Offload on capture path and 
open it in standard way, I see no problem?

> In other words, it's just an endianness type of debate with no clear
> difference between solutions and a matter of personal preference. The
> reality is that there's a clear asymmetrical pattern. The USB-Audio card
> is always present and usable, the ASoC offloaded cards are only present
> in specific implementations and only usable if conditions are met.

In my opinion even if it is specific use case, there is no reason to 
make it more complicated than it needs to be. From my point of view 
problem with current design is that instead of being mostly transparent 
to userspace (when it could be), it adds more work for it.

