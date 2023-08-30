Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03078D5FC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 14:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF8D61FC;
	Wed, 30 Aug 2023 14:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF8D61FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693399930;
	bh=WEY11JQKSeAw/tLmEXYWcs832d5TRluZszGSj1NWkPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M9BdUDI455eM9tvvNfQNyNPk/kd1aCl0baN+a2iQ+a8mCcVDPBbQb4yjxoHYn+nJm
	 07prs10Jv3TQVkZzN9HLjJurCLK8NjS2R/U0VDZ+vB45Wl9pnvDBYFpQ0cSUIMDGeQ
	 RLQFL3+Tn87Qf+pGPxcv1t4uz1H8T4FiE2vogsKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29830F8032D; Wed, 30 Aug 2023 14:51:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B24C5F800F5;
	Wed, 30 Aug 2023 14:51:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E7E5F80158; Wed, 30 Aug 2023 14:51:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F71DF80074
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 14:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F71DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MqXYidSz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693399859; x=1724935859;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WEY11JQKSeAw/tLmEXYWcs832d5TRluZszGSj1NWkPQ=;
  b=MqXYidSzhQvRxwYBrYWtpQJDdDLNmZqzqOddAvHcyL/xfcp/nquwxuif
   YBl5Am1y+m9Ka/Dha9AlY/1kfRyoVI7ID/D6TYl3Z5PBFVYtosPbjFesW
   Pq0dblMzEXk84A2ttc0rW0Sn9ERUWQ2P2s0Y1ZQ17wFnFxBJCfbjCQLej
   ymrtT27tdQbUJaGF3yvuGfCm32eNy8d1SkKCuOb1ULRr4Xb8zQgQ4Vqvf
   DK1F35q0Yd/7v5CSuDlcaH6q6g7fWO1ExCVInp5YqcAR1/Bgxkm//ydKR
   YHTNMKW9iwY7cf+vHx5w8xypX4wLkU027i27wSPQmXCvT26vnIubqbc5r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="365839342"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000";
   d="scan'208";a="365839342"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739081818"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000";
   d="scan'208";a="739081818"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:50:44 -0700
Message-ID: <cd39ced8-fa89-a666-383f-8fd1c7a14d23@linux.intel.com>
Date: Wed, 30 Aug 2023 14:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 10/32] ASoC: qcom: Add USB backend ASoC driver for Q6
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
 <20230829210657.9904-11-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230829210657.9904-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LYAISLU7GWJ2UCXUKZBQKT6WJ2GDW6IC
