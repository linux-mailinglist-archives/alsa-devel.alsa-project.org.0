Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA13F343A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 21:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E2D41676;
	Fri, 20 Aug 2021 21:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E2D41676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629486232;
	bh=IZ5bNN5Od6sAAbc7l8XE2PDFg31z9j8pF9f5SaG3UhA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Du2qW8WdTW2mi7pvsMo7WgEqQzG6gjgaI57OU48F5XCCioU5WClXv5ROLmCltFgSq
	 9DYV7Ok3fwRdtKmWebuGMvV4bjrRVTPgQzO3UDDUCADzxmWBvcNxO4JxXMMJtj5Z2s
	 bYskR7hP/rDsk6MLdA8eSXO+ECXN0RMkEDBYIkTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D085EF800CC;
	Fri, 20 Aug 2021 21:02:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45623F800EC; Fri, 20 Aug 2021 21:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06906F800EC
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 21:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06906F800EC
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="238956401"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="238956401"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 12:02:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="425117963"
Received: from mchombea-mobl.amr.corp.intel.com (HELO [10.212.9.172])
 ([10.212.9.172])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 12:02:19 -0700
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <66d6bd43-ee43-eff4-7a68-333fbb996787@linux.intel.com>
Date: Fri, 20 Aug 2021 14:02:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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


> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> new file mode 100644
> index 000000000000..c02b66f3c913
> --- /dev/null
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -0,0 +1,1737 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ALSA SoC Audio Layer - Rockchip I2S/TDM Controller driver
> + *
> + * Copyright (c) 2018 Rockchip Electronics Co. Ltd.
> + * Author: Sugar Zhang <sugar.zhang@rock-chips.com>
> + * Author: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/delay.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +#include <sound/pcm_params.h>
> +#include <sound/dmaengine_pcm.h>

alphabetical order?

> +static void rockchip_snd_xfer_clear(struct rk_i2s_tdm_dev *i2s_tdm,
> +				    unsigned int clr)
> +{
> +	unsigned int xfer_mask;
> +	unsigned int xfer_val;
> +	unsigned int val;
> +	int retry = 10;
> +	bool tx = clr & I2S_CLR_TXC;
> +	bool rx = clr & I2S_CLR_RXC;
> +
> +	if (!(rx || tx))
> +		return;
> +
> +	xfer_mask = (tx ? I2S_XFER_TXS_START : 0) |
> +		    (rx ? I2S_XFER_RXS_START : 0);
> +	xfer_val = (tx ? I2S_XFER_TXS_STOP : 0) |
> +		   (rx ? I2S_XFER_RXS_STOP : 0);
> +
> +	regmap_update_bits(i2s_tdm->regmap, I2S_XFER, xfer_mask, xfer_val);
> +	udelay(150);
> +	regmap_update_bits(i2s_tdm->regmap, I2S_CLR, clr, clr);
> +
> +	regmap_read(i2s_tdm->regmap, I2S_CLR, &val);
> +	/* Wait on the clear operation to finish */
> +	while (val) {

delay needed here?

> +		regmap_read(i2s_tdm->regmap, I2S_CLR, &val);
> +		retry--;
> +		if (!retry) {
> +			dev_warn(i2s_tdm->dev, "clear failed, reset %s%s\n",
> +				 tx ? "tx" : "", rx ? "rx" : "");
> +			if (rx && tx)
> +				rockchip_snd_xfer_sync_reset(i2s_tdm);
> +			else if (tx)
> +				rockchip_snd_reset(i2s_tdm->tx_reset);
> +			else if (rx)
> +				rockchip_snd_reset(i2s_tdm->rx_reset);
> +			break;
> +		}
> +	}
> +}

