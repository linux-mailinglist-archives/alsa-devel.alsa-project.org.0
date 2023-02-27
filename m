Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498426A46E6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 17:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE47208;
	Mon, 27 Feb 2023 17:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE47208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677514975;
	bh=Tt+w9zZB98pZNoeXk4gxA+FgjI7jMm+u8zdqt3fZ/wQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GRiWdtbMhNrV9ja19Hpkiy8XNb63LEHYEtcO0b8w/yJMC0W7/LMUXNZUbeQ56lazJ
	 ErMPgiMq6Nqc3u+i3vk17WqYmkgQsjXLK4hTRofdnW6ok2RykirAjDW4wqPJJp627p
	 gvZZhEAdTyyAaeFEfbjteYXja+lq8EFYsdQiI0HQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EBA5F802BE;
	Mon, 27 Feb 2023 17:22:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B092F804B1; Mon, 27 Feb 2023 17:22:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25ED0F80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 17:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25ED0F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QaBY9mnz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677514916; x=1709050916;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Tt+w9zZB98pZNoeXk4gxA+FgjI7jMm+u8zdqt3fZ/wQ=;
  b=QaBY9mnzKbbfM/5xKXyufpaGly/7OeOYR2DzkxFllHnDFB+4JPfawpaJ
   Lfzoe5s9S6NLBIOKAERF05PtcYk2h2DEqpCcJ1l2RHFQP4rbeLpVvxw0T
   xwDVs4RmWC1dkugfpiEz6iB87q5tCtWjNJqWqzO2GFS7u1czYm5iYa1W4
   uEc7TEIrZMG9xrbAPytRQiAjUZVw5FFkGVWfiSia2/O7qBG/ECqk7ybqy
   nAK3JjOddDSCXInVvyRViMuVhrkr6EXc/yebNJxtAsoXlQVRkEawvIpQg
   qN5Gx6zCMOdhRvUSBZbz1Js53YS8qHOE1v2biCWW6cBNOu0E2F/mMXXOL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396451395"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="396451395"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 08:21:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673790523"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="673790523"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 08:21:45 -0800
Message-ID: <0fb47fe7-719b-0773-fc14-3d62d7d33619@linux.intel.com>
Date: Mon, 27 Feb 2023 10:17:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ASoC: max98363: add soundwire amplifier driver
Content-Language: en-US
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
References: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JKZ5HFXHJHY7DXXBOCRFCKJWK3F2AAG3
X-Message-ID-Hash: JKZ5HFXHJHY7DXXBOCRFCKJWK3F2AAG3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKZ5HFXHJHY7DXXBOCRFCKJWK3F2AAG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +#include <linux/acpi.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +#include <linux/of.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/regulator/consumer.h>

alphabetical order?

> +#include "max98363.h"
> +
> +struct sdw_stream_data {
> +	struct sdw_stream_runtime *sdw_stream;
> +};

this abstraction isn't needed. We need to remove it for all existing
codec drivers, and for new ones it's better to avoid it.

