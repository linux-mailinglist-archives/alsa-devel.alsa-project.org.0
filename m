Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB853D6A17
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 01:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2111AF5;
	Tue, 27 Jul 2021 01:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2111AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627341381;
	bh=1WQlXz+YVjvaueOaaQdzDVCRtVWgHq5c09qX4KASeog=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0dJGOQ8uodXg9WhGKMzfTfGpZbMlyhF94b3l7YTSR5gffwVBAM/9uvxdqhw7SX5H
	 ry6osu/iXxzOpC4prN2CRiyqTyxJcy/ZpxBNpkOMMrsf72ClQnkvAu/6sF3uTvXNKh
	 gblE6nne7WO/LpHnC2v6c2RSvAgronfKPPqM6l+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34748F8025E;
	Tue, 27 Jul 2021 01:14:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 065AAF8025A; Tue, 27 Jul 2021 01:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2488DF80130
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 01:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2488DF80130
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192609781"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="192609781"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 16:14:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="579923614"
Received: from tskelley-mobl.amr.corp.intel.com (HELO [10.212.14.236])
 ([10.212.14.236])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 16:14:44 -0700
Subject: Re: [PATCH v4 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: David Rhodes <drhodes@opensource.cirrus.com>, broonie@kernel.org,
 robh@kernel.org, ckeepax@opensource.cirrus.com, brian.austin@cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
References: <20210726223438.1464333-1-drhodes@opensource.cirrus.com>
 <20210726223438.1464333-2-drhodes@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b6fd6522-3639-4452-1d8a-dc1b308cc846@linux.intel.com>
Date: Mon, 26 Jul 2021 18:14:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726223438.1464333-2-drhodes@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Couple of nit-picks and one issue with error handling, see below.

> +static int cs35l41_otp_unpack(void *data)
> +{
> +	struct cs35l41_private *cs35l41 = data;
> +	u32 *otp_mem = NULL;

initialization is not necessary? Even a static analyzer would not
complain here, would it?

> +	int i;
> +	int bit_offset, word_offset;
> +	unsigned int bit_sum = 8;
> +	u32 otp_val, otp_id_reg;
> +	const struct cs35l41_otp_map_element_t *otp_map_match = NULL;

same, this is directly assigned below.

> +	const struct cs35l41_otp_packed_element_t *otp_map = NULL;

same, you assign it with

otp_map = otp_map_match->map;

> +	unsigned int orig_spi_freq;
> +	int ret;
> +
> +	otp_mem = kmalloc_array(CS35L41_OTP_SIZE_WORDS, sizeof(*otp_mem),
> +							GFP_KERNEL);
> +	if (!otp_mem)
> +		return -ENOMEM;
> +
> +	ret = regmap_read(cs35l41->regmap, CS35L41_OTPID, &otp_id_reg);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Read OTP ID failed\n");
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +
> +	otp_map_match = cs35l41_find_otp_map(otp_id_reg);
> +
> +	if (otp_map_match == NULL) {

if (!otp_map_match)

> +		dev_err(cs35l41->dev, "OTP Map matching ID %d not found\n",
> +				otp_id_reg);
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +
> +	if (cs35l41->otp_setup)
> +		cs35l41->otp_setup(cs35l41, true, &orig_spi_freq);
> +
> +	ret = regmap_bulk_read(cs35l41->regmap, CS35L41_OTP_MEM0, otp_mem,
> +						CS35L41_OTP_SIZE_WORDS);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Read OTP Mem failed\n");
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +
> +	if (cs35l41->otp_setup)
> +		cs35l41->otp_setup(cs35l41, false, &orig_spi_freq);
> +
> +	otp_map = otp_map_match->map;
> +
> +	bit_offset = otp_map_match->bit_offset;
> +	word_offset = otp_map_match->word_offset;
> +
> +	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000055);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Write Unlock key failed 1/2\n");
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000AA);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Write Unlock key failed 2/2\n");
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +
> +	for (i = 0; i < otp_map_match->num_elements; i++) {
> +		dev_dbg(cs35l41->dev,
> +			   "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
> +					 bit_offset, word_offset, bit_sum % 32);
> +		if (bit_offset + otp_map[i].size - 1 >= 32) {
> +			otp_val = (otp_mem[word_offset] &
> +					GENMASK(31, bit_offset)) >>
> +					bit_offset;
> +			otp_val |= (otp_mem[++word_offset] &
> +					GENMASK(bit_offset +
> +						otp_map[i].size - 33, 0)) <<
> +					(32 - bit_offset);
> +			bit_offset += otp_map[i].size - 32;
> +		} else {
> +
> +			otp_val = (otp_mem[word_offset] &
> +				GENMASK(bit_offset + otp_map[i].size - 1,
> +					bit_offset)) >>	bit_offset;
> +			bit_offset += otp_map[i].size;
> +		}
> +		bit_sum += otp_map[i].size;
> +
> +		if (bit_offset == 32) {
> +			bit_offset = 0;
> +			word_offset++;
> +		}
> +
> +		if (otp_map[i].reg != 0) {
> +			ret = regmap_update_bits(cs35l41->regmap,
> +						otp_map[i].reg,
> +						GENMASK(otp_map[i].shift +
> +							otp_map[i].size - 1,
> +						otp_map[i].shift),
> +						otp_val << otp_map[i].shift);
> +			if (ret < 0) {
> +				dev_err(cs35l41->dev, "Write OTP val failed\n");
> +				ret = -EINVAL;
> +				goto err_otp_unpack;
> +			}
> +		}
> +	}
> +
> +	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000CC);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Write Lock key failed 1/2\n");
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000033);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Write Lock key failed 2/2\n");
> +		ret = -EINVAL;
> +		goto err_otp_unpack;
> +	}
> +	ret = 0;
> +
> +err_otp_unpack:
> +	kfree(otp_mem);
> +	return ret;
> +}