> +static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
> +				    unsigned int fmt)
> +{
> +	struct rk_i2s_tdm_dev *i2s_tdm = to_info(cpu_dai);
> +	unsigned int mask = 0, val = 0, tdm_val = 0, txcr_val = 0, rxcr_val = 0;

not all initializations are required. Run e.g. cppcheck.

> +	int ret = 0;
> +	bool is_tdm = i2s_tdm->tdm_mode;
> +
> +	pm_runtime_get_sync(cpu_dai->dev);

test if this worked?

Also if this fails you need to call pm_runtime_put_noidle()

this is what we use.

ret = pm_runtime_get_sync(dev);
if (ret < 0 && ret != -EACCES) {
      pm_runtime_put_noidle(dev);
      return ret;
}


> +	mask = I2S_CKR_MSS_MASK;
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		val = I2S_CKR_MSS_MASTER;
> +		i2s_tdm->is_master_mode = true;
> +		break;
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		val = I2S_CKR_MSS_SLAVE;
> +		i2s_tdm->is_master_mode = false;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto err_pm_put;
> +	}
> +
> +	regmap_update_bits(i2s_tdm->regmap, I2S_CKR, mask, val);
> +
> +	mask = I2S_CKR_CKP_MASK | I2S_CKR_TLP_MASK | I2S_CKR_RLP_MASK;
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		val = I2S_CKR_CKP_NORMAL |
> +		      I2S_CKR_TLP_NORMAL |
> +		      I2S_CKR_RLP_NORMAL;
> +		break;
> +	case SND_SOC_DAIFMT_NB_IF:
> +		val = I2S_CKR_CKP_NORMAL |
> +		      I2S_CKR_TLP_INVERTED |
> +		      I2S_CKR_RLP_INVERTED;
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		val = I2S_CKR_CKP_INVERTED |
> +		      I2S_CKR_TLP_NORMAL |
> +		      I2S_CKR_RLP_NORMAL;
> +		break;
> +	case SND_SOC_DAIFMT_IB_IF:
> +		val = I2S_CKR_CKP_INVERTED |
> +		      I2S_CKR_TLP_INVERTED |
> +		      I2S_CKR_RLP_INVERTED;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto err_pm_put;
> +	}
> +
> +	regmap_update_bits(i2s_tdm->regmap, I2S_CKR, mask, val);
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		txcr_val = I2S_TXCR_IBM_RSJM;
> +		rxcr_val = I2S_RXCR_IBM_RSJM;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		txcr_val = I2S_TXCR_IBM_LSJM;
> +		rxcr_val = I2S_RXCR_IBM_LSJM;
> +		break;
> +	case SND_SOC_DAIFMT_I2S:
> +		txcr_val = I2S_TXCR_IBM_NORMAL;
> +		rxcr_val = I2S_RXCR_IBM_NORMAL;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A: /* PCM no delay mode */
> +		txcr_val = I2S_TXCR_TFS_PCM;
> +		rxcr_val = I2S_RXCR_TFS_PCM;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B: /* PCM delay 1 mode */
> +		txcr_val = I2S_TXCR_TFS_PCM | I2S_TXCR_PBM_MODE(1);
> +		rxcr_val = I2S_RXCR_TFS_PCM | I2S_RXCR_PBM_MODE(1);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto err_pm_put;
> +	}
> +
> +	mask = I2S_TXCR_IBM_MASK | I2S_TXCR_TFS_MASK | I2S_TXCR_PBM_MASK;
> +	regmap_update_bits(i2s_tdm->regmap, I2S_TXCR, mask, txcr_val);
> +
> +	mask = I2S_RXCR_IBM_MASK | I2S_RXCR_TFS_MASK | I2S_RXCR_PBM_MASK;
> +	regmap_update_bits(i2s_tdm->regmap, I2S_RXCR, mask, rxcr_val);
> +
> +	if (is_tdm) {
> +		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +		case SND_SOC_DAIFMT_RIGHT_J:
> +			val = I2S_TXCR_TFS_TDM_I2S;
> +			tdm_val = TDM_SHIFT_CTRL(2);
> +			break;
> +		case SND_SOC_DAIFMT_LEFT_J:
> +			val = I2S_TXCR_TFS_TDM_I2S;
> +			tdm_val = TDM_SHIFT_CTRL(1);
> +			break;
> +		case SND_SOC_DAIFMT_I2S:
> +			val = I2S_TXCR_TFS_TDM_I2S;
> +			tdm_val = TDM_SHIFT_CTRL(0);
> +			break;
> +		case SND_SOC_DAIFMT_DSP_A:
> +			val = I2S_TXCR_TFS_TDM_PCM;
> +			tdm_val = TDM_SHIFT_CTRL(0);
> +			break;
> +		case SND_SOC_DAIFMT_DSP_B:
> +			val = I2S_TXCR_TFS_TDM_PCM;
> +			tdm_val = TDM_SHIFT_CTRL(2);
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			goto err_pm_put;
> +		}
> +
> +		tdm_val |= TDM_FSYNC_WIDTH_SEL1(1);
> +		if (i2s_tdm->tdm_fsync_half_frame)
> +			tdm_val |= TDM_FSYNC_WIDTH_HALF_FRAME;
> +		else
> +			tdm_val |= TDM_FSYNC_WIDTH_ONE_FRAME;
> +
> +		mask = I2S_TXCR_TFS_MASK;
> +		regmap_update_bits(i2s_tdm->regmap, I2S_TXCR, mask, val);
> +		regmap_update_bits(i2s_tdm->regmap, I2S_RXCR, mask, val);
> +
> +		mask = TDM_FSYNC_WIDTH_SEL1_MSK | TDM_FSYNC_WIDTH_SEL0_MSK |
> +		       TDM_SHIFT_CTRL_MSK;
> +		regmap_update_bits(i2s_tdm->regmap, I2S_TDM_TXCR,
> +				   mask, tdm_val);
> +		regmap_update_bits(i2s_tdm->regmap, I2S_TDM_RXCR,
> +				   mask, tdm_val);
> +	}
> +
> +err_pm_put:
> +	pm_runtime_put(cpu_dai->dev);
> +
> +	return ret;
> +}
> +

