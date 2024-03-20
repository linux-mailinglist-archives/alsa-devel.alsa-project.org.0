Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9A881403
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 16:01:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9942E22AE;
	Wed, 20 Mar 2024 16:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9942E22AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710946892;
	bh=cybB2ILQSWkP+qDem/ecrGvZQ4vNRh+GU9RLJyFVt50=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i+h80lYhIX/cjEwAYBLy6QVbrFdxWnNZKqUA/E7/eFOibMKHEkwAzsxggr594t7Cv
	 zHo/6/gGxfbCdLtmNPoNYH2KwBS6OAFZXOsa5cJ2D388/ax3aV0cE4ERDb6jgD/dAx
	 eMBlnOQ0gHtzvBy0SxrVriZecbcnDl47OvyQU9ro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7449F805A9; Wed, 20 Mar 2024 16:01:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D890BF80564;
	Wed, 20 Mar 2024 16:00:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5730F804E7; Wed, 20 Mar 2024 16:00:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E96A0F8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 16:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E96A0F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EfJNzA5K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710946840; x=1742482840;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cybB2ILQSWkP+qDem/ecrGvZQ4vNRh+GU9RLJyFVt50=;
  b=EfJNzA5K14HACDOF1yH8vEAav1lb0NVc/jILsjetQKkacqVSQuGByLn5
   M1+wl1p3IybZJ2J+coTuLT08oB1AqPxi8Mw4qqsyw49f7tOZczC/bQluH
   sA6wcfxZ+M5qaQBu7KFS8TuJJhqiAWR3lpmF6aQkasmEE2PCwYnoXiNF5
   YDMUHCBgSaO8a9X9i1PMP8v2nI7D4lM4UktO7xfBx8OKUcNQoWSgEcSEL
   PjYhs6LITR0icvRPSGv7hoQeaLz0R4RdOdER4NNdYjaiHfzsjP7jzLoFs
   8Oatn9cKbbPDu03fISNvDKczZdmsYtmPajDHBpKIGQO21wp63nnSOEIF/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16416025"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000";
   d="scan'208";a="16416025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000";
   d="scan'208";a="14831504"
Received: from manikgoy-mobl1.amr.corp.intel.com (HELO [10.212.106.67])
 ([10.212.106.67])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:00:26 -0700
Message-ID: <1d0399d2-684f-490e-8711-f636e987a0b8@linux.intel.com>
Date: Wed, 20 Mar 2024 10:00:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: cdns: Add drivers of Cadence Multi-Channel
 I2S Controller
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
 <20240320090239.168743-3-xingyu.wu@starfivetech.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240320090239.168743-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: U4A2YY6RV6QSHLJ2KCMNL7KLJGQKT67C
X-Message-ID-Hash: U4A2YY6RV6QSHLJ2KCMNL7KLJGQKT67C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4A2YY6RV6QSHLJ2KCMNL7KLJGQKT67C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> diff --git a/sound/soc/cdns/Kconfig b/sound/soc/cdns/Kconfig
> new file mode 100644
> index 000000000000..61ef718ebfe7
> --- /dev/null
> +++ b/sound/soc/cdns/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config SND_SOC_CADENCE_I2S_MC
> +        tristate "Cadence I2S Multi-Channel Controller Device Driver"
> +	depends on HAVE_CLK

indentation is off

> +        select SND_SOC_GENERIC_DMAENGINE_PCM
> +        help
> +         Say Y or M if you want to add support for I2S driver for the
> +         Cadence Multi-Channel I2S Controller device. The device supports
> +         up to a maximum of 8 channels each for play and record.

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence Multi-Channel I2S controller PCM driver
> + *
> + * Copyright (c) 2022-2023 StarFive Technology Co., Ltd.

2024?

> + */
> +
> +#include <linux/io.h>
> +#include <linux/rcupdate.h>
> +#include <sound/pcm_params.h>
> +#include "cdns-i2s-mc.h"
> +
> +#define PERIOD_BYTES_MIN	4096
> +#define BUFFER_BYTES_MAX	(3 * 2 * 8 * PERIOD_BYTES_MIN)

