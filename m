Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173DB4707
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 07:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7981670;
	Tue, 17 Sep 2019 07:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7981670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568699351;
	bh=2QPBNuVmzH+w96l5z5QIW/EKSx5DinSpuj+4fOVzPnI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2VlhzMq/D7L80G64fSeLyJYfj0S0N6J339ODYslo30uCgUrfveTzvPWN4oEabB1W
	 8HGsGFl5AFPMzUqbfscHDPSzDprM7jboCy2+A4sIIlXlITRnSwoTVdKsK5l3LUVFnU
	 ggQdLeCxKQ3R+qUNRRLZBK5dgWl+Hu2yMB7CkXfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D32F80361;
	Tue, 17 Sep 2019 07:47:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28856F80361; Tue, 17 Sep 2019 07:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D6E4F80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 07:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D6E4F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="U755joqW"
Received: by mail-wm1-x343.google.com with SMTP id p7so1647000wmp.4
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 22:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJJ/OqyhCYDAmlAcRrX2Nmlf4soR9ckL779ult1qOVY=;
 b=U755joqWpAls4mMkHumoMeL341aZkDR23QYQUcfShHn0aHHotW/A5uNmp+1vrsM2j3
 n4P+zdVVVJ58o6LJuLNvsuKHRnUgvQFrOIO5jBRNy+bT31a9ZHHKeLw3deJ1h5OKKKGo
 qG6dOhBY2MzK45zkUKNsJZi+lvDIWJOQMtdbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJJ/OqyhCYDAmlAcRrX2Nmlf4soR9ckL779ult1qOVY=;
 b=Jkr94U3SUOl1BBCflvnTeg9cc+GKGk/nPNbS5qjraSzwlyHIcP/zylNd3uyq2hHrOW
 B/9V1+myNs90ckAmPG/eUnTSsdMOyerBQHZzyLUYcRPRvorJBCPg7qKIcR7zHLV8Mgg+
 YbneUGYjTcaNixpOfIPDOgGz3rets93iSKa/mv6ZMHcv+2Q0G+DYUj0gvc1D3PmGg7iF
 P/LRPvR64SOru+HCpPMvCLUtRmGg5dl4ArtCWzY5ImtBXrDuk4yGMdFEJIfSLShEs+bH
 XBxoJD6N+bQMPtDxZqq5my4e2MUtEDAa6ALTDB82EjddoVurRV3pX3EbHrj0DYmVFyqN
 sxxQ==
X-Gm-Message-State: APjAAAWfQ7InRoV4HGTzrbYLv9zZhu3y6m3FxaXEvjWbDpGy8Tvfj171
 6zvwJmB9dQ6iXYtuB5UE0+vEuUfuHdutvDf4FPM83g==
X-Google-Smtp-Source: APXvYqyxmr7hZlgUNMhY5fYIO0VvEmk8E7d9GdFTCke+Zr+FTiNdrI1X1XHriJlmdRX2wt1JJBvkfwOopCZn2jFV3oQ=
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr1911865wme.105.1568699237924; 
 Mon, 16 Sep 2019 22:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190916071511.5909-1-sammc@chromium.org>
 <412d8b9f-463a-1082-8fbb-7a0879decddd@linux.intel.com>
In-Reply-To: <412d8b9f-463a-1082-8fbb-7a0879decddd@linux.intel.com>
From: Sam McNally <sammc@chromium.org>
Date: Tue, 17 Sep 2019 15:46:40 +1000
Message-ID: <CAJqEsoAdv=Hn-zWBeendppWC=5Uwd38S1PTSud5_Vmhxx6W9Ow@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: cht_bsw_rt5645: Add quirk for
 boards using pmc_plt_clk_0
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

