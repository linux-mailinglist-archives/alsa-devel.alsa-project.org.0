Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A554BBB33
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B1561754;
	Fri, 18 Feb 2022 15:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B1561754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645196194;
	bh=aJ3xIH2fN9ae3SbsE2VP6ml3rhW+Z3DMmyq7epfAAqc=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4lvTb4ODJP6B/vGKbBSnlutL0Rj75+g4Fpz9g4QEPfHJi+5rpsqAD7eVx73SMQlh
	 9iyZz/h8upoA0wTSOJ8WkSf3uU7cmgSY4oqs4HMyYAHYRQAI01Ew+e3lDXA+cZAO2N
	 zdpDre3wCEwygmVOuuM5LEmvnyv/6cT3Re3y5jEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17A3F8051E;
	Fri, 18 Feb 2022 15:54:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C163F8051D; Fri, 18 Feb 2022 15:54:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A1FDF8013C
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 15:54:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A1FDF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="WErC1atF"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A26911F46BA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645196062;
 bh=aJ3xIH2fN9ae3SbsE2VP6ml3rhW+Z3DMmyq7epfAAqc=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=WErC1atFCUoRx9/I6wMe2kPsGiJj6UAjtjLC3qrBKFMFKqo5v8jb5sh1yS6p1mIbR
 E4ThhBytCjU9fAMb9ZGmn6fuALC7GMtdvqXkFV/cKpvhntjFJON8WVVbVapC53dFof
 fHQ2QFvRHH+4YG+71qSaFiRI81GS3ls7RXCCSIAkTyy12dL3CSQbfmuaTMrW8g0cgk
 FN2bnL0sctrZ2Tw3hsg07b4ukcAWXgB6xrOOIbe3H8/e6Np9IzHT2DWHCXDqUXHTGo
 63dQ9Jp6ZqGxKoqNkCUdd5dT7Y+BeUq72dLV58RhItGoZ6WtZtjYbYGV9RTcXvGUHs
 BuOcPl9mAQzrg==
Message-ID: <a624679f-3b87-ff07-8983-982bbd983e94@collabora.com>
Date: Fri, 18 Feb 2022 15:54:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v2 05/17] ASoC: mediatek: mt8186: support hw gain in platform
 driver
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-6-jiaxin.yu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220217134205.15400-6-jiaxin.yu@mediatek.com>
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
> This path adds mt8186 hw gain dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  | 245 ++++++++++++++++++
>   1 file changed, 245 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> new file mode 100644
> index 000000000000..796878989727
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// MediaTek ALSA SoC Audio DAI HW Gain Control
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +#include <linux/regmap.h>
> +#include "mt8186-afe-common.h"
> +#include "mt8186-interconnection.h"
> +
> +#define HW_GAIN_1_EN_W_NAME "HW GAIN 1 Enable"
> +#define HW_GAIN_2_EN_W_NAME "HW GAIN 2 Enable"
> +
> +/* dai component */
> +static const struct snd_kcontrol_new mtk_hw_gain1_in_ch1_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1 Switch", AFE_CONN13_1,
> +				    I_CONNSYS_I2S_CH1, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain1_in_ch2_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2 Switch", AFE_CONN14_1,
> +				    I_CONNSYS_I2S_CH2, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch1_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN15,
> +				    I_ADDA_UL_CH1, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain2_in_ch2_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN16,
> +				    I_ADDA_UL_CH2, 1, 0),
> +};
> +
> +static int mtk_hw_gain_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol,
> +			     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	unsigned int gain_cur;
> +	unsigned int gain_con1;
> +
> +	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> +		__func__, w->name, event);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (strcmp(w->name, HW_GAIN_1_EN_W_NAME) == 0) {
> +			gain_cur = AFE_GAIN1_CUR;
> +			gain_con1 = AFE_GAIN1_CON1;
> +		} else {
> +			gain_cur = AFE_GAIN2_CUR;
> +			gain_con1 = AFE_GAIN2_CON1;
> +		}
> +
> +		/* let hw gain ramp up, set cur gain to 0 */
> +		regmap_update_bits(afe->regmap,
> +				   gain_cur,
> +				   AFE_GAIN1_CUR_MASK_SFT,
> +				   0);

This fits in one line (86 columns is ok)

