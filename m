Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227DD4CC433
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30EB1AF3;
	Thu,  3 Mar 2022 18:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30EB1AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646329300;
	bh=csUaHg+yxkLTEXo9BClCIdlfg1cSahev/hn2C7GL9aI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEVbvB+CW2ms3GBFIAzlcSakjwpQhLQ4MtlMtUUa8vklDy8U/7rvr/6H93zHmWbsH
	 h9G4lEblEG4xgEd+nlizTm5KS+jgzlZ4WdBy0aMoSpguydhqphf/nwUu4FYfhWytst
	 CIBgQsk1bzDPFjHZzpjYZr2ig7QJmxAkFA/34K+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E88CF80166;
	Thu,  3 Mar 2022 18:40:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BDDCF80109; Thu,  3 Mar 2022 18:40:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A35F80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A35F80109
X-UUID: d753a7cde2864a2a80d2b960fe781126-20220304
X-UUID: d753a7cde2864a2a80d2b960fe781126-20220304
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 70764042; Fri, 04 Mar 2022 01:40:12 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 4 Mar 2022 01:40:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 01:40:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 01:40:10 +0800
Message-ID: <a8edf274beffbdbadec39d7283ebbab5699ef4d4.camel@mediatek.com>
Subject: Re: [v2 09/17] ASoC: mediatek: mt8186: support tdm in platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
Date: Fri, 4 Mar 2022 01:39:05 +0800
In-Reply-To: <6bc78592-36c0-8462-f4f8-ad9e04a13da6@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-10-jiaxin.yu@mediatek.com>
 <fcae42a5-6e11-e683-8f3a-453650f08d38@collabora.com>
 <9ba63387baecf598db696d0ebbc1583406a57a62.camel@mediatek.com>
 <6bc78592-36c0-8462-f4f8-ad9e04a13da6@collabora.com>
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

