Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2660FB9
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2019 12:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69161663;
	Sat,  6 Jul 2019 12:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69161663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562407316;
	bh=rCSoErHSc+EBOwdbtl5WJx1QYTHuapeo333OAV291po=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Edgn8F/3Z1glBeOkB3q+BcpYr0fWeF8PqehhbRg+b3e989vLdXmBZ9LiVJOj3SUDR
	 mk4UY80cH4+n5zawBHVp7nbN7aH4CImiKxzxcDcPqJ3NVFnFo58mw/A3u9Ra4dfNcA
	 j6Ynzu3Pt2or2pHm5aHJts1JxdoVUdX6olykJuVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB28FF80142;
	Sat,  6 Jul 2019 11:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA44F80140; Sat,  6 Jul 2019 11:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_NO_HELO_DNS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F255F80138
 for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2019 11:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F255F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MhXumSV4"
Received: by mail-ua1-x942.google.com with SMTP id c4so3072307uad.1
 for <alsa-devel@alsa-project.org>; Sat, 06 Jul 2019 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x2Rz/d21/ylv5Zd5tSKi5YqfwGQ980yh4WNadx9GYzU=;
 b=MhXumSV4QoeqvPMiVA5KMYVeE+uN2th6BsySYscGyYhJjh3srusH1YsRVfrkrYlVen
 7ZUCu1dWeAV26hNlZSvWFcuU7tmTva0QMuiGbbaxaZtBQNJiKVrnj/g9MjCDAiMF3z5p
 2c94LPDUb0u0w1hsNsGm1S9a1uVjq58OkHTE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2Rz/d21/ylv5Zd5tSKi5YqfwGQ980yh4WNadx9GYzU=;
 b=RXPiSljOxSQJTk+z3Gp8q2KehyTqId20tr5LLTWZOeaAD5VlD7N4h24S/58JiBRxWP
 OuJ/23QAje5QsbkR9WLgtvqF3uMLSwnf5yAAmlYgjZRwZypFO6AVQw16UtpzH6vrdaAb
 YLqGPd0QUXcD7jFN4b2OS+eKXYWN7/jaUh7e3dd9JfQ+/EWW+LETZFFCdLd5ppBT6mEw
 tMnG7ffJGR0d/JeTg4Uw+GOMbV9O8GKQLvFh7uQM7BGORms1T52Eljd/trVMZ0rQ5kza
 +9GCe4vzIVumc2nwAXzqxiFQUgQmDUEsLNHmVgnMUeoANWow7Wk8PFtF/31PthO7rDeK
 rx/A==
X-Gm-Message-State: APjAAAU770qa3q1xqjrkWxpFc1rgM/PVdQ/AQpJUfh1LZQEivUKdFgSH
 9Pvx13Z0hlg+qxzlikJK/e83qeLIxZwvrV7j9zYOgg==
X-Google-Smtp-Source: APXvYqwUUszDaeoohzqNnkpQSYnHVhSPEY45kVLHkzpLi5HEdIAQnRyv7V0QmFsdPAf8yIUxZoaDtdCrRbHH7LsGI9Q=
X-Received: by 2002:a9f:3605:: with SMTP id r5mr4738015uad.131.1562407158879; 
 Sat, 06 Jul 2019 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-4-cychiang@chromium.org>
 <CA+Px+wXVghbk8k0WE5TEsGRQXx26K0-=h3O7cje-F1phwBGrbQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXVghbk8k0WE5TEsGRQXx26K0-=h3O7cje-F1phwBGrbQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Sat, 6 Jul 2019 17:58:52 +0800
Message-ID: <CAFv8NwKBA_=R2YsgU+dvr_G5fUCNiVL-TOKL=26rK2m_qbrcbw@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 3/4] ASoC: rockchip_max98090: Add dai_link
	for HDMI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 5, 2019 at 3:10 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> > diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
