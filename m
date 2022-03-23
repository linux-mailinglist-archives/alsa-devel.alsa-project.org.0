Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD64E4DF3
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 09:16:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E571717;
	Wed, 23 Mar 2022 09:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E571717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648023419;
	bh=zlH/E8AmgMnOewGytys/a1bUvMApbPcbD3WMwmDKmuk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPgFEi9eNZ2+dcpwvqsnPgJU6YRHHJxKbCttvt+6f58YJt8wlkx8I0BLp00H7RQC8
	 rW1BTxLHGqYhFKuGcCNyn2fUwFYeUFz72iV9tT6GEZKJKBVYS3lg63IbHwzZ3Obv+p
	 Kcfd+bEE65irKLzpw/YKXA+s9Caq/7Iemt0ygSic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A49F80518;
	Wed, 23 Mar 2022 09:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C2B1F80517; Wed, 23 Mar 2022 09:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEF5BF80515
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 09:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF5BF80515
X-UUID: 3edca82acd214e58a28fec002b336d42-20220323
X-UUID: 3edca82acd214e58a28fec002b336d42-20220323
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 129077964; Wed, 23 Mar 2022 16:15:32 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Mar 2022 16:15:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 16:15:31 +0800
Message-ID: <1d3f9ddc742c8af2e4613e6e1008b4a63b33e244.camel@mediatek.com>
Subject: Re: [PATCH v3 2/6] ASoC: mediatek: mt8195: merge machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Date: Wed, 23 Mar 2022 16:15:30 +0800
In-Reply-To: <YjiVySElUQZnJG9C@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-3-trevor.wu@mediatek.com>
 <YjiVySElUQZnJG9C@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Mon, 2022-03-21 at 23:12 +0800, Tzung-Bi Shih wrote:
> On Mon, Mar 21, 2022 at 03:23:08PM +0800, Trevor Wu wrote:
> > -config SND_SOC_MT8195_MT6359_RT1019_RT5682
> > -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019
> > RT5682 codec"
> > -	depends on I2C && GPIOLIB
> > -	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
> > -	select SND_SOC_MT6359
> > -	select SND_SOC_RT1015P
> > -	select SND_SOC_RT5682_I2C
> > -	select SND_SOC_RT5682S
> > -	select SND_SOC_DMIC
> > -	select SND_SOC_HDMI_CODEC
> > -	help
> > -	  This adds ASoC driver for Mediatek MT8195 boards
> > -	  with the MT6359 RT1019 RT5682 audio codec.
> > -	  Select Y if you have such device.
> > -	  If unsure select "N".
> > -
> > -config SND_SOC_MT8195_MT6359_RT1011_RT5682
> > -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011
> > RT5682 codec"
> > +config SND_SOC_MT8195_MT6359
> > +	tristate "ASoC Audio driver for MT8195 with MT6359 and I2S
> > codec"
> 
> s/codec/codecs/.

OK.
> 
> >  	help
> > -	  This adds ASoC driver for Mediatek MT8195 boards
> > -	  with the MT6359 RT1011 RT5682 audio codec.
> > +	  This adds support for ASoC machine driver for Mediatek
> > MT8195 
> > +	  boards with the MT6359 and other I2S audio codec.
> 
> s/codec/codecs/.
OK.

> 
> > diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-
> > rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
> 
> [...]
> > +static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream
> > *substream,
> > +					struct snd_pcm_hw_params
> > *params)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd =
> > asoc_substream_to_rtd(substream);
> > +	struct snd_soc_dai *codec_dai;
> > +	struct snd_soc_card *card = rtd->card;
> > +	int srate, i, ret = 0;
> > +
> > +	srate = params_rate(params);
> > +
> > +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> > +		ret = snd_soc_dai_set_pll(codec_dai, 0,
> > RT1011_PLL1_S_BCLK,
> > +					  64 * srate, 256 * srate);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "codec_dai clock not
> > set\n");
> > +			return ret;
> > +		}
> > +
> > +		ret = snd_soc_dai_set_sysclk(codec_dai,
> > +					     RT1011_FS_SYS_PRE_S_PLL1,
> > +					     256 * srate,
> > SND_SOC_CLOCK_IN);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "codec_dai clock not
> > set\n");
> > +			return ret;
> > +		}
> > +	}
> > +	return ret;
> 
> I guess it may be just copied from mt8195-mt6359-rt1011-
> rt5682.c.  However, it
> is good to turn the code into a better shape.  To be clear, just
> return 0 here
> so that the initialization can be removed.
> 
Yes, I copied it directly.
I will update this in v4.

> > +static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
> 
> [...]
> > +	ret = snd_soc_dapm_add_routes(&card->dapm,
> > mt8195_rt1011_routes,
> > +				      ARRAY_SIZE(mt8195_rt1011_routes))
> > ;
> > +
> > +	if (ret)
> 
> Remove the extra blank line.

OK. I didn't notice the blank line.
> 
> > +static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
> 
> [...]
> > +	ret = snd_soc_dapm_add_routes(&card->dapm,
> > mt8195_rt1019_routes,
> > +				      ARRAY_SIZE(mt8195_rt1019_routes))
> > ;
> > +
> > +	if (ret)
> 
> Remove the extra blank line.

OK.

Thanks,
Trevor

