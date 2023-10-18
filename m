Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F047CDE1D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 15:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68523AE8;
	Wed, 18 Oct 2023 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68523AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697637546;
	bh=WicXwt7zgwB0kjyvct5P6tuXn0cpYntJoR2pWn1NKFg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dl+HlMY8fbp1RlugOW7dZ0PBFNQzg3jFUth7kd689WcrS7XHrNX0+9OaqGh2eJ2DY
	 daYBVz97EG3aDe/kRMlQNkpTsU/4onDIqnwaWW7dQqzSPIFcfQvEXehQvi64yvN17P
	 C+lZvxLGE39iZgd6Z8tWOwSVoyoNon9bx/AwAkN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE5C7F8032D; Wed, 18 Oct 2023 15:57:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82B65F8032D;
	Wed, 18 Oct 2023 15:57:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 610F7F8055B; Wed, 18 Oct 2023 15:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ED16F800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 15:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED16F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V2xnBj0Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697637440; x=1729173440;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WicXwt7zgwB0kjyvct5P6tuXn0cpYntJoR2pWn1NKFg=;
  b=V2xnBj0ZBd980j3XdNOUtHclbF6EvSpkjmV1gfCbt1TgJfbogcmuqhVY
   FBIDTiuhl7h+PyQ3grS8bBgmiFbelRxX7PsmGghBAepvBZ7g8dl7DKjwV
   K/GznEpaNXcIyL09ysq0yi6A0aJUuXjY2iqpkhO23XxY3XqZ+jhfJulR0
   x2axMQtGLOFKvZ3BTEAORkf11KRYEBKWVMppKBHeM8EEwZWhG7NbNITuG
   Vjn9Vm+uUUlMFPOW5t/kFYhLVmxZpuiD+lkP2IwV1+7f0pZt19IQjTID1
   Z5hAu/OB+PROjcgUjX0RJwNvdPa6sAfWQZQMKHE7TvJbNDzXUqFoC8KNl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472242462"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200";
   d="scan'208";a="472242462"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 06:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930209927"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200";
   d="scan'208";a="930209927"
Received: from dmangels-mobl.amr.corp.intel.com (HELO [10.209.187.130])
 ([10.209.187.130])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 06:57:14 -0700
Message-ID: <925d7c03-c288-49a4-8bcd-395b32810d75@linux.intel.com>
Date: Wed, 18 Oct 2023 08:54:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/34] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <9942bb93-31ea-4574-940f-98d87a2fc127@linux.intel.com>
 <366d50fa-500f-e884-d48a-197e65bb2fb7@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <366d50fa-500f-e884-d48a-197e65bb2fb7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BWDAWEHOJQ7LN6TRBWYFPUG5BJWBK73Z
X-Message-ID-Hash: BWDAWEHOJQ7LN6TRBWYFPUG5BJWBK73Z
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWDAWEHOJQ7LN6TRBWYFPUG5BJWBK73Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 19:25, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 10/17/2023 1:58 PM, Pierre-Louis Bossart wrote:
>> It's been a very long time since I reviewed earlier versions, and I am
>> still lost on terminology and concepts. The explanations below should
>> really be added as a .rst file in Documentation for reference, not just
>> as a cover letter.
>>
> 
> Thanks for the review!
> 
> Sure, maybe I can write a more comprehensive documentation that saves
> these details somewhere.  Will add a RST documentation for material
> where necessary.
> 
>>> Several Qualcomm based chipsets can support USB audio offloading to a
>>> dedicated audio DSP, which can take over issuing transfers to the USB
>>> host controller.  The intention is to reduce the load on the main
>>> processors in the SoC, and allow them to be placed into lower power
>>> modes.
>>> There are several parts to this design:
>>>    1. Adding ASoC binding layer
>>>    2. Create a USB backend for Q6DSP
>>
>> "backend" is a loaded terms for ASoC. Can you clarify which part of the
>> ascii art below is a 'backend'?
>>
> 
> This would be the Q6USB entity which is the DPCM backend for this
> particular audio path.