> +static int rockchip_i2s_tdm_clk_set_rate(struct rk_i2s_tdm_dev *i2s_tdm,
> +					 struct clk *clk, unsigned long rate,
> +					 int ppm)
> +{
> +	unsigned long rate_target;
> +	int delta, ret;
> +
> +	if (ppm == i2s_tdm->clk_ppm)
> +		return 0;
> +
> +	delta = (ppm < 0) ? -1 : 1;
> +	delta *= (int)div64_u64((u64)rate * (u64)abs(ppm) + 500000,
> +				1000000);

formula looks odd? looks like you are implementing a round to nearest
operation, but that shouldn't require this multiplication?

> +
> +	rate_target = rate + delta;
> +
> +	if (!rate_target)
> +		return -EINVAL;
> +
> +	ret = clk_set_rate(clk, rate_target);
> +	if (ret)
> +		return ret;
> +
> +	i2s_tdm->clk_ppm = ppm;
> +
> +	return ret;
> +}
> +
> +static int rockchip_i2s_tdm_calibrate_mclk(struct rk_i2s_tdm_dev *i2s_tdm,
> +					   struct snd_pcm_substream *substream,
> +					   unsigned int lrck_freq)
> +{
> +	struct clk *mclk_root;
> +	struct clk *mclk_parent;
> +	unsigned int mclk_root_freq;
> +	unsigned int mclk_root_initial_freq;
> +	unsigned int mclk_parent_freq;
> +	unsigned int div, delta;
> +	u64 ppm;
> +	int ret;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		mclk_parent = i2s_tdm->mclk_tx_src;
> +	else
> +		mclk_parent = i2s_tdm->mclk_rx_src;
> +
> +	switch (lrck_freq) {
> +	case 8000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +	case 64000:
> +	case 96000:
> +	case 192000:
> +		mclk_root = i2s_tdm->mclk_root0;
> +		mclk_root_freq = i2s_tdm->mclk_root0_freq;
> +		mclk_root_initial_freq = i2s_tdm->mclk_root0_initial_freq;
> +		mclk_parent_freq = DEFAULT_MCLK_FS * 192000;
> +		break;
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +	case 176400:
> +		mclk_root = i2s_tdm->mclk_root1;
> +		mclk_root_freq = i2s_tdm->mclk_root1_freq;
> +		mclk_root_initial_freq = i2s_tdm->mclk_root1_initial_freq;
> +		mclk_parent_freq = DEFAULT_MCLK_FS * 176400;
> +		break;
> +	default:
> +		dev_err(i2s_tdm->dev, "Invalid LRCK freq: %u Hz\n",
> +			lrck_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = clk_set_parent(mclk_parent, mclk_root);
> +	if (ret)
> +		return ret;
> +
> +	ret = rockchip_i2s_tdm_clk_set_rate(i2s_tdm, mclk_root,
> +					    mclk_root_freq, 0);
> +	if (ret)
> +		return ret;
> +
> +	delta = abs(mclk_root_freq % mclk_parent_freq - mclk_parent_freq);
> +	ppm = div64_u64((uint64_t)delta * 1000000, (uint64_t)mclk_root_freq);
> +
> +	if (ppm) {
> +		div = DIV_ROUND_CLOSEST(mclk_root_initial_freq, mclk_parent_freq);
> +		if (!div)
> +			return -EINVAL;
> +
> +		mclk_root_freq = mclk_parent_freq * round_up(div, 2);
> +
> +		ret = clk_set_rate(mclk_root, mclk_root_freq);
> +		if (ret)
> +			return ret;
> +
> +		i2s_tdm->mclk_root0_freq = clk_get_rate(i2s_tdm->mclk_root0);
> +		i2s_tdm->mclk_root1_freq = clk_get_rate(i2s_tdm->mclk_root1);
> +	}
> +
> +	ret = clk_set_rate(mclk_parent, mclk_parent_freq);
> +
> +	return ret;

return clk_set_rate(mclk_parent, mclk_parent_freq); ?

> +}
> +
> +static int rockchip_i2s_tdm_set_mclk(struct rk_i2s_tdm_dev *i2s_tdm,
> +				     struct snd_pcm_substream *substream,
> +				     struct clk **mclk)
> +{
> +	unsigned int mclk_freq;
> +	int ret;
> +
> +	if (i2s_tdm->clk_trcm) {
> +		if (i2s_tdm->mclk_tx_freq != i2s_tdm->mclk_rx_freq) {
> +			dev_err(i2s_tdm->dev,
> +				"clk_trcm, tx: %d and rx: %d should be same\n",
> +				i2s_tdm->mclk_tx_freq,
> +				i2s_tdm->mclk_rx_freq);
> +			ret = -EINVAL;
> +			return ret;

return -EINVAL?

> +		}
> +
> +		ret = clk_set_rate(i2s_tdm->mclk_tx, i2s_tdm->mclk_tx_freq);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_set_rate(i2s_tdm->mclk_rx, i2s_tdm->mclk_rx_freq);
> +		if (ret)
> +			return ret;
> +
> +		/* mclk_rx is also ok. */
> +		*mclk = i2s_tdm->mclk_tx;
> +	} else {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			*mclk = i2s_tdm->mclk_tx;
> +			mclk_freq = i2s_tdm->mclk_tx_freq;
> +		} else {
> +			*mclk = i2s_tdm->mclk_rx;
> +			mclk_freq = i2s_tdm->mclk_rx_freq;
> +		}
> +
> +		ret = clk_set_rate(*mclk, mclk_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +

> +	pm_runtime_enable(&pdev->dev);
> +	if (!pm_runtime_enabled(&pdev->dev)) {
> +		ret = i2s_tdm_runtime_resume(&pdev->dev);

that looks like dead code? you've just enabled pm_runtime, why would
this fail?

> +		if (ret)
> +			goto err_pm_disable;
> +	}
> +
> +	regmap_update_bits(i2s_tdm->regmap, I2S_DMACR, I2S_DMACR_TDL_MASK,
> +			   I2S_DMACR_TDL(16));
> +	regmap_update_bits(i2s_tdm->regmap, I2S_DMACR, I2S_DMACR_RDL_MASK,
> +			   I2S_DMACR_RDL(16));
> +	regmap_update_bits(i2s_tdm->regmap, I2S_CKR, I2S_CKR_TRCM_MASK,
> +			   i2s_tdm->clk_trcm << I2S_CKR_TRCM_SHIFT);
> +
> +	if (i2s_tdm->soc_data && i2s_tdm->soc_data->init)
> +		i2s_tdm->soc_data->init(&pdev->dev, res->start);
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &rockchip_i2s_tdm_component,
> +					      &i2s_tdm_dai, 1);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not register DAI\n");
> +		goto err_suspend;
> +	}
> +
> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not register PCM\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +
> +err_suspend:
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		i2s_tdm_runtime_suspend(&pdev->dev);

why is this necessary?

> +err_pm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
> +{
> +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		i2s_tdm_runtime_suspend(&pdev->dev);

this looks backwards, if you disable pm_runtime first what is the
expectation for the rest.
> +
> +	if (!IS_ERR(i2s_tdm->mclk_tx))
> +		clk_prepare_enable(i2s_tdm->mclk_tx);
> +	if (!IS_ERR(i2s_tdm->mclk_rx))
> +		clk_prepare_enable(i2s_tdm->mclk_rx);
> +	if (!IS_ERR(i2s_tdm->hclk))
> +		clk_disable_unprepare(i2s_tdm->hclk);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP

use __maybe_unused

> +static int rockchip_i2s_tdm_suspend(struct device *dev)
> +{
> +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
> +
> +	regcache_mark_dirty(i2s_tdm->regmap);
> +
> +	return 0;
> +}
> +
> +static int rockchip_i2s_tdm_resume(struct device *dev)
> +{
> +	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		return ret;
> +	ret = regcache_sync(i2s_tdm->regmap);
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +#endif
