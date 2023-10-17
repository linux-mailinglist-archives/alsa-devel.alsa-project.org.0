Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B37CD0B2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70D3DEB;
	Wed, 18 Oct 2023 01:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70D3DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585111;
	bh=PybxR5OOHdCgOEo4oG6IoDqdttwVJEzqeA+hF47prLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Np3sjF7T2aRTmfP0Fkr46sug+/78S1MJmxE4TxgPVHobX7gHQzKik48VTj37RrchY
	 bAZNnP7HSQ4e62BgcftsSL5vxgJWN82Y850u4tEEvOG38FbqF7TnMMlgBhN8YfevEe
	 DfYyk5BAnKcMhDEuwvHp5NzyZf5PtPnOrOw43b5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 073F1F80589; Wed, 18 Oct 2023 01:23:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCB90F80578;
	Wed, 18 Oct 2023 01:23:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2130F80578; Wed, 18 Oct 2023 01:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 982EFF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982EFF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WWJ+tgSk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585000; x=1729121000;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PybxR5OOHdCgOEo4oG6IoDqdttwVJEzqeA+hF47prLE=;
  b=WWJ+tgSkdhyQ14f5gTusAdwnrsE94nWdAoifKR7V6LPIKY4OaG4I4a8v
   dYJ9a+wLzqGaSXzWVn8y9Ek4ZJUYLMEh+1hvO2ERaWcLUmVuV7wvejHxM
   UMWdqzl+NEOrsefECFUFMLVLYGKlJL4ic2VZMY6Zvg7LLrqK64LhnBRKq
   QSVSL1nLH+3MhZgkQtwCzzyKlWuWxKVTmQFhr8KxYEv3AKEOGnk8WuVdB
   Q8al2gQXH/ys8DTjKTvHygAYOpew8mWPxwXyvPzUx207t4E80OMBkTjtz
   J61ren1euQWx0fEI6OU5efQMBNNtcDQZemZslQe7zLQ9Q8WnOCu61CraN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778039"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637438"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637438"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:11 -0700
Message-ID: <7aa4ea87-9d1f-400a-bcc5-b56e5b4500c6@linux.intel.com>
Date: Tue, 17 Oct 2023 16:32:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/34] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20231017200109.11407-10-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CA6SF3ULJZQKFHFVTVTNUYS2Y5MWYWNQ
X-Message-ID-Hash: CA6SF3ULJZQKFHFVTVTNUYS2Y5MWYWNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CA6SF3ULJZQKFHFVTVTNUYS2Y5MWYWNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:00, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback endpoints, so that the main

playback only?

> application processor can be placed into lower CPU power modes.  This adds
> the required AFE port configurations and port start command to start an
> audio session.
> 
> Specifically, the QC ADSP can support all potential endpoints that are
> exposed by the audio data interface.  This includes, feedback endpoints
> (both implicit and explicit) as well as the isochronous (data) endpoints.

implicit feedback means support for capture. This is confusing...

> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	int channels = params_channels(params);
> +	int rate = params_rate(params);
> +	struct q6afe_usb_cfg *usb = &dai_data->port_config[dai->id].usb_audio;
> +
> +	usb->sample_rate = rate;
> +	usb->num_channels = channels;
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_U16_LE:
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +	case SNDRV_PCM_FORMAT_SPECIAL:

what does FORMAT_SPECIAL mean? the only other reference I see to this is
related to SLIMbus, not sure how this is related?

> +		usb->bit_width = 16;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +	case SNDRV_PCM_FORMAT_S24_3LE:
> +		usb->bit_width = 24;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		usb->bit_width = 32;
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid format %d\n",
> +			__func__, params_format(params));
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

