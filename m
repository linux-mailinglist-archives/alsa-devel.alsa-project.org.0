Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D532D4CE470
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 12:14:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779BE1A43;
	Sat,  5 Mar 2022 12:13:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779BE1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646478861;
	bh=+q8QMvirJPHnXlqhOc1DdTIHB79kiAXM0dMC5O18jyk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V1VA3clGcYO7UKkQ7J2XKAxBdLoSfPClsrGTEPVDVW5eECuTpB0yTLDAA/cNgoZdd
	 zq7WIrCAfxpItyl4kMOe3heGbdn9cQDfP0eQhjRHAJIpsTNXQhgvbBlLDVQhwsktPY
	 b1hqKSi+VxxkY3KbYVvq1donFOSxW4U5vNpXD/KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9D8F800DF;
	Sat,  5 Mar 2022 12:13:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 279E5F80237; Sat,  5 Mar 2022 12:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CDAF800E4
 for <alsa-devel@alsa-project.org>; Sat,  5 Mar 2022 12:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CDAF800E4
X-UUID: df944644938c4e3cbacd0d079e0f1b42-20220305
X-UUID: df944644938c4e3cbacd0d079e0f1b42-20220305
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1916300288; Sat, 05 Mar 2022 19:12:53 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 5 Mar 2022 19:12:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Mar 2022 19:12:51 +0800
Message-ID: <f11791bc48c466ddc737e23d767bb8dadd218a36.camel@mediatek.com>
Subject: Re: [v2 07/17] ASoC: mediatek: mt8186: support pcm in platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
Date: Sat, 5 Mar 2022 19:12:51 +0800
In-Reply-To: <78474983-a07c-6b1d-797a-d0788f3577b6@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-8-jiaxin.yu@mediatek.com>
 <78474983-a07c-6b1d-797a-d0788f3577b6@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> > This patch adds mt8186 pcm dai driver.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   sound/soc/mediatek/mt8186/mt8186-dai-pcm.c | 432