what are those 3 and 2 and 8 factors? a comment or the use of macros
would help.

> +#define PERIODS_MIN		2
> +
> +static unsigned int cdns_i2s_pcm_tx(struct cdns_i2s_dev *dev,
> +				    struct snd_pcm_runtime *runtime,
> +				    unsigned int tx_ptr, bool *period_elapsed,
> +				    snd_pcm_format_t format)
> +{
> +	unsigned int period_pos = tx_ptr % runtime->period_size;

not following what the modulo is for, usually it's modulo the buffer size?

> +	const u16 (*p16)[2] = (void *)runtime->dma_area;
> +	const u32 (*p32)[2] = (void *)runtime->dma_area;
> +	u32 data[2];
> +	int i;
> +
> +	for (i = 0; i < CDNS_I2S_FIFO_DEPTH; i++) {
> +		if (format == SNDRV_PCM_FORMAT_S16_LE) {
> +			data[0] = p16[tx_ptr][0];
> +			data[1] = p16[tx_ptr][1];
> +		} else if (format == SNDRV_PCM_FORMAT_S32_LE) {
> +			data[0] = p32[tx_ptr][0];
> +			data[1] = p32[tx_ptr][1];
> +		}

what about other formats implied by the use of 'else if' ?
> +
> +		iowrite32(data[0], dev->base + CDNS_FIFO_MEM);
> +		iowrite32(data[1], dev->base + CDNS_FIFO_MEM);
> +		period_pos++;
> +		if (++tx_ptr >= runtime->buffer_size)
> +			tx_ptr = 0;
> +	}
> +
> +	*period_elapsed = period_pos >= runtime->period_size;
> +	return tx_ptr;
> +}

> +static void cdns_i2s_pcm_transfer(struct cdns_i2s_dev *dev, bool push)

'push' really means 'tx' so what not use a simpler naming?

> +{
> +	struct snd_pcm_substream *substream;
> +	bool active, period_elapsed;
> +
> +	rcu_read_lock();
> +	if (push)
> +		substream = rcu_dereference(dev->tx_substream);
> +	else
> +		substream = rcu_dereference(dev->rx_substream);
> +
> +	active = substream && snd_pcm_running(substream);
> +	if (active) {
> +		unsigned int ptr;
> +		unsigned int new_ptr;
> +
> +		if (push) {
> +			ptr = READ_ONCE(dev->tx_ptr);
> +			new_ptr = dev->tx_fn(dev, substream->runtime, ptr,
> +					     &period_elapsed, dev->format);
> +			cmpxchg(&dev->tx_ptr, ptr, new_ptr);
> +		} else {
> +			ptr = READ_ONCE(dev->rx_ptr);
> +			new_ptr = dev->rx_fn(dev, substream->runtime, ptr,
> +					     &period_elapsed, dev->format);
> +			cmpxchg(&dev->rx_ptr, ptr, new_ptr);
> +		}
> +
> +		if (period_elapsed)
> +			snd_pcm_period_elapsed(substream);
> +	}
> +	rcu_read_unlock();
> +}
> +
> +void cdns_i2s_pcm_push_tx(struct cdns_i2s_dev *dev)
> +{
> +	cdns_i2s_pcm_transfer(dev, true);
> +}
> +
> +void cdns_i2s_pcm_pop_rx(struct cdns_i2s_dev *dev)
> +{
> +	cdns_i2s_pcm_transfer(dev, false);
> +}
> +
> +static int cdns_i2s_pcm_open(struct snd_soc_component *component,
> +			     struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct cdns_i2s_dev *dev = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
> +
> +	snd_soc_set_runtime_hwparams(substream, &cdns_i2s_pcm_hardware);
> +	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> +	runtime->private_data = dev;
> +
> +	return 0;
> +}
> +
> +static int cdns_i2s_pcm_close(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream)
> +{
> +	synchronize_rcu();
> +	return 0;

runtime->private_data = NULL?

> +}
> +
> +static int cdns_i2s_pcm_hw_params(struct snd_soc_component *component,
> +				  struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *hw_params)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct cdns_i2s_dev *dev = runtime->private_data;
> +
> +	dev->format = params_format(hw_params);

