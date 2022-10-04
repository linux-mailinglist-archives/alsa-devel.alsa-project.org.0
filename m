Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA525F3FE7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 11:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 303A215C1;
	Tue,  4 Oct 2022 11:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 303A215C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664876317;
	bh=JcZcxWfPtp/23nmDfJdl1YuwXmFYJ/qI2LMQEzf65QY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QbkQk4UirXY9gnX4BELky/nszp5RTGJViJS7DbhIplii/STEcdFKo6jC7FF70y43m
	 xGpL9PfFimlKYgLi59TsBLG5dclWUdWl9+86/GRPdleyPkQrNKwO5czJxp/xkcMpFt
	 vCfg+947PQTec66nglB/TYzalAv4WCU9eeEywCso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EBF0F80118;
	Tue,  4 Oct 2022 11:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD174F8012A; Tue,  4 Oct 2022 11:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18BFF8012A
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 11:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18BFF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="jlgya9Zm"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CBA76601A43;
 Tue,  4 Oct 2022 10:37:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664876253;
 bh=JcZcxWfPtp/23nmDfJdl1YuwXmFYJ/qI2LMQEzf65QY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jlgya9Zm/Vh1dYsussQ09jXNPAVV7p5mi6CrthUPRTS66JwOHH4vw2kaX4ywJOZS7
 FUi+1nbCXT25mqTzWAYQ9rejTXihRRsruHF8zZ6W9UqWxpg6r+6xKOUESiQSSavu0B
 wq/wzmAdtxqAtGE2mzCdE5WO0ymyEh5E2/5SUcPJmlAypeBPK3C73CBNJ9eGAsV9c/
 jpR+Ludyx80EHeEw9I9QkPzqPUHjQRLIPWi+Zestm8RRNCx1cPEGXEhdkUswQUo8m5
 axNrCUrXrZkIuk/UDp5g5YXGg1WTETU0AueVDqnD+wN0lhkrOJzwurhzeCpxK+gVrP
 ASlLz5i5h8bAQ==
Message-ID: <0d017f04-cad3-fa76-5d2d-daaa052f2e62@collabora.com>
Date: Tue, 4 Oct 2022 11:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 04/12] ASoC: mediatek: mt8188: support adda in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930145701.18790-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
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

Il 30/09/22 16:56, Trevor Wu ha scritto:
> Add mt8188 adda dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-dai-adda.c | 639 ++++++++++++++++++++
>   1 file changed, 639 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-adda.c
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-adda.c b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
> new file mode 100644
> index 000000000000..ba8f622bb107
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-adda.c
> @@ -0,0 +1,639 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MediaTek ALSA SoC Audio DAI ADDA Control
> + *
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
> + *         Trevor Wu <trevor.wu@mediatek.com>
> + *         Chun-Chia Chiu <chun-chia.chiu@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/regmap.h>
> +#include "mt8188-afe-clk.h"
> +#include "mt8188-afe-common.h"
> +#include "mt8188-reg.h"
> +
> +#define ADDA_HIRES_THRES 48000
> +
> +enum {
> +	SUPPLY_SEQ_CLOCK_SEL,
> +	SUPPLY_SEQ_ADDA_DL_ON,
> +	SUPPLY_SEQ_ADDA_MTKAIF_CFG,
> +	SUPPLY_SEQ_ADDA_UL_ON,
> +	SUPPLY_SEQ_ADDA_AFE_ON,
> +};
> +
> +enum {
> +	MTK_AFE_ADDA_DL_RATE_8K = 0,
> +	MTK_AFE_ADDA_DL_RATE_11K = 1,
> +	MTK_AFE_ADDA_DL_RATE_12K = 2,
> +	MTK_AFE_ADDA_DL_RATE_16K = 3,
> +	MTK_AFE_ADDA_DL_RATE_22K = 4,
> +	MTK_AFE_ADDA_DL_RATE_24K = 5,
> +	MTK_AFE_ADDA_DL_RATE_32K = 6,
> +	MTK_AFE_ADDA_DL_RATE_44K = 7,
> +	MTK_AFE_ADDA_DL_RATE_48K = 8,
> +	MTK_AFE_ADDA_DL_RATE_96K = 9,
> +	MTK_AFE_ADDA_DL_RATE_192K = 10,
> +};
> +
> +enum {
> +	MTK_AFE_ADDA_UL_RATE_8K = 0,
> +	MTK_AFE_ADDA_UL_RATE_16K = 1,
> +	MTK_AFE_ADDA_UL_RATE_32K = 2,
> +	MTK_AFE_ADDA_UL_RATE_48K = 3,
> +	MTK_AFE_ADDA_UL_RATE_96K = 4,
> +	MTK_AFE_ADDA_UL_RATE_192K = 5,
> +};
> +
> +enum {
> +	DELAY_DATA_MISO1 = 0,
> +	DELAY_DATA_MISO0 = 1,
> +};
> +
> +struct mtk_dai_adda_priv {
> +	unsigned int dl_rate;
> +	unsigned int ul_rate;
> +};
> +

..snip..

