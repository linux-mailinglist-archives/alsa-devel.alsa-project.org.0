Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A31D31F9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 15:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 683211680;
	Thu, 14 May 2020 15:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 683211680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589464721;
	bh=gI/oPbfE2S6M0V1crmuHMKCejgluA4dZ17DxD4tA2g8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQsX94xN1KdZmOE3eg0HwbTcYY7AxUumsVYgsgs7owmAyR8B6s2i1cE8pBwY+Z0/i
	 HCDk3KKUean7GOD4KbzSCye6WhGuLlVP6GNDnWTRW3JWvIg1DBdr+UidwJB5JCCBxf
	 cy8sKDmbs0eDN8Je2JH0UVNnfWXCdG6z48UGfXqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B10F80101;
	Thu, 14 May 2020 15:57:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFEDEF80158; Thu, 14 May 2020 15:56:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ACB1F80101
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 15:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACB1F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cCvY9KI1"
Received: by mail-ed1-x542.google.com with SMTP id w2so2468603edx.4
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+xHuZjo6KNAs+z1Fg1etYI0ZDPjZlGNVfRX79r5Asc=;
 b=cCvY9KI1FbDobXpMhhwl2WwnN+EsPPvgYyEiMrAD4glHm4KzFVHDgnlpwH37j9MbtK
 gsz+qcsUAu91xC+geISjhtgZCIITvJyxIKBcGKcQVJ6Prl/fFp/FbXWswxx02m7W+csz
 MgUq4qq4DY+8xNKuJ9jUCctr9J3PgoS/G2Xp1OrUYl5zn0Qlk6zcNjmQct511eDI4jUT
 VTY7VOEovgUg+2H1srBFRhwLrVwDN0ZEuAdUzpToBpUnbOEgh4xfp5CCiUURCb8jldco
 Gv+Ep+w8U2OBvonD0rlxnLdQaZl48WqN9Jx8G0EvYnSF7hRSu9QihEAasn2+QNyaRX/2
 tK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+xHuZjo6KNAs+z1Fg1etYI0ZDPjZlGNVfRX79r5Asc=;
 b=I1yu5SNCksdfsLTHOA/k7QB7Th34Kh06IR85eyXdiDZ1/KwICYoOxr2BJqlTEHPuch
 vQw9/QlYsAd+osKMgbMDmn/f6yuzBAZ1Dw1KQEtWUJ77sIkTbDtKxxJ2gJEkIL2u/dBP
 ED4XX4ILcVKNtk28YCrMeVrvVli+RVpviOUrxyxypZ6Oqx0sRdFMocRxravSYfxT7LvV
 pVyBo+DMo8MUTGJLXnlIkIBSLSJeoPFjtIteNdnC05zPeNDFopdTaJvKz0t7H3l02sTI
 h+63f7+o8GyYcv9kJ77Ek9/Qm7DghOe6O9BPTMncosm+OceEw9WJJmsf/bCvtFlZjyWM
 vAZQ==
X-Gm-Message-State: AOAM533u0+dbHQuuTKu6EvMjHW5zn2WOztj4FfEmY18PQXz3Qh08xLcE
 a8XDeaXPkuFRSDMhb4cHvRFgI2BdGTnhGcqXSbAvYA==
X-Google-Smtp-Source: ABdhPJzLytZIaO6j2t1SQtOpGH2XKnaKhB4wQijwQhHx46ZVuOyc8LUGd/+MDixW4mNEUlzsubRKAWvH6kxi4Uogno8=
X-Received: by 2002:aa7:d90f:: with SMTP id a15mr342636edr.52.1589464608820;
 Thu, 14 May 2020 06:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200513192020.544928-1-lma@semihalf.com>
 <52ab4557-e551-ce20-247c-681c2a0d1ad1@linux.intel.com>
In-Reply-To: <52ab4557-e551-ce20-247c-681c2a0d1ad1@linux.intel.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 14 May 2020 06:56:37 -0700
Message-ID: <CABXOdTeqjRh7st_fWYCZD0d8iuVJV+g+4ukoVHKEkOL4RmqQhg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Guenter Roeck <groeck@chromium.org>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>,
 Lukasz Majczak <lma@semihalf.com>
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

On Thu, May 14, 2020 at 5:47 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 5/13/20 2:20 PM, Lukasz Majczak wrote:
> > Split be_hw_params_fixup function for different codecs as current common
> > function, leads to crash while trying to get snd_soc_dpcm with
> > container_of() macro in kabylake_ssp_fixup().
> > The crash call path looks as below:
> > soc_pcm_hw_params()
> > snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
> > rtd->dai_link->be_hw_params_fixup(rtd, params)
> > kabylake_ssp_fixup()
> > In this case, codec_params is just a copy of an internal structure and is
> > not embedded into struct snd_soc_dpcm thus we cannot use
> > container_of() on it.
>
> This looks like a nice/welcome change, we've had these unexplained
> crashes on KBL since 4.19 (reported by Guenter and me). I thought they
> were topology related.
>