> > +++++++++++++++++++++
> >   1 file changed, 432 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
> > 
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
> > b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
> > new file mode 100644
> > index 000000000000..73b3f720ed35
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
> > @@ -0,0 +1,432 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// MediaTek ALSA SoC Audio DAI I2S Control
> > +//
> > +// Copyright (c) 2022 MediaTek Inc.
> > +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +
> > +#include <linux/regmap.h>
> > +#include <sound/pcm_params.h>
> > +#include "mt8186-afe-common.h"
> > +#include "mt8186-afe-gpio.h"
> > +#include "mt8186-interconnection.h"
> > +
> > +struct mtk_afe_pcm_priv {
> > +	unsigned int id;
> > +	unsigned int fmt;
> > +	unsigned int bck_invert;
> > +	unsigned int lck_invert;
> > +};
> > +
> > +enum AUD_TX_LCH_RPT {
> 
> lowercase enumeration names please...
> 
> enum aud_tx_lch_rpt {
> 	AUD_TX....BLAH
> };
> 
Ok, I will fix them.

> > +	AUD_TX_LCH_RPT_NO_REPEAT = 0,
> > +	AUD_TX_LCH_RPT_REPEAT = 1
> > +};
> > +
> > +enum AUD_VBT_16K_MODE {
> > +	AUD_VBT_16K_MODE_DISABLE = 0,
> > +	AUD_VBT_16K_MODE_ENABLE = 1
> > +};
> > +
> > +enum AUD_EXT_MODEM {
> > +	AUD_EXT_MODEM_SELECT_INTERNAL = 0,
> > +	AUD_EXT_MODEM_SELECT_EXTERNAL = 1
> > +};
> > +
> > +enum AUD_PCM_SYNC_TYPE {
> > +	/* bck sync length = 1 */
> > +	AUD_PCM_ONE_BCK_CYCLE_SYNC = 0,
> > +	/* bck sync length = PCM_INTF_CON1[9:13] */
> > +	AUD_PCM_EXTENDED_BCK_CYCLE_SYNC = 1
> > +};
> > +
> > +enum AUD_BT_MODE {
> > +	AUD_BT_MODE_DUAL_MIC_ON_TX = 0,
> > +	AUD_BT_MODE_SINGLE_MIC_ON_TX = 1
> > +};
> > +
> > +enum AUD_PCM_AFIFO_SRC {
> > +	/* slave mode & external modem uses different crystal */
> > +	AUD_PCM_AFIFO_ASRC = 0,
> > +	/* slave mode & external modem uses the same crystal */
> > +	AUD_PCM_AFIFO_AFIFO = 1
> > +};
> > +
> > +enum AUD_PCM_CLOCK_SOURCE {
> > +	AUD_PCM_CLOCK_MASTER_MODE = 0,
> > +	AUD_PCM_CLOCK_SLAVE_MODE = 1
> > +};
> > +
> > +enum AUD_PCM_WLEN {
> > +	AUD_PCM_WLEN_PCM_32_BCK_CYCLES = 0,
> > +	AUD_PCM_WLEN_PCM_64_BCK_CYCLES = 1
> > +};
> > +
> > +enum AUD_PCM_24BIT {
> > +	AUD_PCM_24BIT_PCM_16_BITS = 0,
> > +	AUD_PCM_24BIT_PCM_24_BITS = 1
> > +};
> > +
> > +enum AUD_PCM_MODE {
> > +	AUD_PCM_MODE_PCM_MODE_8K = 0,
> > +	AUD_PCM_MODE_PCM_MODE_16K = 1,
> > +	AUD_PCM_MODE_PCM_MODE_32K = 2,
> > +	AUD_PCM_MODE_PCM_MODE_48K = 3,
> > +};
> > +
> > +enum AUD_PCM_FMT {
> > +	AUD_PCM_FMT_I2S = 0,
> > +	AUD_PCM_FMT_EIAJ = 1,
> > +	AUD_PCM_FMT_PCM_MODE_A = 2,
> > +	AUD_PCM_FMT_PCM_MODE_B = 3
> > +};
> > +
> > +enum AUD_BCLK_OUT_INV {
> > +	AUD_BCLK_OUT_INV_NO_INVERSE = 0,
> > +	AUD_BCLK_OUT_INV_INVERSE = 1
> > +};
> > +
> > +enum AUD_LRCLK_OUT_INV {
> > +	AUD_LRCLK_OUT_INV_NO_INVERSE = 0,
> > +	AUD_LRCLK_OUT_INV_INVERSE = 1
> > +};
> > +
> > +enum AUD_PCM_EN {
> > +	AUD_PCM_EN_DISABLE = 0,
> > +	AUD_PCM_EN_ENABLE = 1
> > +};
> > +
> 
> ..snip..
> 
> > +
> > +/* dai ops */
> > +static int mtk_dai_pcm_hw_params(struct snd_pcm_substream
> > *substream,
> > +				 struct snd_pcm_hw_params *params,
> > +				 struct snd_soc_dai *dai)
> > +{
> > +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	int pcm_id = dai->id;
> > +	struct mtk_afe_pcm_priv *pcm_priv = afe_priv->dai_priv[pcm_id];
> > +	unsigned int rate = params_rate(params);
> > +	unsigned int rate_reg = mt8186_rate_transform(afe->dev, rate,
> > dai->id);
> > +	snd_pcm_format_t format = params_format(params);
> > +	unsigned int data_width =
> > +		snd_pcm_format_width(format);
> > +	unsigned int wlen_width =
> > +		snd_pcm_format_physical_width(format);
> > +	unsigned int pcm_con = 0;
> > +
> > +	dev_info(afe->dev, "%s(), id %d, stream %d, widget active p %d,
> > c %d\n",
> > +		 __func__,
> > +		 dai->id,
> > +		 substream->stream,
> > +		 dai->playback_widget->active,
> > +		 dai->capture_widget->active);
> > +	dev_info(afe->dev, "%s(), rate %d, rate_reg %d, data_width %d,
> > wlen_width %d\n",
> > +		 __func__,
> > +		 rate,
> > +		 rate_reg,
> > +		 data_width,
> > +		 wlen_width);
> 
> dev_dbg() - also, you don't need one line per variable.
> 

Yes, I will line them up in two.
> > +
> > +	if (dai->playback_widget->active || dai->capture_widget-
> > >active)
> > +		return 0;
> > +
> > +	switch (dai->id) {
> > +	case MT8186_DAI_PCM:
> > +		pcm_con |= AUD_TX_LCH_RPT_NO_REPEAT <<
> > PCM_TX_LCH_RPT_SFT;
> > +		pcm_con |= AUD_VBT_16K_MODE_DISABLE <<
> > PCM_VBT_16K_MODE_SFT;
> > +		pcm_con |= AUD_EXT_MODEM_SELECT_EXTERNAL <<
> > PCM_EXT_MODEM_SFT;
> > +		pcm_con |= AUD_PCM_ONE_BCK_CYCLE_SYNC <<
> > PCM_SYNC_TYPE_SFT;
> > +		pcm_con |= AUD_BT_MODE_DUAL_MIC_ON_TX <<
> > PCM_BT_MODE_SFT;
> > +		pcm_con |= AUD_PCM_AFIFO_AFIFO << PCM_BYP_ASRC_SFT;
> > +		pcm_con |= AUD_PCM_CLOCK_MASTER_MODE << PCM_SLAVE_SFT;
> > +		pcm_con |= 0 << PCM_SYNC_LENGTH_SFT;
> > +
> > +		/* sampling rate */
> > +		pcm_con |= rate_reg << PCM_MODE_SFT;
> > +
> > +		/* format */
> > +		pcm_con |= pcm_priv->fmt << PCM_FMT_SFT;
> > +
> > +		/* 24bit data width */
> > +		if (data_width > 16)
> > +			pcm_con |= AUD_PCM_24BIT_PCM_24_BITS <<
> > PCM_24BIT_SFT;
> > +		else
> > +			pcm_con |= AUD_PCM_24BIT_PCM_16_BITS <<
> > PCM_24BIT_SFT;
> > +
> > +		/* wlen width*/
> > +		if (wlen_width > 16)
> > +			pcm_con |= AUD_PCM_WLEN_PCM_64_BCK_CYCLES <<
> > PCM_WLEN_SFT;
> > +		else
> > +			pcm_con |= AUD_PCM_WLEN_PCM_32_BCK_CYCLES <<
> > PCM_WLEN_SFT;
> > +
> > +		/* clock invert */
> > +		pcm_con |= pcm_priv->lck_invert <<
> > PCM_SYNC_OUT_INV_SFT;
> > +		pcm_con |= pcm_priv->bck_invert <<
> > PCM_BCLK_OUT_INV_SFT;
> > +
> > +		regmap_update_bits(afe->regmap, PCM_INTF_CON1,
> > +				   0xfffffffe, pcm_con);
> 
> Fits in one line.
> 
> > +		break;
> > +	default:
> > +		dev_info(afe->dev, "%s(), id %d not support\n",
> > +			 __func__, dai->id);
> 
> dev_err()
> 
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned
> > int fmt)
> > +{
> > +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	struct mtk_afe_pcm_priv *pcm_priv = afe_priv->dai_priv[dai-
> > >id];
> > +
> > +	if (!pcm_priv) {
> > +		dev_info(afe->dev, "%s(), tdm_priv == NULL", __func__);
> 
> dev_err()
> 
> > +		return -EINVAL;
> > +	}
> > +