On Tue, 17 Sep 2019 at 01:02, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 9/16/19 2:15 AM, Sam McNally wrote:
> > As of commit 648e921888ad ("clk: x86: Stop marking clocks as
> > CLK_IS_CRITICAL"), the cht_bsw_rt5645 driver needs to enable the clock
> > it's using for the codec's mclk. It does this from commit 7735bce05a9c
> > ("ASoC: Intel: boards: use devm_clk_get() unconditionally"), enabling
> > pmc_plt_clk_3. However, Strago family Chromebooks use pmc_plt_clk_0 for
> > the codec mclk, resulting in white noise with some digital microphones.
> > Add a DMI-based quirk for Strago family Chromebooks to use pmc_plt_clk_0
> > instead.
>
> Sounds good, thanks for the patch. You will need to Cc: maintainers
> (Takashi and Mark) if you want them to see your patches.
>
> Maybe you should mention in the commit message that this mirrors the
> changes made in cht_bsw_max98090_ti?
>
Will do.

> Also see more important comment below
>
> >
> > Signed-off-by: Sam McNally <sammc@chromium.org>
> > ---
> >
> >   sound/soc/intel/boards/cht_bsw_rt5645.c | 26 +++++++++++++++++++------
> >   1 file changed, 20 insertions(+), 6 deletions(-)
> >
> > diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
> > index 8879c3be29d5..c68a5b85a4a0 100644
> > --- a/sound/soc/intel/boards/cht_bsw_rt5645.c
> > +++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
> > @@ -48,6 +48,7 @@ struct cht_mc_private {
> >   #define CHT_RT5645_SSP2_AIF2     BIT(16) /* default is using AIF1  */
> >   #define CHT_RT5645_SSP0_AIF1     BIT(17)
> >   #define CHT_RT5645_SSP0_AIF2     BIT(18)
> > +#define CHT_RT5645_PMC_PLT_CLK_0 BIT(19)
> >
> >   static unsigned long cht_rt5645_quirk = 0;
> >
> > @@ -59,6 +60,8 @@ static void log_quirks(struct device *dev)
> >               dev_info(dev, "quirk SSP0_AIF1 enabled");
> >       if (cht_rt5645_quirk & CHT_RT5645_SSP0_AIF2)
> >               dev_info(dev, "quirk SSP0_AIF2 enabled");
> > +     if (cht_rt5645_quirk & CHT_RT5645_PMC_PLT_CLK_0)
> > +             dev_info(dev, "quirk PMC_PLT_CLK_0 enabled");
> >   }
> >
> >   static int platform_clock_control(struct snd_soc_dapm_widget *w,
> > @@ -226,15 +229,21 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
> >       return 0;
> >   }
> >
> > -/* uncomment when we have a real quirk
> >   static int cht_rt5645_quirk_cb(const struct dmi_system_id *id)
> >   {
> >       cht_rt5645_quirk = (unsigned long)id->driver_data;
> >       return 1;
> >   }
> > -*/
> >
> >   static const struct dmi_system_id cht_rt5645_quirk_table[] = {
> > +     {
> > +             /* Strago family Chromebooks */
> > +             .callback = cht_rt5645_quirk_cb,
> > +             .matches = {
> > +                     DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_Strago"),
> > +             },
> > +             .driver_data = (void *)CHT_RT5645_PMC_PLT_CLK_0,
> > +     },
> >       {
> >       },
> >   };
> > @@ -526,6 +535,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
> >       int dai_index = 0;
> >       int ret_val = 0;
> >       int i;
> > +     const char *mclk_name;
> >
> >       drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> >       if (!drv)
> > @@ -662,11 +672,15 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
> >       if (ret_val)
> >               return ret_val;
> >
> > -     drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> > +     if (cht_rt5645_quirk & CHT_RT5645_PMC_PLT_CLK_0)
> > +             mclk_name = "pmc_plt_clk_0";
> > +     else
> > +             mclk_name = "pmc_plt_clk_3";
>
> Aren't you missing a call to dmi_first_match() to change the default
> value of this cht_rt5645_quirk variable?
>
> The rest of the patch looks good but I don't see how the DMI info is
> actually used.
>

The existing dmi_check_system() call at
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/boards/cht_bsw_rt5645.c?h=for-5.4&id=fca11622d600228bec405456f41590155b3a3eca#n630
uses the quirks table, calling the previously-commented-out callback
to assign to the quirks global. I'll add a mention in the description.

> > +     drv->mclk = devm_clk_get(&pdev->dev, mclk_name);
> >       if (IS_ERR(drv->mclk)) {
> > -             dev_err(&pdev->dev,
> > -                     "Failed to get MCLK from pmc_plt_clk_3: %ld\n",
> > -                     PTR_ERR(drv->mclk));
> > +             dev_err(&pdev->dev, "Failed to get MCLK from %s: %ld\n",
> > +                     mclk_name, PTR_ERR(drv->mclk)); >               return PTR_ERR(drv->mclk);
> >       }
> >
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