> +static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
> +		struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct cs35l41_private *cs35l41 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +	int i;
> +	bool pdn;
> +	unsigned int val;

reverse x-mas tree style for declarations?

[...]

> +static int cs35l41_pcm_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct cs35l41_private *cs35l41 =
> +			snd_soc_component_get_drvdata(dai->component);
> +	int i;
> +	unsigned int rate = params_rate(params);
> +	u8 asp_wl;

reverse xmas-tree, move 'int i' to last line of declaration block?

> +	for (i = 0; i < ARRAY_SIZE(cs35l41_fs_rates); i++) {
> +		if (rate == cs35l41_fs_rates[i].rate)
> +			break;
> +	}
> +
> +	if (i >= ARRAY_SIZE(cs35l41_fs_rates)) {
> +		dev_err(cs35l41->dev, "%s: Unsupported rate: %u\n",
> +						__func__, rate);
> +		return -EINVAL;
> +	}
> +
> +	asp_wl = params_width(params);
> +
> +	if (i < ARRAY_SIZE(cs35l41_fs_rates))
> +		regmap_update_bits(cs35l41->regmap, CS35L41_GLOBAL_CLK_CTRL,
> +			CS35L41_GLOBAL_FS_MASK,
> +			cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
> +				CS35L41_ASP_WIDTH_RX_MASK,
> +				asp_wl << CS35L41_ASP_WIDTH_RX_SHIFT);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_SP_RX_WL,
> +				CS35L41_ASP_RX_WL_MASK,
> +				asp_wl << CS35L41_ASP_RX_WL_SHIFT);
> +		if (cs35l41->i2s_mode) {
> +			regmap_update_bits(cs35l41->regmap,
> +					CS35L41_SP_FRAME_RX_SLOT,
> +					CS35L41_ASP_RX1_SLOT_MASK,
> +					((cs35l41->pdata.right_channel) ? 1 : 0)
> +					 << CS35L41_ASP_RX1_SLOT_SHIFT);
> +			regmap_update_bits(cs35l41->regmap,
> +					CS35L41_SP_FRAME_RX_SLOT,
> +					CS35L41_ASP_RX2_SLOT_MASK,
> +					((cs35l41->pdata.right_channel) ? 0 : 1)
> +					 << CS35L41_ASP_RX2_SLOT_SHIFT);
> +		}
> +	} else {
> +		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
> +				CS35L41_ASP_WIDTH_TX_MASK,
> +				asp_wl << CS35L41_ASP_WIDTH_TX_SHIFT);
> +		regmap_update_bits(cs35l41->regmap, CS35L41_SP_TX_WL,
> +				CS35L41_ASP_TX_WL_MASK,
> +				asp_wl << CS35L41_ASP_TX_WL_SHIFT);
> +	}
> +
> +	return 0;
> +}
> +

