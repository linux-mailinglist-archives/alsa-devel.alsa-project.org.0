Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB785A116
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 11:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6800B6A;
	Mon, 19 Feb 2024 11:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6800B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708338943;
	bh=zL0WFip43RAITgM1V6q1+wudKv7V+38SkMTzwZ7HDTk=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iR/tv+EbrtWns7JpkpX+Ia3XLEZ9SWgZLySKbMvbaH0nIiXfc8b+1ifnN+TvP3Jtm
	 JIgsPCHrPraNekgKnPFWqF2/jsWMfr0MBvZK0kYAUQz5JgiSxqNdM9QgV1uQWgMyFH
	 5t2H3qMsAFzQ2Ub2shHePBFrz2LGWLjuLDUdY+D4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35598F805B2; Mon, 19 Feb 2024 11:35:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13FEBF8059F;
	Mon, 19 Feb 2024 11:35:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 913A3F8019B; Mon, 19 Feb 2024 11:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 648C5F8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 11:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 648C5F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mFp1zFnz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708338351; x=1739874351;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=zL0WFip43RAITgM1V6q1+wudKv7V+38SkMTzwZ7HDTk=;
  b=mFp1zFnzcRRyjQlfPrpGAiDufyN5mP7b6dSdhRRpZHYjVWPSW/i9zCGD
   MRpTE4iPmHKk5ylnc+XZou1iJ1FO//onUAN9MEjqj+sI/GWBmsJgZIQop
   l1QUhFC/GC2T7Ei4wmN5dwU9aLUqmXKFukYJlqqs8VJu/h8Hp4ysc2eqC
   4vH/E1j/2vVgUBVhDY9MGUCZL9mSbtB1MSn4oQURBLqnS9Ygw+AA/z2Ur
   bNlUTJlKAHimVOEPLEmepDlQTQjHxyxS5CVaVslf3qsXGMPnOs1W5CCYr
   i9m5vB8c4FgZcjqvaFPvEl2de6ARE0NWUfq5F0Aq1FLujM+eudXhqpyqL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13807128"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000";
   d="scan'208";a="13807128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="936271047"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000";
   d="scan'208";a="936271047"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2024 02:25:39 -0800
Message-ID: <96ab6033-2cb9-daa7-ddad-090138896739@linux.intel.com>
Date: Mon, 19 Feb 2024 12:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 conor+dt@kernel.org, corbet@lwn.net, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, konrad.dybcio@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
 <2024021754-unengaged-saggy-6ab1@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v17 00/51] Introduce QC USB SND audio offloading support
In-Reply-To: <2024021754-unengaged-saggy-6ab1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SGGFP2MQCDXLQQKABDHHTGEEDI46GXOV
X-Message-ID-Hash: SGGFP2MQCDXLQQKABDHHTGEEDI46GXOV
X-MailFrom: mathias.nyman@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGGFP2MQCDXLQQKABDHHTGEEDI46GXOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17.2.2024 17.25, Greg KH wrote:
> On Fri, Feb 16, 2024 at 04:09:26PM -0800, Wesley Cheng wrote:
>> Several Qualcomm based chipsets can support USB audio offloading to a
>> dedicated audio DSP, which can take over issuing transfers to the USB
>> host controller.  The intention is to reduce the load on the main
>> processors in the SoC, and allow them to be placed into lower power modes.
>> There are several parts to this design:
>>    1. Adding ASoC binding layer
>>    2. Create a USB backend for Q6DSP
>>    3. Introduce XHCI interrupter support
>>    4. Create vendor ops for the USB SND driver
>>
>>        USB                          |            ASoC
>> --------------------------------------------------------------------
>>                                     |  _________________________
>>                                     | |sm8250 platform card     |
>>                                     | |_________________________|
>>                                     |         |           |
>>                                     |      ___V____   ____V____
>>                                     |     |Q6USB   | |Q6AFE    |
>>                                     |     |"codec" | |"cpu"    |
>>                                     |     |________| |_________|
>>                                     |         ^  ^        ^
>>                                     |         |  |________|
>>                                     |      ___V____    |
>>                                     |     |SOC-USB |   |
>>     ________       ________               |        |   |
>>    |USB SND |<--->|QC offld|<------------>|________|   |
>>    |(card.c)|     |        |<----------                |
>>    |________|     |________|___     | |                |
>>        ^               ^       |    | |    ____________V_________
>>        |               |       |    | |   |APR/GLINK             |
>>     __ V_______________V_____  |    | |   |______________________|
>>    |USB SND (endpoint.c)     | |    | |              ^
>>    |_________________________| |    | |              |
>>                ^               |    | |   ___________V___________
>>                |               |    | |->|audio DSP              |
>>     ___________V_____________  |    |    |_______________________|
>>    |XHCI HCD                 |<-    |
>>    |_________________________|      |
>>
>>
>> Adding ASoC binding layer:
>> soc-usb: Intention is to treat a USB port similar to a headphone jack.
>> The port is always present on the device, but cable/pin status can be
>> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
>> communicate with USB SND.
>>
>> Create a USB backend for Q6DSP:
>> q6usb: Basic backend driver that will be responsible for maintaining the
>> resources needed to initiate a playback stream using the Q6DSP.  Will
>> be the entity that checks to make sure the connected USB audio device
>> supports the requested PCM format.  If it does not, the PCM open call will
>> fail, and userpsace ALSA can take action accordingly.
>>
>> Introduce XHCI interrupter support:
>> XHCI HCD supports multiple interrupters, which allows for events to be routed
>> to different event rings.  This is determined by "Interrupter Target" field
>> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
>>
>> Events in the offloading case will be routed to an event ring that is assigned
>> to the audio DSP.
>>
>> Create vendor ops for the USB SND driver:
>> qc_audio_offload: This particular driver has several components associated
>> with it:
>> - QMI stream request handler
>> - XHCI interrupter and resource management
>> - audio DSP memory management
>>
>> When the audio DSP wants to enable a playback stream, the request is first
>> received by the ASoC platform sound card.  Depending on the selected route,
>> ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
>> will send an AFE port start command (with enabling the USB playback path), and
>> the audio DSP will handle the request accordingly.
>>
>> Part of the AFE USB port start handling will have an exchange of control
>> messages using the QMI protocol.  The qc_audio_offload driver will populate the
>> buffer information:
>> - Event ring base address
>> - EP transfer ring base address
>>
>> and pass it along to the audio DSP.  All endpoint management will now be handed
>> over to the DSP, and the main processor is not involved in transfers.
>>
>> Overall, implementing this feature will still expose separate sound card and PCM
>> devices for both the platorm card and USB audio device:
>>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>>   1 [Audio          ]: USB-Audio - USB Audio
>>                        Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
>>
>> This is to ensure that userspace ALSA entities can decide which route to take
>> when executing the audio playback.  In the above, if card#1 is selected, then
>> USB audio data will take the legacy path over the USB PCM drivers, etc...
>>
>> This feature was validated using:
>> - tinymix: set/enable the multimedia path to route to USB backend
>> - tinyplay: issue playback on platform card
> 
> I've applied patches 1-10 and the 2 dts changes here, as those all had
> acks from the relevant maintainers already.
> 

Patch 10/10 is based on an old POC patch by me, but it's heavily modified.

It looks like it does a few minor things that are not optimal, like extra
spinlock/unlock, and wait_for_completion_timeout() with magical timeout value.
  
I haven't tested this version, but I guess any fixes or cleanups can be done
later on top of it.

Thanks
Mathias

