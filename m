Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D6C1FC4BC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 05:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A2A167A;
	Wed, 17 Jun 2020 05:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A2A167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592364849;
	bh=HPVefkGvGMXpMEZtqKUTAHFjNCtMYqdXA3NU1SRqdZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxSbvEAnbLC3M/hsOe3sFxaf2qUYUnbxKNnOhTkRg5idzhSypz8EF9nF3rX5p0iPK
	 9bEIRa7BuIP4dSTYvFHtZ8bhpqcnDWI0LFv3jJap/rA0pk97JKpqdKI2ILiqsI2bkc
	 d+WMFTBfQ5pCtbaIsnP3vZm1r93/B+NFcLVHP1Uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16BA4F80162;
	Wed, 17 Jun 2020 05:32:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 462E0F80162; Wed, 17 Jun 2020 05:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEE2F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 05:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEE2F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ftQAHhnW"
Received: by mail-qt1-x842.google.com with SMTP id d27so505760qtg.4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 20:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzA+ElcDbnifqfzX8lfOg2mPfYscDQJ4/Xb5PE+7lMg=;
 b=ftQAHhnW0hzD4YpGdWc0LllO2OMD/jfP3C4MQqdKOT5C7eeHNFuf4K+O4toru/tGfa
 M0ivB23w/gyeywiGVuCZ3kCavIsEUJxW2YyS/g0DOG4+iW+DvSMZLCj5gblEB0Co3h93
 O5KmfqxvIQC+AZFf7dtDsayhkTtx4Gjtpik3xLJbdQ47I/AO2eQqNDg04oYiDPxo4zF5
 wvphcCLw4AsFpffOfDBt2aD5MeJ8v8EDC6Zz/XhkBL3rvmf7ktHDmE4tH4D8JkXS6fU2
 qvJz80e1pU8aBXdOeY3q4NtoHG9yuQorBt2J57jYGQumcjXumzorN4FSkwDG8AlEhqBC
 2MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzA+ElcDbnifqfzX8lfOg2mPfYscDQJ4/Xb5PE+7lMg=;
 b=OO7q+T8Wp5Ps+uweQvCF0w3gxyktY9YwLp5nJYPkvA453q/Wk3wyFa93BbkEcuuDLX
 FKqVNW8kkeU5r2aOCtfTMQThRFJCYnmnx48/NSwdlXgds2m8NruFn8M8btBzcvYrBzw9
 77rwgK30x41SrqcqTIx4oR8gjjacwwYHUDBDH/QivPcoBkqsqicHmirairWrtCHg2CuD
 t9O125P4A06b9a77cCQ2n+MIVCKPJ1XLlq/rFBkXDShyeMKWFqnS9YwJlvRdHqFYu5sc
 a9PsEgWnL8cek43XBTIym6w46CJDEFQuujDo3BUMjPP9awWuw81GjpEfnV6FGBc6NbyL
 bAEw==
X-Gm-Message-State: AOAM533ZBFb/kQyORK274F4XSj3s+t9dRzokWdRs1IkQkffj4ecj9HCJ
 Xpkiw45seuegHiQEh2DO67ZMqGNjpu6m1bA6NJs=
X-Google-Smtp-Source: ABdhPJyDsNi9Q52RPZTC9rfPswpXtaMmRaUOjgRU4MMGl6dorrqU82mtSiCqR9s3ZZfHZZvEgOKG74qt9+Wv16UivMo=
X-Received: by 2002:ac8:f47:: with SMTP id l7mr24311236qtk.292.1592364729462; 
 Tue, 16 Jun 2020 20:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <1592292637-25734-1-git-send-email-shengjiu.wang@nxp.com>
 <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
 <20200617004845.GB19896@Asurada-Nvidia>
