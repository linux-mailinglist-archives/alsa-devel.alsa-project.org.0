Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C714C9C5A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 05:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849CD17E8;
	Wed,  2 Mar 2022 05:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849CD17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646194150;
	bh=t1qYoQU50coXKYgNJqR46xUcwl+KHZ23KzuV2xd/kJY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NreDGIKQ4C+WGlMc/kj0Apw+/bomep5hQjECRxY9uS1JGqh30dJw6fzxdyU/nzvRQ
	 J3YVXrb+l/3HgqFtALd9W956y5zW0FwAZA6Cwp97m6lOsleOy9W3ac9DPmbE8H9cOO
	 BRJ+C9vSDZrKydnpqWqUNAsHmBOElx0Y5sfAKWGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF4D2F8027D;
	Wed,  2 Mar 2022 05:08:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6462CF801D5; Wed,  2 Mar 2022 05:08:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4889DF80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 05:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4889DF80054
X-UUID: c5bbf587611e40539296222f6d93108a-20220302
X-UUID: c5bbf587611e40539296222f6d93108a-20220302
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1851172525; Wed, 02 Mar 2022 12:07:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 2 Mar 2022 12:07:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Mar 2022 12:07:39 +0800
Message-ID: <0b8a5c22acb87b49de0380c7cb4e49030f93d715.camel@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Date: Wed, 2 Mar 2022 12:07:39 +0800
In-Reply-To: <Yh3hcQpLngg8Pnd4@google.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
 <20220301072924.24814-3-jiaxin.yu@mediatek.com>
 <Yh3hcQpLngg8Pnd4@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

On Tue, 2022-03-01 at 17:03 +0800, Tzung-Bi Shih wrote:
> On Tue, Mar 01, 2022 at 03:29:24PM +0800, Jiaxin Yu wrote:
> > From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>
> 
> The environment didn't configure properly so that the header showed
> up.
> See [1].
> 
> [1]: 
> https://git-scm.com/docs/git-send-email#Documentation/git-send-email.txt---fromltaddressgt
> 
Ok, I will take a look at the "from: " header.

> > diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-
> > rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> 
> [...]
> > +static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682s_card = {
> > +	.name = "mt8192_mt6359_rt1015p_rt5682s",
> > +	.owner = THIS_MODULE,
> > +	.dai_link = mt8192_mt6359_dai_links,
> > +	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
> > +	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
> > +	.num_controls =
> > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
> > +	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
> > +	.num_dapm_widgets =
> > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
> > +	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
> > +	.num_dapm_routes =
> > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
> > +};
> 
> Are the two cards only different from names
> (mt8192_mt6359_rt1015p_rt5682_card vs.
> mt8192_mt6359_rt1015p_rt5682s_card)?
> 
Yes, they are only different form names.

> > @@ -1150,6 +1177,52 @@ static int mt8192_mt6359_dev_probe(struct
> > platform_device *pdev)
> >  				dai_link->num_platforms =
> >  					ARRAY_SIZE(i2s3_rt1015p_platfor
> > ms);
> >  			}
> > +		} else if (strcmp(dai_link->name, "I2S8") == 0) {
> > +			if (card == &mt8192_mt6359_rt1015_rt5682_card
> > ||
> > +			    card == &mt8192_mt6359_rt1015p_rt5682_card)
> > {
> > +				dai_link->cpus = i2s8_rt5682_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s8_rt5682_cpus);
> > +				dai_link->codecs = i2s8_rt5682_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s8_rt5682_codecs);
> > +				dai_link->platforms =
> > i2s8_rt5682_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s8_rt5682_platform
> > s);
> > +			} else if (card ==
> > &mt8192_mt6359_rt1015p_rt5682s_card) {
> > +				dai_link->cpus = i2s8_rt5682s_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s8_rt5682s_cpus);
> > +				dai_link->codecs = i2s8_rt5682s_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s8_rt5682s_codecs)
> > ;
> > +				dai_link->platforms =
> > i2s8_rt5682s_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s8_rt5682s_platfor
> > ms);
> > +			}
> > +		} else if (strcmp(dai_link->name, "I2S9") == 0) {
> > +			if (card == &mt8192_mt6359_rt1015_rt5682_card
> > ||
> > +			    card == &mt8192_mt6359_rt1015p_rt5682_card)
> > {
> > +				dai_link->cpus = i2s9_rt5682_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s9_rt5682_cpus);
> > +				dai_link->codecs = i2s9_rt5682_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s9_rt5682_codecs);
> > +				dai_link->platforms =
> > i2s9_rt5682_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s9_rt5682_platform
> > s);
> > +			} else if (card ==
> > &mt8192_mt6359_rt1015p_rt5682s_card) {
> > +				dai_link->cpus = i2s9_rt5682s_cpus;
> > +				dai_link->num_cpus =
> > +					ARRAY_SIZE(i2s9_rt5682s_cpus);
> > +				dai_link->codecs = i2s9_rt5682s_codecs;
> > +				dai_link->num_codecs =
> > +					ARRAY_SIZE(i2s9_rt5682s_codecs)
> > ;
> > +				dai_link->platforms =
> > i2s9_rt5682s_platforms;
> > +				dai_link->num_platforms =
> > +					ARRAY_SIZE(i2s9_rt5682s_platfor
> > ms);
> > +			}
> 
> After seeing the code, I am starting to wonder if the reuse is
> overkill.  If
> they (RT5682 vs. RT5682S) only have some minor differences, probably
> it could
> reuse more by:
> 
> SND_SOC_DAILINK_DEFS(i2s8, ...
> SND_SOC_DAILINK_DEFS(i2s9, ...
> 
> ...
> 
> if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
>         i2s8_codecs.name = RT5682S_DEV0_NAME;
>         i2s8_codecs.dai_name = RT5682S_CODEC_DAI;
>         ...
> }
> 
> Or even uses of_device_is_compatible() if it would like to reuse the
> struct
> snd_soc_card.
If we reuse the struct snd_soc_card, the card .name will be same.
Should I change the card .name through of_device_is_compatible()?

Maybe like below:

Remove rt5682x related words for snd_soc_card.
static struct snd_soc_card mt8192_mt6359_rt1015p_card = {
	.owner = THIS_MODULE,
	.dai_link = mt8192_mt6359_dai_links,
	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
	.controls = mt8192_mt6359_rt1015p_controls,
	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_controls),
	.dapm_widgets = mt8192_mt6359_rt1015p_widgets,
	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_widgets),
	.dapm_routes = mt8192_mt6359_rt1015p_routes,
	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_routes),
};

static const struct of_device_id mt8192_mt6359_dt_match[] = {
	{
		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
		.data = &mt8192_mt6359_rt1015_rt5682_card,
	},
	{
		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
		.data = &mt8192_mt6359_rt1015p_card,
	},
	{
		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s",
		.data = &mt8192_mt6359_rt1015p_card,
	},
	{}
};

if (of_device_is_compatible(np, "mediatek,
mt8192_mt6359_rt1015p_rt5682")) {
	card.name = "mt8192_mt6359_rt1015p_rt5682";
	...
} else if (of_device_is_compatible(np, "mediatek,
mt8192_mt6359_rt1015p_rt5682s")) {
	card.name = "mt8192_mt6359_rt1015p_rt5682s";
	...
}






