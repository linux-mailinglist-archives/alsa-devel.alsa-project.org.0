Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF778D5FD
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 14:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDC8274C;
	Wed, 30 Aug 2023 14:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDC8274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693399981;
	bh=RSyj81n43sFmtQjzuHfNNauGPkAW6fiLijQd+FzizcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YTXJYBt9xbpmXyuihzLr/Ao0O5rabDIDgP9eZshiYcgji+bdbyEUUnK88eHYdZTbe
	 ieboDWh138xdhBluHBsb/uyhb8FoNfXR4Tg+M0X3VGziBTbAx6hv7G45Gdpuk15bTo
	 3OL/drBeUTnKJ37hHbsG2NT/2dg8KnJbaKgHLJgU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB3DFF80527; Wed, 30 Aug 2023 14:51:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72127F80527;
	Wed, 30 Aug 2023 14:51:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03F54F80155; Wed, 30 Aug 2023 14:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E0D0F80094
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 14:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E0D0F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IZP/+kGY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693399865; x=1724935865;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RSyj81n43sFmtQjzuHfNNauGPkAW6fiLijQd+FzizcA=;
  b=IZP/+kGYfdFz8S42oQ76UlxbyD1lwbh7FBBN4LzcRlSMkcKhegKmITyr
   rZHlMNFILTNIuR8QOjgceHgy2hQeJY2CHW+OYjcOC2oVw+7AiqZ9Io410
   STMidJIe1w/sDxIiaCFr1+n4aLUd5b7gnYO23BEQsyOaAxDDDHRubOAPc
   gljaMoFMPx9qzw+mfwRg2CXzOWA/19VVz8+DD6k+16h+MoHk3MMyjWDMX
   cy7wttk7znphl9OQL7h/BUSTH/eQPspQrdM5a5iUu4qQnOaoKwtD1z2G3
   +y+fECW2OQY47iduQ48f/cvdG9pLgWKnfviPVyb7Yp1n3A0hp05hQ0AUy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365839422"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000";
   d="scan'208";a="365839422"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739082012"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000";
   d="scan'208";a="739082012"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:50:58 -0700
