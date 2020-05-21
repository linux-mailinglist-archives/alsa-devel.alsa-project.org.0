Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5071DD02E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 16:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCE31840;
	Thu, 21 May 2020 16:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCE31840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590071886;
	bh=0YRe8B028sDyHK484M3kTiPf5k5oWKlqVPrPhSe7f7g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFLBAVo6LnbBlLyy5T9mcJ/ONlKAwfL5HCv/f7UGf6NeNstjrT4ZnC8yGr8freqkY
	 WaivnJlKTC2chppEt72x7Ce0mxjUUL6CDXQHLRBPTjeW3h8IyzGFNVMtsULWVzN0G+
	 GnvRjXzX4scN9e8G5hM6EIAWK5x643ZsqqpGNxUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A21EDF80111;
	Thu, 21 May 2020 16:36:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD4FDF801D8; Thu, 21 May 2020 16:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A1FAF80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 16:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A1FAF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="xz9QkOuQ"
Received: by mail-qt1-x843.google.com with SMTP id c24so5613644qtw.7
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 07:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kw4C3gxn8nitVjQ3C7bclCDQ0fRWgJ+lkwu0bdyxrak=;
 b=xz9QkOuQC1KMGJAC++z2mUxICPWVJoB3D7Vwbn2CjACOCry8vurx7rVdJEP9+a+2gZ
 YuMYk0KlhQQArEnLQ4VdYGiuD5HpuQE9tBlIJ/NmFUgCitmvLoiu9LS0xqE4vM/BC9T2
 vftpmWknPyPDLALgy+WVqzbpAPMZCb8zD98N+XuZMLEuQ8vgiOsK4KGjTX7lrne/IHZE
 QlSInfeLLMTHToaNrLFM4ZZ0jNLtGGmd6joPZdL7qQrO8/ad7yxqOUxEZUBUpLMlpSvk
 eOQILiX1umlP82iOIj8kocVQiN6OYzt6ee8P86Ogj/9ucQLPfWbbwcMXgl/Oz1UX5/EG
 e8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kw4C3gxn8nitVjQ3C7bclCDQ0fRWgJ+lkwu0bdyxrak=;
 b=VyZlOJMMpsIKcnouNUUXPzUl9BTdcAgxsloyyl+ssgC9nArATL6ImlIz+3qZbFPDOH
 8wfBqTdvrc+SQFE4bPLynatmbPKEZpd37X69qkQWhkNubMzohnaRihUT9KkYiairpBJi
 7bQ7B0KwFlPSfqGfJoOvi+8nKaWnLqCxOhI6x55l//P2rA5ZJ2V9dgJiBK1OthxNdiMj
 jrO0ChhQmngcKEqQ5Hrt5jVmJsronM0cRem8vyR+4/MfdnsYdWk88PsWixY6tBZ6EELJ
 7lPYivszlAzETDzIsnCnQ7kU58od3hnI5EfqJPuDz40WoHd+VyzkRnVwm08HLmHn4zCe
 NvWw==
X-Gm-Message-State: AOAM532iUhkx0Hmz/D0fJltGVGyIUKv8Ormss5Pit6o6hFuGXg0TZA+D
 BAdEYj5tG56xicoj9tu7yb9SF3168WbcpL/gxkM3Pg==
X-Google-Smtp-Source: ABdhPJzLgTwIZzIg8Goc2vslQuxQGv0CwhAksKkC4SNan+k8quEDwXb3+/3ixr8xV7pt/342sGW1vu4qHIZBPgqY8Go=
X-Received: by 2002:ac8:6159:: with SMTP id d25mr11060756qtm.70.1590071774186; 
 Thu, 21 May 2020 07:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200521134700.1035657-1-lma@semihalf.com>
 <964af231-0bce-1bb2-ea0c-b8bc423eb916@linux.intel.com>
In-Reply-To: <964af231-0bce-1bb2-ea0c-b8bc423eb916@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Thu, 21 May 2020 16:36:03 +0200
Message-ID: <CAFJ_xbp+0-q0ntKfwsoKH2CMocdjYQRR1_sU8-JvupiJa9wrgw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>
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

Yes, my bad
it should be:
+       { "codec1_in", NULL, "DMIC01 Rx" },
+       { "DMIC01 Rx", NULL, "AIF1 Capture" },

The whole idea of taking the mic for SSP0 definition is that each BE
should have its own fixup. Before there was one fixup function, which
checked inside which BE is connected to which FE and applied the
proper fix, it was using the fact that "params" were part of
snd_soc_dpcm. That has changed and now params are "orphaned" so each
BE has to apply a specific fixup for itself.

Best regards,
Lukasz


