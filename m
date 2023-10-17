Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5627CD0C1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:28:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1422DE84;
	Wed, 18 Oct 2023 01:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1422DE84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585321;
	bh=2UKUUSI67P7VTV+D5P7W1dLNBm5HCyoV51RKoH6boYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cl2xHYplbneWO5hk+l5lBit8Hm3EzzL+sa5VeBeJ7rEoimjJSxMV4IhZ+uipKMMGf
	 VKa5t1HhR6Iym2VF757Juu9qQ0WWPZQYtcoGWjgKw6joZsda6vgXIw5btVsaMq6375
	 ykTB6oQU95Cepb8pMtRWXkznBCXc3oKLNJIy/2C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC347F80631; Wed, 18 Oct 2023 01:24:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75337F80621;
	Wed, 18 Oct 2023 01:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFAFDF80619; Wed, 18 Oct 2023 01:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6926F8032D
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6926F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ji2ab5J6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585002; x=1729121002;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2UKUUSI67P7VTV+D5P7W1dLNBm5HCyoV51RKoH6boYk=;
  b=ji2ab5J6jZVDh9Wpgv53JYJXZDhkm9xTEsZqP5kZQBVrbqtF9+rvC8Hw
   8KdpclygcMqIBZr9zOAitWq+r9+JHAoKpc9BoN74XL31KNNYeqXZE1cAS
   YpR3f26j4++J1Fk/mTWP5l9sOjVJz4b09QvY1ghuNhCZ8u0KBb+Dh/Kdg
   eC9JT4SuVO9yWCMUiNIlIuXeKGpCN1nXbMWKS7o4HXVA/pl1D3dToxGI1
   tgFfDRRenqS2ppSZOW4m6rJIVn6ITEMEeNgItufgbmamjiLsnAGseX6a3
   RoIec7fd4mzH8vvwX5O15d4bx0jyTolUq7J5hu/LcbmlwX/SQiPf2ufaL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778104"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778104"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637465"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637465"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:17 -0700
Message-ID: <ad851c66-5c5f-4bbb-b278-7b0c49b3cb07@linux.intel.com>
Date: Tue, 17 Oct 2023 17:29:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 20/34] ALSA: usb-audio: Check for support for requested
 audio format
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
 <20231017200109.11407-21-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AT2P6RT4UTACVF5FPZ4T5NUX5FL6WEOZ
X-Message-ID-Hash: AT2P6RT4UTACVF5FPZ4T5NUX5FL6WEOZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AT2P6RT4UTACVF5FPZ4T5NUX5FL6WEOZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:00, Wesley Cheng wrote:
> Allow for checks on a specific USB audio device to see if a requested PCM
> format is supported.  This is needed for support for when playback is

This is needed for support when playback is

> initiated by the ASoC USB backend path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 11 +++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index c0b312e264bf..88f431917c15 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -162,6 +162,46 @@ int snd_usb_unregister_platform_ops(void)
>  }
>  EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>  
> +/*
> + * Checks to see if requested audio profile, i.e sample rate, # of
> + * channels, etc... is supported by the substream associated to the
> + * USB audio device.
> + */
> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> +			struct snd_pcm_hw_params *params, int direction)
> +{
> +	struct snd_usb_audio *chip;
> +	struct snd_usb_substream *subs = NULL;

useless init?

> +	struct snd_usb_stream *as;
> +	const struct audioformat *fmt;
> +
> +	/*
> +	 * Register mutex is held when populating and clearing usb_chip
> +	 * array.
> +	 */
> +	mutex_lock(&register_mutex);
> +	chip = usb_chip[card_idx];
> +	if (!chip) {
> +		mutex_unlock(&register_mutex);
> +		return NULL;
> +	}
> +
> +	if (enable[card_idx]) {
> +		list_for_each_entry(as, &chip->pcm_list, list) {
> +			subs = &as->substream[direction];
> +			fmt = snd_usb_find_substream_format(subs, params);
> +			if (fmt) {
> +				mutex_unlock(&register_mutex);
> +				return as;
> +			}
> +		}
> +	}
> +	mutex_unlock(&register_mutex);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
> +
>  /*
>   * disconnect streams
>   * called from usb_audio_disconnect()
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 2884912adc96..e26292363cf0 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -216,4 +216,15 @@ struct snd_usb_platform_ops {
>  
>  int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
>  int snd_usb_unregister_platform_ops(void);
> +
> +#if IS_ENABLED(CONFIG_SND_USB_AUDIO)
> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> +			struct snd_pcm_hw_params *params, int direction);
> +#else
> +static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
> +			struct snd_pcm_hw_params *params, int direction)
> +{
> +	return NULL;
> +}
> +#endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
>  #endif /* __USBAUDIO_CARD_H */