Message-ID: <5a5eb3a8-1379-116b-ca17-eac573207c57@linux.intel.com>
Date: Wed, 30 Aug 2023 14:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 12/32] sound: usb: Export USB SND APIs for modules
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-13-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230829210657.9904-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YBKMWE6Q2X47I6BYOQYFD6JEVRZMVTBW
X-Message-ID-Hash: YBKMWE6Q2X47I6BYOQYFD6JEVRZMVTBW
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBKMWE6Q2X47I6BYOQYFD6JEVRZMVTBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/29/2023 11:06 PM, Wesley Cheng wrote:
> Some vendor modules will utilize useful parsing and endpoint management
> APIs to start audio playback/capture.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   sound/usb/card.c     |  4 +++
>   sound/usb/endpoint.c |  1 +
>   sound/usb/helper.c   |  1 +
>   sound/usb/pcm.c      | 67 +++++++++++++++++++++++++++++++++-----------
>   sound/usb/pcm.h      | 11 ++++++++
>   5 files changed, 67 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 067a1e82f4bf..b45b6daee7b7 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -1053,6 +1053,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
>   		wake_up(&chip->shutdown_wait);
>   	return err;
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
>   
>   /* autosuspend and unlock the shutdown */
>   void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
> @@ -1061,6 +1062,7 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
>   	if (atomic_dec_and_test(&chip->usage_count))
>   		wake_up(&chip->shutdown_wait);
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_unlock_shutdown);
>   
>   int snd_usb_autoresume(struct snd_usb_audio *chip)
>   {
> @@ -1083,6 +1085,7 @@ int snd_usb_autoresume(struct snd_usb_audio *chip)
>   	}
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_autoresume);
>   
>   void snd_usb_autosuspend(struct snd_usb_audio *chip)
>   {
> @@ -1096,6 +1099,7 @@ void snd_usb_autosuspend(struct snd_usb_audio *chip)
>   	for (i = 0; i < chip->num_interfaces; i++)
>   		usb_autopm_put_interface(chip->intf[i]);
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_autosuspend);
>   
>   static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
>   {
> diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
> index a385e85c4650..aac92e0b8aa2 100644
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -1503,6 +1503,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
>   	mutex_unlock(&chip->mutex);
>   	return err;
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_endpoint_prepare);
>   
>   /* get the current rate set to the given clock by any endpoint */
>   int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
> diff --git a/sound/usb/helper.c b/sound/usb/helper.c
> index bf80e55d013a..4322ae3738e6 100644
> --- a/sound/usb/helper.c
> +++ b/sound/usb/helper.c
> @@ -62,6 +62,7 @@ void *snd_usb_find_csint_desc(void *buffer, int buflen, void *after, u8 dsubtype
>   	}
>   	return NULL;
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_find_csint_desc);
>   
>   /*
>    * Wrapper for usb_control_msg().
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index 08bf535ed163..999f66080649 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -148,6 +148,16 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
>   	return found;
>   }
>   
> +const struct audioformat *
> +snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> +	    unsigned int rate, unsigned int channels, bool strict_match,
> +	    struct snd_usb_substream *subs)
> +{
> +	return find_format(fmt_list_head, format, rate, channels, strict_match,
> +			subs);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_find_format);
> +
>   static const struct audioformat *
>   find_substream_format(struct snd_usb_substream *subs,
>   		      const struct snd_pcm_hw_params *params)
> @@ -157,6 +167,14 @@ find_substream_format(struct snd_usb_substream *subs,
>   			   true, subs);
>   }
>   
> +const struct audioformat *
> +snd_usb_find_substream_format(struct snd_usb_substream *subs,
> +		      const struct snd_pcm_hw_params *params)
> +{
> +	return find_substream_format(subs, params);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_find_substream_format);
> +
>   bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
>   {
>   	const struct audioformat *fp;
> @@ -461,20 +479,9 @@ static void close_endpoints(struct snd_usb_audio *chip,
>   	}
>   }
>   
> -/*
> - * hw_params callback
> - *
> - * allocate a buffer and set the given audio format.
> - *
> - * so far we use a physically linear buffer although packetize transfer
> - * doesn't need a continuous area.
> - * if sg buffer is supported on the later version of alsa, we'll follow
> - * that.
> - */
> -static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> -			     struct snd_pcm_hw_params *hw_params)
> +int snd_usb_attach_endpoints(struct snd_usb_substream *subs,
> +				struct snd_pcm_hw_params *hw_params)
>   {
> -	struct snd_usb_substream *subs = substream->runtime->private_data;
>   	struct snd_usb_audio *chip = subs->stream->chip;
>   	const struct audioformat *fmt;
>   	const struct audioformat *sync_fmt;
> @@ -499,7 +506,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
>   	if (fmt->implicit_fb) {
>   		sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
>   								hw_params,
> -								!substream->stream,
> +								!subs->direction,
>   								&sync_fixed_rate);
>   		if (!sync_fmt) {
>   			usb_audio_dbg(chip,
> @@ -579,15 +586,28 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_attach_endpoints);
>   
>   /*
> - * hw_free callback
> + * hw_params callback
>    *
> - * reset the audio format and release the buffer
> + * allocate a buffer and set the given audio format.
> + *
> + * so far we use a physically linear buffer although packetize transfer
> + * doesn't need a continuous area.
> + * if sg buffer is supported on the later version of alsa, we'll follow
> + * that.
>    */
> -static int snd_usb_hw_free(struct snd_pcm_substream *substream)
> +static int snd_usb_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *hw_params)
>   {
>   	struct snd_usb_substream *subs = substream->runtime->private_data;
> +
> +	return snd_usb_attach_endpoints(subs, hw_params);
> +}
> +
> +int snd_usb_detach_endpoint(struct snd_usb_substream *subs)
> +{
>   	struct snd_usb_audio *chip = subs->stream->chip;
>   
>   	snd_media_stop_pipeline(subs);
> @@ -603,6 +623,19 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(snd_usb_detach_endpoint);
> +
> +/*
> + * hw_free callback
> + *
> + * reset the audio format and release the buffer
> + */
> +static int snd_usb_hw_free(struct snd_pcm_substream *substream)
> +{
> +	struct snd_usb_substream *subs = substream->runtime->private_data;
> +
> +	return snd_usb_detach_endpoint(subs);
> +}
>   
>   /* free-wheeling mode? (e.g. dmix) */
>   static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
> diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
> index 388fe2ba346d..e36df3611a05 100644
> --- a/sound/usb/pcm.h
> +++ b/sound/usb/pcm.h
> @@ -15,4 +15,15 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
>   int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
>   				    struct audioformat *fmt);
>   
> +const struct audioformat *
> +snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> +	    unsigned int rate, unsigned int channels, bool strict_match,
> +	    struct snd_usb_substream *subs);
> +const struct audioformat *
> +snd_usb_find_substream_format(struct snd_usb_substream *subs,
> +		      const struct snd_pcm_hw_params *params);
> +
> +int snd_usb_attach_endpoints(struct snd_usb_substream *subs,
> +				struct snd_pcm_hw_params *hw_params);
> +int snd_usb_detach_endpoint(struct snd_usb_substream *subs);
>   #endif /* __USBAUDIO_PCM_H */

Why is it multiple "endpoints" when attaching, but only one "endpoint" 
when detaching? Both seem to be getting similar arguments.