Not entirely unexplained. See
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1600868,
which fixes the problem for all three affected drivers.

Someone had told me, though, that the problem is no longer seen. Guess
that was wrong.

Guenter

> If indeed this fixes the issue, it might be worth applying in to all
> stable releases?
>
> Since we have the same code structure for the other kbl drivers, would
> it also make sense to apply the same fixes there:
>
> kbl_da7219_max98927.c:  struct snd_soc_dpcm *dpcm = container_of(
> kbl_rt5663_max98927.c:  struct snd_soc_dpcm *dpcm = container_of(
>
>
> >
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > ---
> >   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 68 +++++++++++--------
> >   1 file changed, 39 insertions(+), 29 deletions(-)
> >
> > diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > index 1b1f8d7a4ea3..2e0ae724122c 100644
> > --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > @@ -328,46 +328,55 @@ static const struct snd_soc_ops kabylake_rt5663_fe_ops = {
> >       .startup = kbl_fe_startup,
> >   };
> >
> > -static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> > -                                     struct snd_pcm_hw_params *params)
> > +static void kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params, snd_pcm_format_t pcm_fmt)
> >   {
> >       struct snd_interval *rate = hw_param_interval(params,
> >                       SNDRV_PCM_HW_PARAM_RATE);
> > -     struct snd_interval *chan = hw_param_interval(params,
> > +     struct snd_interval *channels = hw_param_interval(params,
> >                       SNDRV_PCM_HW_PARAM_CHANNELS);
> >       struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> > -     struct snd_soc_dpcm *dpcm = container_of(
> > -                     params, struct snd_soc_dpcm, hw_params);
> > -     struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
> > -     struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
> >
> >       /*
> >        * The ADSP will convert the FE rate to 48k, stereo, 24 bit
> >        */
> > -     if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> > -         !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> > -         !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> > -             rate->min = rate->max = 48000;
> > -             chan->min = chan->max = 2;
> > -             snd_mask_none(fmt);
> > -             snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> > -     } else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
> > -             if (params_channels(params) == 2 ||
> > -                             DMIC_CH(dmic_constraints) == 2)
> > -                     chan->min = chan->max = 2;
> > -             else
> > -                     chan->min = chan->max = 4;
> > -     }
> > -     /*
> > -      * The speaker on the SSP0 supports S16_LE and not S24_LE.
> > -      * thus changing the mask here
> > -      */
> > -     if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> > -             snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> >
> > +     rate->min = rate->max = 48000;
> > +     channels->min = channels->max = 2;
> > +
> > +     snd_mask_none(fmt);
> > +     snd_mask_set_format(fmt, pcm_fmt);
> > +}
> > +
> > +static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params)
> > +{
> > +     kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S16_LE);
> >       return 0;
> >   }
> >
> > +static int kabylake_ssp1_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params)
> > +{
> > +
> > +     kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
> > +     return 0;
> > +}
> > +
> > +static int kabylake_dmic_cap_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params)
> > +{
> > +     struct snd_interval *channels = hw_param_interval(params,
> > +                     SNDRV_PCM_HW_PARAM_CHANNELS);
> > +
> > +     if (params_channels(params) == 2 ||
> > +                     DMIC_CH(dmic_constraints) == 2)
> > +             channels->min = channels->max = 2;
> > +     else
> > +             channels->min = channels->max = 4;
> > +
> > +     return 0;
> > +}
> >   static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
> >       struct snd_pcm_hw_params *params)
> >   {
> > @@ -582,6 +591,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
> >               .dpcm_capture = 1,
> >               .nonatomic = 1,
> >               .dynamic = 1,
> > +             .be_hw_params_fixup = kabylake_dmic_cap_fixup,
> >               .ops = &kabylake_dmic_ops,
> >               SND_SOC_DAILINK_REG(dmic, dummy, platform),
> >       },
> > @@ -618,7 +628,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
> >                       SND_SOC_DAIFMT_NB_NF |
> >                       SND_SOC_DAIFMT_CBS_CFS,
> >               .ignore_pmdown_time = 1,
> > -             .be_hw_params_fixup = kabylake_ssp_fixup,
> > +             .be_hw_params_fixup = kabylake_ssp0_fixup,
> >               .dpcm_playback = 1,
> >               .dpcm_capture = 1,
> >               .ops = &kabylake_ssp0_ops,
> > @@ -632,7 +642,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
> >               .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> >                       SND_SOC_DAIFMT_CBS_CFS,
> >               .ignore_pmdown_time = 1,
> > -             .be_hw_params_fixup = kabylake_ssp_fixup,
> > +             .be_hw_params_fixup = kabylake_ssp1_fixup,
> >               .ops = &kabylake_rt5663_ops,
> >               .dpcm_playback = 1,
> >               .dpcm_capture = 1,
> >
