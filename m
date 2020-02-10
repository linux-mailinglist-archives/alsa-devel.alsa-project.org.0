Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4A157F21
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 16:46:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165E31671;
	Mon, 10 Feb 2020 16:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165E31671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581349582;
	bh=vhf2oLKpr71Xhm9ISr4PXPtG9aXB3OmGTuO2mAngvCE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhAqa7NBFbDtPTg53MrQYA06QdNMhc61A26uuEu3euwNkUvUViu5TQ0m+foTVwFu6
	 C7pDuEwFlNSZI5pOJb2wgEeDkCm29u5IorFwsd012ARKd8OwvyIQS0V9EU3PVjBOrg
	 S99wBMS5VcRIl9oMgEiDrFJGfN7cCVCejJ46JRLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06108F80157;
	Mon, 10 Feb 2020 16:44:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9256DF80157; Mon, 10 Feb 2020 16:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1114AF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 16:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1114AF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LHadwm+D"
Received: by mail-qv1-xf43.google.com with SMTP id g6so3369174qvy.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nhVJOI9yp+2UqyLkUXHx9xyO5bXhCW+wrrTd+dw8lrM=;
 b=LHadwm+DluCZLHLKz3vEmQ9a3pEVGxLbAZh3bWjplXlQBHHAol1rRR2O3NxfRZkAZE
 33E+GfpfLcvYvDXEbnWlQgr7+tGUpI3ua/uS3H7hR+gwJqxg7Xi//TfijVw2ng0fXBQN
 LSSNWaQNFPlrCxicNOT/gQwy8FCVYLJwYxi3zSu/yDOCg90vj+wPfO5iyjDfj8xH/Nak
 XC3RB8qjtIl/Vm9SItaK6gPms2IG52xBxQUOvPTD7xI6sEsJ5A1N0fbKdG0Kt6GYp515
 iNXjIPm1BSJRhc3L1x2ajL1PATQYNP/L5ZTFln8T06OD2i7WO+dnjxq5gLM6/uAgX5TG
 kc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nhVJOI9yp+2UqyLkUXHx9xyO5bXhCW+wrrTd+dw8lrM=;
 b=ktfWTB1TUogolUCBlKjU35LsizC4yAbr9O0GxdVS4Io24IjTMTJBfNeqO6l+1aicAr
 xDq5kmfBbN44d17GymaPNIy7oFc7OHuB7xvWIGiSqahElclgNUk44H0idIBb9IxYnxit
 E7jDHeKCUexUwtIJlExjfv/QKmOmqT+wplFebb/kYS2cPaYr959jSOE4nt9qs0j39XTh
 oTeVkgP3oNh/KIfnxOkC0DE+QQ80FmGR1nZMrcp4OB1IPrGMahTbKj1LUcdW/fFvsLp5
 udkWBd0Ts6KfU2FNeDpL3fSOTSq8Y9VR/SxSVQ89TiW8Pp5wVuw6HJLyd9s/p1JwKN/o
 O39A==
X-Gm-Message-State: APjAAAXgXzVJdUXa170dJ9trQB5d/tRaRCCkB17orVG2ne5eqJH0QMyX
 Vte6TqyxAw51nd02CTV8uJkE2MTfnFr3B18+0LMg8g==
X-Google-Smtp-Source: APXvYqxKW3c6T5cBsKRoXBur7GXboBV77s3+l/uBgu3ZcKV1XNKgr5rnzyQvs5gIgeE86iIGqmilaXa98UcRc8GUyzg=
X-Received: by 2002:a05:6214:1907:: with SMTP id
 er7mr10379153qvb.199.1581349467547; 
 Mon, 10 Feb 2020 07:44:27 -0800 (PST)
MIME-Version: 1.0
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <00ed82c4-404a-ec70-970e-56ddce9285ae@linux.intel.com>
In-Reply-To: <00ed82c4-404a-ec70-970e-56ddce9285ae@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 10 Feb 2020 07:44:15 -0800
Message-ID: <CAOReqxhHfTuj6mxeX2e_ejMY8N4u+BFLfzKDgn=y5EbWLL_joA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Brent Lu <brent.lu@intel.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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

+Jimmy Cheng-Yi Chiang <cychiang@google.com>

This error is causing pcm_open commands to fail timing requirements,
sometimes taking +500ms to open the PCM as a result. This work around is
required so we can meet the timing requirements. The bug is explained in
detail here https://github.com/thesofproject/sof/issues/2124


