Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6537264B3D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 19:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4154E16CD;
	Thu, 10 Sep 2020 19:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4154E16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599758902;
	bh=6AEuD8nWB9PJJJYQIz7WuLSey2pf1p7gkTMevGaUMXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gxn4uGDGii9mW8ccDfr5aeFg9kRTKICfWCiNDvzWP4j9aLdgTa9oRqJZ7fbKrAIBo
	 fMQR460q2yFdOoSJLn1ia3lVllHay/ZBblhp7LRC4r0+nGcfj+ImfubYNyQ57xbdpt
	 clHwL0JRWTOPxNjdj06Ig//6wGzQ+81mR+T9sedY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAAD9F800E9;
	Thu, 10 Sep 2020 19:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FC29F80272; Thu, 10 Sep 2020 19:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95C28F800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 19:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95C28F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="yQxa1uFq"
Received: by mail-wm1-x343.google.com with SMTP id k18so928029wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q2MB5IT0bikMUn6c3zdS8TDwnoNX5JcV8nLKLxukdHs=;
 b=yQxa1uFqI6MzIP4AqqSAIuyvo6uBBV3k3Ss9wgQa87lkdUj0po3ZTMLz7EHRG0Jt1E
 nQyxpy+RWU0GKPNGZJ13/9XO82+cWeiegUHAVHtJdnorgiw3xMK0/UeDcGH+2HpURtPK
 SSr4RXgK5/2eoYffF+/5MKW3gtwziDrrUkU0G2KF3tz2RHZHDrJ2IWLagey+akhm4a26
 XT53QpIydi7x+cDDwuJlSso35BtJGfhwbr/QWpmFpL0YlZO15AzgQi1ozpNcWhwO1SNt
 9ekevTze2NsqpUpE5dN3bA/tJUhiyifOoTeRdxcVfwyMnd/sf+MRS1P/4c5BtxPiuTOo
 9grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q2MB5IT0bikMUn6c3zdS8TDwnoNX5JcV8nLKLxukdHs=;
 b=iveUl5Ls/tYe+19tdPWQDxYyXwz4mfQE5/vxUIWD+iOlYCIujipBt5Qy8hcRZ4wvqh
 6DcDoUWqJCcEmLmsriuIDE+CKDjVrNXS2Cjua8g3WdnIeJaPNeRASs3bdwfYGROSlDiI
 r7I6hX4guUgC7u1MOAVs6MtjwDyd6RZXJtpndKIuYHuUyIjBbKxIhLsvQyUtQZlPdKw1
 JRVvHICLgBUwmIq32/h/JbDvGK7fEN9HD31bs6cLpbRpviR9yRx0mpssZjHjiXRIrlZt
 A8m3+Il0ZW3e5T5dyNpvV+dwF43uDxFedeRK545kM8CfcKSwCISDq5iMHr1ZKrcrp0bA
 v74g==
X-Gm-Message-State: AOAM5311O0UI3W7aJtizsuSky3dIjqiNWslOKMrPgO3sF0349kdQKq0x
 LTj/s8aiyIrgUTRDjfPB0iU9ex4VYBBgMW6Vl/8tsg==
X-Google-Smtp-Source: ABdhPJzmdh6qHKOv2bhof65lb3HDGws/sZ2pyZiT/DiZwR9e/Xtzl6vG3Np4bTQPLhFZANFWZVuX6qxarL8zi1z1eyQ=
X-Received: by 2002:a1c:6346:: with SMTP id x67mr1078770wmb.42.1599758748908; 
 Thu, 10 Sep 2020 10:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200910154056.30962-1-rad@semihalf.com>
 <333f3365-1ef4-068a-5845-feb01bf46d03@linux.intel.com>
In-Reply-To: <333f3365-1ef4-068a-5845-feb01bf46d03@linux.intel.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Date: Thu, 10 Sep 2020 19:25:33 +0200
Message-ID: <CAOs-w0+knBPoE0vcvHRgjjNumQ_2CL6uhrEBQTpe0khWtNMb2g@mail.gmail.com>
Subject: Re: [PATCH V4] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, John Hsu <KCHSU0@nuvoton.com>,
 Harshapriya <harshapriya.n@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "Sienkiewicz, Michal" <michal.sienkiewicz@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Alex Levin <levinale@google.com>
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

