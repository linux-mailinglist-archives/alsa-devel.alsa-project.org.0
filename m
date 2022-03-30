Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396034EC814
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 17:21:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C93711A28;
	Wed, 30 Mar 2022 17:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C93711A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648653710;
	bh=62VOmuT6t0x2pqTpy3t9E42OjHWjGuZ/ZV9Yo+IzaOQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaCHwAD8mMgiZumm/e4vstXlF67+CWqWoXHyeCbr48jLhT7juvA+kxVtTLbcjXDrD
	 J7PJ8EFU0W5Pnu5MWmYYVLIuvWMwJ+/xjdiGCz2bAJPL1CtIJlbUX0vN8dJcgWhvGz
	 i7bYNkVK3Ub3WiahwoS2hZUfz5GARIFfSuKvFad0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BF0F8025A;
	Wed, 30 Mar 2022 17:20:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F5BF800F2; Wed, 30 Mar 2022 17:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B316F800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 17:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B316F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="dw1SxPbk"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 112231F45044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648653635;
 bh=62VOmuT6t0x2pqTpy3t9E42OjHWjGuZ/ZV9Yo+IzaOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dw1SxPbk+AGfAp47BCkrkLPByFHQ0a5eeUwM5pxBFtLh/cUDa98YhrETr8hDjVNU+
 OwIqaSyxottFSq7HlSZbfNmN6j9YP26sIvygcl7t1Ch005K41XymeHYhNcRBQuGkeB
 X+V2UOdoj1Y9M2NusjzWJ8qyfI325cEkv+fgg4oR+wExH1OPn6fPy68+HRxnRBUmZA
 HK+TgH0Fjcy1Z04U351GLD5OqfPqokDCmj0WLck8JzdE4aefM2+gDDj0ATAsYwrDkL
 UJp5mPrOgtge7jmP2Fy+L9pBgUVMIofsLwHzgM47GBilcBA9KQTi7JAx+hRDW6O0oF
 UzEWkoXAAV6LQ==
Date: Wed, 30 Mar 2022 11:20:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <20220330152026.6nuigsldx46lue44@notapiano>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-3-jiaxin.yu@mediatek.com>
 <20220329223002.uo7kiemopkh7ak4x@notapiano>
 <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dee3fbb7c9f0c3e1f11143db1d6fc4381cab827f.camel@mediatek.com>
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

