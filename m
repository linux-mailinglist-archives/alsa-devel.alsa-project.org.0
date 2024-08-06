Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AEF949403
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 16:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2203CB0;
	Tue,  6 Aug 2024 16:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2203CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722956260;
	bh=7fGp4iTGKumpsOqbZPBC+cJ99owLh5xAt61X67NylpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3aH5CM/IBz0PkyJSluL8v3x4b110jC70hclmBmIrApxWQeJ4IH/vVGc0J9R62QOB
	 DsICT+FZ17wldaR759b7bUBPZRtL1CPfSRY7+v9gSH+2sjChKdsOij/28BocOvUWa9
	 mmNYiiB40f5Of2MpkzibfXxxmsYIE+zdiP4OVbQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15E83F805D8; Tue,  6 Aug 2024 16:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 709C2F805C9;
	Tue,  6 Aug 2024 16:57:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E19CF8047C; Tue,  6 Aug 2024 16:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76837F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76837F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q3dPipIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955930; x=1754491930;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7fGp4iTGKumpsOqbZPBC+cJ99owLh5xAt61X67NylpQ=;
  b=Q3dPipIsN9c+4M0deU+Wt1BUit1dGzYid7jIzj/OPEKyVcSNLu/SnpJF
   MAxDEo/8qEPtOBPbkpDxcammEk0pqk+Vi7nFYojjDVVemvMkAHXgcJNWB
   FxrHWZhkyWP7pIIdTUwfXWDYZU4ik+db4VCzm1Zxp45oPBCvNy8ACvZJk
   tdOzsepYrMjyy9g3h0Na3mboZqZQU40TLbB36rSk0+DwkDPUx6x60Rzw+
   YKPuW8I+Jw3tSHydrNs7L8cx9nO5/UUopLlRAKmwQvgBTWZPi/KPm+rzK
   HKy3p73Ke63C9sutsO/5QX2emyE//swfn4qEEnAiykzsnSI8zlBR1EHrR
   w==;
X-CSE-ConnectionGUID: QppDSIzfTaWl62s9INR47A==
X-CSE-MsgGUID: hKPaLxoYRc+Jo2aIaOHoUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101995"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="21101995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:51:48 -0700
X-CSE-ConnectionGUID: CYOwO9ASSIW+5Vg8zuCwVQ==
X-CSE-MsgGUID: AoaYNMTNSkOzX+xnnSusDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800";
   d="scan'208";a="87476697"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:51:43 -0700
Message-ID: <1a93dbae-6fba-4f07-a732-51a4cd98ff2a@linux.intel.com>
Date: Tue, 6 Aug 2024 16:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
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
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YZ3ZUIG7OAZTENFFFY6VKEOU75N7QU4F
X-Message-ID-Hash: YZ3ZUIG7OAZTENFFFY6VKEOU75N7QU4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZ3ZUIG7OAZTENFFFY6VKEOU75N7QU4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> With the introduction of the soc-usb driver, add documentation highlighting
> details on how to utilize the new driver and how it interacts with
> different components in USB SND and ASoC.  It provides examples on how to
> implement the drivers that will need to be introduced in order to enable
> USB audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

(...)

> +
> +One potential use case would be to support USB audio offloading, which is
> +an implementation that allows for an external DSP on the SoC to handle the
> +transfer of audio data over the USB bus.  This would let the main
> +processor to stay in lower power modes for longer durations.  The following

*duration

(...)

> +
> +In order to account for conditions where driver or device existence is
> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
> +connect events for any identified USB audio interfaces.  Consider the
> +the following situtation:

*situation

> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.

At the moment I only see getter below, how does application set it?

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

That's better, although I'm still not convinced end users care where 
offload happens.

Few questions though, so I'm sure I understand how it works:
Does "0, 1" in this case means that if you try to open device 1 on card 
0, you won't be able to do it, because it is offloading USB?

In case it is "-1, -1" is there a chance that it can change?


