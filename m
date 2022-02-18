Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C34BBB17
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEB1F1785;
	Fri, 18 Feb 2022 15:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEB1F1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645196166;
	bh=puo/n4BmysyRpl5GEWNmjLuBHZH5TF5qEbN8xSBb3N8=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tA1SVdJYACwWVzkKI56U3ujV8uDnUZm6C7tn7m/ysuFous/jBFA0Irevb3t3cBodl
	 70rtfdZuKvTnDIoyQqzRe4I7RfVJMj6TbH06bY0YnaVI9/f/z/VKoOE4/DaAY/KqW4
	 209wmhwjkWq/KBqfaqMlGuc2uMDKLCvXu+PHIZIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A9DF800FF;
	Fri, 18 Feb 2022 15:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66043F804FE; Fri, 18 Feb 2022 15:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92870F800FF
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 15:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92870F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Gw3SDXzL"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6DEF21F46BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645196060;
 bh=puo/n4BmysyRpl5GEWNmjLuBHZH5TF5qEbN8xSBb3N8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Gw3SDXzLp3GfCSC67Jus523MpAaAsfAqic7tuLRpR9mDoZDfhWOPwAKg75bK+HvTB
 GFkAoAczP45zyzU0n67ZbdnWegZzHl3vY2Kxkd87OJwMSgz2sQWGOPhJ9NMJX1COK/
 pG2U4iH3pL0INZr0xxunWP3flH2Jl8j8ykcA7NsbTGNeIWI9cpKouG7KD5ffNaXbhs
 /PfT3KyXOJMAujmU7+3KU4n6u9G5ZLCqRQpKIszjuwdotOwdPn8qWrNCTDvS4Y+wNz
 umOcR0QLJNlJqhSN1yCoV2CLaKvbU4Zz2Y5mRFEL5NR8lgHfUYJt2Hh3Ho6TQTX0rs
 J8JHNfZtxN2PQ==
Message-ID: <0e633e93-566d-0a91-f5e3-f3e3131fcb43@collabora.com>
Date: Fri, 18 Feb 2022 15:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v2 03/17] ASoC: mediatek: mt8186: support adda in platform driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-4-jiaxin.yu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220217134205.15400-4-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> This patch adds mt8186 adda dai driver
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 891 ++++++++++++++++++++
>   1 file changed, 891 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> new file mode 100644
> index 000000000000..6d7dd1533da0
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> @@ -0,0 +1,891 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// MediaTek ALSA SoC Audio DAI ADDA Control
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +#include <linux/regmap.h>
> +#include <linux/delay.h>
> +#include "mt8186-afe-clk.h"
> +#include "mt8186-afe-common.h"
> +#include "mt8186-afe-gpio.h"
> +#include "mt8186-interconnection.h"
> +

..snip..


> +
> +static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
> +				     struct snd_kcontrol *kcontrol,
> +				     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	int delay_data;
> +	int delay_cycle;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2) {
> +			/* set protocol 2 */
> +			regmap_write(afe->regmap, AFE_ADDA_MTKAIF_CFG0,
> +				     0x00010000);

No leading zeros, please (also, it fits in one line):
			regmap_write(afe->regmap, AFE_ADDA_MTKAIF_CFG0, 0x10000);

> +			/* mtkaif_rxif_clkinv_adc inverse */
> +			regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIF_CFG0,
> +					   MTKAIF_RXIF_CLKINV_ADC_MASK_SFT,
> +					   0x1 << MTKAIF_RXIF_CLKINV_ADC_SFT);

Please use the BIT() macro:
					   BIT(MTKAIF_RXIF_CLKINV_ADC_SFT)

