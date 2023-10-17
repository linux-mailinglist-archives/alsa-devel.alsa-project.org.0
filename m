Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5E7CD0BC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E951E7F;
	Wed, 18 Oct 2023 01:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E951E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585242;
	bh=Jfwi6zOwIf92FmGVyVBCRV0UI9mYK0d0yD+xgDrknf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B0x+zZ+g1CVnILj497O3RohMSsbM1jukrEOKQ/jxuCBxhC+Ujk87WSnmPLKY9Bxn6
	 urA8xlqylvErWYxDkZLx3/Q3VVBL1j/+c9Hfc3y7thLUjgyeabzkH2ojimGrJzEjUw
	 pxkKBoa6qW4p+/sivMELpED+K1KvHRL9RxEvcZ/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A73B9F805FE; Wed, 18 Oct 2023 01:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC1AF805F8;
	Wed, 18 Oct 2023 01:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60424F805AE; Wed, 18 Oct 2023 01:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F481F80552
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F481F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JVCKDx8h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585013; x=1729121013;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jfwi6zOwIf92FmGVyVBCRV0UI9mYK0d0yD+xgDrknf4=;
  b=JVCKDx8hLpxfdp8mapQTBHlAuSkSTTXYgvqXGhxTjNHFQmPsw5pCF9n0
   NRNMqb1/xv2Y55rSs5358NRPnTZ1PYU7DfztPL4mdC1jwmaO8BBtVWizu
   ZqW8bbMK+97pfWZ4tIIcHvTYCmWZYj6rl/iCuyVw1YDtecqcRghVf+uNy
   7PQ38f03cTfbXkh6PFyoy0LGOEpjGfCbGPe4Yxw494vVP3CzlaeKLf7lt
   TFM/Tg4jsBTuPyImErvPCbdl7abb/xXEN8uo04R8u+k1uGbHEmCTUJdSH
   xqLMlUPQ3Vm2dXfrLD43cU4ijSy97MfSlwrS3dI8UA+3JqIXP0bv21/UX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778239"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778239"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637523"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637523"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:30 -0700
Message-ID: <97c16b75-1277-41f1-a0b6-293e76dbcb7f@linux.intel.com>
Date: Tue, 17 Oct 2023 18:07:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 33/34] ALSA: usb-audio: Allow for rediscovery of
 connected USB SND devices
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-34-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-34-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ONS4QESCEFSNW5SM3DCGCLU7SL4XGDVY
X-Message-ID-Hash: ONS4QESCEFSNW5SM3DCGCLU7SL4XGDVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONS4QESCEFSNW5SM3DCGCLU7SL4XGDVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:01, Wesley Cheng wrote:
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
> index 88f431917c15..7d3f470754ca 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -202,6 +202,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  }
>  EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>  
> +/*
> + * in case the platform driver was not ready at the time of USB SND
> + * device connect, expose an API to discover all connected USB devices
> + * so it can populate any dependent resources/structures.

it's really unclear how the "platform driver was not ready at the time
of USB SND device connect" condition can be detected. It's my
understanding that we should never assume any specific order or timing
on platform driver probes. And things should also work if a driver is
unbound.

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
> +	}
> +	mutex_unlock(&register_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
> +
>  /*
>   * disconnect streams
>   * called from usb_audio_disconnect()
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 01f7e10f30f4..c0aeda17ed69 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -221,11 +221,13 @@ int snd_usb_unregister_platform_ops(void);
>  #if IS_ENABLED(CONFIG_SND_USB_AUDIO)
>  struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  			struct snd_pcm_hw_params *params, int direction);
> +void snd_usb_rediscover_devices(void);
>  #else
>  static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  			struct snd_pcm_hw_params *params, int direction)
>  {
>  	return NULL;
>  }
> +static void snd_usb_rediscover_devices(void) { }
>  #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
>  #endif /* __USBAUDIO_CARD_H */
