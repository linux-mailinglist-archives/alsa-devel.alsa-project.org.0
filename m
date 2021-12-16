Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206D4768C3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 04:39:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F281AA0;
	Thu, 16 Dec 2021 04:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F281AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639625940;
	bh=fAga0Wr2DUiwlOag0KoItGpVBE0Vs6XqaTgA5UptJJc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdrBg4lyrpiGMA7zZiQREX4R3mw+AiIMBURvJM+aiqX273KN6NH1opQU//WnhuWJc
	 q/wYkPaLNXG5IQtv71RejOca8W49yXDru9rRl/EKKUkrdVxLrkvJNp5Zf+l6sjQy0q
	 daxxa9S8rfXLSEIojc3dDHYb9I78sl3EvUeHwczk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1962CF800B0;
	Thu, 16 Dec 2021 04:37:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51ED6F800B0; Thu, 16 Dec 2021 04:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A53EF800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 04:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A53EF800B0
X-UUID: bb65dc2f54a443e99c7702d40a2cf28c-20211216
X-UUID: bb65dc2f54a443e99c7702d40a2cf28c-20211216
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 107822264; Thu, 16 Dec 2021 11:37:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 11:37:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Dec 2021 11:37:35 +0800
Message-ID: <0b99c46f84c98c56e8fc99b2e103f52f756b5bf9.camel@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8195: update control for RT5682
 series
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 16 Dec 2021 11:37:34 +0800
In-Reply-To: <YbmlT+OSwpGuylsx@google.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
 <YbmlT+OSwpGuylsx@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, shumingf@realtek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

Hi Tzung-Bi,
Thanks for your reviewing,