> +
> +static struct reg_default max98363_reg[] = {
> +	{MAX98363_R0040_SCP_INIT_STAT_1, 0x00},
> +	{MAX98363_R0041_SCP_INIT_MASK_1, 0x00},
> +	{MAX98363_R0042_SCP_INIT_STAT_2, 0x00},
> +	{MAX98363_R0044_SCP_CTRL, 0x00},
> +	{MAX98363_R0045_SCP_SYSTEM_CTRL, 0x00},
> +	{MAX98363_R0046_SCP_DEV_NUMBER, 0x00},
> +	{MAX98363_R004D_SCP_BUS_CLK, 0x00},
> +	{MAX98363_R0050_SCP_DEV_ID_0, 0x21},
> +	{MAX98363_R0051_SCP_DEV_ID_1, 0x01},
> +	{MAX98363_R0052_SCP_DEV_ID_2, 0x9F},
> +	{MAX98363_R0053_SCP_DEV_ID_3, 0x87},
> +	{MAX98363_R0054_SCP_DEV_ID_4, 0x08},
> +	{MAX98363_R0055_SCP_DEV_ID_5, 0x00},

That seems wrong, why would you declare standard registers that are
known to the bus and required to be implemented?

> +	{MAX98363_R0060_SCP_FRAME_CTRL, 0x00},
> +	{MAX98363_R0062_SCP_CLK_SCALE_BANK0, 0x00},
> +	{MAX98363_R0070_SCP_FRAME_CTRL, 0x00},
> +	{MAX98363_R0072_SCP_CLK_SCALE_BANK1, 0x00},
> +	{MAX98363_R0080_SCP_PHYOUTCTRL_0, 0x00},
> +	{MAX98363_R0100_DP1_INIT_STAT, 0x00},
> +	{MAX98363_R0101_DP1_INIT_MASK, 0x00},
> +	{MAX98363_R0102_DP1_PORT_CTRL, 0x00},
> +	{MAX98363_R0103_DP1_BLOCK_CTRL_1, 0x00},
> +	{MAX98363_R0104_DP1_PREPARE_STATUS, 0x00},
> +	{MAX98363_R0105_DP1_PREPARE_CTRL, 0x00},
> +	{MAX98363_R0120_DP1_CHANNEL_EN, 0x00},
> +	{MAX98363_R0122_DP1_SAMPLE_CTRL1, 0x00},
> +	{MAX98363_R0123_DP1_SAMPLE_CTRL2, 0x00},
> +	{MAX98363_R0124_DP1_OFFSET_CTRL1, 0x00},
> +	{MAX98363_R0125_DP1_OFFSET_CTRL2, 0x00},
> +	{MAX98363_R0126_DP1_HCTRL, 0x00},
> +	{MAX98363_R0127_DP1_BLOCK_CTRL3, 0x00},
> +	{MAX98363_R0130_DP1_CHANNEL_EN, 0x00},
> +	{MAX98363_R0132_DP1_SAMPLE_CTRL1, 0x00},
> +	{MAX98363_R0133_DP1_SAMPLE_CTRL2, 0x00},
> +	{MAX98363_R0134_DP1_OFFSET_CTRL1, 0x00},
> +	{MAX98363_R0135_DP1_OFFSET_CTRL2, 0x00},
> +	{MAX98363_R0136_DP1_HCTRL, 0x0136},
> +	{MAX98363_R0137_DP1_BLOCK_CTRL3, 0x00},
> +	{MAX98363_R2001_INTR_RAW, 0x0},
> +	{MAX98363_R2003_INTR_STATE, 0x0},
> +	{MAX98363_R2005_INTR_FALG, 0x0},
> +	{MAX98363_R2007_INTR_EN, 0x0},
> +	{MAX98363_R2009_INTR_CLR, 0x0},
> +	{MAX98363_R2021_ERR_MON_CTRL, 0x0},
> +	{MAX98363_R2022_SPK_MON_THRESH, 0x0},
> +	{MAX98363_R2023_SPK_MON_DURATION, 0x0},
> +	{MAX98363_R2030_TONE_GEN_CFG, 0x0},
> +	{MAX98363_R203F_TONE_GEN_EN, 0x0},
> +	{MAX98363_R2040_AMP_VOL, 0x0},
> +	{MAX98363_R2041_AMP_GAIN, 0x5},
> +	{MAX98363_R2042_DSP_CFG, 0x0},
> +	{MAX98363_R21FF_REV_ID, 0x0},
> +};
> +
> +static bool max98363_readable_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	/* SoundWire Control Port Registers */
> +	case MAX98363_R0040_SCP_INIT_STAT_1 ... MAX98363_R0046_SCP_DEV_NUMBER:
> +	case MAX98363_R004D_SCP_BUS_CLK:
> +	case MAX98363_R0050_SCP_DEV_ID_0 ... MAX98363_R0055_SCP_DEV_ID_5:
> +	case MAX98363_R0062_SCP_CLK_SCALE_BANK0:
> +	case MAX98363_R0072_SCP_CLK_SCALE_BANK1:
> +	case MAX98363_R0080_SCP_PHYOUTCTRL_0:
> +	/* Soundwire Data Port 1 Registers */
> +	case MAX98363_R0100_DP1_INIT_STAT ... MAX98363_R0105_DP1_PREPARE_CTRL:
> +	case MAX98363_R0120_DP1_CHANNEL_EN ... MAX98363_R0127_DP1_BLOCK_CTRL3:
> +	case MAX98363_R0130_DP1_CHANNEL_EN:
> +	case MAX98363_R0132_DP1_SAMPLE_CTRL1... MAX98363_R0137_DP1_BLOCK_CTRL3:
> +	/* MAX98363 Amp Control Registers */
> +	case MAX98363_R2001_INTR_RAW:
> +	case MAX98363_R2003_INTR_STATE:
> +	case MAX98363_R2005_INTR_FALG:
> +	case MAX98363_R2007_INTR_EN:
> +	case MAX98363_R2009_INTR_CLR:
> +	case MAX98363_R2021_ERR_MON_CTRL ... MAX98363_R2023_SPK_MON_DURATION:
> +	case MAX98363_R2030_TONE_GEN_CFG:
> +	case MAX98363_R203F_TONE_GEN_EN:
> +	case MAX98363_R2040_AMP_VOL:
> +	case MAX98363_R2041_AMP_GAIN:
> +	case MAX98363_R2042_DSP_CFG:
> +	case MAX98363_R21FF_REV_ID:
> +		return true;
> +	default:
> +		return false;
> +	}
> +};
> +
> +static bool max98363_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	/* SoundWire Control Port Registers */
> +	case MAX98363_R0040_SCP_INIT_STAT_1 ... MAX98363_R0046_SCP_DEV_NUMBER:
> +	case MAX98363_R004D_SCP_BUS_CLK:
> +	case MAX98363_R0050_SCP_DEV_ID_0 ... MAX98363_R0055_SCP_DEV_ID_5:
> +	case MAX98363_R0062_SCP_CLK_SCALE_BANK0:
> +	case MAX98363_R0072_SCP_CLK_SCALE_BANK1:
> +	case MAX98363_R0080_SCP_PHYOUTCTRL_0:
> +	/* Soundwire Data Port 1 Registers */
> +	case MAX98363_R0100_DP1_INIT_STAT ... MAX98363_R0105_DP1_PREPARE_CTRL:
> +	case MAX98363_R0120_DP1_CHANNEL_EN ... MAX98363_R0127_DP1_BLOCK_CTRL3:
> +	case MAX98363_R0130_DP1_CHANNEL_EN:
> +	case MAX98363_R0132_DP1_SAMPLE_CTRL1... MAX98363_R0137_DP1_BLOCK_CTRL3:
> +	/* MAX98363 Amp Control Registers */
> +	case MAX98363_R2001_INTR_RAW:
> +	case MAX98363_R2003_INTR_STATE:
> +	case MAX98363_R2005_INTR_FALG:
> +	case MAX98363_R2007_INTR_EN:
> +	case MAX98363_R2009_INTR_CLR:
> +	case MAX98363_R21FF_REV_ID:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config max98363_sdw_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.max_register = MAX98363_R21FF_REV_ID,
> +	.reg_defaults  = max98363_reg,
> +	.num_reg_defaults = ARRAY_SIZE(max98363_reg),
> +	.readable_reg = max98363_readable_register,
> +	.volatile_reg = max98363_volatile_reg,

