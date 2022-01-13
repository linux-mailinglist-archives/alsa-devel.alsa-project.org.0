Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C8C48DDCA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:40:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D6C02041;
	Thu, 13 Jan 2022 19:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D6C02041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642099235;
	bh=iL2fgWOOuJEzuniZ3WuPssSOffY8aRg6eYScK3p39JQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLC6tDR0K6afg48/lHTmdgYzpGAzI6h4Cnl/wSTFLilMHm+yo/28Z/i5mnjctTaH0
	 mMnV38lCNNWsR+eLuNOyZ06Ryk9XLexLvuDmlvd5uAn6UW+7l6Amj0LDIcdKgM0Q49
	 35gAf2i/fzFG1Bs8HIHK/hOut19D1hr2uwzjWAMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92308F804B1;
	Thu, 13 Jan 2022 19:38:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 376B5F804B1; Thu, 13 Jan 2022 19:38:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24AF2F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24AF2F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TTkCYr8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099131; x=1673635131;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iL2fgWOOuJEzuniZ3WuPssSOffY8aRg6eYScK3p39JQ=;
 b=TTkCYr8G+b5L1L3+UCpmrY2KI5rUlx8+lpHDIOLehKLrbmYxlT2Gp3iq
 QtVtnJQoSyOvz/BPFHi7C9sq5TZid14or1ll7qNRWcbgPtbnbAWfuw2MZ
 nbrzqTruYajv89YhtfTFAQZBZM6Am3j0dUJzQ9IUgqlwluK6h1rgWH4/e
 LC/plQWwwES8Fb24W0xiJpYywVBrXCDPQ8gaw2C72GZHIyuc/yXnICol1
 xZwtqyXETtxC938/6zJmvKK3J6NeaGfcslzCkIaymAwSY5r35UopYbMoU
 G2KC53wkOnA01GQgS3b2G5biKMDZsPJdGxZzKArg5+22V3cWps07+Wuwq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="307431357"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="307431357"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:38:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620699902"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:38:44 -0800
Subject: Re: [PATCH v2 1/6] ASoC: amd: acp: Add generic support for PDM
 controller on ACP
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
 <20220113163348.434108-2-AjitKumar.Pandey@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7d79a8a7-b9b5-8a0c-a140-810bc647927c@linux.intel.com>
Date: Thu, 13 Jan 2022 12:34:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113163348.434108-2-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Alexander.Deucher@amd.com,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

couple of nit-picks:


> diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
> new file mode 100644
> index 000000000000..cb9bbd795eee
> --- /dev/null
> +++ b/sound/soc/amd/acp/acp-pdm.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +//
> +// This file is provided under a dual BSD/GPLv2 license. When using or
> +// redistributing this file, you may do so under either license.
> +//
> +// Copyright(c) 2021 Advanced Micro Devices, Inc.

2022?

> +//
> +// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> +//	    Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> +//
> +
> +/*
> + * Generic Hardware interface for ACP Audio PDM controller
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <linux/dma-mapping.h>

alphabetical order?

> +
> +#include "amd.h"
> +
> +#define DRV_NAME "acp-pdm"
> +
> +#define PDM_DMA_STAT		0x10
> +#define PDM_DMA_INTR_MASK	0x10000
> +#define PDM_DEC_64		0x2
> +#define PDM_CLK_FREQ_MASK	0x07
> +#define PDM_MISC_CTRL_MASK	0x10
> +#define PDM_ENABLE		0x01
> +#define PDM_DISABLE		0x00
> +#define DMA_EN_MASK		0x02
> +#define DELAY_US		5
> +#define PDM_TIMEOUT		1000
> +
> +static int acp_dmic_dai_trigger(struct snd_pcm_substream *substream,
> +			       int cmd, struct snd_soc_dai *dai)
> +{
> +	struct acp_stream *stream = substream->runtime->private_data;
> +	struct device *dev = dai->component->dev;
> +	struct acp_dev_data *adata = dev_get_drvdata(dev);
> +	u32 physical_addr, size_dmic, period_bytes;
> +	unsigned int dma_enable;
> +	int ret = 0;
> +
> +	period_bytes = frames_to_bytes(substream->runtime,
> +			substream->runtime->period_size);
> +	size_dmic = frames_to_bytes(substream->runtime,
> +			substream->runtime->buffer_size);
> +
> +	physical_addr = stream->reg_offset + MEM_WINDOW_START;
> +
> +	/* Init DMIC Ring buffer */
> +	writel(physical_addr, adata->acp_base + ACP_WOV_RX_RINGBUFADDR);
> +	writel(size_dmic, adata->acp_base + ACP_WOV_RX_RINGBUFSIZE);
> +	writel(period_bytes, adata->acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
> +	writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);

could this be done in a .prepare step?

> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		dma_enable = readl(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +		if (!(dma_enable & DMA_EN_MASK)) {
> +			writel(PDM_ENABLE, adata->acp_base + ACP_WOV_PDM_ENABLE);
> +			writel(PDM_ENABLE, adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +		}
> +
> +		ret = readl_poll_timeout_atomic(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE,
> +						dma_enable, (dma_enable & DMA_EN_MASK),
> +						DELAY_US, PDM_TIMEOUT);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		dma_enable = readl(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +		if ((dma_enable & DMA_EN_MASK)) {
> +			writel(PDM_DISABLE, adata->acp_base + ACP_WOV_PDM_ENABLE);
> +			writel(PDM_DISABLE, adata->acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +
> +		}
> +
> +		ret = readl_poll_timeout_atomic(adata->acp_base + ACP_WOV_PDM_DMA_ENABLE,
> +						dma_enable, !(dma_enable & DMA_EN_MASK),
> +						DELAY_US, PDM_TIMEOUT);

is the _atomic needed?

> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int acp_dmic_hwparams(struct snd_pcm_substream *substream,
> +	struct snd_pcm_hw_params *hwparams, struct snd_soc_dai *dai)
> +{
> +	struct device *dev = dai->component->dev;
> +	struct acp_dev_data *adata = dev_get_drvdata(dev);
> +	unsigned int dmic_ctrl, channels, ch_mask;
> +
> +	/* Enable default DMIC clk */
> +	writel(PDM_CLK_FREQ_MASK, adata->acp_base + ACP_WOV_CLK_CTRL);
> +	dmic_ctrl = readl(adata->acp_base + ACP_WOV_MISC_CTRL);
> +	dmic_ctrl |= PDM_MISC_CTRL_MASK;
> +	writel(dmic_ctrl, adata->acp_base + ACP_WOV_MISC_CTRL);

.hw_params can be called multiple times, should this clock handling be
done in a .prepare step?

Or alternatively in .startup - this doesn't seem to depend on hardware
parameters?

> +
> +	channels = params_channels(hwparams);
> +	switch (channels) {
> +	case 2:
> +		ch_mask = 0;
> +		break;
> +	case 4:
> +		ch_mask = 1;
> +		break;
> +	case 6:
> +		ch_mask = 2;
> +		break;
> +	default:
> +		dev_err(dev, "Invalid channels %d\n", channels);
> +		return -EINVAL;
> +	}
> +
> +	if (params_format(hwparams) != SNDRV_PCM_FORMAT_S32_LE) {
> +		dev_err(dai->dev, "Invalid format:%d\n", params_format(hwparams));
> +		return -EINVAL;
> +	}
> +
> +	writel(ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
> +	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
> +
> +	return 0;
> +}

> +MODULE_LICENSE("GPL v2");

"GPL" is enough