> +
> +static int mt8188_adda_mtkaif_init(struct mtk_base_afe *afe)
> +{
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtkaif_param *param = &afe_priv->mtkaif_params;
> +	int delay_data;
> +	int delay_cycle;
> +	unsigned int mask = 0;
> +	unsigned int val = 0;
> +
> +	/* set rx protocol 2 & mtkaif_rxif_clkinv_adc inverse */
> +	mask = (MTKAIF_RXIF_CLKINV_ADC | MTKAIF_RXIF_PROTOCOL2);
> +	val = (MTKAIF_RXIF_CLKINV_ADC | MTKAIF_RXIF_PROTOCOL2);
> +
> +	regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIF_CFG0, mask, val);

This should be
	regmap_set_bits(afe->regmap, AFE_ADDA_MTKAIF_CFG0,
			MTKAIF_RXIF_CLKINV_ADC | MTKAIF_RXIF_PROTOCOL2);
> +
> +	mask = RG_RX_PROTOCOL2;
> +	val = RG_RX_PROTOCOL2;
> +	regmap_update_bits(afe->regmap, AFE_AUD_PAD_TOP, mask, val);

regmap_set_bits() again

> +
> +	if (!param->mtkaif_calibration_ok) {
> +		dev_info(afe->dev, "%s(), calibration fail\n",  __func__);
> +		return 0;
> +	}
> +
> +	/* set delay for ch1, ch2 */
> +	if (param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_0] >=
> +	    param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1]) {
> +		delay_data = DELAY_DATA_MISO1;
> +		delay_cycle =
> +			param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_0] -
> +			param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1];
> +	} else {
> +		delay_data = DELAY_DATA_MISO0;
> +		delay_cycle =
> +			param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_1] -
> +			param->mtkaif_phase_cycle[MT8188_MTKAIF_MISO_0];
> +	}
> +
> +	val = 0;
> +	mask = (MTKAIF_RXIF_DELAY_DATA | MTKAIF_RXIF_DELAY_CYCLE_MASK);
> +	val |= MTKAIF_RXIF_DELAY_CYCLE(delay_cycle) &
> +	       MTKAIF_RXIF_DELAY_CYCLE_MASK;

	val = FIELD_PREP(MTKAIF_RXIF_DELAY_CYCLE_MASK, delay_cycle);

> +	val |= delay_data << MTKAIF_RXIF_DELAY_DATA_SHIFT;

	val |= FIELD_PREP(MTKAIF_RXIF_DELAY_DATA, delay_data);

Can you please use bitfield access macros across the entire file (and the others)?
This will both increase human readability and add compile-time checks on register
fields.

> +	regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIF_RX_CFG2, mask, val);
> +
> +	return 0;
> +}
> +
> +static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
> +				     struct snd_kcontrol *kcontrol,
> +				     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +
> +	dev_dbg(afe->dev, "%s(), name %s, event 0x%x\n",
> +		__func__, w->name, event);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		mt8188_adda_mtkaif_init(afe);
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
> +	case SND_SOC_DAPM_POST_PMD:
> +		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
> +		usleep_range(125, 135);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_adda_ul_mictype(struct mtk_base_afe *afe, bool dmic)
> +{
> +	unsigned int reg = AFE_ADDA_UL_SRC_CON0;
> +	unsigned int val = 0;
> +	unsigned int mask;
> +
> +	mask = (UL_SDM3_LEVEL_CTL | UL_MODE_3P25M_CH1_CTL |
> +		UL_MODE_3P25M_CH2_CTL);

	val = (UL_SDM3_LEVEL_CTL | UL_MODE_3P25M_CH1_CTL | UL_MODE_3P25M_CH2_CTL);

> +
> +	/* turn on dmic, ch1, ch2 */
> +	if (dmic)
		regmap_set_bits(afe->regmap, reg, val);
	else
		regmap_clear_bits(afe->regmap, reg, val);


> +		val = mask;
> +
> +	regmap_update_bits(afe->regmap, reg, mask, val);
> +}
> +

..snip..

> +
> +static int mtk_afe_adc_hires_connect(struct snd_soc_dapm_widget *source,
> +				     struct snd_soc_dapm_widget *sink)
> +{
> +	struct snd_soc_dapm_widget *w = source;
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_adda_priv *adda_priv;
> +
> +	adda_priv = afe_priv->dai_priv[MT8188_AFE_IO_ADDA];
> +
> +	if (!adda_priv) {
> +		dev_err(afe->dev, "%s adda_priv == NULL", __func__);
> +		return 0;

		return -EINVAL?

> +	}
> +
> +	return (adda_priv->ul_rate > ADDA_HIRES_THRES) ? 1 : 0;

	return !!(adda_priv->ul_rate > ADDA_HIRES_THRES);

> +}
> +
> +static int mtk_afe_dac_hires_connect(struct snd_soc_dapm_widget *source,
> +				     struct snd_soc_dapm_widget *sink)
> +{
> +	struct snd_soc_dapm_widget *w = source;
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_adda_priv *adda_priv;
> +
> +	adda_priv = afe_priv->dai_priv[MT8188_AFE_IO_ADDA];
> +
> +	if (!adda_priv) {
> +		dev_err(afe->dev, "%s adda_priv == NULL", __func__);
> +		return 0;

same here

> +	}
> +
> +	return (adda_priv->dl_rate > ADDA_HIRES_THRES) ? 1 : 0;
> +}
> +

..snip..

Regards,
Angelo


