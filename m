Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416A9447A6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91690381A;
	Thu,  1 Aug 2024 11:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91690381A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503618;
	bh=LUc7gpjBS/NHhnn5BVc97L0Im6/kGFGbOYcyzShbHlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V8c7HFXEDDyzWJ7Yo5vRFoPWX1qNj7reuSBJnPhjn4tcPyBKwkA+H4fmxfVJfO+6/
	 taTffRFfBMGTmanrvuygekOFfG1xfmpG31PjruDoEFYdSJDcTlIUOG0eduGwtdDJi5
	 5mmL1ABMfB09S4qDMHUF+EBnISDPy72i7ARayaHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B382F80607; Thu,  1 Aug 2024 11:12:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16C4DF805D9;
	Thu,  1 Aug 2024 11:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8431FF805EC; Thu,  1 Aug 2024 11:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 184EAF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 184EAF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MnDOKM77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503520; x=1754039520;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LUc7gpjBS/NHhnn5BVc97L0Im6/kGFGbOYcyzShbHlE=;
  b=MnDOKM77p6WHmpngN7tsxpODtx3VJQUz83A9s/cRO7e/FhBiI4qMhP5X
   h+h3XgLygZEpxEBBwDbTnh/H2lrm5uIVZWClW9UCxmozBBpzJteI583q8
   bPwaTwhUgTuyMCky7eXZPPIX2uqcRX1YfdOvY0H7mkLZkbj5yvj6HsgqV
   sqM2R4Af09aTNOXo86d7AW1FTm5mA9hepTLRKStKifnsoROLC4PGmkeq4
   wf/ip0XauB4+law7djxLJLe4j+Z1/E0r1gkDRZrka6Ee6N+EZjtgb3Kgu
   GAV9IvqRPAvGEQBU+ACIRzTkIBuyWFGTl5xlTpMQ7BjOBF7E1r7dXSGfG
   g==;
X-CSE-ConnectionGUID: NYUjGRddTByyDGh914JoqQ==
X-CSE-MsgGUID: v9nfNuerTm2LdMJLaaSpKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383422"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:08 -0700
X-CSE-ConnectionGUID: ++Bdj5q4TKqwVVZ9HpXbgw==
X-CSE-MsgGUID: C6b4ZdPESPW+h8z2Bw+jtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59089790"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:01 -0700
Message-ID: <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
Date: Thu, 1 Aug 2024 10:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7XLIFCJFO5C2V3JJLFKRT76PJIXFWWLY
X-Message-ID-Hash: 7XLIFCJFO5C2V3JJLFKRT76PJIXFWWLY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XLIFCJFO5C2V3JJLFKRT76PJIXFWWLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +/**
> + * struct snd_soc_usb_device
> + * @card_idx - sound card index associated with USB device
> + * @pcm_idx - PCM device index associated with USB device
> + * @chip_idx - USB sound chip array index
> + * @num_playback - number of playback streams
> + * @num_capture - number of capture streams

so here we have a clear separation between playback and capture...

> + * @list - list head for SoC USB devices
> + **/
> +struct snd_soc_usb_device {
> +	int card_idx;
> +	int pcm_idx;
> +	int chip_idx;
> +	int num_playback;
> +	int num_capture;
> +	struct list_head list;
> +};
> +
> +/**
> + * struct snd_soc_usb
> + * @list - list head for SND SOC struct list
> + * @component - reference to ASoC component
> + * @num_supported_streams - number of supported concurrent sessions

... but here we don't. And it's not clear what the working 'sessions'
means in the comment.

> + * @connection_status_cb - callback to notify connection events
> + * @priv_data - driver data
> + **/
> +struct snd_soc_usb {
> +	struct list_head list;
> +	struct snd_soc_component *component;
> +	unsigned int num_supported_streams;
> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
> +			struct snd_soc_usb_device *sdev, bool connected);
> +	void *priv_data;
> +};

> +/**
> + * snd_soc_usb_allocate_port() - allocate a SOC USB device

USB port?

> + * @component: USB DPCM backend DAI component
> + * @num_streams: number of offloading sessions supported

same comment, is this direction-specific or not?

> + * @data: private data
> + *
> + * Allocate and initialize a SOC USB device.  This will populate parameters that
> + * are used in subsequent sequences.
> + *
> + */
> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
> +					      int num_streams, void *data)
> +{
> +	struct snd_soc_usb *usb;
> +
> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
> +	if (!usb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	usb->component = component;
> +	usb->priv_data = data;
> +	usb->num_supported_streams = num_streams;
> +
> +	return usb;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
> +
> +/**
> + * snd_soc_usb_free_port() - free a SOC USB device
> + * @usb: allocated SOC USB device
> +
> + * Free and remove the SOC USB device from the available list of devices.

Now I am lost again on the device:port relationship. I am sure you've
explained this before but I forget things and the code isn't
self-explanatory.


> + *
> + */
> +void snd_soc_usb_free_port(struct snd_soc_usb *usb)
> +{
> +	snd_soc_usb_remove_port(usb);
> +	kfree(usb);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
> +
> +/**
> + * snd_soc_usb_add_port() - Add a USB backend port
> + * @usb: soc usb device to add
> + *
> + * Register a USB backend device to the SND USB SOC framework.  Memory is
> + * allocated as part of the USB backend device.
> + *
> + */
> +void snd_soc_usb_add_port(struct snd_soc_usb *usb)
> +{
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
> +
> +/**
> + * snd_soc_usb_remove_port() - Remove a USB backend port
> + * @usb: soc usb device to remove
> + *
> + * Remove a USB backend device from USB SND SOC.  Memory is freed when USB
> + * backend is removed.
> + *
> + */
> +void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
> +{
> +	struct snd_soc_usb *ctx, *tmp;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
> +		if (ctx == usb) {
> +			list_del(&ctx->list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