don't you need to test if the formats are supported?

> +	dev->tx_fn = cdns_i2s_pcm_tx;
> +	dev->rx_fn = cdns_i2s_pcm_rx;
> +
> +	return 0;
> +}

> +static int cdns_i2s_start(struct cdns_i2s_dev *i2s,
> +			  struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	unsigned char max_ch = i2s->max_channels;
> +	unsigned char i2s_ch;
> +	int i;
> +
> +	/* Each channel is stereo */
> +	i2s_ch = runtime->channels / 2;
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		if ((i2s_ch + i2s->tx_using_channels) > max_ch) {
> +			dev_err(i2s->dev,
> +				"Max %d channels: using %d for TX, do not support %d for RX\n",
> +				max_ch, i2s->tx_using_channels, i2s_ch);
> +			return -ENOMEM;

ENOMEM is for memory allocation, that looks more like EINVAL?

> +		}
> +
> +		i2s->rx_using_channels = i2s_ch;
> +		/* Enable channels from 0 to 'max_ch' as tx */
> +		for (i = 0; i < i2s_ch; i++)
> +			cdns_i2s_channel_start(i2s, CDNS_I2S_CM_0 << i,
> +					       CDNS_I2S_TC_RECEIVER);
> +
> +	} else {
> +		if ((i2s_ch + i2s->rx_using_channels) > max_ch) {
> +			dev_err(i2s->dev,
> +				"Max %d channels: using %d for RX, do not support %d for TX\n",
> +				max_ch, i2s->rx_using_channels, i2s_ch);
> +			return -ENOMEM;
> +		}
> +
> +		i2s->tx_using_channels = i2s_ch;
> +		/* Enable channels from 'max_ch' to 0 as rx */
> +		for (i = (max_ch - 1); i > (max_ch - i2s_ch - 1); i--) {
> +			if (i < 0)
> +				return -EINVAL;

that is a test you can probably factor out of the loop before doing
anything that's inconsistent.

> +
> +			cdns_i2s_channel_start(i2s, CDNS_I2S_CM_0 << i,
> +					       CDNS_I2S_TC_TRANSMITTER);
> +		}
> +	}
> +	cdns_i2s_enable_clock(i2s, substream->stream);
> +
> +	if (i2s->irq >= 0)
> +		cdns_i2s_set_all_irq_mask(i2s, false);
> +
> +	cdns_i2s_clear_int(i2s);
> +
> +	return 0;
> +}
> +
> +static int cdns_i2s_stop(struct cdns_i2s_dev *i2s,
> +			 struct snd_pcm_substream *substream)
> +{
> +	unsigned char i2s_ch;
> +	int i;
> +
> +	cdns_i2s_clear_int(i2s);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		i2s_ch = i2s->rx_using_channels;
> +		for (i = 0; i < i2s_ch; i++)
> +			cdns_i2s_channel_stop(i2s, (CDNS_I2S_CM_0 << i));
> +
> +		i2s->rx_using_channels = 0;
> +	} else {
> +		unsigned char max_ch = i2s->max_channels;
> +
> +		i2s_ch = i2s->tx_using_channels;
> +		for (i = (max_ch - 1); i > (max_ch - i2s_ch - 1); i--) {
> +			if (i < 0)
> +				return -EINVAL;

same here, first test if the channel maps are valid, then do the loop?

> +
> +			cdns_i2s_channel_stop(i2s, (CDNS_I2S_CM_0 << i));
> +		}
> +
> +		i2s->tx_using_channels = 0;
> +	}
> +
> +	if (i2s->irq >= 0 && !i2s->tx_using_channels && !i2s->rx_using_channels)
> +		cdns_i2s_set_all_irq_mask(i2s, true);
> +
> +	return 0;
> +}

