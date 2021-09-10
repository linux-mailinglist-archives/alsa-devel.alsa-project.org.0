Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C2C40703B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 19:06:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5A79169F;
	Fri, 10 Sep 2021 19:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5A79169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631293602;
	bh=knblnjHSIamk4IC2iKeEuVPIgyXOD3THQPgCJcoqZ1Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tA+lqWGRzLi6nAkFKnsrhSDPpIWOOnkp2B9+9lYhrFhIxhY5XrCABeiTwrvx0zXj5
	 PxCFplIOmRXoiSJJ0GQ219XApai/7fEhHUsfAWw9coViqPz597EnkHgmzmX+w0b7xC
	 T+Y4JJjjNgu63a97BYvQ//O74emjXMZHwGf8yDi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2689FF8049C;
	Fri, 10 Sep 2021 19:05:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB4BF8049C; Fri, 10 Sep 2021 19:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 869D9F80143
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 19:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 869D9F80143
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="306688757"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="306688757"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 10:05:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="467201285"
Received: from teurias-mobl1.amr.corp.intel.com (HELO [10.213.178.39])
 ([10.213.178.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 10:05:11 -0700
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: add machine driver with
 mt6359, rt1011 and rt5682
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20210910104405.11420-1-trevor.wu@mediatek.com>
 <20210910104405.11420-2-trevor.wu@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <10fc49fa-9791-0225-365d-e3074680596c@linux.intel.com>
Date: Fri, 10 Sep 2021 11:47:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910104405.11420-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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


> +static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_card *card = rtd->card;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	unsigned int rate = params_rate(params);
> +	unsigned int mclk_fs_ratio = 128;
> +	unsigned int mclk_fs = rate * mclk_fs_ratio;
> +	int bitwidth;
> +	int ret;
> +
> +	bitwidth = snd_pcm_format_width(params_format(params));
> +	if (bitwidth < 0) {
> +		dev_err(card->dev, "invalid bit width: %d\n", bitwidth);
> +		return bitwidth;
> +	}
> +
> +	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x00, 0x0, 0x2, bitwidth);
> +	if (ret) {
> +		dev_err(card->dev, "failed to set tdm slot\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL1,
> +				  RT5682_PLL1_S_BCLK1,
> +				  params_rate(params) * 64,
> +				  params_rate(params) * 512);
> +	if (ret) {
> +		dev_err(card->dev, "failed to set pll\n");
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai,
> +				     RT5682_SCLK_S_PLL1,
> +				     params_rate(params) * 512,
> +				     SND_SOC_CLOCK_IN);
> +	if (ret) {
> +		dev_err(card->dev, "failed to set sysclk\n");
> +		return ret;
> +	}
> +
> +	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);

If you are using params_rate(params) x factor, then it'd be more
consistent to use:

return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 128,
SND_SOC_CLOCK_OUT);


> +static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_component *cmpnt_afe =
> +		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct snd_soc_component *cmpnt_codec =
> +		asoc_rtd_to_codec(rtd, 0)->component;
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
> +	struct mt8195_afe_private *afe_priv = afe->platform_priv;
> +	struct mtkaif_param *param = &afe_priv->mtkaif_params;
> +	int phase;
> +	unsigned int monitor;
> +	int mtkaif_calibration_num_phase;
> +	int test_done_1, test_done_2, test_done_3;
> +	int cycle_1, cycle_2, cycle_3;
> +	int prev_cycle_1, prev_cycle_2, prev_cycle_3;
> +	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
> +	int counter;
> +	bool mtkaif_calibration_ok;
> +	int mtkaif_chosen_phase[MT8195_MTKAIF_MISO_NUM];
> +	int mtkaif_phase_cycle[MT8195_MTKAIF_MISO_NUM];
> +	int i;

reverse x-mas style with longer declarations first?

> +
> +	dev_info(afe->dev, "%s(), start\n", __func__);

dev_dbg

> +
> +	param->mtkaif_calibration_ok = false;
> +	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++) {
> +		param->mtkaif_chosen_phase[i] = -1;
> +		param->mtkaif_phase_cycle[i] = 0;
> +		mtkaif_chosen_phase[i] = -1;
> +		mtkaif_phase_cycle[i] = 0;
> +	}
> +
> +	if (IS_ERR(afe_priv->topckgen)) {
> +		dev_info(afe->dev, "%s() Cannot find topckgen controller\n",
> +			 __func__);
> +		return 0;

is this not an error? Why not dev_err() and return -EINVAL or something?

> +	}
> +
> +	pm_runtime_get_sync(afe->dev);

test if this worked?

