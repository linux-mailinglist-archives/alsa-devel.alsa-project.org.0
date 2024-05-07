Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB308BFE56
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 15:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF2DE72;
	Wed,  8 May 2024 15:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF2DE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715174225;
	bh=+u9xtA3A4qWiXB/A2rpymg6ByEaKIVCB76KjWj11y/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AIV0ONzxdgU+PWkarY6UZMi6LCIn51kZIoeCEY8ktqIJjOYNMocqIUVBfwJGulOMp
	 OWN2yPaQzbNrtp/3f9Wkhni7F4rSTq8gxm32P0XyBUk/fyzFgAn9dO8mAzSDiFf+Rh
	 vTgMCJAoGxwWGpSsB5XOng7rSGwz8oN3a9UrRplE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 803CCF80571; Wed,  8 May 2024 15:16:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDAE7F805AE;
	Wed,  8 May 2024 15:16:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 397F6F8024C; Wed,  8 May 2024 15:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07251F8024C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 15:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07251F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OlCRIMOD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715174173; x=1746710173;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+u9xtA3A4qWiXB/A2rpymg6ByEaKIVCB76KjWj11y/Q=;
  b=OlCRIMODoMiUYfLWroSwaFxyHqUjiX6eO06w3LdIdnGwhM1J83jcXId+
   srWLbHxleMnv2SXhSu8dnhELPJA2hvxwKlVZlwSJILdPVZgYLCWbB6xON
   3GvorkzIe9cNzLkuEbNHfaYj4xniwIoKmxDMuHKQyhxNNfnJ3JkID4tCJ
   SEjSN73HX9sDygb4vAljKPh7STpXiSK2FJTLZtgWVbfw8BiEgJR9N5K7t
   qlgISF845PlByNrbVNdhO/Z9sFesD8j2xhNf4WqwNKv62OSC5uor5EbtH
   Xvmg25yMMLLHD2O+qahV3i09habpx08k0cbG3Br+O7vfPiziaJ6RuBAwr
   w==;
X-CSE-ConnectionGUID: UQNjhdZ3R42zY5wd/Ub51A==
X-CSE-MsgGUID: WEJyZn5+RpKlsgV+74vmGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="36413213"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="36413213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:09 -0700
X-CSE-ConnectionGUID: pfAWuZjXRPaa5DMWrIGqBQ==
X-CSE-MsgGUID: EjppC2esQDilsGXwWQHTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000";
   d="scan'208";a="33356740"
Received: from sskolar-mobl.amr.corp.intel.com (HELO [10.212.67.115])
 ([10.212.67.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:16:08 -0700
Message-ID: <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
Date: Tue, 7 May 2024 15:37:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzk+dt@kernel.org, gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
 bagasdotme@gmail.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-10-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240507195116.9464-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H3WK24SDAJ4G3SZCLVJR2HHFXH6473JT
X-Message-ID-Hash: H3WK24SDAJ4G3SZCLVJR2HHFXH6473JT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3WK24SDAJ4G3SZCLVJR2HHFXH6473JT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>  static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
> +	{
> +		.playback = {
> +			.stream_name = "USB Playback",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
> +					SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
> +					SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> +					SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
> +					SNDRV_PCM_RATE_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +					SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
> +					SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +					SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rate_min =	8000,
> +			.rate_max = 192000,
> +		},
> +		.id = USB_RX,
> +		.name = "USB_RX",
> +	},

Wait, is this saying you will have exactly one PCM device/FE DAI
connected to the USB BE DAI exposed in patch 11?

> +	SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
> +			   usb_mixer_controls,
> +			   ARRAY_SIZE(usb_mixer_controls)),
> +

And then what is the role of the USB mixer if you only have one input?

I must be missing something.

