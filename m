Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043AE6B2BDF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 18:19:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57F1189E;
	Thu,  9 Mar 2023 18:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57F1189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678382363;
	bh=DWw0YxBPSzac2AGMPFfLahNrg6JI7/BBQKqE56zAOwc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l1NhotLH2tsON/T6c5wYhfASf4Ja2X7throGEp+LN0csDV1NV045CpSmotJmAg1KU
	 7qPnr63qAHWBztcdjvqgLZokZ8Pv/c/+vI+d2gotBesabK3RKbJrxczwLo0eu20Cc5
	 OUOstvGA2/PVWgNpLgIcL3qhhiPYrdZhFbbJpJ98=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E90FDF80236;
	Thu,  9 Mar 2023 18:18:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57546F8042F; Thu,  9 Mar 2023 18:18:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E771F80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 18:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E771F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OAUkOyYd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678382293; x=1709918293;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DWw0YxBPSzac2AGMPFfLahNrg6JI7/BBQKqE56zAOwc=;
  b=OAUkOyYdej0WXzdLQ+GEzIWgcD/ftVS3ddqygTPS0IwK8kQCRo+nwxFj
   7OpAfhuGp+dFjOZOl2DWnGIA5EWrs7RguMT5ZBPN3Rnt4OAR9feHZIiHI
   pyMUupFEiABCGZPyTe9rjFrbLa8PZ26UZ/Frhslp8aPjFMduqjQY6L78p
   io7xori7+oI7ZpA7yTK8lXLsEk8GRmvTO++8ydnYLyNfedUT7jKFZ1Xhm
   3PB5P8si7NKjChbNtTMbPPiCQD402mZqSpr+lx1dC6sMrnrKgpZfIGe2Y
   Lx4E+7RnMmfXpML14qFuTtie5/ivnuPCrUa7SViTucj7SrNQHPi03CGix
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364150242"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400";
   d="scan'208";a="364150242"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 09:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801241494"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400";
   d="scan'208";a="801241494"
Received: from hamannjo-mobl1.amr.corp.intel.com (HELO [10.255.34.234])
 ([10.255.34.234])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 09:13:36 -0800
Message-ID: <4f8a66c0-398f-5655-3aa7-a59bc9ba56cc@linux.intel.com>
Date: Thu, 9 Mar 2023 11:13:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/28] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EYYPAKATPBYBEM4KHW2X7ELFZSCSFKJD
X-Message-ID-Hash: EYYPAKATPBYBEM4KHW2X7ELFZSCSFKJD
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYYPAKATPBYBEM4KHW2X7ELFZSCSFKJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/8/23 17:57, Wesley Cheng wrote:
> Changes in v3:
> - Changed prefix from RFC to PATCH
> - Rebased entire series to usb-next
> - Updated copyright years

You may want to move the per-version changes after the description of
this patchset.