> @@ -617,6 +655,9 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
>  	{"TX_CODEC_DMA_TX_5", NULL, "TX_CODEC_DMA_TX_5 Capture"},
>  	{"RX_CODEC_DMA_RX_6 Playback", NULL, "RX_CODEC_DMA_RX_6"},
>  	{"RX_CODEC_DMA_RX_7 Playback", NULL, "RX_CODEC_DMA_RX_7"},
> +
> +	/* USB playback AFE port receives data for playback, hence use the RX port */
> +	{"USB Playback", NULL, "USB_RX"},

Capture for implicit feedback?

>  };
>  
>  static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
> @@ -644,6 +685,18 @@ static int msm_dai_q6_dai_remove(struct snd_soc_dai *dai)
>  	return 0;
>  }
>  
> +static const struct snd_soc_dai_ops q6usb_ops = {
> +	.probe		= msm_dai_q6_dai_probe,
> +	.prepare	= q6afe_dai_prepare,
> +	.hw_params	= q6usb_hw_params,

this is rather confusing with two different layers used for hw_params
and prepare? Additional comments or explanations wouldn't hurt.

> +	.shutdown	= q6afe_dai_shutdown,
> +	/*
> +	 * Startup callback not needed, as AFE port start command passes the PCM
> +	 * parameters within the AFE command, which is provided by the PCM core
> +	 * during the prepare() stage.

This doesn't really explain why you need a shutdown?


> + * struct afe_param_id_usb_audio_dev_latency_mode
> + * @cfg_minor_version: Minor version used for tracking USB audio device
> + * configuration.
> + * Supported values:
> + *     AFE_API_MINOR_VERSION_USB_AUDIO_LATENCY_MODE
> + * @mode: latency mode for the USB audio device

what are the different latency modes? and is this related to the latency
reporting that was added in the USB2 audio class IIRC?

> +static int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
> +{
> +	union afe_port_config *pcfg = &port->port_cfg;
> +	struct afe_param_id_usb_audio_dev_params usb_dev;
> +	struct afe_param_id_usb_audio_dev_lpcm_fmt lpcm_fmt;
> +	struct afe_param_id_usb_audio_svc_interval svc_int;
> +	int ret = 0;

useless init overridden...
> +
> +	if (!pcfg) {
> +		dev_err(port->afe->dev, "%s: Error, no configuration data\n", __func__);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	memset(&usb_dev, 0, sizeof(usb_dev));
> +	memset(&lpcm_fmt, 0, sizeof(lpcm_fmt));
> +	memset(&svc_int, 0, sizeof(svc_int));
> +
> +	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	ret = q6afe_port_set_param_v2(port, &usb_dev,

.... here

> +				      AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
> +	if (ret) {
> +		dev_err(port->afe->dev, "%s: AFE device param cmd failed %d\n",
> +			__func__, ret);
> +		goto exit;
> +	}
> +
> +	lpcm_fmt.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	lpcm_fmt.endian = pcfg->usb_cfg.endian;
> +	ret = q6afe_port_set_param_v2(port, &lpcm_fmt,
> +				      AFE_PARAM_ID_USB_AUDIO_DEV_LPCM_FMT,
> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(lpcm_fmt));
> +	if (ret) {
> +		dev_err(port->afe->dev, "%s: AFE device param cmd LPCM_FMT failed %d\n",
> +			__func__, ret);
> +		goto exit;
> +	}
> +
> +	svc_int.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	svc_int.svc_interval = pcfg->usb_cfg.service_interval;
> +	ret = q6afe_port_set_param_v2(port, &svc_int,
> +				      AFE_PARAM_ID_USB_AUDIO_SVC_INTERVAL,
> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(svc_int));
> +	if (ret)
> +		dev_err(port->afe->dev, "%s: AFE device param cmd svc_interval failed %d\n",
> +			__func__, ret);
> +
> +exit:
> +	return ret;
> +}

> -#define AFE_PORT_MAX		129
> +#define AFE_PORT_MAX		137

does this mean 8 ports are reserved for USB?

Or is this 137 just a random index coming from the AFE design?