X-Message-ID-Hash: LYAISLU7GWJ2UCXUKZBQKT6WJ2GDW6IC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYAISLU7GWJ2UCXUKZBQKT6WJ2GDW6IC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/29/2023 11:06 PM, Wesley Cheng wrote:
> Create a USB BE component that will register a new USB port to the ASoC USB
> framework.  This will handle determination on if the requested audio
> profile is supported by the USB device currently selected.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   include/sound/q6usboffload.h  |  20 ++++
>   sound/soc/qcom/Kconfig        |   4 +
>   sound/soc/qcom/qdsp6/Makefile |   1 +
>   sound/soc/qcom/qdsp6/q6usb.c  | 200 ++++++++++++++++++++++++++++++++++
>   4 files changed, 225 insertions(+)
>   create mode 100644 include/sound/q6usboffload.h
>   create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
> 
> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
> new file mode 100644
> index 000000000000..4fb1912d9f55
> --- /dev/null
> +++ b/include/sound/q6usboffload.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * linux/sound/q6usboffload.h -- QDSP6 USB offload
> + *
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
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
> +	u32 intr_num;
> +	struct iommu_domain *domain;
> +};
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index e7b00d1d9e99..bb285af6bb04 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -114,6 +114,9 @@ config SND_SOC_QDSP6_APM
>   config SND_SOC_QDSP6_PRM_LPASS_CLOCKS
>   	tristate
>   
> +config SND_SOC_QDSP6_USB
> +	tristate
> +
>   config SND_SOC_QDSP6_PRM
>   	tristate
>   	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
> @@ -134,6 +137,7 @@ config SND_SOC_QDSP6
>   	select SND_SOC_TOPOLOGY
>   	select SND_SOC_QDSP6_APM
>   	select SND_SOC_QDSP6_PRM
> +	select SND_SOC_QDSP6_USB
>   	help
>   	 To add support for MSM QDSP6 Soc Audio.
>   	 This will enable sound soc platform specific
> diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
> index 3963bf234664..c9457ee898d0 100644
> --- a/sound/soc/qcom/qdsp6/Makefile
> +++ b/sound/soc/qcom/qdsp6/Makefile
> @@ -17,3 +17,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += q6apm-dai.o
>   obj-$(CONFIG_SND_SOC_QDSP6_APM_LPASS_DAI) += q6apm-lpass-dais.o
>   obj-$(CONFIG_SND_SOC_QDSP6_PRM) += q6prm.o
>   obj-$(CONFIG_SND_SOC_QDSP6_PRM_LPASS_CLOCKS) += q6prm-clocks.o
> +obj-$(CONFIG_SND_SOC_QDSP6_USB) += q6usb.o
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> new file mode 100644
> index 000000000000..88aa0a64201a
> --- /dev/null
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
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
> +
> +struct q6usb_port_data {
> +	struct q6afe_usb_cfg usb_cfg;
> +	struct snd_soc_usb *usb;
> +	struct q6usb_offload priv;
> +	int active_idx;
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

Missing new line after closing bracket between function and following 
struct.

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
> +
> +static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
> +					const struct of_phandle_args *args,
> +					const char **dai_name)
> +{
> +	int id = args->args[0];
> +	int ret = -EINVAL;
> +	int i;
> +
> +	for (i = 0; i  < ARRAY_SIZE(q6usb_be_dais); i++) {

Double space after second i.

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
> +	if (connected)
> +		/* We only track the latest USB headset plugged in */
> +		data->active_idx = sdev->card_idx;

Maybe add brackets around both comment and code? Not sure what guidance 
there is in such cases, but above code looks weird to me.

> +
> +	return 0;
> +}
> +
> +static int q6usb_component_probe(struct snd_soc_component *component)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
> +
> +	data->usb = snd_soc_usb_add_port(component->dev, &data->priv, q6usb_alsa_connection_cb);
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
> +}
> +
> +static const struct snd_soc_component_driver q6usb_dai_component = {
> +	.probe = q6usb_component_probe,
> +	.remove = q6usb_component_remove,
> +	.name = "q6usb-dai-component",
> +	.dapm_widgets = q6usb_dai_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(q6usb_dai_widgets),
> +	.dapm_routes = q6usb_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(q6usb_dapm_routes),
> +	.of_xlate_dai_name = q6usb_audio_ports_of_xlate_dai_name,
> +};
> +
> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct q6usb_port_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(node, "qcom,usb-audio-intr-num",
> +				&data->priv.intr_num);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to read intr num.\n");
> +		return ret;
> +	}
> +
> +	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> +	if (ret < 0)
> +		data->priv.sid = -1;
> +	else
> +		data->priv.sid = args.args[0] & SID_MASK;
> +
> +	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
> +
> +	data->priv.dev = dev;
> +	dev_set_drvdata(dev, data);
> +
> +	return devm_snd_soc_register_component(dev, &q6usb_dai_component,
> +					q6usb_be_dais, ARRAY_SIZE(q6usb_be_dais));
> +}
> +
> +static int q6usb_dai_dev_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

Does platform driver really need empty remove function? Remove it.

> +
> +static const struct of_device_id q6usb_dai_device_id[] = {
> +	{ .compatible = "qcom,q6usb" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, q6usb_dai_device_id);
> +
> +static struct platform_driver q6usb_dai_platform_driver = {
> +	.driver = {
> +		.name = "q6usb-dai",
> +		.of_match_table = of_match_ptr(q6usb_dai_device_id),
> +	},
> +	.probe = q6usb_dai_dev_probe,
> +	.remove = q6usb_dai_dev_remove,
> +};
> +module_platform_driver(q6usb_dai_platform_driver);
> +
> +MODULE_DESCRIPTION("Q6 USB backend dai driver");
> +MODULE_LICENSE("GPL");