> XHCI:
> - Rebased changes on top of XHCI changes merged into usb-next, and only added
> changes that were still under discussion.
> - Added change to read in the "num-hc-interrupters" device property.
> 
> ASoC:
> - qusb6 USB backend
>   - Incorporated suggestions to fetch iommu information with existing APIs
>   - Added two new sound kcontrols to fetch offload status and offload device
>     selection.
>     - offload status - will return the card and pcm device in use
>         tinymix -D 0 get 1 --> 1, 0 (offload in progress on card#1 pcm#0)
> 
>     - device selection - set the card and pcm device to enable offload on. Ex.:
>         tinymix -D 0 set 1 2 0  --> sets offload on card#2 pcm#0
>                                     (this should be the USB card)
> 
> USB SND:
> - Fixed up some locking related concerns for registering platform ops.
>    - Moved callbacks under the register_mutex, so that 
> - Modified APIs to properly pass more information about the USB SND device, so
> that the Q6USB backend can build a device list/map, in order to monitor offload
> status and device selection.
> 
> Changes in v2:
> 
> XHCI:
> - Replaced XHCI and HCD changes with Mathias' XHCI interrupter changes
> in his tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters
> 
> Adjustments made to Mathias' changes:
>   - Created xhci-intr.h to export/expose interrupter APIs versus exposing xhci.h.
>     Moved dependent structures to this file as well. (so clients can parse out
>     information from "struct xhci_interrupter")
>   - Added some basic locking when requesting interrupters.
>   - Fixed up some sanity checks.
>   - Removed clearing of the ERSTBA during freeing of the interrupter. (pending
>     issue where SMMU fault occurs if DMA addr returned is 64b - TODO)
> 
> - Clean up pending events in the XHCI secondary interrupter.  While testing USB
> bus suspend, it was seen that on bus resume, the xHCI HC would run into a command
> timeout.
> - Added offloading APIs to xHCI to fetch transfer and event ring information.
> 
> ASoC:
> - Modified soc-usb to allow for multiple USB port additions.  For this to work,
> the USB offload driver has to have a reference to the USB backend by adding
> a "usb-soc-be" DT entry to the device saved into XHCI sysdev.
> - Created separate dt-bindings for defining USB_RX port.
> - Increased APR timeout to accommodate the situation where the AFE port start
> command could be delayed due to having to issue a USB bus resume while
> handling the QMI stream start command.
> 
> USB SND:
> - Added a platform ops during usb_audio_suspend().  This allows for the USB
> offload driver to halt the audio stream when system enters PM suspend.  This
> ensures the audio DSP is not issuing transfers on the USB bus.
> - Do not override platform ops if they are already populated.
> - Introduce a shared status variable between the USB offload and USB SND layers,
> to ensure that only one path is active at a time.  If the USB bus is occupied,
> then userspace is notified that the path is busy.


---> start of the cover letter:

> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>   1. Adding ASoC binding layer
>   2. Create a USB backend for Q6DSP

clarify what 'backend' means. I would guess you are referring to the
ASoC DPCM concept of Back-End, which typically exposes an audio
interface controlled by a DSP?

If yes, the description should be

"Create a Q6DSP ASoC DPCM BackEnd for USB audio playback/record".

>   3. Introduce XHCI interrupter support
>   4. Create vendor ops for the USB SND driver

Add an introduction as to why this would be needed? which 'vendor' are
we talking about, is this on the SOC side or the USB device side?

> Adding ASoC binding layer:
> soc-usb: Intention is to treat a USB port similar to a headphone jack.
> The port is always present on the device, but cable/pin status can be
> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> communicate with USB SND.

port == backend?

Using different words for the same concept is a sure way to lose the
reviewers, and not describing different concepts isn't much better.

> Create a USB backend for Q6DSP:
> q6usb: Basic backend driver that will be responsible for maintaining the

What does this mean? Is this a module that registers a set of ASoC DAIs?

It's not clear to me what a 'backend driver' means either in a USB or
ASoC context.

> resources needed to initiate a playback stream using the Q6DSP.  Will
> be the entity that checks to make sure the connected USB audio device
> supports the requested PCM format.  If it does not, the PCM open call will
> fail, and userpsace ALSA can take action accordingly.

If it's an ASoC backend, there is no PCM open call. You're probably
referring to the hw_params, not the open/startup anyways.

> 
> Introduce XHCI interrupter support:
> XHCI HCD supports multiple interrupters, which allows for events to be routed
> to different event rings.  This is determined by "Interrupter Target" field
> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> 
> Events in the offloading case will be routed to an event ring that is assigned
> to the audio DSP.
> 
> Create vendor ops for the USB SND driver:
> qc_audio_offload: This particular driver has several components associated
> with it:
> - QMI stream request handler
> - XHCI interrupter and resource management
> - audio DSP memory management

so how does this 'qc_audio_offload' interface with 'q6usb' described
above? how are the roles different or complementary?

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
> devices for both the platorm card and USB audio device:
>  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                       SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>  1 [Audio          ]: USB-Audio - USB Audio
>                       Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
> 
> This is to ensure that userspace ALSA entities can decide which route to take
> when executing the audio playback.  In the above, if card#1 is selected, then
> USB audio data will take the legacy path over the USB PCM drivers, etc...

I already voiced my concerns about exposing two cards, each with their
own set of volume controls with the same device. It would be much better
to have an additional offloaded PCM device for card0...

But if the consensus is to have two cards, it's still not clear how the
routing would be selected. In the case where there are two USB audio
devices attached, the offloaded path would only support one of the two.
How would userspace know which of the two is selected?

And how would userspace know the difference anyways between two physical
devices attached to the platform with no offload, and one physical
device with one additional offload path? The names you selected can't be
used to identify that card1 is the optimized version of card0.

Before we review low-level kernel plumbing, it would be good to give a
better overview of how userspace applications are supposed to interact
with the cards and identify the offloaded path. Testing with
tinyplay/tinymix is fine, but that's a developer-level or CI unit test.
we've got to see the broader picture of how a sound server would use
this USB offload capability.