On Wed, 2021-12-15 at 16:20 +0800, Tzung-Bi Shih wrote:
> On Wed, Dec 15, 2021 at 02:58:34PM +0800, Trevor Wu wrote:
> > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
> > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
> 
> [...]
> > +static int mt8195_set_bias_level_post(struct snd_soc_card *card,
> > +	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level
> > level)
> > +{
> > +	struct snd_soc_component *component = dapm->component;
> > +	struct mt8195_mt6359_rt1011_rt5682_priv *priv =
> > +		snd_soc_card_get_drvdata(card);
> > +	int ret = 0;
> 
> ret doesn't need to be initialized.
> 
Originally, I initailize "ret", because it will be returned at the end
of the function. To be concise, I will return 0 directly and remove the
initialization.

> > +	/*
> > +	 * It's required to control mclk directly in the
> > set_bias_level_post
> > +	 * function for rt5682 and rt5682s codec, or the unexpected pop
> > happens
> > +	 * at the end of playback.
> > +	 */
> > +	if (!component ||
> > +	    (strcmp(component->name, RT5682_DEV0_NAME) &&
> > +	    strcmp(component->name, RT5682S_DEV0_NAME)))
> > +		return 0;
> > +
> > +	if (IS_ERR(priv->i2so1_mclk))
> > +		return 0;
> 
> I doubt if it needs to check priv->i2so1_mclk.  In other words, if
> IS_ERR(priv->i2so1_mclk) is true in _probe, does
> mt8195_set_bias_level_post() get called?
> 

Now, i2so1_mclk is a required property.
I will remove the condition in v2.

> > +	switch (level) {
> > +	case SND_SOC_BIAS_OFF:
> > +		if (!__clk_is_enabled(priv->i2so1_mclk))
> > +			return 0;
> > +
> > +		dev_dbg(card->dev, "Disable i2so1");
> > +		clk_disable_unprepare(priv->i2so1_mclk);
> 
> I would suggest move dev_dbg() later than clk_disable_unprepare()
> which means "Disable i2so1" is done.
> 
OK.

> > +		break;
> > +	case SND_SOC_BIAS_ON:
> > +		dev_dbg(card->dev, "Enable i2so1");
> > +		ret = clk_prepare_enable(priv->i2so1_mclk);
> > +		if (ret) {
> > +			dev_err(card->dev, "Can't enable mclk, err:
> > %d\n", ret);
> 
> The error message can be more specific.  "Cannot enable i2so1" for
> example.
> 
OK.

> > +			return ret;
> > +		}
> 
> Also, I would suggest move dev_dbg() later than
> clk_prepare_enable().  Otherwise, it could fail to prepare or enable
> but still can see "Enable i2so1" message.
> 
Yes, that's correct.
I will move it to a proper position.

> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return ret;
> 
> The function doesn't use any gotos.  To be concise, "return 0;".
OK.

> 
> > @@ -1072,6 +1119,19 @@ static int
> > mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
> >  		return -EINVAL;
> >  	}
> >  
> > +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> > +	if (IS_ERR(priv->i2so1_mclk)) {
> > +		ret = PTR_ERR(priv->i2so1_mclk);
> > +		if (ret == -ENOENT) {
> > +			dev_dbg(&pdev->dev,
> > +				"Failed to get i2so1_mclk, defer
> > probe\n");
> > +			return -EPROBE_DEFER;
> > +		}
> 
> Does devm_clk_get_optional() could make the block more concise?

Even though we use devm_clk_get_optional, we still have to handle the
(-ENOENT) case in probe function. In my opinion, original
implementation could be kept.

> 
> > +
> > +		dev_err(&pdev->dev, "Failed to get i2so1_mclk,
> > err:%d\n", ret);
> 
> If devm_clk_get() is possible to return -EPROBE_DEFER too, use
> dev_err_probe().
Ok.

> 
> > --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> > +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> 
> [...]
> > +static int mt8195_set_bias_level_post(struct snd_soc_card *card,
> > +	struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level
> > level)
> > +{
> > +	struct snd_soc_component *component = dapm->component;
> > +	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
> > +		snd_soc_card_get_drvdata(card);
> > +	int ret = 0;
> 
> Ditto, see comments above.
> 
OK.

> > +
> > +	/*
> > +	 * It's required to control mclk directly in the
> > set_bias_level_post
> > +	 * function for rt5682 and rt5682s codec, or the unexpected pop
> > happens
> > +	 * at the end of playback.
> > +	 */
> > +	if (!component ||
> > +	    (strcmp(component->name, RT5682_DEV0_NAME) &&
> > +	    strcmp(component->name, RT5682S_DEV0_NAME)))
> > +		return 0;
> > +
> > +	if (IS_ERR(priv->i2so1_mclk))
> > +		return 0;
> 
> Ditto, see comments above.
> 
OK.

> > +
> > +	switch (level) {
> > +	case SND_SOC_BIAS_OFF:
> > +		if (!__clk_is_enabled(priv->i2so1_mclk))
> > +			return 0;
> > +
> > +		dev_dbg(card->dev, "Disable i2so1");
> > +		clk_disable_unprepare(priv->i2so1_mclk);
> > +		break;
> > +	case SND_SOC_BIAS_ON:
> > +		dev_dbg(card->dev, "Enable i2so1");
> > +		ret = clk_prepare_enable(priv->i2so1_mclk);
> > +		if (ret) {
> > +			dev_err(card->dev, "Can't enable mclk, err:
> > %d\n", ret);
> > +			return ret;
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> 
> Ditto, see comments above for the block.
> 
OK.

> > +
> > +	return ret;
> 
> Ditto, see comments above.
> 
OK.

> > @@ -1285,6 +1326,19 @@ static int
> > mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
> >  		return -EINVAL;
> >  	}
> >  
> > +	priv->i2so1_mclk = devm_clk_get(&pdev->dev, "i2so1_mclk");
> > +	if (IS_ERR(priv->i2so1_mclk)) {
> > +		ret = PTR_ERR(priv->i2so1_mclk);
> > +		if (ret == -ENOENT) {
> > +			dev_dbg(&pdev->dev,
> > +				"Failed to get i2so1_mclk, defer
> > probe\n");
> > +			return -EPROBE_DEFER;
> > +		}
> > +
> > +		dev_err(&pdev->dev, "Failed to get i2so1_mclk,
> > err:%d\n", ret);
> > +		return ret;
> > +	}
> 
> Ditto, see comments above for the block.
OK.


