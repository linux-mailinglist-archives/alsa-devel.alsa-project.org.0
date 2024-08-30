Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3496965E4F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34CF6B70;
	Fri, 30 Aug 2024 12:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34CF6B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012947;
	bh=UfcqtMrsI4yLwUepfMAYwVCdjBub/4R778PIbcvRnyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KYCFoKq1gvQQ7KcMCS+mWwOJ3SeZm7WpFtsiDuqOeB/0dhdHB6fShcq2dD0CblxHV
	 qPfVfxCTiUo/qrYOHhOJZohyQUDHKcqYv+T+pnRuTqGtFCgxBnau+96zyOo7JRsBn4
	 7TEs+oy1SUgvtQyZYIOH8V9O1PwIwJoON5mnPNi0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D777AF8074D; Fri, 30 Aug 2024 12:13:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAC0F80752;
	Fri, 30 Aug 2024 12:13:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE686F8071C; Fri, 30 Aug 2024 12:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 875A5F80616
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 875A5F80616
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QdeRVD8S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012773; x=1756548773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UfcqtMrsI4yLwUepfMAYwVCdjBub/4R778PIbcvRnyM=;
  b=QdeRVD8SekrDvBBN6d+3+OsSNTOYuExTGAP18KmiruHcFAY7MJIYEXcC
   2qtgpV0MQbQSgDVKtO68V2OjOsQrFZEgp1QwLddKZfYJ19rYK0at32ShB
   U3UjavFmCPczhi2CeK++2cNOuzJ58oRuo6jm45nglwmj+NtWVYuqp5ri8
   hIR8EmwwGKyPudKcut7Cj+fuQ5pc9+Jt5aVh6BTr/0fJr7QAgyUBsvOoQ
   w9rS+/L+sZt31tBDSAHgj1aYaepuhX5/cYVzORh/iW2weu45kb7NDFNOs
   iGG5wm1kQmDInSXNvnKseWUzmMjUduIxgaxvi1VzQ8f3dyVG0DgdFlRda
   w==;
X-CSE-ConnectionGUID: TOZzERxSRl6dPZdTrTRcpA==
X-CSE-MsgGUID: JlXKal3zQsmPzoMvNaI9pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218939"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218939"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:51 -0700
X-CSE-ConnectionGUID: VE0a1kFVQkKbDhFTrHBt/w==
X-CSE-MsgGUID: p8MSDibSS+Shu+kAlIzg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481829"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:45 -0700
Message-ID: <63b679c8-48f1-4251-8b7e-d38b605e5089@linux.intel.com>
Date: Fri, 30 Aug 2024 11:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 24/33] ALSA: usb-audio: Introduce USB SND platform op
 callbacks
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-25-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-25-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: G5UT37WVG4M3WE2ES452N3DNUO7VPDWB
X-Message-ID-Hash: G5UT37WVG4M3WE2ES452N3DNUO7VPDWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5UT37WVG4M3WE2ES452N3DNUO7VPDWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Allow for different platforms to be notified on USB SND connect/disconnect
> sequences.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 10 +++++++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 1f9dfcd8f336..7f120aa006c0 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +/*
> + * Register platform specific operations that will be notified on events
> + * which occur in USB SND.  The platform driver can utilize this path to
> + * enable features, such as USB audio offloading, which allows for audio data
> + * to be queued by an audio DSP.
> + *
> + * Only one set of platform operations can be registered to USB SND.  The
> + * platform register operation is protected by the register_mutex.
> + */
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	guard(mutex)(&register_mutex);
> +	if (platform_ops)
> +		return -EEXIST;
> +
> +	platform_ops = ops;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +/*
> + * Unregisters the current set of platform operations.  This allows for

Unregister?

> + * a new set to be registered if required.
> + *
> + * The platform unregister operation is protected by the register_mutex.
> + */
> +int snd_usb_unregister_platform_ops(void)
> +{
> +	guard(mutex)(&register_mutex);
> +	platform_ops = NULL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>  
>  /*
>   * Checks to see if requested audio profile, i.e sample rate, # of
> @@ -946,7 +982,11 @@ static int usb_audio_probe(struct usb_interface *intf,
>  	chip->num_interfaces++;
>  	usb_set_intfdata(intf, chip);
>  	atomic_dec(&chip->active);
> +
> +	if (platform_ops && platform_ops->connect_cb)
> +		platform_ops->connect_cb(chip);
>  	mutex_unlock(&register_mutex);
> +
>  	return 0;
>  
>   __error:
> @@ -983,6 +1023,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>  	card = chip->card;
>  
>  	mutex_lock(&register_mutex);
> +	if (platform_ops && platform_ops->disconnect_cb)
> +		platform_ops->disconnect_cb(chip);
> +
>  	if (atomic_inc_return(&chip->shutdown) == 1) {
>  		struct snd_usb_stream *as;
>  		struct snd_usb_endpoint *ep;
> @@ -1130,6 +1173,11 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
>  		chip->system_suspend = chip->num_suspended_intf;
>  	}
>  
> +	mutex_lock(&register_mutex);
> +	if (platform_ops && platform_ops->suspend_cb)
> +		platform_ops->suspend_cb(intf, message);
> +	mutex_unlock(&register_mutex);
> +
>  	return 0;
>  }
>  
> @@ -1170,6 +1218,11 @@ static int usb_audio_resume(struct usb_interface *intf)
>  
>  	snd_usb_midi_v2_resume_all(chip);
>  
> +	mutex_lock(&register_mutex);
> +	if (platform_ops && platform_ops->resume_cb)
> +		platform_ops->resume_cb(intf);
> +	mutex_unlock(&register_mutex);
> +
>   out:
>  	if (chip->num_suspended_intf == chip->system_suspend) {
>  		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 4f4f3f39b7fa..23d9e6fc69e7 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -207,7 +207,17 @@ struct snd_usb_stream {
>  	struct list_head list;
>  };
>  
> +struct snd_usb_platform_ops {
> +	void (*connect_cb)(struct snd_usb_audio *chip);
> +	void (*disconnect_cb)(struct snd_usb_audio *chip);
> +	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
> +	void (*resume_cb)(struct usb_interface *intf);
> +};


You're using the same mutex to protect all four callbacks, so how would
things work if e.g. you disconnected a device during the resume operation?