Thank you Pierre.
Sending V6.

czw., 10 wrz 2020 o 17:58 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
>
> almost there, only couple of typos below. The comments are really good no=
w!
>
> > +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream=
, int cmd)
> >   {
> >       struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     struct snd_pcm_runtime *runtime =3D substream->runtime;
> >       struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
> > -     int ret;
> > -
> > -     ret =3D snd_soc_dai_set_sysclk(codec_dai,
> > -                     NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> > -
> > -     if (ret < 0)
> > -             dev_err(rtd->dev, "snd_soc_dai_set_sysclk err =3D %d\n", =
ret);
> > +     int ret =3D 0;
> > +
> > +     switch (cmd) {
> > +     case SNDRV_PCM_TRIGGER_START:
> > +             /* Since 256xFS clocks cannot be generated by SKL, the NA=
U8825
> > +              * is configured to re-generate its system clock from the=
 BCLK
> > +              * using the FLL.
> > +              * We must switch system clock (FLL to use BCLK) here as =
it is
> > +              * not given eariler by FW (like in hw_param). We let nau=
8825 to
>
> typo: earlier
>
> > +              * use internal VCO clock till now which reduces the audi=
able
>
> type: audible
>
> > +              * pop's. */
> > +
> > +             /* fall through */
>
> I don't think it's required if there's no code?
>
> > +
> > +     case SNDRV_PCM_TRIGGER_RESUME:
> > +             /* Once device resumes, the system will only enable power
> > +              * sequence for playback without doing hardware parameter=
, audio
> > +              * format, and PLL configure. In the mean time, the jack
> > +              * detecion sequence has changed PLL parameters and switc=
hed to
>
> typo: detection
>
> > +              * internal clock. Thus, the playback signal distorted wi=
thout
> > +              * correct PLL parameters. Therefore we need to configure=
 PLL
> > +              * again */
> > +             ret =3D snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL=
_FS, 0,
> > +                                          SND_SOC_CLOCK_IN);
> > +             if (ret < 0) {
> > +                     dev_err(codec_dai->dev, "can't set FS clock %d\n"=
, ret);
> > +                     break;
> > +             }
> > +             ret =3D snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rat=
e,
> > +                                       runtime->rate * 256);
> > +             if (ret < 0)
> > +                     dev_err(codec_dai->dev, "can't set FLL: %d\n", re=
t);
> > +             break;
> > +     }
>
> same comments for the other machine driver.
> >
> >       return ret;
> >   }
> >
> > -static const struct snd_soc_ops skylake_nau8825_ops =3D {
> > -     .hw_params =3D skylake_nau8825_hw_params,
> > +static struct snd_soc_ops skylake_nau8825_ops =3D {
> > +     .trigger =3D skylake_nau8825_trigger,
> >   };
> >
> >   static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
> > diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/=
intel/boards/skl_nau88l25_ssm4567.c
> > index 4b317bcf6ea0..d076f19f9b78 100644
> > --- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> > +++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> > @@ -12,6 +12,7 @@
> >
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/delay.h>
> >   #include <sound/core.h>
> >   #include <sound/pcm.h>
> >   #include <sound/soc.h>
> > @@ -57,12 +58,12 @@ static const struct snd_kcontrol_new skylake_contro=
ls[] =3D {
> >   };
> >
> >   static int platform_clock_control(struct snd_soc_dapm_widget *w,
> > -             struct snd_kcontrol *k, int  event)
> > +             struct snd_kcontrol *k, int event)
> >   {
> >       struct snd_soc_dapm_context *dapm =3D w->dapm;
> >       struct snd_soc_card *card =3D dapm->card;
> >       struct snd_soc_dai *codec_dai;
> > -     int ret;
> > +     int ret =3D 0;
> >
> >       codec_dai =3D snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_=
DAI);
> >       if (!codec_dai) {
> > @@ -70,14 +71,7 @@ static int platform_clock_control(struct snd_soc_dap=
m_widget *w,
> >               return -EIO;
> >       }
> >
> > -     if (SND_SOC_DAPM_EVENT_ON(event)) {
> > -             ret =3D snd_soc_dai_set_sysclk(codec_dai,
> > -                             NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK=
_IN);
> > -             if (ret < 0) {
> > -                     dev_err(card->dev, "set sysclk err =3D %d\n", ret=
);
> > -                     return -EIO;
> > -             }
> > -     } else {
> > +     if (!SND_SOC_DAPM_EVENT_ON(event)) {
> >               ret =3D snd_soc_dai_set_sysclk(codec_dai,
> >                               NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN=
);
> >               if (ret < 0) {
> > @@ -85,6 +79,7 @@ static int platform_clock_control(struct snd_soc_dapm=
_widget *w,
> >                       return -EIO;
> >               }
> >       }
> > +
> >       return ret;
> >   }
> >
> > @@ -344,24 +339,51 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_=
runtime *rtd,
> >       return 0;
> >   }
> >
> > -static int skylake_nau8825_hw_params(struct snd_pcm_substream *substre=
am,
> > -     struct snd_pcm_hw_params *params)
> > +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream=
, int cmd)
> >   {
> >       struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     struct snd_pcm_runtime *runtime =3D substream->runtime;
> >       struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
> > -     int ret;
> > -
> > -     ret =3D snd_soc_dai_set_sysclk(codec_dai,
> > -                     NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> > -
> > -     if (ret < 0)
> > -             dev_err(rtd->dev, "snd_soc_dai_set_sysclk err =3D %d\n", =
ret);
> > +     int ret =3D 0;
> > +
> > +     switch (cmd) {
> > +     case SNDRV_PCM_TRIGGER_START:
> > +             /* Since 256xFS clocks cannot be generated by SKL, the NA=
U8825
> > +              * is configured to re-generate its system clock from the=
 BCLK
> > +              * using the FLL.
> > +              * We must switch system clock (FLL to use BCLK) here as =
it is
> > +              * not given eariler by FW (like in hw_param). We let nau=
8825 to
> > +              * use internal VCO clock till now which reduces the audi=
able
> > +              * pop's. */
> > +
> > +             /* fall through */
> > +
> > +     case SNDRV_PCM_TRIGGER_RESUME:
> > +             /* Once device resumes, the system will only enable power
> > +              * sequence for playback without doing hardware parameter=
, audio
> > +              * format, and PLL configure. In the mean time, the jack
> > +              * detecion sequence has changed PLL parameters and switc=
hed to
> > +              * internal clock. Thus, the playback signal distorted wi=
thout
> > +              * correct PLL parameters. Therefore we need to configure=
 PLL
> > +              * again */
> > +             ret =3D snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL=
_FS, 0,
> > +                                          SND_SOC_CLOCK_IN);
> > +             if (ret < 0) {
> > +                     dev_err(codec_dai->dev, "can't set FS clock %d\n"=
, ret);
> > +                     break;
> > +             }
> > +             ret =3D snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rat=
e,
> > +                                       runtime->rate * 256);
> > +             if (ret < 0)
> > +                     dev_err(codec_dai->dev, "can't set FLL: %d\n", re=
t);
> > +             break;
> > +     }
> >
> >       return ret;
> >   }
> >
> > -static const struct snd_soc_ops skylake_nau8825_ops =3D {
> > -     .hw_params =3D skylake_nau8825_hw_params,
> > +static struct snd_soc_ops skylake_nau8825_ops =3D {
> > +     .trigger =3D skylake_nau8825_trigger,
> >   };
> >
> >   static const unsigned int channels_dmic[] =3D {
> > @@ -582,6 +604,7 @@ static struct snd_soc_dai_link skylake_dais[] =3D {
> >               .init =3D skylake_ssm4567_codec_init,
> >               .ignore_pmdown_time =3D 1,
> >               .be_hw_params_fixup =3D skylake_ssp_fixup,
> > +             .ops =3D &skylake_nau8825_ops,
> >               .dpcm_playback =3D 1,
> >               .dpcm_capture =3D 1,
> >               SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
> >