On Wed, Mar 30, 2022 at 10:33:06AM +0800, Jiaxin Yu wrote:
> On Tue, 2022-03-29 at 18:30 -0400, Nícolas F. R. A. Prado wrote:
> > Hi Jiaxin,
> > 
> > On Thu, Mar 24, 2022 at 02:45:09PM +0800, Jiaxin Yu wrote:
> > > MT8192 platform will use rt1015 or rt105p codec, so through the
> > > snd_soc_of_get_dai_link_codecs() to complete the configuration
> > > of dai_link's codecs.
> > > 
> > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > ---
> > >  .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 108 ++++++++++--
> > > ------
> > >  1 file changed, 59 insertions(+), 49 deletions(-)
> > > 
> > > diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-
> > > rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> > > index ee91569c0911..837c2ccd5b3d 100644
> > > --- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> > > +++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
> > > @@ -604,17 +604,9 @@ SND_SOC_DAILINK_DEFS(i2s2,
> > >  		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
> > >  		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > >  
> > > -SND_SOC_DAILINK_DEFS(i2s3_rt1015,
> > > +SND_SOC_DAILINK_DEFS(i2s3,
> > >  		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
> > > -		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
> > > -						   RT1015_CODEC_DAI),
> > > -					COMP_CODEC(RT1015_DEV1_NAME,
> > > -						   RT1015_CODEC_DAI)),
> > > -		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > > -
> > > -SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
> > > -		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
> > > -		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
> > > +		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
> > >  		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > >  
> > >  SND_SOC_DAILINK_DEFS(i2s5,
> > > @@ -929,6 +921,7 @@ static struct snd_soc_dai_link
> > > mt8192_mt6359_dai_links[] = {
> > >  		.dpcm_playback = 1,
> > >  		.ignore_suspend = 1,
> > >  		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
> > > +		SND_SOC_DAILINK_REG(i2s3),
> > >  	},
> > >  	{
> > >  		.name = "I2S5",
> > > @@ -1100,55 +1093,64 @@ static struct snd_soc_card
> > > mt8192_mt6359_rt1015p_rt5682_card = {
> > >  	.num_dapm_routes =
> > > ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
> > >  };
> > >  
> > > +static int mt8192_mt6359_card_set_be_link(struct snd_soc_card
> > > *card,
> > > +					  struct snd_soc_dai_link
> > > *link,
> > > +					  struct device_node *node,
> > > +					  char *link_name)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (node && strcmp(link->name, link_name) == 0) {
> > > +		ret = snd_soc_of_get_dai_link_codecs(card->dev, node,
> > > link);
> > > +		if (ret < 0) {
> > > +			dev_err_probe(card->dev, ret, "get dai link
> > > codecs fail\n");
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
> > >  {
> > >  	struct snd_soc_card *card;
> > > -	struct device_node *platform_node, *hdmi_codec;
> > > +	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
> > >  	int ret, i;
> > >  	struct snd_soc_dai_link *dai_link;
> > >  	struct mt8192_mt6359_priv *priv;
> > >  
> > > -	platform_node = of_parse_phandle(pdev->dev.of_node,
> > > -					 "mediatek,platform", 0);
> > > -	if (!platform_node) {
> > > -		dev_err(&pdev->dev, "Property 'platform' missing or
> > > invalid\n");
> > > +	card = (struct snd_soc_card *)of_device_get_match_data(&pdev-
> > > >dev);
> > > +	if (!card)
> > >  		return -EINVAL;
> > > +	card->dev = &pdev->dev;
> > > +
> > > +	platform_node = of_parse_phandle(pdev->dev.of_node,
> > > "mediatek,platform", 0);
> > > +	if (!platform_node) {
> > > +		ret = -EINVAL;
> > > +		dev_err_probe(&pdev->dev, ret, "Property 'platform'
> > > missing or invalid\n");
> > > +		goto err_platform_node;
> > >  	}
> > >  
> > > -	card = (struct snd_soc_card *)of_device_get_match_data(&pdev-
> > > >dev);
> > > -	if (!card) {
> > > +	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
> > > "mediatek,hdmi-codec", 0);
> > > +	if (!hdmi_codec) {
> > >  		ret = -EINVAL;
> > > -		goto put_platform_node;
> > > +		dev_err_probe(&pdev->dev, ret, "Property 'hdmi-codec'
> > > missing or invalid\n");
> > > +		goto err_hdmi_codec;
> > 
> > You're making hdmi-codec a required property, since now the driver
> > fails to
> > probe without it. Is it really required though? The driver code still
> > checks for
> > the presence of hdmi_codec before using it, so shouldn't it be fine
> > to let it be
> > optional?
> > 
> > If it is really required now though, then I guess at least the dt-
> > binding should
> > be updated accordingly. (Although I think this would technically
> > break the ABI?)
> > 
> > Thanks,
> > Nícolas
> 
> Hi Nícolas,
> 
> Thanks for your comment. Indeed I made hdmi-codec a required property,
> because it is a must in this machine driver. I prefer to report errors
> during the registration rather than during the use.

But what do you mean that it is required in this machine driver? The code checks
for presence of hdmi_codec and ignores it if it's not set, so it does really
seem optional to me. Also, I have tested this driver on mt8192-asurada-spherion
without hdmi-codec set in the DT and the speaker and headphone sound works just
fine.

Besides, there might be machines using this driver that don't support HDMI, and
requiring an hdmi-codec in the DT for them would not make any sense. So keeping
hdmi-codec as optional seems like the most sensible solution to me, really.

Thanks,
Nícolas

> 
> So I'd like to take your second suggestion. I need to update dt-binding 
> that set hdmi-codec as required property.
> 
> "(Although I think this would technicallybreak the ABI?)"
> ==> I can't understand this question, could you help explain it in more
> detail.
> 
> Thanks,
> Jiaxin.Yu
> 
> > 
> >  	}
> > > -	card->dev = &pdev->dev;
> > >  
> > > -	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
> > > -				      "mediatek,hdmi-codec", 0);
> > > +	speaker_codec = of_get_child_by_name(pdev->dev.of_node,
> > > "speaker-codecs");
> > > +	if (!speaker_codec) {
> > > +		ret = -EINVAL;
> > > +		dev_err_probe(&pdev->dev, ret, "Property 'speaker-
> > > codecs' missing or invalid\n");
> > > +		goto err_speaker_codec;
> > > +	}
> > >  
> > 
> snip...
> > >  
> > > -put_hdmi_codec:
> > > +err_probe:
> > > +	of_node_put(speaker_codec);
> > > +err_speaker_codec:
> > >  	of_node_put(hdmi_codec);
> > > -put_platform_node:
> > > +err_hdmi_codec:
> > >  	of_node_put(platform_node);
> > > +err_platform_node:
> > >  	return ret;
> > >  }
> > >  
> > > -- 
> > > 2.18.0
> > > 
> > > 
> 