> +	mt6359_mtkaif_calibration_enable(cmpnt_codec);
> +
> +	/* set test type to synchronizer pulse */
> +	regmap_update_bits(afe_priv->topckgen,
> +			   CKSYS_AUD_TOP_CFG, 0xffff, 0x4);
> +	mtkaif_calibration_num_phase = 42;	/* mt6359: 0 ~ 42 */
> +	mtkaif_calibration_ok = true;
> +
> +	for (phase = 0;
> +	     phase <= mtkaif_calibration_num_phase && mtkaif_calibration_ok;
> +	     phase++) {
> +		mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
> +						    phase, phase, phase);
> +
> +		regmap_update_bits(afe_priv->topckgen,
> +				   CKSYS_AUD_TOP_CFG, 0x1, 0x1);
> +
> +		test_done_1 = 0;
> +		test_done_2 = 0;
> +		test_done_3 = 0;
> +		cycle_1 = -1;
> +		cycle_2 = -1;
> +		cycle_3 = -1;
> +		counter = 0;
> +		while (!(test_done_1 & test_done_2 & test_done_3)) {
> +			regmap_read(afe_priv->topckgen,
> +				    CKSYS_AUD_TOP_MON, &monitor);
> +			test_done_1 = (monitor >> 28) & 0x1;
> +			test_done_2 = (monitor >> 29) & 0x1;
> +			test_done_3 = (monitor >> 30) & 0x1;
> +			if (test_done_1 == 1)
> +				cycle_1 = monitor & 0xf;
> +
> +			if (test_done_2 == 1)
> +				cycle_2 = (monitor >> 4) & 0xf;
> +
> +			if (test_done_3 == 1)
> +				cycle_3 = (monitor >> 8) & 0xf;
> +
> +			/* handle if never test done */
> +			if (++counter > 10000) {
> +				dev_info(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, cycle_3 %d, monitor 0x%x\n",
> +					 __func__,
> +					 cycle_1, cycle_2, cycle_3, monitor);
> +				mtkaif_calibration_ok = false;
> +				break;
> +			}
> +		}
> +
> +		if (phase == 0) {
> +			prev_cycle_1 = cycle_1;
> +			prev_cycle_2 = cycle_2;
> +			prev_cycle_3 = cycle_3;
> +		}
> +
> +		if (cycle_1 != prev_cycle_1 &&
> +		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
> +			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = phase - 1;
> +			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_0] = prev_cycle_1;
> +		}
> +
> +		if (cycle_2 != prev_cycle_2 &&
> +		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
> +			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = phase - 1;
> +			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_1] = prev_cycle_2;
> +		}
> +
> +		if (cycle_3 != prev_cycle_3 &&
> +		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
> +			mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = phase - 1;
> +			mtkaif_phase_cycle[MT8195_MTKAIF_MISO_2] = prev_cycle_3;
> +		}
> +
> +		regmap_update_bits(afe_priv->topckgen,
> +				   CKSYS_AUD_TOP_CFG, 0x1, 0x0);
> +
> +		if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] >= 0 &&
> +		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] >= 0 &&
> +		    mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] >= 0)
> +			break;
> +	}
> +
> +	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] < 0) {
> +		mtkaif_calibration_ok = false;
> +		chosen_phase_1 = 0;
> +	} else {
> +		chosen_phase_1 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0];
> +	}
> +
> +	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] < 0) {
> +		mtkaif_calibration_ok = false;
> +		chosen_phase_2 = 0;
> +	} else {
> +		chosen_phase_2 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1];
> +	}
> +
> +	if (mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] < 0) {
> +		mtkaif_calibration_ok = false;
> +		chosen_phase_3 = 0;
> +	} else {
> +		chosen_phase_3 = mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2];
> +	}
> +
> +	mt6359_set_mtkaif_calibration_phase(cmpnt_codec,
> +					    chosen_phase_1,
> +					    chosen_phase_2,
> +					    chosen_phase_3);
> +
> +	mt6359_mtkaif_calibration_disable(cmpnt_codec);
> +	pm_runtime_put(afe->dev);
> +
> +	param->mtkaif_calibration_ok = mtkaif_calibration_ok;
> +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_0] = chosen_phase_1;
> +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_1] = chosen_phase_2;
> +	param->mtkaif_chosen_phase[MT8195_MTKAIF_MISO_2] = chosen_phase_3;
> +	for (i = 0; i < MT8195_MTKAIF_MISO_NUM; i++)
> +		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
> +
> +	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
> +		 __func__, param->mtkaif_calibration_ok);

dev_dbg?

> +
> +	return 0;
> +}
> +

