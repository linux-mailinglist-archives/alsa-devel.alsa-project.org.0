Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34D94BD49
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 14:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154BA83B;
	Thu,  8 Aug 2024 14:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154BA83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723119690;
	bh=ypoxP7jDf7LjMLCC24x01FzK9fJ/WozB7SR4D4u7jHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p1N/nXz3Y150/5xnBBgfZ8It3F9X663bJ+Z9CRxDDbuXIxP042LgiHJbO1cZxRX4z
	 dqLTSp0zF4WEbdthDDQa2VcXpgQarZ3ml2yiOLy7GKcYNSyJ1zSEhyjOwqGPoE1mUo
	 O9xr3bXxctOeuCbUx5MWvQJ1Iq6bbjyl4wrJ5k3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 623C7F805D3; Thu,  8 Aug 2024 14:20:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D32F805D2;
	Thu,  8 Aug 2024 14:20:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 673A5F802DB; Thu,  8 Aug 2024 14:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1717F800B0
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 14:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1717F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AjBqdD3v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723119080; x=1754655080;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ypoxP7jDf7LjMLCC24x01FzK9fJ/WozB7SR4D4u7jHA=;
  b=AjBqdD3va8GcBqwGQVcpO57OM7NPjWW4ePJQyqSKGs9JjhEJH1QH2INN
   iMvHFpYVG1naf4pki0Uor54TLJaASWCqJqg9W2Beuc/wbp527c5PXVh2I
   J9r6i27MFsRPIMF1ien0dueC1UTFxmx3MSvdklqNbRNvc57qYHsZaPj/5
   wHAsj5gsfrMC3eRfLRvm1KhvHp/yFw6erhIqLMO3KvMHaJm7L3Y2fEMwR
   75k7ZH0ERv0fkrTWUTEVRo1hdePJl3C6l1UkaWgPMOpd0JMC8npWBVIH8
   Y0M1nNk6crhxekJrwd6P+3DhcJVgEBOxR15fxDXG+HoVFaZk7j/JeXjGp
   g==;
X-CSE-ConnectionGUID: cpiKCEuRRS+3Jf8Y3lBILw==
X-CSE-MsgGUID: bo+FiF4ETB2EU0A1A+kPrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20901296"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800";
   d="scan'208";a="20901296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 05:11:15 -0700
X-CSE-ConnectionGUID: TmdFroz0QU6FXsOr/pvTEg==
X-CSE-MsgGUID: D7BmpyGfTAuI8ysmCatVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800";
   d="scan'208";a="62149825"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 05:11:11 -0700
Message-ID: <c3b6ac24-6359-4809-83d9-ac62ec64b396@linux.intel.com>
Date: Thu, 8 Aug 2024 14:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <43e9850c-3e34-4582-aadd-4a6dcbd3ce8d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G4Q7222BT2OOVNN6AJ2CT73VQB32EHXT
X-Message-ID-Hash: G4Q7222BT2OOVNN6AJ2CT73VQB32EHXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4Q7222BT2OOVNN6AJ2CT73VQB32EHXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/8/2024 3:19 AM, Wesley Cheng wrote:
> Hi Amadeusz,
> 
> On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
>> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>>> With USB audio offloading, an audio session is started from the ASoC
>>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>>> readily available for use, in case the non-offload path is desired.  In
>>> order to prevent the two entities from attempting to use the USB bus,
>>> introduce a flag that determines when either paths are in use.
>>>
>>
>> How can this happen? Can you provide some example with list of devices and which one should block the other? If I recall correctly devices are already exclusive unless you support substreams which ASoC does not at the moment.
>>
>  From past discussions, I think so far everyone is on board with the idea of having both the USB sound card and PCM devices exist in conjunction w/ the USB offload path, which is going to be done over the ASoC platform card.  So for example,
> 

Sorry, I must have missed that and examples in documentation could 
probably be a bit better, it is bit late at patchset 24 that I 
understood about this now. And is part of a reason why I was confused 
about kcontrol implementation.

> / # cat /proc/asound/cards
>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>   1 [C320M          ]: USB-Audio - Plantronics C320-M
>                        Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> 
> This device currently has the following sound cards within the system:
> 
> - card#0 - ASoC platform card: handles USB offload, speaker, etc...
> 
> - card#1 - USB SND card: card created for interacting with the connected USB device.
> 
> So now, with USB offloading in the picture, there are basically two paths that can start attempting to utilize the same USB device endpoints.  Let's keep it simple and assume the device only has one playback substream (which means only one PCM device)
> 
> /proc/asound/card1 # cat stream0
> Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed : USB Audio
> 
> Playback:
>    Status: Stop
>    Interface 2
>      Altset 1
>      Format: S16_LE
>      Channels: 2
>      Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>      Rates: 8000, 16000, 24000, 32000, 44100, 48000
>      Bits: 16
>      Channel map: FL FR
> 
> So the patch here will prevent transfers from happening from both the offload path and directly over the USB SND PCM device, which correlates to the following paths:
> 
> - offload: card#0 pcm#0
> 
> - USB SND: card#1 pcm#0

Well, it's one way to do that.

Personally I would just reuse USB FEs and when opening one check if it 
can be offloaded:
* check if someone disabled Offload on FE
* check if it is connected to HW that can do Offload at all
* check if Offload streams are available on backing HW
* check if audio formats are supported by above HW
* do any other checks that may be needed
and then just redirect FE setup to relevant driver doing offload if 
able, otherwise just go standard path.


As I've wrote I must have missed the discussion where it was agreed on 
and if maintainers agree that it can be done this way, I won't fight it. 
Even though I would consider my way a lot simpler and user friendly from 
end user point of view.

Thanks,
Amadeusz
