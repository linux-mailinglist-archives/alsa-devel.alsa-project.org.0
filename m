Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A584E2B8F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 16:13:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9ED1171D;
	Mon, 21 Mar 2022 16:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9ED1171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647875607;
	bh=PrKpKY8QnE0N8PiVT+LSfP5YvP0HN8p+1UyF5N/GqUc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hyi0+tfpdcEMzgPo6LBtqeYog7yurGts2cJu2A9s6jJBi3yKw4HTzFtTiMHBTJycc
	 FGiz8uGafyWKu/cG4zGL/tUWg466Pg+LTXjUV0c52cTupUjddPsYNbYvTlqFQmnehB
	 6jVYhPDNezqSO8YuVNZ3EmCWt7XHF5aIR3R8wvWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B030F80238;
	Mon, 21 Mar 2022 16:12:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CCD4F80227; Mon, 21 Mar 2022 16:12:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED263F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 16:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED263F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nZGIoPL4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23EFEB81744;
 Mon, 21 Mar 2022 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1DBC340E8;
 Mon, 21 Mar 2022 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647875533;
 bh=PrKpKY8QnE0N8PiVT+LSfP5YvP0HN8p+1UyF5N/GqUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZGIoPL4eXPQhAqTlxO0JXw9JOtv+HL+2arpXrhi7QOLM3NYr/bydfX9fCC8lZuJW
 /bAEmtKZ5c4phI1Bezw4VJfeeROoozKZ641TNH2vSbYFIwXDxoSAFIY01oJYCbVkty
 eXRDgT8EjiJoRixrL+kkIS1GxkHSpg8+ibFbcF8F9JqmLo75HBE5SENbeCrS7vzD36
 zZEuNvaAnD3PQuVW47pxbF+c8UhSVKS/yz1ewKwf1cKV+DIeDT6n9YY2+CbrNjoiKd
 lsSEEv6b22IPmsRhQm5UtJLvLttp++37zLoFEbjF6zuuUgIFHw6XeOP8wlrlYzXGcd
 DBIRjYdVYF/og==
Date: Mon, 21 Mar 2022 23:12:09 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 2/6] ASoC: mediatek: mt8195: merge machine driver
Message-ID: <YjiVySElUQZnJG9C@google.com>
References: <20220321072312.14972-1-trevor.wu@mediatek.com>
 <20220321072312.14972-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321072312.14972-3-trevor.wu@mediatek.com>
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

On Mon, Mar 21, 2022 at 03:23:08PM +0800, Trevor Wu wrote:
> -config SND_SOC_MT8195_MT6359_RT1019_RT5682
> -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1019 RT5682 codec"
> -	depends on I2C && GPIOLIB
> -	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
> -	select SND_SOC_MT6359
> -	select SND_SOC_RT1015P
> -	select SND_SOC_RT5682_I2C
> -	select SND_SOC_RT5682S
> -	select SND_SOC_DMIC
> -	select SND_SOC_HDMI_CODEC
> -	help
> -	  This adds ASoC driver for Mediatek MT8195 boards
> -	  with the MT6359 RT1019 RT5682 audio codec.
> -	  Select Y if you have such device.
> -	  If unsure select "N".
> -
> -config SND_SOC_MT8195_MT6359_RT1011_RT5682
> -	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011 RT5682 codec"
> +config SND_SOC_MT8195_MT6359
> +	tristate "ASoC Audio driver for MT8195 with MT6359 and I2S codec"

s/codec/codecs/.

>  	help
> -	  This adds ASoC driver for Mediatek MT8195 boards
> -	  with the MT6359 RT1011 RT5682 audio codec.
> +	  This adds support for ASoC machine driver for Mediatek MT8195 
> +	  boards with the MT6359 and other I2S audio codec.

s/codec/codecs/.

> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
[...]
> +static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_card *card = rtd->card;
> +	int srate, i, ret = 0;
> +
> +	srate = params_rate(params);
> +
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
> +					  64 * srate, 256 * srate);
> +		if (ret < 0) {
> +			dev_err(card->dev, "codec_dai clock not set\n");
> +			return ret;
> +		}
> +
> +		ret = snd_soc_dai_set_sysclk(codec_dai,
> +					     RT1011_FS_SYS_PRE_S_PLL1,
> +					     256 * srate, SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(card->dev, "codec_dai clock not set\n");
> +			return ret;
> +		}
> +	}
> +	return ret;

I guess it may be just copied from mt8195-mt6359-rt1011-rt5682.c.  However, it
is good to turn the code into a better shape.  To be clear, just return 0 here
so that the initialization can be removed.

> +static int mt8195_rt1011_init(struct snd_soc_pcm_runtime *rtd)
[...]
> +	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt1011_routes,
> +				      ARRAY_SIZE(mt8195_rt1011_routes));
> +
> +	if (ret)

Remove the extra blank line.

> +static int mt8195_rt1019_init(struct snd_soc_pcm_runtime *rtd)
[...]
> +	ret = snd_soc_dapm_add_routes(&card->dapm, mt8195_rt1019_routes,
> +				      ARRAY_SIZE(mt8195_rt1019_routes));
> +
> +	if (ret)

Remove the extra blank line.