On Mon, Feb 10, 2020 at 6:44 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
> On 2/10/20 2:16 AM, Brent Lu wrote:
> > Intel sst firmware turns on BCLK/WCLK in START Ioctl call which timing is
> > later than the DAPM SUPPLY event handler da7219_dai_event is called (in
> > PREPARED state). Therefore, the SRM lock check always fail.
> >
> > Moving the check to trigger callback could ensure the SRM is locked
> before
> > DSP starts to process data and avoid possisble noise.
>
> This codec is used quite a bit by Chromebooks across multiple
> generations and with both SST and SOF drivers, we need to be careful
> about changes.
> I am personally not aware of any issues and never saw an 'SRM failed to
> lock message'. On which platform did you see a problem?
>
> >
> > Signed-off-by: Brent Lu <brent.lu@intel.com>
> > ---
> >   sound/soc/codecs/da7219.c | 68
> +++++++++++++++++++++++++++++++----------------
> >   1 file changed, 45 insertions(+), 23 deletions(-)
> >
> > diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
> > index f83a6ea..0fb5ea5 100644
> > --- a/sound/soc/codecs/da7219.c
> > +++ b/sound/soc/codecs/da7219.c
> > @@ -794,9 +794,7 @@ static int da7219_dai_event(struct
> snd_soc_dapm_widget *w,
> >       struct snd_soc_component *component =
> snd_soc_dapm_to_component(w->dapm);
> >       struct da7219_priv *da7219 =
> snd_soc_component_get_drvdata(component);
> >       struct clk *bclk = da7219->dai_clks[DA7219_DAI_BCLK_IDX];
> > -     u8 pll_ctrl, pll_status;
> > -     int i = 0, ret;
> > -     bool srm_lock = false;
> > +     int ret;
> >
> >       switch (event) {
> >       case SND_SOC_DAPM_PRE_PMU:
> > @@ -820,26 +818,6 @@ static int da7219_dai_event(struct
> snd_soc_dapm_widget *w,
> >               /* PC synchronised to DAI */
> >               snd_soc_component_update_bits(component, DA7219_PC_COUNT,
> >                                   DA7219_PC_FREERUN_MASK, 0);
> > -
> > -             /* Slave mode, if SRM not enabled no need for status
> checks */
> > -             pll_ctrl = snd_soc_component_read32(component,
> DA7219_PLL_CTRL);
> > -             if ((pll_ctrl & DA7219_PLL_MODE_MASK) !=
> DA7219_PLL_MODE_SRM)
> > -                     return 0;
> > -
> > -             /* Check SRM has locked */
> > -             do {
> > -                     pll_status = snd_soc_component_read32(component,
> DA7219_PLL_SRM_STS);
> > -                     if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
> > -                             srm_lock = true;
> > -                     } else {
> > -                             ++i;
> > -                             msleep(50);
> > -                     }
> > -             } while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
> > -
> > -             if (!srm_lock)
> > -                     dev_warn(component->dev, "SRM failed to lock\n");
> > -
> >               return 0;
> >       case SND_SOC_DAPM_POST_PMD:
> >               /* PC free-running */
> > @@ -1658,12 +1636,56 @@ static int da7219_hw_params(struct
> snd_pcm_substream *substream,
> >       return 0;
> >   }
> >
> > +static int da7219_set_dai_trigger(struct snd_pcm_substream *substream,
> int cmd,
> > +                               struct snd_soc_dai *dai)
> > +{
> > +     struct snd_soc_component *component = dai->component;
> > +     u8 pll_ctrl, pll_status;
> > +     int i = 0;
> > +     bool srm_lock = false;
> > +
> > +     switch (cmd) {
> > +     case SNDRV_PCM_TRIGGER_START:
> > +             /* Slave mode, if SRM not enabled no need for status
> checks */
> > +             pll_ctrl = snd_soc_component_read32(component,
> DA7219_PLL_CTRL);
> > +             if ((pll_ctrl & DA7219_PLL_MODE_MASK) !=
> DA7219_PLL_MODE_SRM)
> > +                     return 0;
> > +
> > +             /* Check SRM has locked */
> > +             do {
> > +                     pll_status = snd_soc_component_read32(component,
> > +
>  DA7219_PLL_SRM_STS);
> > +                     if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
> > +                             srm_lock = true;
> > +                     } else {
> > +                             ++i;
> > +                             msleep(50);
> > +                     }
> > +             } while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
> > +
> > +             if (!srm_lock)
> > +                     dev_warn(component->dev, "SRM failed to lock\n");
> > +
> > +             break;
> > +     case SNDRV_PCM_TRIGGER_RESUME:
> > +     case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > +     case SNDRV_PCM_TRIGGER_STOP:
> > +     case SNDRV_PCM_TRIGGER_SUSPEND:
> > +     case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static const struct snd_soc_dai_ops da7219_dai_ops = {
> >       .hw_params      = da7219_hw_params,
> >       .set_sysclk     = da7219_set_dai_sysclk,
> >       .set_pll        = da7219_set_dai_pll,
> >       .set_fmt        = da7219_set_dai_fmt,
> >       .set_tdm_slot   = da7219_set_dai_tdm_slot,
> > +     .trigger        = da7219_set_dai_trigger,
> >   };
> >
> >   #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S20_3LE |\
> >
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