I don't see why the SoundWire standard registers are part of regmap?

> +	.cache_type = REGCACHE_RBTREE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +static __maybe_unused int max98363_suspend(struct device *dev)
> +{
> +	struct max98363_priv *max98363 = dev_get_drvdata(dev);
> +
> +	regcache_cache_only(max98363->regmap, true);
> +	regcache_mark_dirty(max98363->regmap);
> +
> +	if (max98363->dvddio)
> +		regulator_disable(max98363->dvddio);
> +
> +	if (max98363->vdd)
> +		regulator_disable(max98363->vdd);
> +
> +	return 0;
> +}
> +
> +#define MAX98363_PROBE_TIMEOUT 5000
> +
> +static __maybe_unused int max98363_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct max98363_priv *max98363 = dev_get_drvdata(dev);
> +	unsigned long time;
> +	int ret;
> +
> +	if (!max98363->first_hw_init)
> +		return 0;
> +
> +	if (!slave->unattach_request)
> +		goto regmap_sync;
> +
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(MAX98363_PROBE_TIMEOUT));
> +	if (!time) {
> +		dev_err(dev, "Initialization not complete, timed out\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +regmap_sync:
> +
> +	if (max98363->dvddio) {
> +		ret = regulator_enable(max98363->dvddio);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (max98363->vdd) {
> +		ret = regulator_enable(max98363->vdd);
> +		if (ret < 0)
> +			return ret;
> +	}

that is very very odd. It's the first time we see a SoundWire codec
driver that has a power dependency, and it's quite likely that it's too
late to enable power resources *AFTER* dealing with all the
initialization and enumeration.

It's not even clear to me how this device would be enumerated.

You'd need to explain what part of the amplifier is controlled by those
regulator, otherwise it's impossible to review and understand if the
driver does the 'right thing'

> +
> +	slave->unattach_request = 0;
> +	regcache_cache_only(max98363->regmap, false);
> +	regcache_sync(max98363->regmap);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops max98363_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(max98363_suspend, max98363_resume)
> +	SET_RUNTIME_PM_OPS(max98363_suspend, max98363_resume, NULL)
> +};
> +
> +static int max98363_read_prop(struct sdw_slave *slave)
> +{
> +	struct sdw_slave_prop *prop = &slave->prop;
> +	int nval, i;
> +	u32 bit;
> +	unsigned long addr;
> +	struct sdw_dpn_prop *dpn;
> +
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +
> +	/* BITMAP: 00000010  Dataport 1 is active */
> +	prop->sink_ports = BIT(1);
> +	prop->paging_support = true;
> +	prop->clk_stop_timeout = 20;
> +
> +	nval = hweight32(prop->source_ports);

you don't seem to have any source ports, so allocating a zero-size chunk
of data is useless. You can still this entire section, no?

> +	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +					  sizeof(*prop->src_dpn_prop),
> +					  GFP_KERNEL);
> +	if (!prop->src_dpn_prop)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	dpn = prop->src_dpn_prop;
> +	addr = prop->source_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].simple_ch_prep_sm = true;
> +		dpn[i].ch_prep_timeout = 10;
> +		i++;
> +	}
> +
> +	/* do this again for sink now */
> +	nval = hweight32(prop->sink_ports);
> +	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +					   sizeof(*prop->sink_dpn_prop),
> +					   GFP_KERNEL);
> +	if (!prop->sink_dpn_prop)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	dpn = prop->sink_dpn_prop;
> +	addr = prop->sink_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].simple_ch_prep_sm = true;
> +		dpn[i].ch_prep_timeout = 10;
> +		i++;
> +	}
> +
> +	/* set the timeout values */
> +	prop->clk_stop_timeout = 20;
> +	prop->simple_clk_stop_capable = true;
> +	prop->clock_reg_supported = true;
> +
> +	return 0;
> +}
> +
> +static int max98363_io_init(struct sdw_slave *slave)
> +{
> +	struct device *dev = &slave->dev;
> +	struct max98363_priv *max98363 = dev_get_drvdata(dev);
> +	int ret, reg;
> +
> +	if (max98363->first_hw_init) {
> +		regcache_cache_only(max98363->regmap, false);
> +		regcache_cache_bypass(max98363->regmap, true);
> +	}
> +
> +	/*
> +	 * PM runtime is only enabled when a Slave reports as Attached
> +	 */
> +	if (!max98363->first_hw_init) {
> +		/* set autosuspend parameters */
> +		pm_runtime_set_autosuspend_delay(dev, 3000);
> +		pm_runtime_use_autosuspend(dev);
> +
> +		/* update count of parent 'active' children */
> +		pm_runtime_set_active(dev);
> +
> +		/* make sure the device does not suspend immediately */
> +		pm_runtime_mark_last_busy(dev);
> +
> +		pm_runtime_enable(dev);
> +	}
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	ret = regmap_read(max98363->regmap, MAX98363_R21FF_REV_ID, &reg);
> +	if (!ret) {
> +		dev_info(dev, "Revision ID: %X\n", reg);
> +		return ret;
> +	}
> +
> +	if (max98363->first_hw_init) {
> +		regcache_cache_bypass(max98363->regmap, false);
> +		regcache_mark_dirty(max98363->regmap);
> +	}
> +
> +	max98363->first_hw_init = true;
> +	max98363->hw_init = true;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);

