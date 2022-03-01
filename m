Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5B4C8753
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 10:05:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30451AFB;
	Tue,  1 Mar 2022 10:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30451AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646125508;
	bh=1c14S9dVNVF1VyP3FFe0N65e9c5Jwxgr+ehoV6e9Nh4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEbQRNqiQHoKqKGGBNl5ocOctkNSWZLt3sQqnKQgfyOWEoqwuiwfzcVSR8ujYkt4W
	 3yu6ocXDLEgK9bnU2BGNO283CSsWp3/7AEClgZHMGyXJS2X6tOR26Kaiq8fjaqj1ev
	 pfssGFzJPLmkoX/0Z4ZDiA3Z5tm0VErfXbvNseX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 568BAF802D2;
	Tue,  1 Mar 2022 10:04:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14A70F80054; Tue,  1 Mar 2022 10:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42606F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 10:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42606F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gD5dXXhU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1AAD1B817F9;
 Tue,  1 Mar 2022 09:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1186C340EE;
 Tue,  1 Mar 2022 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646125429;
 bh=1c14S9dVNVF1VyP3FFe0N65e9c5Jwxgr+ehoV6e9Nh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gD5dXXhUeEpUdK7hh/LestsugNYQB0olqAMDGA85MmxmdxSbaa8ZXOIKWM/2ZswUK
 xLf/XlReSOYTALDhEGkCR0pV6xgf7JEhKLhbjM7EKbXIALSoDeXUPTnV6Kp5bcUCAj
 Pz9UtyP8vv8NGM+AM6IM0VTUdqn2iSoDw9OYSpBi+B52N4oDlTHdYAzBvDS0b+mjKp
 Xd+5CA9Tugg4uwvHbkVQGI4iS4yFkYZb2cRkbPGwSZ1HOdjxyr/WRRvMuKUwgWri48
 TVoO6bSS5lESM/u0uNGB/qSpd/iWw67aaIm9iqO04J6Quh83P17qIcnpFKP9V2Z4I6
 dzEq5egneiLXQ==
Date: Tue, 1 Mar 2022 17:03:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <Yh3hcQpLngg8Pnd4@google.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
 <20220301072924.24814-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301072924.24814-3-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
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

On Tue, Mar 01, 2022 at 03:29:24PM +0800, Jiaxin Yu wrote:
> From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>

The environment didn't configure properly so that the header showed up.
See [1].

[1]: https://git-scm.com/docs/git-send-email#Documentation/git-send-email.txt---fromltaddressgt

> diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
[...]
> +static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682s_card = {
> +	.name = "mt8192_mt6359_rt1015p_rt5682s",
> +	.owner = THIS_MODULE,
> +	.dai_link = mt8192_mt6359_dai_links,
> +	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
> +	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
> +	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
> +	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
> +	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
> +	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
> +};

Are the two cards only different from names
(mt8192_mt6359_rt1015p_rt5682_card vs. mt8192_mt6359_rt1015p_rt5682s_card)?

> @@ -1150,6 +1177,52 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  				dai_link->num_platforms =
>  					ARRAY_SIZE(i2s3_rt1015p_platforms);
>  			}
> +		} else if (strcmp(dai_link->name, "I2S8") == 0) {
> +			if (card == &mt8192_mt6359_rt1015_rt5682_card ||
> +			    card == &mt8192_mt6359_rt1015p_rt5682_card) {
> +				dai_link->cpus = i2s8_rt5682_cpus;
> +				dai_link->num_cpus =
> +					ARRAY_SIZE(i2s8_rt5682_cpus);
> +				dai_link->codecs = i2s8_rt5682_codecs;
> +				dai_link->num_codecs =
> +					ARRAY_SIZE(i2s8_rt5682_codecs);
> +				dai_link->platforms = i2s8_rt5682_platforms;
> +				dai_link->num_platforms =
> +					ARRAY_SIZE(i2s8_rt5682_platforms);
> +			} else if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
> +				dai_link->cpus = i2s8_rt5682s_cpus;
> +				dai_link->num_cpus =
> +					ARRAY_SIZE(i2s8_rt5682s_cpus);
> +				dai_link->codecs = i2s8_rt5682s_codecs;
> +				dai_link->num_codecs =
> +					ARRAY_SIZE(i2s8_rt5682s_codecs);
> +				dai_link->platforms = i2s8_rt5682s_platforms;
> +				dai_link->num_platforms =
> +					ARRAY_SIZE(i2s8_rt5682s_platforms);
> +			}
> +		} else if (strcmp(dai_link->name, "I2S9") == 0) {
> +			if (card == &mt8192_mt6359_rt1015_rt5682_card ||
> +			    card == &mt8192_mt6359_rt1015p_rt5682_card) {
> +				dai_link->cpus = i2s9_rt5682_cpus;
> +				dai_link->num_cpus =
> +					ARRAY_SIZE(i2s9_rt5682_cpus);
> +				dai_link->codecs = i2s9_rt5682_codecs;
> +				dai_link->num_codecs =
> +					ARRAY_SIZE(i2s9_rt5682_codecs);
> +				dai_link->platforms = i2s9_rt5682_platforms;
> +				dai_link->num_platforms =
> +					ARRAY_SIZE(i2s9_rt5682_platforms);
> +			} else if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
> +				dai_link->cpus = i2s9_rt5682s_cpus;
> +				dai_link->num_cpus =
> +					ARRAY_SIZE(i2s9_rt5682s_cpus);
> +				dai_link->codecs = i2s9_rt5682s_codecs;
> +				dai_link->num_codecs =
> +					ARRAY_SIZE(i2s9_rt5682s_codecs);
> +				dai_link->platforms = i2s9_rt5682s_platforms;
> +				dai_link->num_platforms =
> +					ARRAY_SIZE(i2s9_rt5682s_platforms);
> +			}

After seeing the code, I am starting to wonder if the reuse is overkill.  If
they (RT5682 vs. RT5682S) only have some minor differences, probably it could
reuse more by:

SND_SOC_DAILINK_DEFS(i2s8, ...
SND_SOC_DAILINK_DEFS(i2s9, ...

...

if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
        i2s8_codecs.name = RT5682S_DEV0_NAME;
        i2s8_codecs.dai_name = RT5682S_CODEC_DAI;
        ...
}

Or even uses of_device_is_compatible() if it would like to reuse the struct
snd_soc_card.
