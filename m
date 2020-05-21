Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA081DD06C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 16:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDABD1842;
	Thu, 21 May 2020 16:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDABD1842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590072311;
	bh=/bOLitq3D6f5Lw9ClPafNJ5an38jLvLt5oF/wNilLcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WLZx0gSUEetrlY5dT+9z+FcDeFGbXu4IrzEPmNNmnw2MaxAAkTe8VUCCcFCi2C+MB
	 dkxRP48R/nx0jlKqw43yoe6wM1lRiFOvTWebvZ8Qs9UdzENaZPLXG4eWEquWnAUOhC
	 yoM1GggpvdVX9BPvzvVFSzI6Jy7gQiOoBp3pHWpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C12F80111;
	Thu, 21 May 2020 16:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2EEDF801A3; Thu, 21 May 2020 16:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45A35F80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 16:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A35F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="PRDTs1mj"
Received: by mail-qv1-xf43.google.com with SMTP id d1so3161994qvl.6
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OWMWIICJOp+hJAxbX5Tu+4fE+20wKUz+iRF2w47jjK4=;
 b=PRDTs1mjXcMqy/ZTMG/SawaHuhiPDJJ/XK7hjnFWwJaLgXZ5M7LitZJazQo/VwhxKt
 oQJanCwKUt6lcaYMxzMQkiNzF/gCZHih0F+NJ3CTjtOgWoy3pM0Y5P60b0LMQ0VXDHOQ
 qtWz+VN6boOo5k/YtmF+JkzXELBBxq4OgnM3vvv5VmsyGNses7aodAneycKoa0gopNlI
 lmZG708Hbf2ndbxZMSCTPbo+iDef53/b3YwGCqNN10nkjCwr+RSBdNpEvo/uHYu6iPBu
 /1K/pY9BAFcz7rzRRxKn3pNj31k+DKi+aODYVo9refINiXwAKQ0YnZ6hjan1+ldan+Eq
 qizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OWMWIICJOp+hJAxbX5Tu+4fE+20wKUz+iRF2w47jjK4=;
 b=m+HCetJxfj6djRpkMmoMwKxotytJrhKuXlFAZn1pZs5u0tinhPk4oomAbK6N0Pfs4H
 dbG0CnPftgd9hTAEBkPh7q1Z2a88c0pJ+RK/olaP82bXkF3fRkgUU8hwlLPw4DApa5kz
 g7XDSEEBjzkVwDPZ0A/jqzyBeKD0sO2/4ajnU/G++yGRNShBaQjhqGxcFq5tZHT8V870
 d9wW7Vn8dt26CJirTn+J1RRXVBgYfEv01g1Xi127ZzguNA0FAGSqtNj0/z5eKbmiNPB3
 QXF1Nmcwl/rrnW8cm1c3GsMbW6bnDbUYjRIAOjGu3qw7+0dnpD2qYyOAwGRiylP0U0Fd
 JCTg==
X-Gm-Message-State: AOAM533CsV2s7aSOnmZ3o2yPmVSCq2SbiH7IpuuEUV2xcGDBA5fi5TnG
 mEVh3TQAxI1gK2TIgMClCpnLykLToJpFotMz2ED95Q==
X-Google-Smtp-Source: ABdhPJzE7H4KRjQEBFo3WyNaEzMkFyOfvi7urDEOFRg1183iO5SYn2hpqNanGY1czvRCAJX9oh9wS3GjgwCsJksyQKQ=
X-Received: by 2002:a0c:e6c2:: with SMTP id l2mr10201167qvn.91.1590072198498; 
 Thu, 21 May 2020 07:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200521134700.1035657-1-lma@semihalf.com>
 <964af231-0bce-1bb2-ea0c-b8bc423eb916@linux.intel.com>
 <CAFJ_xbp+0-q0ntKfwsoKH2CMocdjYQRR1_sU8-JvupiJa9wrgw@mail.gmail.com>
In-Reply-To: <CAFJ_xbp+0-q0ntKfwsoKH2CMocdjYQRR1_sU8-JvupiJa9wrgw@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Thu, 21 May 2020 16:43:07 +0200
Message-ID: <CAFJ_xbqwg6KqoOoUPEM1bhwQ0wuBHAcQD28fhabC5=qogCdEwQ@mail.gmail.com>
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

