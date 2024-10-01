Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD598BE6B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 15:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55A14DFA;
	Tue,  1 Oct 2024 15:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55A14DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727790689;
	bh=ZjnZ6HcxXVnSGhUNzCssMu9rs8Yn/20JXALRKtmHYas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1dT4ieQSXcYJgv9g+isMNfFgZ3sosVT2NhXWkjjBbaEC6tBNmaEvrRFf2EqR0U3S
	 qbPykDYMqDyK5yhndtPqTiIMPl6z9alZZ7kix2nJ/1Yl+80iSfliewGxhYGEu9oJwT
	 ISRqBAO7rNzq6T6j0zXU/1VewTrLdZMFX9JE17I8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0FF7F8057A; Tue,  1 Oct 2024 15:50:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45787F805AA;
	Tue,  1 Oct 2024 15:50:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151CBF80517; Tue,  1 Oct 2024 15:50:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DC90F80007
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 15:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC90F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HCIp95m2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727790652; x=1759326652;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZjnZ6HcxXVnSGhUNzCssMu9rs8Yn/20JXALRKtmHYas=;
  b=HCIp95m2C0AeCNbB/qGN8i5gAb4FnNEYHmweEOdb23OL+gB73ABM3pmz
   za4o7/dVUAkub/srgG6h0wwxS7LYSeFCHqCZOFLuG/dEFC3ZuYS0TX3Hn
   nFOW/8fr6Rvvjm1DwRZFo0uN1CXnQpApHNJvPuPa8pZZbWptclIb8YU6m
   Tlo16jxwMlqC+nsZcHCopmvG6yzqYvumqyd9RftOvpKesxA6hEGh9cOQo
   cdUtyYH0apO/WpZ9CbwlAn/ppfHbLYehUUkEvH9STqlBLdc2ICuKfFkgb
   I4gu7N3yvKQJ6HldJYAIKuutDE5fdzaIrLd7MCw6pCvcjM9rYF8RMnjgH
   g==;
X-CSE-ConnectionGUID: tGx3iMx0Scq2u2F5lKy3lQ==
X-CSE-MsgGUID: EvbFxWrDQoK8nJ6D0nTqzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27057077"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800";
   d="scan'208";a="27057077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:50:30 -0700
X-CSE-ConnectionGUID: YMwChNxVQjmysxdfyxnOTw==
X-CSE-MsgGUID: s0taBGk6QrKNb737qVtWvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800";
   d="scan'208";a="78087977"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:50:24 -0700
