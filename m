Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE1C944857
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C1139BB;
	Thu,  1 Aug 2024 11:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C1139BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504645;
	bh=5p1oyYO6u1shRaRU1kQj5x9fnU5Q6DlYMq5LOgbkvZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OjwtLFMA00v3AXFvZxVh7Y2c29lz52jBiZWNuefUK+G4BqUrimf5IDHQUqbU2ukRj
	 NDCzTexR0iBdeaCkDwaxG+Ap1BSijUJYX71WSjuhx5iUxhvqdIb+WYooACzpjeEr8R
	 sNrZ5L6jYpuX9VJRV7uUocBxKVa7IllDxT7WmWLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C8A4F805C3; Thu,  1 Aug 2024 11:30:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A659AF805AF;
	Thu,  1 Aug 2024 11:30:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C77B9F80269; Thu,  1 Aug 2024 11:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27BC4F802DB
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27BC4F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XHtM/zXC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503522; x=1754039522;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5p1oyYO6u1shRaRU1kQj5x9fnU5Q6DlYMq5LOgbkvZo=;
  b=XHtM/zXC5MghpZk4PIpujkUlmaotbUn70g5oQj29zp6eHjno9s6F9hiN
   JFY6xz0kK/lL2EVhgWYqmwTNS9lJ41YOCprrA+dldEKALMLn8ZWWc0yUV
   a+VuaMp61TE1qLbqvEh+GqZEMkHIv5oVSibRJZ+7n+kNfUPXWa7B6EMfl
   5jixSPPId/1GD+Tf55jG4nmc45O5wB3cjq5VHC8NHuwSojl4U6xzInALk
   DRf/zoqZEjadVCcPEQY6Isyvc2KIAdgyO0dJfq6n2BfS+J2lkdS1y+nrI
   s6f+srH27qt2BpovAKZ9Gb2Efx6fOsstCPM34EZJ9DWPlOY+ycI38ZeJk
   w==;
X-CSE-ConnectionGUID: 6LZBeRatSPCHRCyOY1jdxg==
X-CSE-MsgGUID: TTvlERyTR0CiqtbJZW39FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383498"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:27 -0700
X-CSE-ConnectionGUID: HjVKERAITIC28FpFzogoxA==
X-CSE-MsgGUID: /6WLYwWXRqOt446s4lkJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59089859"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:21 -0700
Message-ID: <57c5af3e-3299-47ae-9e13-bfce077f5e23@linux.intel.com>
Date: Thu, 1 Aug 2024 10:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
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
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QNOYR7JFCXUWIUIYFY4WTN6D72OVLTZF
X-Message-ID-Hash: QNOYR7JFCXUWIUIYFY4WTN6D72OVLTZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNOYR7JFCXUWIUIYFY4WTN6D72OVLTZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +
> +::
> +
> +               USB                   |            ASoC
> +                                     |  _________________________
> +                                     | |   ASoC Platform card    |
> +                                     | |_________________________|
> +                                     |         |           |
> +                                     |      ___V____   ____V____
> +                                     |     |ASoC BE | |ASoC FE  |
> +                                     |     |DAI LNK | |DAI LNK  |
> +                                     |     |________| |_________|
> +                                     |         ^  ^        ^
> +                                     |         |  |________|
> +                                     |      ___V____    |
> +                                     |     |SOC-USB |   |
> +     ________       ________               |        |   |
> +    |USB SND |<--->|USBSND  |<------------>|________|   |
> +    |(card.c)|     |offld   |<----------                |
> +    |________|     |________|___     | |                |
> +        ^               ^       |    | |    ____________V_________
> +        |               |       |    | |   |IPC                   |
> +     __ V_______________V_____  |    | |   |______________________|
> +    |USB SND (endpoint.c)     | |    | |              ^
> +    |_________________________| |    | |              |
> +                ^               |    | |   ___________V___________
> +                |               |    | |->|audio DSP              |
> +     ___________V_____________  |    |    |_______________________|
> +    |XHCI HCD                 |<-    |
> +    |_________________________|      |
> +