> +
> +		/* set target gain to 0 */
> +		regmap_update_bits(afe->regmap,
> +				   gain_con1,
> +				   GAIN1_TARGET_MASK_SFT,
> +				   0);

Same here.

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget mtk_dai_hw_gain_widgets[] = {
> +	/* inter-connections */
> +	SND_SOC_DAPM_MIXER("HW_GAIN1_IN_CH1", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain1_in_ch1_mix,
> +			   ARRAY_SIZE(mtk_hw_gain1_in_ch1_mix)),
> +	SND_SOC_DAPM_MIXER("HW_GAIN1_IN_CH2", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain1_in_ch2_mix,
> +			   ARRAY_SIZE(mtk_hw_gain1_in_ch2_mix)),
> +	SND_SOC_DAPM_MIXER("HW_GAIN2_IN_CH1", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain2_in_ch1_mix,
> +			   ARRAY_SIZE(mtk_hw_gain2_in_ch1_mix)),
> +	SND_SOC_DAPM_MIXER("HW_GAIN2_IN_CH2", SND_SOC_NOPM, 0, 0,
> +			   mtk_hw_gain2_in_ch2_mix,
> +			   ARRAY_SIZE(mtk_hw_gain2_in_ch2_mix)),
> +
> +	SND_SOC_DAPM_SUPPLY(HW_GAIN_1_EN_W_NAME,
> +			    AFE_GAIN1_CON0, GAIN1_ON_SFT, 0,
> +			    mtk_hw_gain_event,
> +			    SND_SOC_DAPM_PRE_PMU),
> +
> +	SND_SOC_DAPM_SUPPLY(HW_GAIN_2_EN_W_NAME,
> +			    AFE_GAIN2_CON0, GAIN2_ON_SFT, 0,
> +			    mtk_hw_gain_event,
> +			    SND_SOC_DAPM_PRE_PMU),
> +
> +	SND_SOC_DAPM_INPUT("HW Gain 1 Out Endpoint"),
> +	SND_SOC_DAPM_INPUT("HW Gain 2 Out Endpoint"),
> +	SND_SOC_DAPM_OUTPUT("HW Gain 1 In Endpoint"),
> +};
> +
> +static const struct snd_soc_dapm_route mtk_dai_hw_gain_routes[] = {
> +	{"HW Gain 1 In", NULL, "HW_GAIN1_IN_CH1"},
> +	{"HW Gain 1 In", NULL, "HW_GAIN1_IN_CH2"},
> +	{"HW Gain 2 In", NULL, "HW_GAIN2_IN_CH1"},
> +	{"HW Gain 2 In", NULL, "HW_GAIN2_IN_CH2"},
> +
> +	{"HW Gain 1 In", NULL, HW_GAIN_1_EN_W_NAME},
> +	{"HW Gain 1 Out", NULL, HW_GAIN_1_EN_W_NAME},
> +	{"HW Gain 2 In", NULL, HW_GAIN_2_EN_W_NAME},
> +	{"HW Gain 2 Out", NULL, HW_GAIN_2_EN_W_NAME},
> +
> +	{"HW Gain 1 In Endpoint", NULL, "HW Gain 1 In"},
> +	{"HW Gain 1 Out", NULL, "HW Gain 1 Out Endpoint"},
> +	{"HW Gain 2 Out", NULL, "HW Gain 2 Out Endpoint"},
> +};
> +
> +static const struct snd_kcontrol_new mtk_hw_gain_controls[] = {
> +	SOC_SINGLE("HW Gain 1 Volume", AFE_GAIN1_CON1,
> +		   GAIN1_TARGET_SFT, GAIN1_TARGET_MASK, 0),
> +	SOC_SINGLE("HW Gain 2 Volume", AFE_GAIN2_CON1,
> +		   GAIN2_TARGET_SFT, GAIN2_TARGET_MASK, 0),
> +};
> +
> +/* dai ops */
> +static int mtk_dai_gain_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	unsigned int rate = params_rate(params);
> +	unsigned int rate_reg = mt8186_rate_transform(afe->dev, rate, dai->id);
> +
> +	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",
> +		 __func__,
> +		 dai->id,
> +		 substream->stream,
> +		 rate);

This should be:
	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",

		 __func__, dai->id, substream->stream, rate);