Pierre

Sorry, I didn't get it for the first time, you are suggesting to not
use DMIC01 as it is used by PCH-attached
dmics by other drivers.

Best regards,
Lukasz

czw., 21 maj 2020 o 16:36 =C5=81ukasz Majczak <lma@semihalf.com> napisa=C5=
=82(a):
>
> Yes, my bad
> it should be:
> +       { "codec1_in", NULL, "DMIC01 Rx" },
> +       { "DMIC01 Rx", NULL, "AIF1 Capture" },
>
> The whole idea of taking the mic for SSP0 definition is that each BE
> should have its own fixup. Before there was one fixup function, which
> checked inside which BE is connected to which FE and applied the
> proper fix, it was using the fact that "params" were part of
> snd_soc_dpcm. That has changed and now params are "orphaned" so each
> BE has to apply a specific fixup for itself.
>
> Best regards,
> Lukasz
>
>
> czw., 21 maj 2020 o 16:25 Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> >
> >
> >
> > On 5/21/20 8:47 AM, Lukasz Majczak wrote:
> > > Split be_hw_params_fixup function for different codecs as current com=
mon
> > > function, leads to crash while trying to get snd_soc_dpcm with
> > > container_of() macro in kabylake_ssp_fixup().
> > > The crash call path looks as below:
> > > soc_pcm_hw_params()
> > > snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
> > > rtd->dai_link->be_hw_params_fixup(rtd, params)
> > > kabylake_ssp_fixup()
> > > In this case, codec_params is just a copy of an internal structure an=
d is
> > > not embedded into struct snd_soc_dpcm thus we cannot use
> > > container_of() on it.
> > >
> > > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > > ---
> > >   .../intel/boards/kbl_rt5663_rt5514_max98927.c | 130 ++++++++++++---=
---
> > >   1 file changed, 85 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/so=
und/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > index 1b1f8d7a4ea3..12a9983979e0 100644
> > > --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> > > @@ -171,8 +171,8 @@ static const struct snd_soc_dapm_route kabylake_m=
ap[] =3D {
> > >       { "hs_in", NULL, "ssp1 Rx" },
> > >       { "ssp1 Rx", NULL, "AIF Capture" },
> > >
> > > -     { "codec1_in", NULL, "ssp0 Rx" },
> > > -     { "ssp0 Rx", NULL, "AIF1 Capture" },
> > > +     { "codec1_in", NULL, "DMIC01 Rx" },
> > > +     { "DMIC01 Rx", NULL, "AIF1 Capture" },
> >
> > This doesn't seem right. This board uses DMICs attached to the codec so
> > we should not make references to routes that are used for PCH-attached
> > dmics in all other machine drivers:
> >
> >         { "dmic01_hifi", NULL, "DMIC01 Rx" },
> >         { "DMIC01 Rx", NULL, "DMIC AIF" },
> >
> > >
> > >       /* IV feedback path */
> > >       { "codec0_fb_in", NULL, "ssp0 Rx"},
> > > @@ -328,42 +328,52 @@ static const struct snd_soc_ops kabylake_rt5663=
_fe_ops =3D {
> > >       .startup =3D kbl_fe_startup,
> > >   };
> > >
> > > -static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> > > -                                     struct snd_pcm_hw_params *param=
s)
> > > +static void kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> > > +     struct snd_pcm_hw_params *params, snd_pcm_format_t pcm_fmt)
> > >   {
> > >       struct snd_interval *rate =3D hw_param_interval(params,
> > >                       SNDRV_PCM_HW_PARAM_RATE);
> > > -     struct snd_interval *chan =3D hw_param_interval(params,
> > > +     struct snd_interval *channels =3D hw_param_interval(params,
> > >                       SNDRV_PCM_HW_PARAM_CHANNELS);
> > >       struct snd_mask *fmt =3D hw_param_mask(params, SNDRV_PCM_HW_PAR=
AM_FORMAT);
> > > -     struct snd_soc_dpcm *dpcm =3D container_of(
> > > -                     params, struct snd_soc_dpcm, hw_params);
> > > -     struct snd_soc_dai_link *fe_dai_link =3D dpcm->fe->dai_link;
> > > -     struct snd_soc_dai_link *be_dai_link =3D dpcm->be->dai_link;
> > >
> > >       /*
> > >        * The ADSP will convert the FE rate to 48k, stereo, 24 bit
> > >        */
> > > -     if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
> > > -         !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
> > > -         !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
> > > -             rate->min =3D rate->max =3D 48000;
> > > -             chan->min =3D chan->max =3D 2;
> > > -             snd_mask_none(fmt);
> > > -             snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> > > -     } else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
> > > +
> > > +     rate->min =3D rate->max =3D 48000;
> > > +     channels->min =3D channels->max =3D 2;
> > > +
> > > +     snd_mask_none(fmt);
> > > +     snd_mask_set_format(fmt, pcm_fmt);
> > > +}
> > > +
> > > +static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
> > > +     struct snd_pcm_hw_params *params)
> > > +{
> > > +     kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S16_LE);
> > > +     return 0;
> > > +}
> > > +
> > > +static int kabylake_ssp1_fixup(struct snd_soc_pcm_runtime *rtd,
> > > +     struct snd_pcm_hw_params *params)
> > > +{
> > > +
> > > +     kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
> > > +     return 0;
> > > +}
> > > +
> > > +static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
> > > +                                     struct snd_pcm_hw_params *param=
s)
> > > +{
> > > +     struct snd_interval *channels =3D hw_param_interval(params,
> > > +                     SNDRV_PCM_HW_PARAM_CHANNELS);
> > > +
> > >               if (params_channels(params) =3D=3D 2 ||
> > >                               DMIC_CH(dmic_constraints) =3D=3D 2)
> > > -                     chan->min =3D chan->max =3D 2;
> > > +                     channels->min =3D channels->max =3D 2;
> > >               else
> > > -                     chan->min =3D chan->max =3D 4;
> > > -     }
> > > -     /*
> > > -      * The speaker on the SSP0 supports S16_LE and not S24_LE.
> > > -      * thus changing the mask here
> > > -      */
> > > -     if (!strcmp(be_dai_link->name, "SSP0-Codec"))
> > > -             snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> > > +                     channels->min =3D channels->max =3D 4;
> > >
> > >       return 0;
> > >   }
> > > @@ -400,20 +410,6 @@ static int kabylake_ssp0_hw_params(struct snd_pc=
m_substream *substream,
> > >       int ret =3D 0, j;
> > >
> > >       for_each_rtd_codec_dais(rtd, j, codec_dai) {
> > > -             if (!strcmp(codec_dai->component->name, RT5514_DEV_NAME=
)) {
> > > -                     ret =3D snd_soc_dai_set_tdm_slot(codec_dai, 0xF=
, 0, 8, 16);
> > > -                     if (ret < 0) {
> > > -                             dev_err(rtd->dev, "set TDM slot err:%d\=
n", ret);
> > > -                             return ret;
> > > -                     }
> > > -
> > > -                     ret =3D snd_soc_dai_set_sysclk(codec_dai,
> > > -                             RT5514_SCLK_S_MCLK, 24576000, SND_SOC_C=
LOCK_IN);
> > > -                     if (ret < 0) {
> > > -                             dev_err(rtd->dev, "set sysclk err: %d\n=
", ret);
> > > -                             return ret;
> > > -                     }
> > > -             }
> > >               if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME=
)) {
> > >                       ret =3D snd_soc_dai_set_tdm_slot(codec_dai, 0x3=
0, 3, 8, 16);
> > >                       if (ret < 0) {
> > > @@ -433,10 +429,37 @@ static int kabylake_ssp0_hw_params(struct snd_p=
cm_substream *substream,
> > >       return ret;
> > >   }
> > >
> > > +static int kabylake_dmic01_hw_params(struct snd_pcm_substream *subst=
ream,
> > > +     struct snd_pcm_hw_params *params)
> > > +{
> > > +     struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > > +     int ret =3D 0;
> > > +
> > > +     ret =3D snd_soc_dai_set_tdm_slot(rtd->codec_dai, 0xF, 0, 8, 16)=
;
> > > +     if (ret < 0) {
> > > +             dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     ret =3D snd_soc_dai_set_sysclk(rtd->codec_dai,
> > > +             RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
> > > +     if (ret < 0) {
> > > +             dev_err(rtd->dev, "set sysclk err: %d\n", ret);
> > > +             return ret;
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >   static struct snd_soc_ops kabylake_ssp0_ops =3D {
> > >       .hw_params =3D kabylake_ssp0_hw_params,
> > >   };
> > >
> > > +static struct snd_soc_ops kabylake_dmic01_ops =3D {
> > > +     .hw_params =3D kabylake_dmic01_hw_params,
> > > +};
> > > +
> > > +
> > >   static const unsigned int channels_dmic[] =3D {
> > >       4,
> > >   };
> > > @@ -507,14 +530,19 @@ SND_SOC_DAILINK_DEF(ssp0_pin,
> > >   SND_SOC_DAILINK_DEF(ssp0_codec,
> > >       DAILINK_COMP_ARRAY(
> > >       /* Left */ COMP_CODEC(MAXIM_DEV0_NAME, KBL_MAXIM_CODEC_DAI),
> > > -     /* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI),
> > > -     /* dmic */ COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_D=
AI)));
> > > +     /* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI)));
> > >
> > >   SND_SOC_DAILINK_DEF(ssp1_pin,
> > >       DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
> > >   SND_SOC_DAILINK_DEF(ssp1_codec,
> > >       DAILINK_COMP_ARRAY(COMP_CODEC(RT5663_DEV_NAME, KBL_REALTEK_CODE=
C_DAI)));
> > >
> > > +SND_SOC_DAILINK_DEF(dmic01_pin,
> > > +     DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
> > > +SND_SOC_DAILINK_DEF(dmic01_codec,
> > > +     DAILINK_COMP_ARRAY(
> > > +             COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI)=
));
> > > +
> > >   SND_SOC_DAILINK_DEF(idisp1_pin,
> > >       DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
> > >   SND_SOC_DAILINK_DEF(idisp1_codec,
> > > @@ -618,9 +646,8 @@ static struct snd_soc_dai_link kabylake_dais[] =
=3D {
> > >                       SND_SOC_DAIFMT_NB_NF |
> > >                       SND_SOC_DAIFMT_CBS_CFS,
> > >               .ignore_pmdown_time =3D 1,
> > > -             .be_hw_params_fixup =3D kabylake_ssp_fixup,
> > > +             .be_hw_params_fixup =3D kabylake_ssp0_fixup,
> > >               .dpcm_playback =3D 1,
> > > -             .dpcm_capture =3D 1,
> > >               .ops =3D &kabylake_ssp0_ops,
> > >               SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
> > >       },
> > > @@ -632,12 +659,25 @@ static struct snd_soc_dai_link kabylake_dais[] =
=3D {
> > >               .dai_fmt =3D SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF =
|
> > >                       SND_SOC_DAIFMT_CBS_CFS,
> > >               .ignore_pmdown_time =3D 1,
> > > -             .be_hw_params_fixup =3D kabylake_ssp_fixup,
> > > +             .be_hw_params_fixup =3D kabylake_ssp1_fixup,
> > >               .ops =3D &kabylake_rt5663_ops,
> > >               .dpcm_playback =3D 1,
> > >               .dpcm_capture =3D 1,
> > >               SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
> > >       },
> > > +     {
> > > +             .name =3D "dmic01",
> > > +             .id =3D 2,
> > > +             .no_pcm =3D 1,
> > > +             .dai_fmt =3D SND_SOC_DAIFMT_DSP_B |
> > > +                     SND_SOC_DAIFMT_NB_NF |
> > > +                     SND_SOC_DAIFMT_CBS_CFS,
> > > +             .ignore_pmdown_time =3D 1,
> > > +             .be_hw_params_fixup =3D kabylake_dmic_fixup,
> > > +             .dpcm_capture =3D 1,
> > > +             .ops =3D &kabylake_dmic01_ops,
> > > +             SND_SOC_DAILINK_REG(dmic01_pin, dmic01_codec, platform)=
,
> > > +     },
> > >       {
> > >               .name =3D "iDisp1",
> > >               .id =3D 3,
> > >
> > > base-commit: a4f6fc98cd2fa1774bcaeb248c67156ef9402a56
> > >