DPCM is about dailinks. Technically the q6usb entity is a codec dai
which is part of a DPCM backend dailink.
> 
>>>    3. Introduce XHCI interrupter support
>>>    4. Create vendor ops for the USB SND driver
>>>
>>>        USB                          |            ASoC
>>> --------------------------------------------------------------------
>>>                                     |  _________________________
>>>                                     | |sm8250 platform card     |
>>>                                     | |_________________________|
>>>                                     |         |           |
>>>                                     |      ___V____   ____V____
>>>                                     |     |Q6USB   | |Q6AFE    |
>>>                                     |     |"codec" | |"cpu"    |
>>>                                     |     |________| |_________|
>>>                                     |         ^  ^        ^
>>>                                     |         |  |________|
>>>                                     |      ___V____    |
>>>                                     |     |SOC-USB |   |
>>>     ________       ________               |        |   |
>>>    |USB SND |<--->|QC offld|<------------>|________|   |
>>>    |(card.c)|     |        |<----------                |
>>>    |________|     |________|___     | |                |
>>>        ^               ^       |    | |    ____________V_________
>>>        |               |       |    | |   |APR/GLINK             |
>>>     __ V_______________V_____  |    | |   |______________________|
>>>    |USB SND (endpoint.c)     | |    | |              ^
>>>    |_________________________| |    | |              |
>>>                ^               |    | |   ___________V___________
>>>                |               |    | |->|audio DSP              |
>>>     ___________V_____________  |    |    |_______________________|
>>>    |XHCI HCD                 |<-    |
>>>    |_________________________|      |
>>>
>>>
>>> Adding ASoC binding layer:
>>> soc-usb: Intention is to treat a USB port similar to a headphone jack.
>>
>> What is a 'port'? USB refers to "interfaces" and "endpoints". Is a
>> "port" a 1:1 mapping to "endpoint"?
>>
>> Below I read "AFE port" so not sure what concepts refer to what.
>>
> 
> "Port" in this explanation refers to the USB port.  So the audio device
> connected.  You are right that a USB device can enumerate w/ multiple
> interfaces (ie UAC + HID + ...) so the closest relation to "port" is
> "interface."  It is not a 1:1 mapping w/ the number of endpoints exposed
> by a device.
> 
> "AFE port" is just something that has been termed from the audio DSP
> end, so that concept of port is not related to the port where USB
> devices are connected to.  This is something that is defined within the
> audio DSP.

Wow. So there's a "USB port" and "AFE port". I would recommend avoiding
the same term for completely different concepts. Why not use "USB device"?

>>>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>
>> How do you plan on exposing the USB PCM device?
>>
>> The lines above are really cryptic, and with no USB reference in any of
>> the short/long card names it's not obvious that this card is different
>> from the no-offload case, is it?
>>
> 
> In the end, since the offload case is handled by the audio DSP, it would
> have to go through the platform/machine sound card.  That is the sm8250
> device above.
> 
>>>   1 [Audio          ]: USB-Audio - USB Audio
>>>                        Generic USB Audio at usb-xhci-hcd.1.auto-1.4,
>>> high speed
>>
>> likewise some sort of qualifier would be useful to show that card 0 and
>> card 1 can target the same USB endpoints.
>>
> 
> Do userspace entities look at this card string?  Assuming there is only
> one platform card, there are situations where maybe multiple USB audio
> devices are connected to the same USB root hub, so offloading can happen
> on any one of them (not at the same time).

Jaroslav cares, as measured by the changes over the years to make the
card names more self-explanatory.

I really don't see anything in the SM8250MTPWCD938 card name that would
hint at the support of USB. If it's not in the card string, maybe this
can be added in the component string as well (amixer -Dhw:0 info). The
point is that userspace should not have to maintain an 'accept-list' of
card names but have the means to check the USB offload capability with a
vendor-neutral convention.