> +static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
> +{
> +	static const unsigned int rates[] = {
> +		48000
> +	};
> +	static const unsigned int channels[] = {
> +		2, 4, 6, 8
> +	};
> +	static const struct snd_pcm_hw_constraint_list constraints_rates = {
> +		.count = ARRAY_SIZE(rates),
> +		.list  = rates,
> +		.mask = 0,
> +	};
> +	static const struct snd_pcm_hw_constraint_list constraints_channels = {
> +		.count = ARRAY_SIZE(channels),
> +		.list  = channels,
> +		.mask = 0,
> +	};

you use the same const tables several times, move to a higher scope and
reuse?

> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	int ret;
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_RATE,
> +					 &constraints_rates);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
> +		return ret;
> +	}
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_CHANNELS,
> +					 &constraints_channels);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
> +	.startup = mt8195_hdmitx_dptx_startup,
> +};
> +
> +static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	unsigned int rate = params_rate(params);
> +	unsigned int mclk_fs_ratio = 256;
> +	unsigned int mclk_fs = rate * mclk_fs_ratio;
> +
> +	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs,
> +				      SND_SOC_CLOCK_OUT);

return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
SND_SOC_CLOCK_OUT);
?


> +static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
> +		snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_component *cmpnt_codec =
> +		asoc_rtd_to_codec(rtd, 0)->component;
> +	int ret = 0;

unnecessary init

> +	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
> +				    &priv->dp_jack, NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	return snd_soc_component_set_jack(cmpnt_codec, &priv->dp_jack, NULL);
> +}
> +
> +static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
> +		snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_component *cmpnt_codec =
> +		asoc_rtd_to_codec(rtd, 0)->component;
> +	int ret = 0;

unnecessary init

> +	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
> +				    &priv->hdmi_jack, NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
> +}
> +
> +static int mt8195_hdmitx_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
> +					      struct snd_pcm_hw_params *params)
> +

spurious line?

> +{
> +	/* fix BE i2s format to 32bit, clean param mask first */
> +	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
> +			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
> +
> +	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
> +
> +	return 0;
> +}
> +
> +static int mt8195_playback_startup(struct snd_pcm_substream *substream)
> +{
> +	static const unsigned int rates[] = {
> +		48000
> +	};
> +	static const unsigned int channels[] = {
> +		2
> +	};
> +	static const struct snd_pcm_hw_constraint_list constraints_rates = {
> +		.count = ARRAY_SIZE(rates),
> +		.list  = rates,
> +		.mask = 0,
> +	};
> +	static const struct snd_pcm_hw_constraint_list constraints_channels = {
> +		.count = ARRAY_SIZE(channels),
> +		.list  = channels,
> +		.mask = 0,
> +	};

actually now I realize it's only the number of channels that differs...

> +
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	int ret;
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_RATE,
> +					 &constraints_rates);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
> +		return ret;
> +	}
> +
> +	ret = snd_pcm_hw_constraint_list(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_CHANNELS,
> +					 &constraints_channels);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}

> +static struct snd_soc_dai_link mt8195_mt6359_rt1011_rt5682_dai_links[] = {
> +	/* FE */
> +	[DAI_LINK_DL2_FE] = {
> +		.name = "DL2_FE",
> +		.stream_name = "DL2 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST,
> +		},
> +		.dynamic = 1,
> +		.dpcm_playback = 1,
> +		.ops = &mt8195_playback_ops,
> +		SND_SOC_DAILINK_REG(DL2_FE),
> +	},
> +	[DAI_LINK_DL3_FE] = {
> +		.name = "DL3_FE",
> +		.stream_name = "DL3 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST,
> +		},
> +		.dynamic = 1,
> +		.dpcm_playback = 1,
> +		.ops = &mt8195_playback_ops,
> +		SND_SOC_DAILINK_REG(DL3_FE),
> +	},
> +	[DAI_LINK_DL6_FE] = {
> +		.name = "DL6_FE",
> +		.stream_name = "DL6 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST,
> +		},
> +		.dynamic = 1,
> +		.dpcm_playback = 1,
> +		.ops = &mt8195_playback_ops,
> +		SND_SOC_DAILINK_REG(DL6_FE),
> +	},
> +	[DAI_LINK_DL7_FE] = {
> +		.name = "DL7_FE",
> +		.stream_name = "DL7 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_PRE,
> +			SND_SOC_DPCM_TRIGGER_PRE,
> +		},

this is interesting, is it intentional that the trigger order is
different from all FEs?

> +		.dynamic = 1,
> +		.dpcm_playback = 1,

also no .ops?