> > index c5fc24675a33..195309d1225a 100644
> > --- a/sound/soc/rockchip/rockchip_max98090.c
> > +++ b/sound/soc/rockchip/rockchip_max98090.c
> >  static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
> > @@ -92,38 +95,59 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
> >
> >         ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
> >                                      SND_SOC_CLOCK_OUT);
> > -       if (ret < 0) {
> > -               dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
> > +       if (ret && ret != -ENOTSUPP) {
> > +               dev_err(cpu_dai->dev, "Can't set cpu dai clock %d\n", ret);
I should remove this change because cpu dai should support sysclk ops.

> >                 return ret;
> >         }
> >
> >         ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
> >                                      SND_SOC_CLOCK_IN);
> > -       if (ret < 0) {
> > -               dev_err(codec_dai->dev, "Can't set codec clock %d\n", ret);
> > +       if (ret && ret != -ENOTSUPP) {
> > +               dev_err(codec_dai->dev, "Can't set codec dai clock %d\n", ret);
> >                 return ret;
> >         }
> Does it imply: it is acceptable even if they are "not supported"?
Thank you for this good catch.
Here machine driver has the knowledge of deciding whether it is
expected to see the ops is not supported.
For HDMI path using hdmi-codec driver, it is expected to see -ENOTSUPP.
But it is not expected for codec DAI of max98090.
I should distinguish them.

>
>
> >
> > -       return ret;
> > +       return 0;
> >  }
> >
> >  static const struct snd_soc_ops rk_aif1_ops = {
> >         .hw_params = rk_aif1_hw_params,
> >  };
> >
> > -SND_SOC_DAILINK_DEFS(hifi,
> > +SND_SOC_DAILINK_DEFS(analog,
> >         DAILINK_COMP_ARRAY(COMP_EMPTY()),
> >         DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
> >         DAILINK_COMP_ARRAY(COMP_EMPTY()));
> >
> > -static struct snd_soc_dai_link rk_dailink = {
> > -       .name = "max98090",
> > -       .stream_name = "Audio",
> > -       .ops = &rk_aif1_ops,
> > -       /* set max98090 as slave */
> > -       .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> > -               SND_SOC_DAIFMT_CBS_CFS,
> > -       SND_SOC_DAILINK_REG(hifi),
> > +SND_SOC_DAILINK_DEFS(hdmi,
> > +       DAILINK_COMP_ARRAY(COMP_EMPTY()),
> > +       DAILINK_COMP_ARRAY(COMP_CODEC("hdmi-audio-codec.3.auto", "i2s-hifi")),
> > +       DAILINK_COMP_ARRAY(COMP_EMPTY()));
> > +
> > +enum {
> > +       DAILINK_MAX98090,
> > +       DAILINK_HDMI,
> > +};
> > +
> > +/* max98090 and HDMI codec dai_link */
> > +static struct snd_soc_dai_link rk_dailinks[] = {
> > +       [DAILINK_MAX98090] = {
> > +               .name = "max98090",
> > +               .stream_name = "Analog",
> > +               .ops = &rk_aif1_ops,
> > +               /* set max98090 as slave */
> > +               .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> > +                       SND_SOC_DAIFMT_CBS_CFS,
> > +               SND_SOC_DAILINK_REG(analog),
> > +       },
> > +       [DAILINK_HDMI] = {
> > +               .name = "HDMI",
> > +               .stream_name = "HDMI",
> > +               .ops = &rk_aif1_ops,
> > +               .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> > +                       SND_SOC_DAIFMT_CBS_CFS,
> > +               SND_SOC_DAILINK_REG(hdmi),
> > +       }
> >  };
> >
> >  static int rk_98090_headset_init(struct snd_soc_component *component);
> > @@ -136,8 +160,8 @@ static struct snd_soc_aux_dev rk_98090_headset_dev = {
> >  static struct snd_soc_card snd_soc_card_rk = {
> >         .name = "ROCKCHIP-I2S",
> >         .owner = THIS_MODULE,
> > -       .dai_link = &rk_dailink,
> > -       .num_links = 1,
> > +       .dai_link = rk_dailinks,
> > +       .num_links = ARRAY_SIZE(rk_dailinks),
> >         .aux_dev = &rk_98090_headset_dev,
> >         .num_aux_devs = 1,
> >         .dapm_widgets = rk_dapm_widgets,
> > @@ -173,27 +197,48 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
> >         int ret = 0;
> >         struct snd_soc_card *card = &snd_soc_card_rk;
> >         struct device_node *np = pdev->dev.of_node;
> > +       struct device_node *np_analog;
> > +       struct device_node *np_cpu;
> > +       struct of_phandle_args args;
> >
> >         /* register the soc card */
> >         card->dev = &pdev->dev;
> >
> > -       rk_dailink.codecs->of_node = of_parse_phandle(np,
> > -                       "rockchip,audio-codec", 0);
> > -       if (!rk_dailink.codecs->of_node) {
> > +       np_analog = of_parse_phandle(np, "rockchip,audio-codec", 0);
> > +       if (!np_analog) {
> >                 dev_err(&pdev->dev,
> >                         "Property 'rockchip,audio-codec' missing or invalid\n");
> >                 return -EINVAL;
> >         }
> > +       rk_dailinks[DAILINK_MAX98090].codecs->of_node = np_analog;
> > +
> > +       ret = of_parse_phandle_with_fixed_args(np, "rockchip,audio-codec",
> > +                                              0, 0, &args);
> > +       if (ret) {
> > +               dev_err(&pdev->dev,
> > +                       "Unable to parse property 'rockchip,audio-codec'\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = snd_soc_get_dai_name(
> > +                       &args, &rk_dailinks[DAILINK_MAX98090].codecs->dai_name);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Unable to get codec dai_name\n");
> > +               return ret;
> > +       }
> > +
> > +       np_cpu = of_parse_phandle(np, "rockchip,i2s-controller", 0);
> >
> > -       rk_dailink.cpus->of_node = of_parse_phandle(np,
> > -                       "rockchip,i2s-controller", 0);
> > -       if (!rk_dailink.cpus->of_node) {
> > +       if (!np_cpu) {
> >                 dev_err(&pdev->dev,
> >                         "Property 'rockchip,i2s-controller' missing or invalid\n");
> >                 return -EINVAL;
> >         }
> >
> > -       rk_dailink.platforms->of_node = rk_dailink.cpus->of_node;
> > +       rk_dailinks[DAILINK_MAX98090].cpus->of_node = np_cpu;
> > +       rk_dailinks[DAILINK_MAX98090].platforms->of_node = np_cpu;
> > +       rk_dailinks[DAILINK_HDMI].cpus->of_node = np_cpu;
> > +       rk_dailinks[DAILINK_HDMI].platforms->of_node = np_cpu;
> >
> >         rk_98090_headset_dev.codec_of_node = of_parse_phandle(np,
> >                         "rockchip,headset-codec", 0);
> > --
> > 2.22.0.410.gd8fdbe21b5-goog
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