> +
> +			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0) {
> +				if (afe_priv->mtkaif_chosen_phase[0] < 0 &&
> +				    afe_priv->mtkaif_chosen_phase[1] < 0) {
> +					dev_err(afe->dev,
> +						"%s(), calib fail mtkaif_chosen_phase[0/1]:%d/%d\n",
> +						__func__,
> +						afe_priv->mtkaif_chosen_phase[0],
> +						afe_priv->mtkaif_chosen_phase[1]);
> +					break;
> +				}
> +
> +				if (afe_priv->mtkaif_chosen_phase[0] < 0 ||
> +				    afe_priv->mtkaif_chosen_phase[1] < 0) {
> +					dev_err(afe->dev,
> +						"%s(), skip dealy setting mtkaif_chosen_phase[0/1]:%d/%d\n",
> +						__func__,
> +						afe_priv->mtkaif_chosen_phase[0],
> +						afe_priv->mtkaif_chosen_phase[1]);
> +					break;
> +				}
> +			}
> +
> +			/* set delay for ch12 */
> +			if (afe_priv->mtkaif_phase_cycle[0] >=
> +			    afe_priv->mtkaif_phase_cycle[1]) {
> +				delay_data = DELAY_DATA_MISO1;
> +				delay_cycle = afe_priv->mtkaif_phase_cycle[0] -
> +					      afe_priv->mtkaif_phase_cycle[1];
> +			} else {
> +				delay_data = DELAY_DATA_MISO2;
> +				delay_cycle = afe_priv->mtkaif_phase_cycle[1] -
> +					      afe_priv->mtkaif_phase_cycle[0];
> +			}
> +
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_MTKAIF_RX_CFG2,
> +					   MTKAIF_RXIF_DELAY_DATA_MASK_SFT,
> +					   delay_data <<
> +					   MTKAIF_RXIF_DELAY_DATA_SFT);
> +
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_MTKAIF_RX_CFG2,
> +					   MTKAIF_RXIF_DELAY_CYCLE_MASK_SFT,
> +					   delay_cycle <<
> +					   MTKAIF_RXIF_DELAY_CYCLE_SFT);
> +
> +		} else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2) {
> +			regmap_write(afe->regmap, AFE_ADDA_MTKAIF_CFG0,
> +				     0x00010000);

No leading zeroes, please.

> +		} else {
> +			regmap_write(afe->regmap, AFE_ADDA_MTKAIF_CFG0, 0x0);

0x0 -> 0

> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol,
> +			     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +
> +	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
> +		__func__, w->name, event);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		mt8186_afe_gpio_request(afe->dev, true, MT8186_DAI_ADDA, 0);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
> +		usleep_range(125, 135);
> +		mt8186_afe_gpio_request(afe->dev, false, MT8186_DAI_ADDA, 0);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mt8186_adda_dmic_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +
> +	ucontrol->value.integer.value[0] = afe_priv->mtkaif_dmic;
> +
> +	return 0;
> +}
> +
> +static int mt8186_adda_dmic_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	int dmic_on;
> +
> +	if (ucontrol->value.enumerated.item[0] >= e->items)
> +		return -EINVAL;
> +
> +	dmic_on = ucontrol->value.integer.value[0];
> +
> +	dev_info(afe->dev, "%s(), kcontrol name %s, dmic_on %d\n",
> +		 __func__, kcontrol->id.name, dmic_on);

Shouldn't this be a dev_dbg() instead?

> +
> +	if (afe_priv->mtkaif_dmic == dmic_on)
> +		return 0;
> +
> +	afe_priv->mtkaif_dmic = dmic_on;
> +
> +	return 1;
> +}
> +

...snip...

> +
> +#define HIRES_THRESHOLD 48000
> +static int mtk_afe_dac_hires_connect(struct snd_soc_dapm_widget *source,
> +				     struct snd_soc_dapm_widget *sink)
> +{
> +	struct snd_soc_dapm_widget *w = source;
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mtk_afe_adda_priv *adda_priv;
> +
> +	adda_priv = get_adda_priv_by_name(afe, w->name);
> +
> +	if (!adda_priv) {
> +		dev_info(afe->dev, "%s(), adda_priv == NULL", __func__);

dev_err()

> +		return 0;
> +	}
> +
> +	return (adda_priv->dl_rate > HIRES_THRESHOLD) ? 1 : 0;
> +}
> +
> +static int mtk_afe_adc_hires_connect(struct snd_soc_dapm_widget *source,
> +				     struct snd_soc_dapm_widget *sink)
> +{
> +	struct snd_soc_dapm_widget *w = source;
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mtk_afe_adda_priv *adda_priv;
> +
> +	adda_priv = get_adda_priv_by_name(afe, w->name);
> +
> +	if (!adda_priv) {
> +		dev_info(afe->dev, "%s(), adda_priv == NULL", __func__);

dev_err()

> +		return 0;
> +	}
> +
> +	return (adda_priv->ul_rate > HIRES_THRESHOLD) ? 1 : 0;
> +}
> +

..snip..

