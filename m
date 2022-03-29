Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92F4EBC9A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 10:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B426174B;
	Wed, 30 Mar 2022 10:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B426174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648628460;
	bh=UixZDeRTrhsKgzzqeAfm88dzf7voTXF+9DAsFdXgx0E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tmllhgCnb7gOIB/LmnRN451esMcZ4CdFcbeDx0DvcIKY8ebkaPUPONE7Osm90/hyn
	 JU53pz96QQpUX6WWJ4u2/Pi3jbjpFat6p67c0bcnQVdcNi6W1NC7nGgl4/rsywxGsD
	 U9dD+2uBqhlKe43DoBNyUe15wPc0vGhgYtxtE5bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B88E4F80506;
	Wed, 30 Mar 2022 10:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 141FFF80311; Wed, 30 Mar 2022 00:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D894DF80121
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 00:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D894DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="dyeLb4CU"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id BDAD71F441AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648593008;
 bh=UixZDeRTrhsKgzzqeAfm88dzf7voTXF+9DAsFdXgx0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dyeLb4CUcnoS6OTYufOPl9rds549X/ysJ1Nkf+RZtUFca1Wj4/mSy5TeTvJjyrtTV
 h8zlfY5lMwt8dNnnPWBZBQEnccS7ul1GfzKC1ojCH8NgTaEKTPR/3wvFBxFwOlJw27
 Njd0g1n7M7+95c+9BodNYbmVV4wF3nSyF4m98mg4irkgx7GITVIeJLDgeMYsIIwjEU
 U4YvwVgVfZuutU/VXE2Z+TdBIlqcUPpWphH8igtk0YQw9QzKmSmxawnpSX+M5/9YUQ
 lkzlRUYWtAK2qKXyht+fHU0jFkWJDV2/2PhPCRx37pRxzJJiYlONUwevIUMPLNh92F
 S0x7VC5ezhgvQ==
Date: Tue, 29 Mar 2022 18:30:02 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220329223002.uo7kiemopkh7ak4x@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220324064511.10665-3-jiaxin.yu@mediatek.com>
X-Mailman-Approved-At: Wed, 30 Mar 2022 10:19:17 +0200
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
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

Hi Jiaxin,