> +static int cdns_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
> +			    unsigned int fmt)
> +{
> +	struct cdns_i2s_dev *i2s = snd_soc_dai_get_drvdata(cpu_dai);
> +	int ret = 0;
> +
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		i2s->tx_sync_ms_mode = CDNS_I2S_MASTER_MODE;
> +		i2s->rx_sync_ms_mode = CDNS_I2S_MASTER_MODE;
> +		cdns_i2s_set_ms_mode(i2s);
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		i2s->tx_sync_ms_mode = CDNS_I2S_SLAVE_MODE;
> +		i2s->rx_sync_ms_mode = CDNS_I2S_SLAVE_MODE;
> +		cdns_i2s_set_ms_mode(i2s);
> +		break;
> +	case SND_SOC_DAIFMT_CBM_CFS:
> +	case SND_SOC_DAIFMT_CBS_CFM:

that's the old stuff, use CBP/CBC macros please.

> +		ret = -EINVAL;
> +		break;
> +	default:
> +		dev_dbg(i2s->dev, "Invalid master/slave format\n");
> +		ret = -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}

> +#ifdef CONFIG_PM

Do we need this or just rely on __unused?

> +static int cdns_i2s_runtime_suspend(struct device *dev)
> +{
> +	struct cdns_i2s_dev *i2s = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(i2s->clks[1].clk); /* ICG clock */
> +	return 0;
> +}
> +
> +static int cdns_i2s_runtime_resume(struct device *dev)
> +{
> +	struct cdns_i2s_dev *i2s = dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(i2s->clks[1].clk); /* ICG clock */
> +}
> +#endif

> +static int cdns_i2s_probe(struct platform_device *pdev)
> +{
> +	struct cdns_i2s_dev *i2s;
> +	struct resource *res;
> +	int ret;
> +
> +	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> +	if (!i2s) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +	platform_set_drvdata(pdev, i2s);
> +
> +	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(i2s->base)) {
> +		ret = PTR_ERR(i2s->base);
> +		goto err;
> +	}
> +
> +	i2s->dev = &pdev->dev;
> +	i2s->phybase = res->start;
> +
> +	ret = cdns_i2s_init(i2s);
> +	if (ret)
> +		goto err;
> +
> +	i2s->irq = platform_get_irq(pdev, 0);
> +	if (i2s->irq >= 0) {
> +		ret = devm_request_irq(&pdev->dev, i2s->irq, cdns_i2s_irq_handler,
> +				       0, pdev->name, i2s);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "request_irq failed\n");
> +			goto err;
> +		}
> +	}
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &cdns_i2s_component,
> +					      &cdns_i2s_dai, 1);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "couldn't register component\n");
> +		goto err;
> +	}
> +
> +	if (i2s->irq >= 0)
> +		ret = cdns_i2s_pcm_register(pdev);
> +	else
> +		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "could not register pcm: %d\n", ret);
> +		goto err;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	if (pm_runtime_enabled(&pdev->dev))
> +		cdns_i2s_runtime_suspend(&pdev->dev);

that sequence looks suspicious.... Why would you suspend immediately
during the probe? You're probably missing all the autosuspend stuff?

> +
> +	dev_dbg(&pdev->dev, "I2S supports %d stereo channels with %s.\n",
> +		i2s->max_channels, ((i2s->irq < 0) ? "dma" : "interrupt"));
> +
> +	return 0;
> +
> +err:
> +	return ret;
> +}
> +
> +static int cdns_i2s_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		cdns_i2s_runtime_suspend(&pdev->dev);

... and this one too. Once you've disabled pm_runtime, checking the
status is irrelevant...

> +
> +	return 0;
> +}
> +
