Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C047CD0B1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA2B69F6;
	Wed, 18 Oct 2023 01:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA2B69F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585110;
	bh=5h5iCT8ktCVTN33vs8t2+sxyBfUL3ZcnowzRbDOneZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hObnOmqSZff0yWJ+caHn5vgvP2hz0PQt1SWrcWM8bT3lrnlm1Ap1TJmt6ctWBQjP0
	 W+qySoq1VgrR+ZaUfCa/bN24kx8fPtWneFK8pPv+smD01JlyDqXTiMFDAT/G5pnE+D
	 SoOA6035jn9yhWOnWlTJd9lSM62CTqkLJ5Jw45Rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D212F80236; Wed, 18 Oct 2023 01:23:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC392F80571;
	Wed, 18 Oct 2023 01:23:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 873EEF80558; Wed, 18 Oct 2023 01:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C7BAF8025F
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C7BAF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fLmCudN0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585001; x=1729121001;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5h5iCT8ktCVTN33vs8t2+sxyBfUL3ZcnowzRbDOneZw=;
  b=fLmCudN05ZgeiLDze5WLzj8z67E/d6KL5Ta5iQCZ9ZBLfE41cKmwd6M8
   yzIn4pcS48/rfVuNvROXIMzZMMVvhCzevdOqRWCmIXLH7ROnwoR+Xj3O3
   tMoeLX2pz6wbN2GBw/CSMIk23vTwkG82pRO/EkGaAU6+3aZLVymcd4pQu
   oYwfrXY7l5wXRBEpwQou9G1uY9pcSnK7tlDJIu1xH/RZfYULWNiHSESIv
   ICzbs59ffpKJDIB8Z0MGy2IPAWknMMdkXgbdk/oti9ntNQSiIsQxfy66P
   3PXuEO2SNjBKOt0mdT4D0j/6O9vuT2u6fiSSf2k/8zA+3p3CYG6jeYOL+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778075"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778075"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637455"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637455"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:13 -0700
Message-ID: <7af39ea4-f120-43a2-b023-fa281ff05966@linux.intel.com>
Date: Tue, 17 Oct 2023 16:46:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/34] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20231017200109.11407-12-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4JFSSWH5K2MAOX2PDBU4TYSW326RUS5V
X-Message-ID-Hash: 4JFSSWH5K2MAOX2PDBU4TYSW326RUS5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JFSSWH5K2MAOX2PDBU4TYSW326RUS5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/device.h>

alphabetical order?

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/iommu.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-map-ops.h>
> +
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <sound/soc-usb.h>
> +#include <sound/pcm_params.h>
> +#include <sound/asound.h>
> +#include <sound/q6usboffload.h>
> +
> +#include "q6dsp-lpass-ports.h"
> +#include "q6afe.h"
> +
> +#define SID_MASK	0xF

Prefix? e.g. Q6_USB_SID_MASK?

> +
> +struct q6usb_port_data {
> +	struct q6afe_usb_cfg usb_cfg;
> +	struct snd_soc_usb *usb;
> +	struct q6usb_offload priv;
> +	int active_idx;

index of what?

> +};
> +
> +static const struct snd_soc_dapm_widget q6usb_dai_widgets[] = {
> +	SND_SOC_DAPM_HP("USB_RX_BE", NULL),
> +};
> +
> +static const struct snd_soc_dapm_route q6usb_dapm_routes[] = {
> +	{"USB Playback", NULL, "USB_RX_BE"},
> +};
> +
> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops q6usb_ops = {
> +	.hw_params = q6usb_hw_params,
> +};
> +
> +static struct snd_soc_dai_driver q6usb_be_dais[] = {
> +	{
> +		.playback = {
> +			.stream_name = "USB BE RX",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
> +				SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
> +				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> +				SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
> +				SNDRV_PCM_RATE_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +				SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
> +				SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +				SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rate_max =     192000,
> +			.rate_min =	8000,
> +		},
> +		.id = USB_RX,
> +		.name = "USB_RX_BE",
> +		.ops = &q6usb_ops,
> +	},
> +};

This is a bit confusing.

In patch 9/34 you have a

static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {

but this was not described anywhere in your cover letter.

or maybe this referred to the 'Q6AFE "cpu"', in which case you have
inconsistent naming between q6dsp and q6afe?

> +
> +static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
> +					const struct of_phandle_args *args,
> +					const char **dai_name)
> +{
> +	int id = args->args[0];
> +	int ret = -EINVAL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(q6usb_be_dais); i++) {
> +		if (q6usb_be_dais[i].id == id) {
> +			*dai_name = q6usb_be_dais[i].name;
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
> +			struct snd_soc_usb_device *sdev, bool connected)
> +{
> +	struct q6usb_port_data *data;
> +
> +	if (!usb->component)
> +		return -ENODEV;
> +
> +	data = dev_get_drvdata(usb->component->dev);
> +
> +	if (connected) {
> +		/* We only track the latest USB headset plugged in */
> +		data->active_idx = sdev->card_idx;
> +	}
> +
> +	return 0;
> +}
> +
> +static int q6usb_component_probe(struct snd_soc_component *component)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
> +
> +	data->usb = snd_soc_usb_add_port(component->dev, &data->priv, q6usb_alsa_connection_cb);

There is a conceptual problem here wrt. resource allocation.

snd_soc_usb_add_port() uses devm_kzalloc().

This cannot be used in a component probe, this has to be used in a real
driver probe.

> +	if (IS_ERR(data->usb)) {
> +		dev_err(component->dev, "failed to add usb port\n");
> +		return -ENODEV;
> +	}
> +
> +	data->usb->component = component;
> +
> +	return 0;
> +}
> +
> +static void q6usb_component_remove(struct snd_soc_component *component)
> +{
> +	snd_soc_usb_remove_port(component->dev);

and here as well, this should free the "struct snd_soc_usb *usb"
allocated in the probe. relying on devm_ is not quite right. Or if you
use devm_, you have to call it from the platform driver .probe.

> +static struct platform_driver q6usb_dai_platform_driver = {
> +	.driver = {
> +		.name = "q6usb-dai",
> +		.of_match_table = of_match_ptr(q6usb_dai_device_id),
> +	},
> +	.probe = q6usb_dai_dev_probe,
> +	/*
> +	 * Remove not required as resources are cleaned up as part of
> +	 * component removal.  Others are device managed resources.
> +	 */
> +};
> +module_platform_driver(q6usb_dai_platform_driver);
> +
> +MODULE_DESCRIPTION("Q6 USB backend dai driver");
> +MODULE_LICENSE("GPL");
