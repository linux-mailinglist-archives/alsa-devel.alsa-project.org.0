Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D993965E26
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A780386E;
	Fri, 30 Aug 2024 12:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A780386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012826;
	bh=y00x1TMGRvzYoEqQKzfQV1CLcXwYCVrbAv6PGJi2A2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ab9tP2EGCwlYPGrQc/c1w5IfUC66fwD2mbb3di7Tc2yHo0HwfIfxTCQG8KA51Cg7P
	 QjFFb01PEqoc22wZTWyPS4egCrD4Fn4rYnnNCFK4g2Q1Eq3Hbg6FLDBJ7Z3QOnW71q
	 2xqoNXPa0/MtJ16G41RT6XDbU2rbmqOX0uFu0oNM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD5AEF80528; Fri, 30 Aug 2024 12:12:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0F6F805E2;
	Fri, 30 Aug 2024 12:12:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2E91F80641; Fri, 30 Aug 2024 12:12:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C4F3F80107
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C4F3F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EJyTLKtP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012724; x=1756548724;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y00x1TMGRvzYoEqQKzfQV1CLcXwYCVrbAv6PGJi2A2o=;
  b=EJyTLKtPnpefuRcGmD5HUwcWa9fldF/v6jBUGBOaiY8928Blq6aXXPBS
   TsjOxF5knuQVfrYy+gN3av2xwT6G5xc9XVC0ORjI+VCYfpgoc8BBa0P9T
   wwj30ducrWFkPTXcHIhmRBJb5EI5xe5WBxEwzFVkbljxZP8mPmdO5KHmK
   ygF+lQs8OiymuNvuD65hrDY3JxUmfVFWdPgUgJ21M7jYgpDqncIrW8YCc
   5HN6h9D4LEub/nTdGYf8ttgZfdaB5xgo2FX8DHK6uCSkSJ9t7MxX0Y6jd
   owzPRCJiP2S/X+Y05nMOiPOoKjYa8iP8B2gWIvXCKmm+M9natZVjUTnGL
   Q==;
X-CSE-ConnectionGUID: cRAHHBeiTM+/Ytj9VED/3Q==
X-CSE-MsgGUID: Y9Vo4NQYReG4wBUxWP9a0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218797"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218797"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:02 -0700
X-CSE-ConnectionGUID: fjjXRzf5Q/qN7kKIT5PMPw==
X-CSE-MsgGUID: Rrtuk6UgQ0iLT65o58uqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481536"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:56 -0700
Message-ID: <144f02c3-e75c-46d8-9a50-936167a25576@linux.intel.com>
Date: Fri, 30 Aug 2024 10:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 15/33] ASoC: usb: Fetch ASoC card and pcm device
 information
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
 <20240829194105.1504814-16-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-16-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4RIRQ27OCCTYBELLAK66C3U7ETRFE7G2
X-Message-ID-Hash: 4RIRQ27OCCTYBELLAK66C3U7ETRFE7G2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RIRQ27OCCTYBELLAK66C3U7ETRFE7G2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> USB SND needs to know how the USB offload path is being routed.  This would
> allow for applications to open the corresponding sound card and pcm device
> when it wants to take the audio offload path.  This callback should return
> the mapped indexes based on the USB SND device information.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index 5c788cbfa82e..86876098a2b7 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -36,6 +36,7 @@ struct snd_soc_usb_device {
>   * @list - list head for SND SOC struct list
>   * @component - reference to ASoC component
>   * @connection_status_cb - callback to notify connection events
> + * @update_offload_route_info - callback to fetch mapped ASoC device

nit-pick: explain that 'route' refers to the (card, device) pair and
isn't related to the concept of DAPM route.

>   * @priv_data - driver data
>   **/
>  struct snd_soc_usb {
> @@ -44,6 +45,9 @@ struct snd_soc_usb {
>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>  				    struct snd_soc_usb_device *sdev,
>  				    bool connected);
> +	int (*update_offload_route_info)(struct snd_soc_component *component,
> +					 int card, int pcm, int direction,
> +					 long *route);

nit-pick: also explain the format used for the (card, device) pair
stored in the long

>  	void *priv_data;
>  };
>  
> @@ -59,6 +63,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
>  int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>  				   struct snd_soc_jack *jack);
>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +				     int direction, long *route);
>  
>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>  					      void *data);
> @@ -101,6 +107,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
>  	return 0;
>  }
>  
> +static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +					    int direction, long *route)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline struct snd_soc_usb *
>  snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
>  {
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index 3d5354298206..de249e8a28cb 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -117,6 +117,37 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
>  
> +/**
> + * snd_soc_usb_update_offload_route - Find active USB offload path
> + * @dev - USB device to get offload status
> + * @card - USB card index
> + * @pcm - USB PCM device index
> + * @direction - playback or capture direction
> + * @route - pointer to route output array
> + *
> + * Fetch the current status for the USB SND card and PCM device indexes
> + * specified.
> + */
> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
> +				     int direction, long *route)
> +{
> +	struct snd_soc_usb *ctx;
> +	int ret;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	mutex_lock(&ctx_mutex);
> +	if (ctx && ctx->update_offload_route_info)
> +		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
> +						     direction, route);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_update_offload_route);
> +
>  /**
>   * snd_soc_usb_find_priv_data() - Retrieve private data stored
>   * @dev: device reference

