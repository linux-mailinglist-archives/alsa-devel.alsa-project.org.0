Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38C965E3D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C83C851;
	Fri, 30 Aug 2024 12:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C83C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012891;
	bh=3I2S+/y3zRWREP8+H0SqebmdItXfXZ9zPC2+cYey4Qw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h+g95jruSBzI5dHGYGwOO+34lf9e248/9N7JvZu6RgBt7XTJeXbI6o/DRMV5yN89H
	 cdCEeRMhKZqliE6QQCAwy+UWdtO/41kAmXwVxJ56NglCjq8gisXlNaOcOPkZf9evd9
	 91ASq+QOkntOdTSZqKTipY8GQBusGl5FMLs2dg6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C25AF805FE; Fri, 30 Aug 2024 12:12:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE9EF806DC;
	Fri, 30 Aug 2024 12:12:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5624F805F2; Fri, 30 Aug 2024 12:12:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A7207F805ED
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7207F805ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bVR9zy+q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012755; x=1756548755;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3I2S+/y3zRWREP8+H0SqebmdItXfXZ9zPC2+cYey4Qw=;
  b=bVR9zy+qR/RoEl5+z8DYnyVggbXFtqwDbTiMAh2+pYqCbOFMu9YLl9J6
   +7HA0FNTrO6W0nMuHKfjECRU1T37o5Z/zNR90WNN2ApytnT3RVhwRa2Gx
   uE5q4IEcMXpRJT6JbznEWyWP/has9q6SkKllSsTP8uvXIUjL3v/OlUxXw
   ecx1xcm6KZXDmWwrmaQNzL+MTsa5j668pmunacWUxwUHZPjkaavcSBntz
   M+A+JP7CaojbfwzOyla77/vftihuCu6SwWOoDepjCAUEYvNcAEZPszdIb
   mjaMyrFRdNVJRpTtzT7OHtf78l55WYh591nK3nC0v7CsCFUZbbaflJXFA
   w==;
X-CSE-ConnectionGUID: DtchkNOOSBCzFGVx4dum6g==
X-CSE-MsgGUID: anZQRBpYQ2mfaRg3avX+aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218877"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218877"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:31 -0700
X-CSE-ConnectionGUID: gtK2iHKfSeuDG2GH68lbnw==
X-CSE-MsgGUID: tIZC8KOQQ4uGb8DXCiEqOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481724"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:25 -0700
Message-ID: <afe37014-8ec5-4808-bc24-09ac0f2d93b6@linux.intel.com>
Date: Fri, 30 Aug 2024 11:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 21/33] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20240829194105.1504814-22-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-22-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7MNHBZLZ4HMM73B5PZA3PHJ5TMBSSNXB
X-Message-ID-Hash: 7MNHBZLZ4HMM73B5PZA3PHJ5TMBSSNXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MNHBZLZ4HMM73B5PZA3PHJ5TMBSSNXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.
> 
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/q6usboffload.h  |  20 +++
>  sound/soc/qcom/Kconfig        |  10 ++
>  sound/soc/qcom/qdsp6/Makefile |   1 +
>  sound/soc/qcom/qdsp6/q6usb.c  | 246 ++++++++++++++++++++++++++++++++++
>  4 files changed, 277 insertions(+)
>  create mode 100644 include/sound/q6usboffload.h
>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
> 
> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
> new file mode 100644
> index 000000000000..49ab2c34b84c
> --- /dev/null
> +++ b/include/sound/q6usboffload.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * linux/sound/q6usboffload.h -- QDSP6 USB offload

not sure about the linux/ prefix?

> + *
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/**
> + * struct q6usb_offload
> + * @dev - dev handle to usb be
> + * @sid - streamID for iommu
> + * @intr_num - usb interrupter number
> + * @domain - allocated iommu domain
> + **/
> +struct q6usb_offload {
> +	struct device *dev;
> +	long long sid;
> +	u16 intr_num;
> +	struct iommu_domain *domain;
> +};

consider reordering to avoid holes/alignment issues, e.g. all pointers
first, then long long then u16


> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int direction = substream->stream;
> +	struct q6afe_port *q6usb_afe;
> +	struct snd_soc_usb_device *sdev;
> +	int ret = -EINVAL;
> +
> +	mutex_lock(&data->mutex);
> +
> +	/* No active chip index */
> +	if (list_empty(&data->devices))
> +		goto out;

-ENODEV for the default return value>?

> +
> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
> +
> +	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
> +	if (ret < 0)
> +		goto out;
> +
> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
> +	if (IS_ERR(q6usb_afe))
> +		goto out;
> +
> +	/* Notify audio DSP about the devices being offloaded */
> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
> +					  sdev->ppcm_idx[sdev->num_playback - 1]);

don't you need a symmetrical notification upon hw_free()?

Also what happens if there are multiple calls to hw_params, which is
quite legit in ALSA/ASoC?