In-Reply-To: <20200617004845.GB19896@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Jun 2020 11:31:58 +0800
Message-ID: <CAA+D8AN_Djr_OTXBWJbymtUY7pjTV_VKKiqwRBqQ8cxo4USgCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl-asoc-card: Add MQS support
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Jun 17, 2020 at 8:50 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Jun 16, 2020 at 03:30:37PM +0800, Shengjiu Wang wrote:
> > The MQS codec isn't an i2c device, so add a new platform device for it.
> >
> > MQS only support playback, so add a new audio map.
> >
> > Add there maybe "model" property or no "audio-routing" property insertions
>
> "Add" => "And"
>
> > devicetree, so add some enhancement for these two property.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl-asoc-card.c | 70 ++++++++++++++++++++++++++---------
> >  1 file changed, 52 insertions(+), 18 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 00be73900888..2ac8cb9ddd10 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
>
> > @@ -482,6 +489,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >  {
> >       struct device_node *cpu_np, *codec_np, *asrc_np;
> >       struct device_node *np = pdev->dev.of_node;
> > +     struct platform_device *codec_pdev = NULL; /* used for non i2c device*/
>
> Having both codec_pdev and codec_dev duplicates things. Actually
> only a couple of places really need "codec_dev" -- most of them
> need codec_dev->dev pointer instead. So we could have a cleanup:
>
> -       struct i2c_client *codec_dev;
> +       struct device *codec_dev = NULL;
>
> > @@ -512,10 +520,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       }
> >
> >       codec_np = of_parse_phandle(np, "audio-codec", 0);
> > -     if (codec_np)
> > +     if (codec_np) {
> >               codec_dev = of_find_i2c_device_by_node(codec_np);
> > -     else
> > +             if (!codec_dev)
> > +                     codec_pdev = of_find_device_by_node(codec_np);
> > +     } else {
> >               codec_dev = NULL;
> > +     }
>
> Here can have something like (feel free to simplify):
>
>         if (codec_np) {
>                 struct platform_device *codec_pdev;
>                 struct i2c_client *codec_i2c;
>
>                 codec_i2c = of_find_i2c_device_by_node(codec_np);
>                 if (codec_i2c)
>                         codec_dev = &codec_i2c->dev;
>
>                 if (!codec_dev) {
>                         codec_pdev = of_find_device_by_node(codec_np);
>                         codec_dev = &codec_pdev->dev;
>                 }
>         }
> >       asrc_np = of_parse_phandle(np, "audio-asrc", 0);
> >       if (asrc_np)
> > @@ -525,6 +536,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       if (codec_dev) {
> >               struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
>
> Then here:
>
> -               struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
> +               struct clk *codec_clk = clk_get(codec_dev, NULL);
>
> > @@ -538,6 +556,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       /* Assign a default DAI format, and allow each card to overwrite it */
> >       priv->dai_fmt = DAI_FMT_BASE;
> >
> > +     memcpy(priv->dai_link, fsl_asoc_card_dai,
> > +            sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));
>
> > @@ -573,13 +596,25 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >               codec_dai_name = "ac97-hifi";
> >               priv->card.set_bias_level = NULL;
> >               priv->dai_fmt = SND_SOC_DAIFMT_AC97;
> > +             priv->card.dapm_routes = audio_map_ac97;
> > +             priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_ac97);
> > +     } else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
> > +             codec_dai_name = "fsl-mqs-dai";
> > +             priv->card.set_bias_level = NULL;
> > +             priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
> > +                             SND_SOC_DAIFMT_CBS_CFS |
> > +                             SND_SOC_DAIFMT_NB_NF;
> > +             priv->dai_link[1].dpcm_playback = 1;
> > +             priv->dai_link[2].dpcm_playback = 1;
>
> dpcm_playback = 1? That's the default value in fsl_asoc_card_dai.

ah,  should be dpcm_capture = 0.

>
> > @@ -601,19 +636,18 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >               priv->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
> >       }
> >
> > -     snprintf(priv->name, sizeof(priv->name), "%s-audio",
> > -              fsl_asoc_card_is_ac97(priv) ? "ac97" :
> > -              codec_dev->name);
> > -
> >       /* Initialize sound card */
> >       priv->pdev = pdev;
> >       priv->card.dev = &pdev->dev;
> > -     priv->card.name = priv->name;
> > +     ret = snd_soc_of_parse_card_name(&priv->card, "model");
> > +     if (ret) {
> > +             snprintf(priv->name, sizeof(priv->name), "%s-audio",
> > +                      fsl_asoc_card_is_ac97(priv) ? "ac97" :
> > +                      (codec_dev ? codec_dev->name : codec_pdev->name));
>
> We can just use dev_name() if codec_dev is struct device *
> Or having a codec_dev_name to cache codec_pdev/i2c->name.
>
> > -     ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> > -             goto asrc_fail;
> > +     if (of_property_read_bool(np, "audio-routing")) {
> > +             ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> > +                     goto asrc_fail;
>
> Hmm...audio-routing is a required property in DT binding doc.
> So you might need to update that too.

will update them in v2.

best regards
wang shengjiu