> +static int cs35l41_boost_config(struct cs35l41_private *cs35l41,
> +		int boost_ind, int boost_cap, int boost_ipk)
> +{
> +	int ret;

move this last?

> +	unsigned char bst_lbst_val, bst_cbst_range, bst_ipk_scaled;
> +	struct regmap *regmap = cs35l41->regmap;
> +	struct device *dev = cs35l41->dev;
> +
> +	switch (boost_ind) {
> +	case 1000:	/* 1.0 uH */
> +		bst_lbst_val = 0;
> +		break;
> +	case 1200:	/* 1.2 uH */
> +		bst_lbst_val = 1;
> +		break;
> +	case 1500:	/* 1.5 uH */
> +		bst_lbst_val = 2;
> +		break;
> +	case 2200:	/* 2.2 uH */
> +		bst_lbst_val = 3;
> +		break;
> +	default:
> +		dev_err(dev, "Invalid boost inductor value: %d nH\n",
> +				boost_ind);
> +		return -EINVAL;
> +	}
> +
> +	switch (boost_cap) {
> +	case 0 ... 19:
> +		bst_cbst_range = 0;
> +		break;
> +	case 20 ... 50:
> +		bst_cbst_range = 1;
> +		break;
> +	case 51 ... 100:
> +		bst_cbst_range = 2;
> +		break;
> +	case 101 ... 200:
> +		bst_cbst_range = 3;
> +		break;
> +	default:	/* 201 uF and greater */
> +		bst_cbst_range = 4;
> +	}
> +
> +	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
> +			CS35L41_BST_K1_MASK,
> +			cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
> +				<< CS35L41_BST_K1_SHIFT);
> +	if (ret) {
> +		dev_err(dev, "Failed to write boost K1 coefficient\n");
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
> +			CS35L41_BST_K2_MASK,
> +			cs35l41_bst_k2_table[bst_lbst_val][bst_cbst_range]
> +				<< CS35L41_BST_K2_SHIFT);
> +	if (ret) {
> +		dev_err(dev, "Failed to write boost K2 coefficient\n");
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
> +			CS35L41_BST_SLOPE_MASK,
> +			cs35l41_bst_slope_table[bst_lbst_val]
> +				<< CS35L41_BST_SLOPE_SHIFT);
> +	if (ret) {
> +		dev_err(dev, "Failed to write boost slope coefficient\n");
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
> +			CS35L41_BST_LBST_VAL_MASK,
> +			bst_lbst_val << CS35L41_BST_LBST_VAL_SHIFT);
> +	if (ret) {
> +		dev_err(dev, "Failed to write boost inductor value\n");
> +		return ret;
> +	}
> +
> +	if ((boost_ipk < 1600) || (boost_ipk > 4500)) {
> +		dev_err(dev, "Invalid boost inductor peak current: %d mA\n",
> +				boost_ipk);
> +		return -EINVAL;
> +	}
> +	bst_ipk_scaled = ((boost_ipk - 1600) / 50) + 0x10;
> +
> +	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_PEAK_CUR,
> +			CS35L41_BST_IPK_MASK,
> +			bst_ipk_scaled << CS35L41_BST_IPK_SHIFT);
> +	if (ret) {
> +		dev_err(dev, "Failed to write boost inductor peak current\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +

> +int cs35l41_probe(struct cs35l41_private *cs35l41,
> +				struct cs35l41_platform_data *pdata)
> +{
> +	int ret;
> +	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
> +	int timeout;
> +	int irq_pol = 0;
> +
> +
> +	for (i = 0; i < CS35L41_NUM_SUPPLIES; i++)
> +		cs35l41->supplies[i].supply = cs35l41_supplies[i];
> +
> +	ret = devm_regulator_bulk_get(cs35l41->dev, CS35L41_NUM_SUPPLIES,
> +					cs35l41->supplies);
> +	if (ret != 0) {
> +		dev_err(cs35l41->dev,
> +			"Failed to request core supplies: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	if (pdata) {
> +		cs35l41->pdata = *pdata;
> +	} else {
> +		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata,
> +					     cs35l41);
> +		if (ret != 0) {
> +			ret = -ENODEV;
> +			goto err;

so here you will disable regulators that have not been enabled, is it
intentional?

mixing gotos and returns is confusing...

and in addition you will set the reset_gpio that you only get a couple
of lines below, that will be a page fault?

> +		}
> +	}
> +
> +	ret = regulator_bulk_enable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
> +	if (ret != 0) {
> +		dev_err(cs35l41->dev,
> +			"Failed to enable core supplies: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* returning NULL can be an option if in stereo mode */
> +	cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset",
> +							GPIOD_OUT_LOW);
> +	if (IS_ERR(cs35l41->reset_gpio)) {
> +		ret = PTR_ERR(cs35l41->reset_gpio);
> +		cs35l41->reset_gpio = NULL;
> +		if (ret == -EBUSY) {
> +			dev_info(cs35l41->dev,
> +				 "Reset line busy, assuming shared reset\n");
> +		} else {
> +			dev_err(cs35l41->dev,
> +				"Failed to get reset GPIO: %d\n", ret);
> +			goto err;
> +		}
> +	}
> +	if (cs35l41->reset_gpio) {
> +		/* satisfy minimum reset pulse width spec */
> +		usleep_range(2000, 2100);
> +		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
> +	}
> +
> +	usleep_range(2000, 2100);
> +
> +	timeout = 100;
> +	do {
> +		if (timeout == 0) {
> +			dev_err(cs35l41->dev,
> +				"Timeout waiting for OTP_BOOT_DONE\n");
> +			ret = -EBUSY;
> +			goto err;
> +		}
> +		usleep_range(1000, 1100);
> +		regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS4, &int_status);
> +		timeout--;
> +	} while (!(int_status & CS35L41_OTP_BOOT_DONE));
> +
> +	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
> +	if (int_status & CS35L41_OTP_BOOT_ERR) {
> +		dev_err(cs35l41->dev, "OTP Boot error\n");
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Get Device ID failed\n");
> +		goto err;
> +	}
> +
> +	ret = regmap_read(cs35l41->regmap, CS35L41_REVID, &reg_revid);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Get Revision ID failed\n");
> +		goto err;
> +	}
> +
> +	mtl_revid = reg_revid & CS35L41_MTLREVID_MASK;
> +
> +	/* CS35L41 will have even MTLREVID
> +	 * CS35L41R will have odd MTLREVID
> +	 */
> +	chipid_match = (mtl_revid % 2) ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
> +	if (regid != chipid_match) {
> +		dev_err(cs35l41->dev, "CS35L41 Device ID (%X). Expected ID %X\n",
> +			regid, chipid_match);
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	switch (reg_revid) {
> +	case CS35L41_REVID_A0:
> +		ret = regmap_register_patch(cs35l41->regmap,
> +				cs35l41_reva0_errata_patch,
> +				ARRAY_SIZE(cs35l41_reva0_errata_patch));
> +		if (ret < 0) {
> +			dev_err(cs35l41->dev,
> +				"Failed to apply A0 errata patch %d\n", ret);
> +			goto err;
> +		}
> +		break;
> +	case CS35L41_REVID_B0:
> +		ret = regmap_register_patch(cs35l41->regmap,
> +				cs35l41_revb0_errata_patch,
> +				ARRAY_SIZE(cs35l41_revb0_errata_patch));
> +		if (ret < 0) {
> +			dev_err(cs35l41->dev,
> +				"Failed to apply B0 errata patch %d\n", ret);
> +			goto err;
> +		}
> +		break;
> +	case CS35L41_REVID_B2:
> +		ret = regmap_register_patch(cs35l41->regmap,
> +				cs35l41_revb2_errata_patch,
> +				ARRAY_SIZE(cs35l41_revb2_errata_patch));
> +		if (ret < 0) {
> +			dev_err(cs35l41->dev,
> +				"Failed to apply B2 errata patch %d\n", ret);
> +			goto err;
> +		}
> +		break;
> +	}
> +
> +	irq_pol = cs35l41_irq_gpio_config(cs35l41);
> +
> +	/* Set interrupt masks for critical errors */
> +	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1,
> +			CS35L41_INT1_MASK_DEFAULT);
> +
> +	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL,
> +			cs35l41_irq, IRQF_ONESHOT | IRQF_SHARED | irq_pol,
> +			"cs35l41", cs35l41);
> +
> +	/* CS35L41 needs INT for PDN_DONE */
> +	if (ret != 0) {
> +		dev_err(cs35l41->dev, "Failed to request IRQ: %d\n", ret);
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	ret = cs35l41_otp_unpack(cs35l41);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "OTP Unpack failed\n");
> +		goto err;
> +	}
> +
> +	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_CCM_CORE_CTRL, 0);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Write CCM_CORE_CTRL failed\n");
> +		goto err;
> +	}
> +
> +	ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
> +				 CS35L41_AMP_EN_MASK, 0);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "Write CS35L41_PWR_CTRL2 failed\n");
> +		goto err;
> +	}
> +
> +	ret = devm_snd_soc_register_component(cs35l41->dev,
> +					&soc_component_dev_cs35l41,
> +					cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "%s: Register codec failed\n", __func__);
> +		goto err;
> +	}
> +
> +	ret = cs35l41_set_pdata(cs35l41);
> +	if (ret < 0) {
> +		dev_err(cs35l41->dev, "%s: Set pdata failed\n", __func__);
> +		goto err;
> +	}
> +
> +	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n",
> +			regid, reg_revid);
> +
> +	return 0;
> +
> +err:
> +	regulator_bulk_disable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
> +	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
> +	return ret;
> +}
> +
> +int cs35l41_remove(struct cs35l41_private *cs35l41)
> +{
> +	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
> +	regulator_bulk_disable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
> +	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
> +	return 0;
> +}
> +
>