On Thu, Mar 24, 2022 at 02:45:09PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt105p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 108 ++++++++++--------
>  1 file changed, 59 insertions(+), 49 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> index ee91569c0911..837c2ccd5b3d 100644
> --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> @@ -604,17 +604,9 @@ SND_SOC_DAILINK_DEFS(i2s2,
>  		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
>  		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
>  
> -SND_SOC_DAILINK_DEFS(i2s3_rt1015,
> +SND_SOC_DAILINK_DEFS(i2s3,
>  		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
> -		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
> -						   RT1015_CODEC_DAI),
> -					COMP_CODEC(RT1015_DEV1_NAME,
> -						   RT1015_CODEC_DAI)),
> -		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> -
> -SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
> -		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
> -		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
> +		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
>  		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
>  
>  SND_SOC_DAILINK_DEFS(i2s5,
> @@ -929,6 +921,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
>  		.dpcm_playback = 1,
>  		.ignore_suspend = 1,
>  		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
> +		SND_SOC_DAILINK_REG(i2s3),
>  	},
>  	{
>  		.name = "I2S5",
> @@ -1100,55 +1093,64 @@ static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
>  	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
>  };
>  
> +static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
> +					  struct snd_soc_dai_link *link,
> +					  struct device_node *node,
> +					  char *link_name)
> +{
> +	int ret;
> +
> +	if (node && strcmp(link->name, link_name) == 0) {
> +		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
> +		if (ret < 0) {
> +			dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card;
> -	struct device_node *platform_node, *hdmi_codec;
> +	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
>  	int ret, i;
>  	struct snd_soc_dai_link *dai_link;
>  	struct mt8192_mt6359_priv *priv;
>  
> -	platform_node = of_parse_phandle(pdev->dev.of_node,
> -					 "mediatek,platform", 0);
> -	if (!platform_node) {
> -		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
> +	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
> +	if (!card)
>  		return -EINVAL;
> +	card->dev = &pdev->dev;
> +
> +	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
> +	if (!platform_node) {
> +		ret = -EINVAL;
> +		dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
> +		goto err_platform_node;
>  	}
>  
> -	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
> -	if (!card) {
> +	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
> +	if (!hdmi_codec) {
>  		ret = -EINVAL;
> -		goto put_platform_node;
> +		dev_err_probe(&pdev->dev, ret, "Property 'hdmi-codec' missing or invalid\n");
> +		goto err_hdmi_codec;

You're making hdmi-codec a required property, since now the driver fails to
probe without it. Is it really required though? The driver code still checks for
the presence of hdmi_codec before using it, so shouldn't it be fine to let it be
optional?

If it is really required now though, then I guess at least the dt-binding should
be updated accordingly. (Although I think this would technically break the ABI?)

Thanks,
Nícolas

>  	}
> -	card->dev = &pdev->dev;
>  
> -	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
> -				      "mediatek,hdmi-codec", 0);
> +	speaker_codec = of_get_child_by_name(pdev->dev.of_node, "speaker-codecs");
> +	if (!speaker_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(&pdev->dev, ret, "Property 'speaker-codecs' missing or invalid\n");
> +		goto err_speaker_codec;
> +	}
>  
>  	for_each_card_prelinks(card, i, dai_link) {
> -		if (strcmp(dai_link->name, "I2S3") == 0) {
> -			if (card == &mt8192_mt6359_rt1015_rt5682_card) {
> -				dai_link->ops = &mt8192_rt1015_i2s_ops;
> -				dai_link->cpus = i2s3_rt1015_cpus;
> -				dai_link->num_cpus =
> -					ARRAY_SIZE(i2s3_rt1015_cpus);
> -				dai_link->codecs = i2s3_rt1015_codecs;
> -				dai_link->num_codecs =
> -					ARRAY_SIZE(i2s3_rt1015_codecs);
> -				dai_link->platforms = i2s3_rt1015_platforms;
> -				dai_link->num_platforms =
> -					ARRAY_SIZE(i2s3_rt1015_platforms);
> -			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card) {
> -				dai_link->cpus = i2s3_rt1015p_cpus;
> -				dai_link->num_cpus =
> -					ARRAY_SIZE(i2s3_rt1015p_cpus);
> -				dai_link->codecs = i2s3_rt1015p_codecs;
> -				dai_link->num_codecs =
> -					ARRAY_SIZE(i2s3_rt1015p_codecs);
> -				dai_link->platforms = i2s3_rt1015p_platforms;
> -				dai_link->num_platforms =
> -					ARRAY_SIZE(i2s3_rt1015p_platforms);
> -			}
> +		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
> +		if (ret) {
> +			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
> +				      dai_link->name);
> +			goto err_probe;
>  		}
>  
>  		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
> @@ -1156,6 +1158,9 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  			dai_link->ignore = 0;
>  		}
>  
> +		if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
> +			dai_link->ops = &mt8192_rt1015_i2s_ops;
> +
>  		if (!dai_link->platforms->name)
>  			dai_link->platforms->of_node = platform_node;
>  	}
> @@ -1163,22 +1168,27 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv) {
>  		ret = -ENOMEM;
> -		goto put_hdmi_codec;
> +		goto err_probe;
>  	}
>  	snd_soc_card_set_drvdata(card, priv);
>  
>  	ret = mt8192_afe_gpio_init(&pdev->dev);
>  	if (ret) {
> -		dev_err(&pdev->dev, "init gpio error %d\n", ret);
> -		goto put_hdmi_codec;
> +		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
> +		goto err_probe;
>  	}
>  
>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret)
> +		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
>  
> -put_hdmi_codec:
> +err_probe:
> +	of_node_put(speaker_codec);
> +err_speaker_codec:
>  	of_node_put(hdmi_codec);
> -put_platform_node:
> +err_hdmi_codec:
>  	of_node_put(platform_node);
> +err_platform_node:
>  	return ret;
>  }
>  
> -- 
> 2.18.0
> 
> 