czw., 21 maj 2020 o 16:25 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
>
>
>
> On 5/21/20 8:47 AM, Lukasz Majczak wrote:
> > Split be_hw_params_fixup function for different codecs as current commo=
n
> > function, leads to crash while trying to get snd_soc_dpcm with
> > container_of() macro in kabylake_ssp_fixup().
> > The crash call path looks as below:
> > soc_pcm_hw_params()
> > snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
> > rtd->dai_link->be_hw_params_fixup(rtd, params)
> > kabylake_ssp_fixup()
> > In this case, codec_params is just a copy of an internal structure and =
is
> > not embedded into struct snd_soc_dpcm thus we cannot use
> > container_of() on it.
> >
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > ---
> >   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 130 ++++++++++++-----=
-
> >   1 file changed, 85 insertions(+), 45 deletions(-)
> >
> > diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/soun=
d/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > index 1b1f8d7a4ea3..12a9983979e0 100644
> > --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > @@ -171,8 +171,8 @@ static const struct snd_soc_dapm_route kabylake_map=
[] =3D {
> >       { "hs_in", NULL, "ssp1 Rx" },
> >       { "ssp1 Rx", NULL, "AIF Capture" },
> >
> > -     { "codec1_in", NULL, "ssp0 Rx" },
> > -     { "ssp0 Rx", NULL, "AIF1 Capture" },
> > +     { "codec1_in", NULL, "DMIC01 Rx" },
> > +     { "DMIC01 Rx", NULL, "AIF1 Capture" },
>
> This doesn't seem right. This board uses DMICs attached to the codec so
> we should not make references to routes that are used for PCH-attached
> dmics in all other machine drivers:
>
>         { "dmic01_hifi", NULL, "DMIC01 Rx" },
>         { "DMIC01 Rx", NULL, "DMIC AIF" },
>
> >
> >       /* IV feedback path */
> >       { "codec0_fb_in", NULL, "ssp0 Rx"},
> > @@ -328,42 +328,52 @@ static const struct snd_soc_ops kabylake_rt5663_f=
e_ops =3D {
> >       .startup =3D kbl_fe_startup,
> >   };
> >
> > -static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> > -                                     struct snd_pcm_hw_params *params)
> > +static void kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params, snd_pcm_format_t pcm_fmt)
> >   {
> >       struct snd_interval *rate =3D hw_param_interval(params,
> >                       SNDRV_PCM_HW_PARAM_RATE);
> > -     struct snd_interval *chan =3D hw_param_interval(params,
> > +     struct snd_interval *channels =3D hw_param_interval(params,
> >                       SNDRV_PCM_HW_PARAM_CHANNELS);
> >       struct snd_mask *fmt =3D hw_param_mask(params, SNDRV_PCM_HW_PARAM=
_FORMAT);
> > -     struct snd_soc_dpcm *dpcm =3D container_of(
> > -                     params, struct snd_soc_dpcm, hw_params);
> > -     struct snd_soc_dai_link *fe_dai_link =3D dpcm->fe->dai_link;
> > -     struct snd_soc_dai_link *be_dai_link =3D dpcm->be->dai_link;
> >
> >       /*
> >        * The ADSP will convert the FE rate to 48k, stereo, 24 bit
> >        */
> > -     if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> > -         !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> > -         !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> > -             rate->min =3D rate->max =3D 48000;
> > -             chan->min =3D chan->max =3D 2;
> > -             snd_mask_none(fmt);
> > -             snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> > -     } else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
> > +
> > +     rate->min =3D rate->max =3D 48000;
> > +     channels->min =3D channels->max =3D 2;
> > +
> > +     snd_mask_none(fmt);
> > +     snd_mask_set_format(fmt, pcm_fmt);
> > +}
> > +
> > +static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params)
> > +{
> > +     kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S16_LE);
> > +     return 0;
> > +}
> > +
> > +static int kabylake_ssp1_fixup(struct snd_soc_pcm_runtime *rtd,
> > +     struct snd_pcm_hw_params *params)
> > +{
> > +
> > +     kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
> > +     return 0;
> > +}
> > +
> > +static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
> > +                                     struct snd_pcm_hw_params *params)
> > +{
> > +     struct snd_interval *channels =3D hw_param_interval(params,
> > +                     SNDRV_PCM_HW_PARAM_CHANNELS);
> > +
> >               if (params_channels(params) =3D=3D 2 ||
> >                               DMIC_CH(dmic_constraints) =3D=3D 2)
> > -                     chan->min =3D chan->max =3D 2;
> > +                     channels->min =3D channels->max =3D 2;
> >               else
> > -                     chan->min =3D chan->max =3D 4;
> > -     }
> > -     /*
> > -      * The speaker on the SSP0 supports S16_LE and not S24_LE.
> > -      * thus changing the mask here
> > -      */
> > -     if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> > -             snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> > +                     channels->min =3D channels->max =3D 4;
> >
> >       return 0;
> >   }
> > @@ -400,20 +410,6 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_=
substream *substream,
> >       int ret =3D 0, j;
> >
> >       for_each_rtd_codec_dais(rtd, j, codec_dai) {
> > -             if (!strcmp(codec_dai->component->name, RT5514_DEV_NAME))=
 {
> > -                     ret =3D snd_soc_dai_set_tdm_slot(codec_dai, 0xF, =
0, 8, 16);
> > -                     if (ret < 0) {
> > -                             dev_err(rtd->dev, "set TDM slot err:%d\n"=
, ret);
> > -                             return ret;
> > -                     }
> > -
> > -                     ret =3D snd_soc_dai_set_sysclk(codec_dai,
> > -                             RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLO=
CK_IN);
> > -                     if (ret < 0) {
> > -                             dev_err(rtd->dev, "set sysclk err: %d\n",=
 ret);
> > -                             return ret;
> > -                     }
> > -             }
> >               if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME))=
 {
> >                       ret =3D snd_soc_dai_set_tdm_slot(codec_dai, 0x30,=
 3, 8, 16);
> >                       if (ret < 0) {
> > @@ -433,10 +429,37 @@ static int kabylake_ssp0_hw_params(struct snd_pcm=
_substream *substream,
> >       return ret;
> >   }
> >
> > +static int kabylake_dmic01_hw_params(struct snd_pcm_substream *substre=
am,
> > +     struct snd_pcm_hw_params *params)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     int ret =3D 0;
> > +
> > +     ret =3D snd_soc_dai_set_tdm_slot(rtd->codec_dai, 0xF, 0, 8, 16);
> > +     if (ret < 0) {
> > +             dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D snd_soc_dai_set_sysclk(rtd->codec_dai,
> > +             RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
> > +     if (ret < 0) {
> > +             dev_err(rtd->dev, "set sysclk err: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> >   static struct snd_soc_ops kabylake_ssp0_ops =3D {
> >       .hw_params =3D kabylake_ssp0_hw_params,
> >   };
> >
> > +static struct snd_soc_ops kabylake_dmic01_ops =3D {
> > +     .hw_params =3D kabylake_dmic01_hw_params,
> > +};
> > +
> > +
> >   static const unsigned int channels_dmic[] =3D {
> >       4,
> >   };
> > @@ -507,14 +530,19 @@ SND_SOC_DAILINK_DEF(ssp0_pin,
> >   SND_SOC_DAILINK_DEF(ssp0_codec,
> >       DAILINK_COMP_ARRAY(
> >       /* Left */ COMP_CODEC(MAXIM_DEV0_NAME, KBL_MAXIM_CODEC_DAI),
> > -     /* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI),
> > -     /* dmic */ COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI=
)));
> > +     /* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI)));
> >
> >   SND_SOC_DAILINK_DEF(ssp1_pin,
> >       DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
> >   SND_SOC_DAILINK_DEF(ssp1_codec,
> >       DAILINK_COMP_ARRAY(COMP_CODEC(RT5663_DEV_NAME, KBL_REALTEK_CODEC_=
DAI)));
> >
> > +SND_SOC_DAILINK_DEF(dmic01_pin,
> > +     DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
> > +SND_SOC_DAILINK_DEF(dmic01_codec,
> > +     DAILINK_COMP_ARRAY(
> > +             COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI)))=
;
> > +
> >   SND_SOC_DAILINK_DEF(idisp1_pin,
> >       DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
> >   SND_SOC_DAILINK_DEF(idisp1_codec,
> > @@ -618,9 +646,8 @@ static struct snd_soc_dai_link kabylake_dais[] =3D =
{
> >                       SND_SOC_DAIFMT_NB_NF |
> >                       SND_SOC_DAIFMT_CBS_CFS,
> >               .ignore_pmdown_time =3D 1,
> > -             .be_hw_params_fixup =3D kabylake_ssp_fixup,
> > +             .be_hw_params_fixup =3D kabylake_ssp0_fixup,
> >               .dpcm_playback =3D 1,
> > -             .dpcm_capture =3D 1,
> >               .ops =3D &kabylake_ssp0_ops,
> >               SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
> >       },
> > @@ -632,12 +659,25 @@ static struct snd_soc_dai_link kabylake_dais[] =
=3D {
> >               .dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> >                       SND_SOC_DAIFMT_CBS_CFS,
> >               .ignore_pmdown_time =3D 1,
> > -             .be_hw_params_fixup =3D kabylake_ssp_fixup,
> > +             .be_hw_params_fixup =3D kabylake_ssp1_fixup,
> >               .ops =3D &kabylake_rt5663_ops,
> >               .dpcm_playback =3D 1,
> >               .dpcm_capture =3D 1,
> >               SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
> >       },
> > +     {
> > +             .name =3D "dmic01",
> > +             .id =3D 2,
> > +             .no_pcm =3D 1,
> > +             .dai_fmt =3D SND_SOC_DAIFMT_DSP_B |
> > +                     SND_SOC_DAIFMT_NB_NF |
> > +                     SND_SOC_DAIFMT_CBS_CFS,
> > +             .ignore_pmdown_time =3D 1,
> > +             .be_hw_params_fixup =3D kabylake_dmic_fixup,
> > +             .dpcm_capture =3D 1,
> > +             .ops =3D &kabylake_dmic01_ops,
> > +             SND_SOC_DAILINK_REG(dmic01_pin, dmic01_codec, platform),
> > +     },
> >       {
> >               .name =3D "iDisp1",
> >               .id =3D 3,
> >
> > base-commit: a4f6fc98cd2fa1774bcaeb248c67156ef9402a56
> >