> +		SND_SOC_DAILINK_REG(DL7_FE),
> +	},
> +	[DAI_LINK_DL8_FE] = {
> +		.name = "DL8_FE",
> +		.stream_name = "DL8 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST,
> +		},
> +		.dynamic = 1,
> +		.dpcm_playback = 1,
> +		.ops = &mt8195_playback_ops,
> +		SND_SOC_DAILINK_REG(DL8_FE),
> +	},
> +	[DAI_LINK_DL10_FE] = {
> +		.name = "DL10_FE",
> +		.stream_name = "DL10 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST,
> +		},
> +		.dynamic = 1,
> +		.dpcm_playback = 1,
> +		.ops = &mt8195_hdmitx_dptx_playback_ops,
> +		SND_SOC_DAILINK_REG(DL10_FE),
> +	},
> +	[DAI_LINK_DL11_FE] = {
> +		.name = "DL11_FE",
> +		.stream_name = "DL11 Playback",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_POST,
> +			SND_SOC_DPCM_TRIGGER_POST,
> +		},
> +		.dynamic = 1,
> +		.dpcm_playback = 1,
> +		.ops = &mt8195_playback_ops,
> +		SND_SOC_DAILINK_REG(DL11_FE),
> +	},
> +	[DAI_LINK_UL1_FE] = {
> +		.name = "UL1_FE",
> +		.stream_name = "UL1 Capture",
> +		.trigger = {
> +			SND_SOC_DPCM_TRIGGER_PRE,
> +			SND_SOC_DPCM_TRIGGER_PRE,

and again here, why PRE and no ops?

> +static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = &mt8195_mt6359_rt1011_rt5682_soc_card;
> +	struct device_node *platform_node;
> +	struct snd_soc_dai_link *dai_link;
> +	struct mt8195_mt6359_rt1011_rt5682_priv *priv = NULL;

initialization is not necessary

> +	int ret, i;
> +
> +	card->dev = &pdev->dev;
> +
> +	platform_node = of_parse_phandle(pdev->dev.of_node,
> +					 "mediatek,platform", 0);
> +	if (!platform_node) {
> +		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (!dai_link->platforms->name)
> +			dai_link->platforms->of_node = platform_node;
> +
> +		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
> +			dai_link->codecs->of_node =
> +				of_parse_phandle(pdev->dev.of_node,
> +						 "mediatek,dptx-codec", 0);
> +			if (!dai_link->codecs->of_node) {
> +				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
> +			} else {
> +				dai_link->codecs->name = NULL;
> +				dai_link->codecs->dai_name = "i2s-hifi";
> +				dai_link->init = mt8195_dptx_codec_init;
> +			}
> +		}
> +
> +		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
> +			dai_link->codecs->of_node =
> +				of_parse_phandle(pdev->dev.of_node,
> +						 "mediatek,hdmi-codec", 0);
> +			if (!dai_link->codecs->of_node) {
> +				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
> +			} else {
> +				dai_link->codecs->name = NULL;
> +				dai_link->codecs->dai_name = "i2s-hifi";
> +				dai_link->init = mt8195_hdmi_codec_init;
> +			}
> +		}
> +	}
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	snd_soc_card_set_drvdata(card, priv);
> +
> +	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret)
> +		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
> +			__func__, ret);
> +	return ret;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id mt8195_mt6359_rt1011_rt5682_dt_match[] = {
> +	{.compatible = "mediatek,mt8195_mt6359_rt1011_rt5682",},
> +	{}
> +};
> +#endif
> +
> +static const struct dev_pm_ops mt8195_mt6359_rt1011_rt5682_pm_ops = {
> +	.poweroff = snd_soc_poweroff,
> +	.restore = snd_soc_resume,
> +};
> +
> +static struct platform_driver mt8195_mt6359_rt1011_rt5682_driver = {
> +	.driver = {
> +		.name = "mt8195_mt6359_rt1011_rt5682",
> +#ifdef CONFIG_OF
> +		.of_match_table = mt8195_mt6359_rt1011_rt5682_dt_match,
> +#endif
> +		.pm = &mt8195_mt6359_rt1011_rt5682_pm_ops,
> +	},
> +	.probe = mt8195_mt6359_rt1011_rt5682_dev_probe,
> +};
> +
> +module_platform_driver(mt8195_mt6359_rt1011_rt5682_driver);
> +
> +/* Module information */
> +MODULE_DESCRIPTION("MT8195-MT6359-RT1011-RT5682 ALSA SoC machine driver");
> +MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
> +MODULE_LICENSE("GPL v2");

"GPL" is enough

> +MODULE_ALIAS("mt8195_mt6359_rt1011_rt5682 soc card");
> 
