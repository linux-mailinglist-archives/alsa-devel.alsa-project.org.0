Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7C94479D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCD437FF;
	Thu,  1 Aug 2024 11:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCD437FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503606;
	bh=YyMMtwwfLvF7XbN3Hd27FU6gmaTz5OzC5jyQFcvLAO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=owryoi1WrHhURPUR3sh2Zv2gmHvllAgITXWMuRIVtrOkCN3bEbbs3JENjAS/e9GS/
	 Mr11C/TfTzANt04dH+J4xeW30gZQO7+gpueDghYJmfT+hO+TWnLML4jE3FkSusryc1
	 o4DJ+yjj8ea0c4fv/PQK0+iKgRhzUiEe5iI//TD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992ADF805F3; Thu,  1 Aug 2024 11:12:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E3FF805FC;
	Thu,  1 Aug 2024 11:12:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6843DF805EC; Thu,  1 Aug 2024 11:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B51BBF80269
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B51BBF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MNFBkGoz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503522; x=1754039522;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YyMMtwwfLvF7XbN3Hd27FU6gmaTz5OzC5jyQFcvLAO4=;
  b=MNFBkGozhJ+TJC4R/V5m6QXCVYEBIGNV7/WYkcdKo98v9qO0E8TqpRey
   jP3H9bhNTybZEbb2n3LpMP1/HPvpD4TUUi6BywEnTRJKyMpLOenkaU2CT
   4cJhrVJWeCGodMF2WjWU87NsgxhESoNa6ZGAc3BRVwN7FLknyTfnkRnpy
   E5n3y9PrIKzTQLah1rLS3prddrG7awTybU0+jIiBEXDia+S7gHzNyx0+9
   q1jCNCoo830KBNEfw6Y6f+rTo5EQsbfUjcCy49DZqUDdhXVsqNd5a1s9G
   B/ewB83gTFg6SLVBCa6rdGKFKItN8FvC3XWT4vF8DingfMoF0hgQzHoYo
   w==;
X-CSE-ConnectionGUID: VFhXP5GXTsGnPgsiM4oTGg==
X-CSE-MsgGUID: efq/F2m/Q7eiZRQDWPXxcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383481"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383481"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:21 -0700
X-CSE-ConnectionGUID: ELbweMuJSkOz6l0VdhQiCQ==
X-CSE-MsgGUID: BARAQ/IiRXWsmTikx+x+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59089817"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:11:15 -0700
Message-ID: <63c20e7a-f62a-4b6c-8ea1-1608e06e5b58@linux.intel.com>
Date: Thu, 1 Aug 2024 10:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 11/34] ASoC: usb: Fetch ASoC card and pcm device
 information
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
 <20240801011730.4797-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KDQR437VPICZNWA7NX75FCZDJ5VW2PJF
X-Message-ID-Hash: KDQR437VPICZNWA7NX75FCZDJ5VW2PJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDQR437VPICZNWA7NX75FCZDJ5VW2PJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 03:17, Wesley Cheng wrote:
> USB SND needs to know how the USB offload path is being routed.  This would
> allow for applications to open the corresponding sound card and pcm device
> when it wants to take the audio offload path.  This callback should return
> the mapped indexes based on the USB SND device information.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/soc-usb.h | 16 ++++++++++++++++
>  sound/soc/soc-usb.c     | 28 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index d6b576f971ae..a167e3de0a78 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -8,6 +8,11 @@
>  
>  #include <sound/soc.h>
>  
> +enum snd_soc_usb_kctl {
> +	SND_SOC_USB_KCTL_CARD_ROUTE,
> +	SND_SOC_USB_KCTL_PCM_ROUTE,
> +};
> +
>  /**
>   * struct snd_soc_usb_device
>   * @card_idx - sound card index associated with USB device
> @@ -32,6 +37,7 @@ struct snd_soc_usb_device {
>   * @component - reference to ASoC component
>   * @num_supported_streams - number of supported concurrent sessions
>   * @connection_status_cb - callback to notify connection events
> + * @get_offload_dev - callback to fetch mapped ASoC device
>   * @priv_data - driver data
>   **/
>  struct snd_soc_usb {
> @@ -40,6 +46,8 @@ struct snd_soc_usb {
>  	unsigned int num_supported_streams;
>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>  			struct snd_soc_usb_device *sdev, bool connected);
> +	int (*get_offload_dev)(struct snd_soc_component *component,
> +				int card, int pcm, enum snd_soc_usb_kctl route);
>  	void *priv_data;
>  };
>  
> @@ -51,6 +59,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
>  int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>  					struct snd_soc_jack *jack);
>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
> +int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
> +				enum snd_soc_usb_kctl route);
>  
>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>  					      int num_streams, void *data);
> @@ -86,6 +96,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
>  	return -ENODEV;
>  }
>  
> +static int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
> +					enum snd_soc_usb_kctl route)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
>  					      struct snd_soc_component *component,
>  					      int num_streams, void *data)
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index fe2a75a28af4..3c217ac67c57 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -117,6 +117,34 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
>  
> +/**
> + * soc_usb_get_offload_device - Set active USB offload path

get or set?

> + * @dev - USB device to get offload status
> + * @card - USB card index
> + * @pcm - USB PCM device index
> + *> + * Fetch the current status for the USB SND card and PCM device
indexes
> + * specified.

the function returns an integer, how does this return the 'mapped indices"?

> + */
> +int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
> +				enum snd_soc_usb_kctl route)

missing route in kernel doc.

> +{
> +	struct snd_soc_usb *ctx;
> +	int ret;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	mutex_lock(&ctx_mutex);
> +	if (ctx && ctx->get_offload_dev)
> +		ret = ctx->get_offload_dev(ctx->component, card, pcm, route);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(soc_usb_get_offload_device);
> +
>  /**
>   * snd_soc_usb_find_priv_data() - Retrieve private data stored
>   * @dev: device reference