Message-ID: <75ffde3a-7fef-4c15-bfc8-87756e1c3f11@linux.intel.com>
Date: Tue, 1 Oct 2024 15:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 00/32] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 bgoswami@quicinc.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SCAAKOCFRP756UTYBF7YVUXEP3UTQDY6
X-Message-ID-Hash: SCAAKOCFRP756UTYBF7YVUXEP3UTQDY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCAAKOCFRP756UTYBF7YVUXEP3UTQDY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/25/2024 2:59 AM, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 
> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>    1. Adding ASoC binding layer
>    2. Create a USB backend for Q6DSP
>    3. Introduce XHCI interrupter support
>    4. Create vendor ops for the USB SND driver
> 
>        USB                          |            ASoC
> --------------------------------------------------------------------
>                                     |  _________________________
>                                     | |sm8250 platform card     |
>                                     | |_________________________|
>                                     |         |           |
>                                     |      ___V____   ____V____
>                                     |     |Q6USB   | |Q6AFE    |
>                                     |     |"codec" | |"cpu"    |
>                                     |     |________| |_________|
>                                     |         ^  ^        ^
>                                     |         |  |________|
>                                     |      ___V____    |
>                                     |     |SOC-USB |   |
>     ________       ________               |        |   |
>    |USB SND |<--->|QC offld|<------------>|________|   |
>    |(card.c)|     |        |<----------                |
>    |________|     |________|___     | |                |
>        ^               ^       |    | |    ____________V_________
>        |               |       |    | |   |APR/GLINK             |
>     __ V_______________V_____  |    | |   |______________________|
>    |USB SND (endpoint.c)     | |    | |              ^
>    |_________________________| |    | |              |
>                ^               |    | |   ___________V___________
>                |               |    | |->|audio DSP              |
>     ___________V_____________  |    |    |_______________________|
>    |XHCI HCD                 |<-    |
>    |_________________________|      |
> 
> 
> Adding ASoC binding layer
> =========================
> soc-usb: Intention is to treat a USB port similar to a headphone jack.
> The port is always present on the device, but cable/pin status can be
> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> communicate with USB SND.
> 
> Create a USB backend for Q6DSP
> ==============================
> q6usb: Basic backend driver that will be responsible for maintaining the
> resources needed to initiate a playback stream using the Q6DSP.  Will
> be the entity that checks to make sure the connected USB audio device
> supports the requested PCM format.  If it does not, the PCM open call will
> fail, and userspace ALSA can take action accordingly.
> 
> Introduce XHCI interrupter support
> ==================================
> XHCI HCD supports multiple interrupters, which allows for events to be routed
> to different event rings.  This is determined by "Interrupter Target" field
> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> 
> Events in the offloading case will be routed to an event ring that is assigned
> to the audio DSP.
> 
> Create vendor ops for the USB SND driver
> ========================================
> qc_audio_offload: This particular driver has several components associated
> with it:
> - QMI stream request handler
> - XHCI interrupter and resource management
> - audio DSP memory management
> 
> When the audio DSP wants to enable a playback stream, the request is first
> received by the ASoC platform sound card.  Depending on the selected route,
> ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
> will send an AFE port start command (with enabling the USB playback path), and
> the audio DSP will handle the request accordingly.
> 
> Part of the AFE USB port start handling will have an exchange of control
> messages using the QMI protocol.  The qc_audio_offload driver will populate the
> buffer information:
> - Event ring base address
> - EP transfer ring base address
> 
> and pass it along to the audio DSP.  All endpoint management will now be handed
> over to the DSP, and the main processor is not involved in transfers.
> 
> Overall, implementing this feature will still expose separate sound card and PCM
> devices for both the platform card and USB audio device:
>   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>   1 [Audio          ]: USB-Audio - USB Audio
>                        Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
> 
> This is to ensure that userspace ALSA entities can decide which route to take
> when executing the audio playback.  In the above, if card#1 is selected, then
> USB audio data will take the legacy path over the USB PCM drivers, etc...
> 
> The current limitation is that the latest USB audio device that is identified
> will be automatically selected by the Q6USB BE DAI for offloading.  Future
> patches can be added to possibly add for more flexibility, but until the userpace
> applications can be better defined, having these mechanisms will complicate the
> overall implementation.
> 
> USB offload Kcontrols
> =====================
> Part of the vendor offload package will have a mixer driver associated with it
> (mixer_usb_offload.c).  This entity will be responsible for coordinating with
> SOC USB and the Q6USB backend DAI to fetch information about the sound card
> and PCM device indices associated with the offload path.  The logic is done
> based on the current implementation of how paths are controlled within the QC
> ASoC implementation.
> 
> QC ASoC Q6Routing
> -----------------
> Within the Q6 ASOC design, the registered ASoC platform card will expose a set
> of kcontrols for enabling the BE DAI links to the FE DAI link.  For example:
> 
> tinymix -D 0 contents
> Number of controls: 1033
> ctl     type    num     name                                    value
> ...
> 1025    BOOL    1       USB Mixer MultiMedia1                   Off
> 1026    BOOL    1       USB Mixer MultiMedia2                   Off
> 1027    BOOL    1       USB Mixer MultiMedia3                   Off
> 1028    BOOL    1       USB Mixer MultiMedia4                   Off
> 1029    BOOL    1       USB Mixer MultiMedia5                   Off
> 1030    BOOL    1       USB Mixer MultiMedia6                   Off
> 1031    BOOL    1       USB Mixer MultiMedia7                   Off
> 1032    BOOL    1       USB Mixer MultiMedia8                   Off
> 
> Each of these kcontrols will enable the USB BE DAI link (q6usb) to be connected
> to a FE DAI link (q6asm).  Since each of these controls are DAPM widgets, when
> it is enabled, the DAPM widget's "connect" flag is updated accordingly.
> 
> USB Offload Mapping
> -------------------
> Based on the Q6routing, the USB BE DAI link can determine which sound card and
> PCM device is enabled for offloading.  Fetching the ASoC platform sound card's
> information is fairly straightforward, and the bulk of the work goes to finding
> the corresponding PCM device index.  As mentioned above, the USB BE DAI can
> traverse the DAPM widgets to find the DAPM path that is related to the control
> for the "USB Mixer."  Based on which "USB Mixer" is enabled, it can find the
> corresponding DAPM widget associated w/ the FE DAI link (Multimedia*).  From there
> it can find the PCM device created for the Multimedia* stream.
> 
> Only one BE DAI link can be enabled per FE DAI.  For example, if the HDMI path is
> enabled for Multimedia1, the USB Mixer will be disabled and switched over.
> 
> Examples of kcontrol
> --------------------
> tinymix -D 0 contents
> Number of controls: 1033
> ctl     type    num     name
> ...
> 1025    BOOL    1       USB Mixer MultiMedia1                   Off
> 1026    BOOL    1       USB Mixer MultiMedia2                   On
> 1027    BOOL    1       USB Mixer MultiMedia3                   Off
> 1028    BOOL    1       USB Mixer MultiMedia4                   Off
> 1029    BOOL    1       USB Mixer MultiMedia5                   Off
> 1030    BOOL    1       USB Mixer MultiMedia6                   Off
> 1031    BOOL    1       USB Mixer MultiMedia7                   Off
> 1032    BOOL    1       USB Mixer MultiMedia8                   Off
> 
> tinymix -D 2 contents
> Number of controls: 7
> ctl     type    num     name                                    value
> 0       INT     2       Playback Channel Map                    0, 0 (range 0->36)
> 1       BOOL    2       MDR-1ADAC  Playback Switch              On, On
> 2       BOOL    1       MDR-1ADAC  Playback Switch              On
> 3       INT     2       MDR-1ADAC  Playback Volume              127, 127 (range 0->127)
> 4       INT     1       MDR-1ADAC  Playback Volume              127 (range 0->127)
> 5       BOOL    1       Sony Internal Clock Validity            On
> 6       INT     2       USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> 
> The example highlights that the userspace/application can utilize the offload path
> for the USB device on card#0 PCM device#1.
> 
> When dealing with multiple USB audio devices, only the latest USB device identified
> is going to be selected for offload capable.
> 
> tinymix -D 1 contents
> Number of controls: 9
> ctl     type    num     name                                    value
> 0       INT     2       Capture Channel Map                     0, 0 (range 0->36)
> 1       INT     2       Playback Channel Map                    0, 0 (range 0->36)
> 2       BOOL    1       Headset Capture Switch                  On
> 3       INT     1       Headset Capture Volume                  1 (range 0->4)
> 4       BOOL    1       Sidetone Playback Switch                On
> 5       INT     1       Sidetone Playback Volume                4096 (range 0->8192)
> 6       BOOL    1       Headset Playback Switch                 On
> 7       INT     2       Headset Playback Volume                 20, 20 (range 0->24)
> 8       INT     2       USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> 
> "-1, -1" shows that this device has no route to the offload path.
> 
> This feature was validated using:
> - tinymix: set/enable the multimedia path to route to USB backend
> - tinyplay: issue playback on platform card
> 



Just a reminder that I'm still not a fan of this design. Two seemingly 
unrelated Front Ends end up accessing same resource and blocking each 
other, that's why there is a need for above kcontrol interface.

In my opinion the fact that audio is routed through different HW paths, 
should not require separate Front Ends. It should start on same FE as it 
ends on one device. It would be a lot more user friendly that when end 
user opens USB FE it will just happen automatically, with current 
implementation user space needs to be aware of two separate front ends 
and internal dependency between them based on kcontrol value. If there 
is need to selectively disable it due to problems with some HW or in 
testing, just provide simple kcontrol on whole USB device with values 
"auto"(default), "force" (to always force offload), "off" (to disable it).

