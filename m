Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35440760E67
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C04AF63;
	Tue, 25 Jul 2023 11:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C04AF63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276875;
	bh=OmPXnBpjFbasw+T9ea6wqRGGLgB3z7Oa0ef3fv0n3bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K+7vC16C58yVJM46VepHbZk0LPzrO77Fj0Lwv6oH0mh/f5eUxPGJH8+YoQb7hKxHf
	 tjEv7PnChycztFdwKT6UyF19jRSodv7HaRJqN0EjfhO6JQcA1YbYjavgsYucJKu9zh
	 MEszxVZZp+VWrEvk3Pcr5pT7Knk0M83g32ST6O0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 243B5F805B3; Tue, 25 Jul 2023 11:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 531BEF805AC;
	Tue, 25 Jul 2023 11:19:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF78F805AD; Tue, 25 Jul 2023 11:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4C3BF80310
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4C3BF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SUQidgfN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276755; x=1721812755;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OmPXnBpjFbasw+T9ea6wqRGGLgB3z7Oa0ef3fv0n3bc=;
  b=SUQidgfNDfKKmR18FoNM1wxAEnOtrvF93Ddtx9WF3caqljZOU7EiDqFk
   ElDd51DCDWINQGl5i1szp9YyEaOcgdRwFcRLgQ+emaOBnrT0MCSqQugje
   2XcLbp/z9qadtO6S0q6g8FyrCsD1FEHEFAxzghuKUyL9WmGvvQRf7RzDO
   JbKXmxSmXy8hahV0ltnzg2Xh3FWhn//iwLzqERFyWoC160od61HwROoG4
   FThZV+Y4CNIkk5Pn1F7478+qNeuEB3pSoe2DZbt/BWOiGtNSDR8l9Z95p
   UIStc0Shv0sMFH8WjhcJlBtR6PgaQP4WZgji/2I5oia+pQPK/68V7UTL5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367691069"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="367691069"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980536"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="719980536"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:19:07 -0700
Message-ID: <671a524d-b4c8-78d8-33de-40170a23d189@linux.intel.com>
Date: Tue, 25 Jul 2023 11:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 31/32] sound: usb: card: Allow for rediscovery of
 connected USB SND devices
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, oneukum@suse.com, albertccwang@google.com,
 o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-32-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230725023416.11205-32-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6WV4FDJQL7SPQHRC7NSUIWQVTFBEEKXN
X-Message-ID-Hash: 6WV4FDJQL7SPQHRC7NSUIWQVTFBEEKXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WV4FDJQL7SPQHRC7NSUIWQVTFBEEKXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/25/23 04:34, Wesley Cheng wrote:
> In case of notifying SND platform drivers of connection events, some of
> these use cases, such as offloading, require an ASoC USB backend device to
> be initialized before the events can be handled.  If the USB backend device
> has not yet been probed, this leads to missing initial USB audio device
> connection events.
> 
> Expose an API that traverses the usb_chip array for connected devices, and
> to call the respective connection callback registered to the SND platform
> driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 19 +++++++++++++++++++
>  sound/usb/card.h |  2 ++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 365f6d978608..27a89aaa0bf3 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -170,6 +170,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  }
>  EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>  
> +/*
> + * in case the platform driver was not ready at the time of USB SND
> + * device connect, expose an API to discover all connected USB devices
> + * so it can populate any dependent resources/structures.
> + */
> +void snd_usb_rediscover_devices(void)
> +{
> +	int i;
> +
> +	mutex_lock(&register_mutex);
> +	for (i = 0; i < SNDRV_CARDS; i++) {
> +		if (usb_chip[i])
> +			if (platform_ops && platform_ops->connect_cb)
> +				platform_ops->connect_cb(usb_chip[i]);

what happens if the USB device is removed while the platform device adds
a port?

This sounds super-racy to me. It's the same set of problems we're having
between audio and display/DRM, I would be surprised if this function
dealt with all corner cases of insertion/removal, bind/unbind.


> +	}
> +	mutex_unlock(&register_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
> +
>  /*
>   * disconnect streams
>   * called from usb_audio_disconnect()
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index db735680d155..dfd241334e3d 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -219,6 +219,7 @@ int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
>  int snd_usb_unregister_platform_ops(void);
>  struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  			struct snd_pcm_hw_params *params, int direction);
> +void snd_usb_rediscover_devices(void);
>  #else
>  static int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
>  {
> @@ -235,5 +236,6 @@ static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  {
>  	return NULL;
>  }
> +void snd_usb_rediscover_devices(void) { }
>  #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
>  #endif /* __USBAUDIO_CARD_H */