On Thu, 2022-03-03 at 16:08 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/03/22 15:10, Jiaxin Yu ha scritto:
> > On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> > > > This patch adds mt8186 tdm dai driver.
> > > > 
> > > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > > ---
> > > >    sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 713
> > > > +++++++++++++++++++++
> > > >    1 file changed, 713 insertions(+)
> > > >    create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-
> > > > tdm.c
> > > > 
> > > > diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> > > > b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> > > > new file mode 100644
> > > > index 000000000000..28dd3661f0e0
> > > > --- /dev/null
> > > > +++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> > > > @@ -0,0 +1,713 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +//
> > > > +// MediaTek ALSA SoC Audio DAI TDM Control
> > > > +//
> > > > +// Copyright (c) 2022 MediaTek Inc.
> > > > +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > > +
> 
> ..snip..
> 
> > > > +
> > > > +static int mtk_dai_tdm_hw_params(struct snd_pcm_substream
> > > > *substream,
> > > > +				 struct snd_pcm_hw_params
> > > > *params,
> > > > +				 struct snd_soc_dai *dai)
> > > > +{
> > > > +	struct mtk_base_afe *afe =
> > > > snd_soc_dai_get_drvdata(dai);
> > > > +	struct mt8186_afe_private *afe_priv = afe-
> > > > >platform_priv;
> > > > +	int tdm_id = dai->id;
> > > > +	struct mtk_afe_tdm_priv *tdm_priv = afe_priv-
> > > > >dai_priv[tdm_id];
> > > > +	unsigned int tdm_mode = tdm_priv->tdm_mode;
> > > > +	unsigned int data_mode = tdm_priv->data_mode;
> > > > +	unsigned int rate = params_rate(params);
> > > > +	unsigned int channels = params_channels(params);
> > > > +	snd_pcm_format_t format = params_format(params);
> > > > +	unsigned int bit_width =
> > > > +		snd_pcm_format_physical_width(format);
> > > > +	unsigned int tdm_channels = (data_mode ==
> > > > TDM_DATA_ONE_PIN) ?
> > > > +		get_tdm_ch_per_sdata(tdm_mode, channels) : 2;
> > > > +	unsigned int lrck_width =
> > > > +		get_tdm_lrck_width(format, tdm_mode);
> > > > +	unsigned int tdm_con = 0;
> > > > +	bool slave_mode = tdm_priv->slave_mode;
> > > > +	bool lrck_inv = tdm_priv->lck_invert;
> > > > +	bool bck_inv = tdm_priv->bck_invert;
> > > > +	unsigned int ctrl_reg;
> > > > +	unsigned int ctrl_mask;
> > > > +	unsigned int tran_rate;
> > > > +	unsigned int tran_relatch_rate;
> > > > +
> > > > +	if (tdm_priv)
> > > > +		tdm_priv->rate = rate;
> > > > +	else
> > > > +		dev_info(afe->dev, "%s(), tdm_priv == NULL",
> > > > __func__);
> > > > +
> > > > +	tran_rate = mt8186_rate_transform(afe->dev, rate, dai-
> > > > >id);
> > > > +	tran_relatch_rate =
> > > > mt8186_tdm_relatch_rate_transform(afe->dev,
> > > > rate);
> > > > +
> > > > +	/* calculate mclk_rate, if not set explicitly */
> > > > +	if (!tdm_priv->mclk_rate) {
> > > > +		tdm_priv->mclk_rate = rate * tdm_priv-
> > > > >mclk_multiple;
> > > > +		mtk_dai_tdm_cal_mclk(afe,
> > > > +				     tdm_priv,
> > > > +				     tdm_priv->mclk_rate);
> > > > +	}
> > > > +
> > > > +	/* ETDM_IN1_CON0 */
> > > > +	tdm_con |= slave_mode <<
> > > > ETDM_IN1_CON0_REG_SLAVE_MODE_SFT;
> > > > +	tdm_con |= tdm_mode << ETDM_IN1_CON0_REG_FMT_SFT;
> > > > +	tdm_con |= (bit_width - 1) <<
> > > > ETDM_IN1_CON0_REG_BIT_LENGTH_SFT;
> > > > +	tdm_con |= (bit_width - 1) <<
> > > > ETDM_IN1_CON0_REG_WORD_LENGTH_SFT;
> > > > +	tdm_con |= (tdm_channels - 1) <<
> > > > ETDM_IN1_CON0_REG_CH_NUM_SFT;
> > > > +	/* default disable sync mode */
> > > > +	tdm_con |= 0 << ETDM_IN1_CON0_REG_SYNC_MODE_SFT;
> > > 
> > > 0 << (anything) == 0
> > > 
> > > (number |= 0) == number
> > > 
> > > Is this a mistake, or are you really doing nothing here?
> > > 
> > 
> > No, this is just to emphasize the need to set this bit to 0.
> > It really do nothing here, just link a reminder.
> > Can I keep this sentence?
> 
> If, in your judgement, it is very important to have a reminder about
> that
> bit having to be unset, then add a comment in the code saying so.
> Don't simply comment out the statement as it is.
> 
> A good way would be something like
> /* sync mode bit has to be unset because this that reason, otherwise
> X happens */

I see, thanks for your kind advise.
> 
> > > 
> > > > +	/* relatch fix to h26m */
> > > > +	tdm_con |= 0 <<
> > > > ETDM_IN1_CON0_REG_RELATCH_1X_EN_SEL_DOMAIN_SFT;
> > > > +
> > > > +	ctrl_reg = ETDM_IN1_CON0;
> > > > +	ctrl_mask = ETDM_IN_CON0_CTRL_MASK;
> > > > +	regmap_update_bits(afe->regmap, ctrl_reg, ctrl_mask,
> > > > tdm_con);
> > > > +
> > > > +	/* ETDM_IN1_CON1 */
> > > > +	tdm_con = 0;
> > > > +	tdm_con |= 0 << ETDM_IN1_CON1_REG_LRCK_AUTO_MODE_SFT;
> > > > +	tdm_con |= 1 << ETDM_IN1_CON1_PINMUX_MCLK_CTRL_OE_SFT;
> > > > +	tdm_con |= (lrck_width - 1) <<
> > > > ETDM_IN1_CON1_REG_LRCK_WIDTH_SFT;
> > > > +
> > > > +	ctrl_reg = ETDM_IN1_CON1;
> > > > +	ctrl_mask = ETDM_IN_CON1_CTRL_MASK;
> > > > +	regmap_update_bits(afe->regmap, ctrl_reg, ctrl_mask,
> > > > tdm_con);
> > > 
> > > You don't need the ctrl_reg, nor ctrl_mask variables...
> > 
> > I was trying to avoid a line of more than 80 words, so I shortened
> > the
> > number of words through variables.
> > 
> 
> Yes, I know, I did understand what you were trying to do...
> ...but it's fine to go past 80: in this case this would be 88
> columns,
> which is still ok to have!
> 
> And note, this is the case with all of similar calls present in this
> function,
> that's why I said that you don't need these two variables! :)
> 
> Thank you,
> Angelo
Ok, I got it. This function will be corrected in the next version.

Thank you.
Jiaxin.Yu


> 
> 