It wouldn't hurt to describe what you mean by 'port' in this diagram...


> +SOC USB driver
> +==============
> +Structures
> +----------
> +``struct snd_soc_usb``
> +
> +  - ``list``: list head for SND SOC struct list
> +  - ``component``: reference to ASoC component
> +  - ``num_supported_streams``: number of supported concurrent sessions
> +  - ``connection_status_cb``: callback to notify connection events
> +  - ``get_offload_dev``: callback to fetch selected USB sound card/PCM device

I think you meant fetch offloaded sound card and PCM device information
for a given USB card:device pair?


> +Functions
> +---------
> +.. code-block:: rst
> +
> +	const char *snd_soc_usb_get_components_tag(bool playback);
> +..
> +
> +  - ``playback``: direction of audio stream

why not use the usual direction 0: playback and 1: capture?

> +
> +**snd_soc_usb_get_components_tag()** returns the tag used for describing if USB
> +offloading is supported for appending to a sound card's components string.

How does this work if the ASoC part is probe after the USB card? The
component string would be modified after the creation of the card?

A control is more dynamic by nature, not sure about this component
string. Jaroslav?

>
> +**snd_soc_usb_add_port()** add an allocated SOC USB device to the SOC USB framework.
> +Once added, this device can be referenced by further operations.
> +
> +.. code-block:: rst
> +
> +	void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
> +..
> +
> +  - ``usb``: SOC USB device to remove
> +
> +**snd_soc_usb_remove_port()** removes a SOC USB device from the SOC USB framework.
> +After removing a device, any SOC USB operations would not be able to reference the
> +device removed.

Not clear to me if the notion of 'port' helps, why not just
snd_soc_usb_add_device() and remove_device()?


> +
> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.
> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
> +						Plantronics Plantronics Blackwire 3225 Seri at usb-xhci-hcd.1.auto-1.1, full sp
> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +  **USB Sound Card** - card#2:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> +
> +The above example shows a scenario where the system has one ASoC platform card
> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
> +the available kcontrols for each USB audio device, the following kcontrol lists
> +the mapped offload path for the specific device:
> +
> +	"USB Offload Playback Route#*"
> +
> +The kcontrol is indexed, because a USB audio device could potentially have
> +several PCM devices.  The above kcontrols are defined as:
> +
> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
> +	card and PCM device index.  The output "0, 1" (card index, PCM device index)
> +	signifies that there is an available offload path for the USB SND device
> +	through card#0-PCM device#1.  If "-1, -1" is seen, then no offload path is
> +	available for the USB SND device.
> +
> +USB Offload Playback Route Kcontrol
> +-----------------------------------
> +In order to allow for vendor specific implementations on audio offloading device
> +selection, the SOC USB layer exposes the following:
> +
> +.. code-block:: rst
> +
> +	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol);
> +..
> +
> +These are specific for the **USB Offload Playback Route PCM#** kcontrol.
> +
> +When users issue get calls to the kcontrol, the registered SOC USB callbacks will
> +execute the registered function calls to the DPCM BE DAI link.

Oh man, now I get what 'get_offload_dev" means: it really means
"update_offload_info' or 'update_info_kcontrol".
The 'get' routines usually provide a handle on something to another part
of the kernel.
Not here, it's an update of something to be looked-up by userspace...


> +**Callback Registration:**
> +
> +.. code-block:: rst
> +
> +	static int q6usb_component_probe(struct snd_soc_component *component)
> +	{
> +	...
> +	usb = snd_soc_usb_allocate_port(component, 1, &data->priv);
> +	if (IS_ERR(usb))
> +		return -ENOMEM;
> +
> +	usb->connection_status_cb = q6usb_alsa_connection_cb;
> +	usb->get_offload_dev = q6usb_get_offload_dev;
> +
> +	ret = snd_soc_usb_add_port(usb);
> +..