so if there isn't a cycle of suspend-resume, how would the regulator
handling work?

Something's really off here.

> +
> +	return 0;
> +}

> +static int max98363_sdw_set_tdm_slot(struct snd_soc_dai *dai,
> +				     unsigned int tx_mask,
> +				     unsigned int rx_mask,
> +				     int slots, int slot_width)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct max98363_priv *max98363 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	/* tx_mask is not supported */
> +	if (tx_mask)
> +		return -EINVAL;
> +
> +	if (!rx_mask && !slots && !slot_width)
> +		max98363->tdm_mode = false;
> +	else
> +		max98363->tdm_mode = true;
> +
> +	max98363->rx_mask = rx_mask;
> +	max98363->slot = slots;
> +
> +	return 0;
> +}

this would not be used for a SoundWire device? Why is this needed?

> +
> +static const struct snd_soc_dai_ops max98363_dai_sdw_ops = {
> +	.hw_params = max98363_sdw_dai_hw_params,
> +	.hw_free = max98363_pcm_hw_free,
> +	.set_stream = max98363_set_sdw_stream,
> +	.shutdown = max98363_shutdown,

I am not clear why there is a .shutdown but no .startup, is this really
needed?

> +	.set_tdm_slot = max98363_sdw_set_tdm_slot,
> +};
> +
> +static struct snd_soc_dai_driver max98363_dai[] = {
> +	{
> +		.name = "max98363-aif1",
> +		.playback = {
> +			.stream_name = "HiFi Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = MAX98363_RATES,
> +			.formats = MAX98363_FORMATS,
> +		},
> +		.ops = &max98363_dai_sdw_ops,
> +	}
> +};
> +
> +static int max98363_update_status(struct sdw_slave *slave,
> +				  enum sdw_slave_status status)
> +{
> +	struct max98363_priv *max98363 = dev_get_drvdata(&slave->dev);
> +
> +	if (status == SDW_SLAVE_UNATTACHED)
> +		max98363->hw_init = false;
> +
> +	/*
> +	 * Perform initialization only if slave status is SDW_SLAVE_ATTACHED
> +	 */
> +	if (max98363->hw_init || status != SDW_SLAVE_ATTACHED)
> +		return 0;
> +
> +	/* perform I/O transfers required for Slave initialization */
> +	return max98363_io_init(slave);
> +}
> +
> +/*
> + * slave_ops: callbacks for get_clock_stop_mode, clock_stop and
> + * port_prep are not defined for now
> + */
> +static struct sdw_slave_ops max98363_slave_ops = {
> +	.read_prop = max98363_read_prop,
> +	.update_status = max98363_update_status,
> +	.bus_config = NULL,

not needed

> +};
> +

> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id max98363_acpi_match[] = {
> +	{ "ADS8363", 0 },

Why is this needed? If this is a SoundWire device, only the _ADR is
used, the HID is irrelevant.

Could this be a left-over from a I2S version?

> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, max98363_acpi_match);
> +#endif
> +
> +static const struct sdw_device_id max98363_id[] = {
> +	SDW_SLAVE_ENTRY(0x019F, 0x8363, 0),
> +	{},
> +};
> +MODULE_DEVICE_TABLE(sdw, max98363_id);
> +
> +static struct sdw_driver max98363_sdw_driver = {
> +	.driver = {
> +		.name = "max98363",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(max98363_of_match),
> +		.acpi_match_table = ACPI_PTR(max98363_acpi_match),

not needed, only the id_table will be used.

> +		.pm = &max98363_pm,
> +	},
> +	.probe = max98363_sdw_probe,
> +	.remove = NULL,

not needed

> +	.ops = &max98363_slave_ops,
> +	.id_table = max98363_id,
> +};
> +