> +};
> +
> +/* dai ops */
> +static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	unsigned int rate = params_rate(params);
> +	int id = dai->id;
> +	struct mtk_afe_adda_priv *adda_priv = afe_priv->dai_priv[id];
> +
> +	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",
> +		 __func__,
> +		 id,
> +		 substream->stream,
> +		 rate);
> +
> +	if (!adda_priv) {
> +		dev_info(afe->dev, "%s(), adda_priv == NULL", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		unsigned int dl_src2_con0 = 0;
> +		unsigned int dl_src2_con1 = 0;

This initialization is redundant: you're never using these variables
before initializing them later, so initializing them to zero is not
needed here.

> +
> +		adda_priv->dl_rate = rate;
> +
> +		/* set sampling rate */
> +		dl_src2_con0 = adda_dl_rate_transform(afe, rate) <<
> +			       DL_2_INPUT_MODE_CTL_SFT;
> +
> +		/* set output mode, UP_SAMPLING_RATE_X8 */
> +		dl_src2_con0 |= (0x3 << DL_2_OUTPUT_SEL_CTL_SFT);
> +
> +		/* turn off mute function */
> +		dl_src2_con0 |= (0x01 << DL_2_MUTE_CH2_OFF_CTL_PRE_SFT);

BIT() macro, please

> +		dl_src2_con0 |= (0x01 << DL_2_MUTE_CH1_OFF_CTL_PRE_SFT);
> +
> +		/* set voice input data if input sample rate is 8k or 16k */
> +		if (rate == 8000 || rate == 16000)
> +			dl_src2_con0 |= 0x01 << DL_2_VOICE_MODE_CTL_PRE_SFT;
> +
> +		/* SA suggest apply -0.3db to audio/speech path */
> +		dl_src2_con1 = MTK_AFE_ADDA_DL_GAIN_NORMAL <<
> +			       DL_2_GAIN_CTL_PRE_SFT;
> +
> +		/* turn on down-link gain */
> +		dl_src2_con0 |= (0x01 << DL_2_GAIN_ON_CTL_PRE_SFT);
> +
> +		if (id == MT8186_DAI_ADDA) {
> +			/* clean predistortion */
> +			regmap_write(afe->regmap, AFE_ADDA_PREDIS_CON0, 0);
> +			regmap_write(afe->regmap, AFE_ADDA_PREDIS_CON1, 0);
> +
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_DL_SRC2_CON0, dl_src2_con0);
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_DL_SRC2_CON1, dl_src2_con1);
> +
> +			/* set sdm gain */
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_DL_SDM_DCCOMP_CON,
> +					   ATTGAIN_CTL_MASK_SFT,
> +					   AUDIO_SDM_LEVEL_NORMAL <<
> +					   ATTGAIN_CTL_SFT);
> +
> +			/* Use new 2nd sdm */
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_DL_SDM_DITHER_CON,
> +					   AFE_DL_SDM_DITHER_64TAP_EN_MASK_SFT,
> +					   0x1 << AFE_DL_SDM_DITHER_64TAP_EN_SFT);

BIT(AFE_DL_SDM_DITHER_64TAP_EN_SFT)

> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_DL_SDM_AUTO_RESET_CON,
> +					   AFE_DL_USE_NEW_2ND_SDM_MASK_SFT,
> +					   0x1 << AFE_DL_USE_NEW_2ND_SDM_SFT);

BIT(AFE_DL_USE_NEW_2ND_SDM_SFT)

> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_DL_SDM_DCCOMP_CON,
> +					   USE_3RD_SDM_MASK_SFT,
> +					   AUDIO_SDM_2ND << USE_3RD_SDM_SFT);
> +
> +			/* sdm auto reset */
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_DL_SDM_AUTO_RESET_CON,
> +				     SDM_AUTO_RESET_THRESHOLD);
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_DL_SDM_AUTO_RESET_CON,
> +					   SDM_AUTO_RESET_TEST_ON_MASK_SFT,
> +					   0x1 << SDM_AUTO_RESET_TEST_ON_SFT);

BIT(SDM_AUTO_RESET_TEST_ON_SFT)

> +		}
> +	} else {
> +		unsigned int voice_mode = 0;

what about...
		unsigned int ul_src_con0 = 0; /* default value */
		unsigned int voice_mode =  adda_ul_rate_transform(afe, rate);

> +		unsigned int ul_src_con0 = 0;	/* default value */
> +
> +		adda_priv->ul_rate = rate;
> +
> +		voice_mode = adda_ul_rate_transform(afe, rate);
> +
> +		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
> +
> +		/* enable iir */
> +		ul_src_con0 |= (1 << UL_IIR_ON_TMP_CTL_SFT) &
> +			       UL_IIR_ON_TMP_CTL_MASK_SFT;
> +		ul_src_con0 |= (UL_IIR_SW << UL_IIRMODE_CTL_SFT) &
> +			       UL_IIRMODE_CTL_MASK_SFT;
> +		switch (id) {
> +		case MT8186_DAI_ADDA:
> +		case MT8186_DAI_AP_DMIC:
> +			/* 35Hz @ 48k */
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_IIR_COEF_02_01, 0x00000000);

Please drop leading zeroes:

regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_02_01, 0);

> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_IIR_COEF_04_03, 0x00003FB8);

... and also please write hex in lower-case:

regmap_write(afe->regmap,
	     AFE_ADDA_IIR_COEF_04_03, 0x03fb8);

> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_IIR_COEF_06_05, 0x3FB80000);
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_IIR_COEF_08_07, 0x3FB80000);
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_IIR_COEF_10_09, 0x0000C048);
> +
> +			regmap_write(afe->regmap,
> +				     AFE_ADDA_UL_SRC_CON0, ul_src_con0);
> +
> +			/* Using Internal ADC */
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_TOP_CON0,
> +					   0x1 << 0,
> +					   0x0 << 0);

Please use the BIT() macro:

regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, BIT(0), 0);

P.S.: 87 columns is ok

> +
> +			/* mtkaif_rxif_data_mode = 0, amic */
> +			regmap_update_bits(afe->regmap,
> +					   AFE_ADDA_MTKAIF_RX_CFG0,
> +					   0x1 << 0,
> +					   0x0 << 0);

same here.

> +			break;
> +		default:
> +			break;
> +		}
> +
> +		/* ap dmic */
> +		switch (id) {
> +		case MT8186_DAI_AP_DMIC:
> +			mtk_adda_ul_src_dmic(afe, id);
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

Regards,
Angelo

