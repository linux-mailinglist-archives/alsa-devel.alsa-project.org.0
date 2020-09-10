Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80126490B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 17:51:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1051D16AE;
	Thu, 10 Sep 2020 17:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1051D16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599753048;
	bh=trmJ68PhLLl+aWBDgTM5pbM9Sr1Pdi7zdqAaYMsZOLM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4aDg+htQmBcxxqQw51jMwBmByNpHYpntWXrDkC0eslJ1IbSS2xZfaROzbBJD5OUY
	 Bw7Dhn73abR1V74+4RSOmu2eF5ceG9qIkyOLLHCz5Iez7owZp+qAPEGmuq1fAD3jZS
	 2hRnz8UhLHQrhfqhe+FknS8Jx/KbpJ1w2i7AXEsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 908DAF800D0;
	Thu, 10 Sep 2020 17:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D22F80264; Thu, 10 Sep 2020 17:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08F3DF800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 17:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F3DF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="YNl7TSu+"
Received: by mail-wm1-x342.google.com with SMTP id a9so542830wmm.2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=peTib//Ycbs3vZS6Tzhvh2I/PmXZcYoOfUtEJkf9FQ4=;
 b=YNl7TSu+ahLYsc/jiGC17DmXsEV/SAw1UbLXJy7PrRKECo+gal8Aw5Z2Z5FLRe1pqt
 AFX5z5RdSL1+LvcuUncXi2ht8QHiTwHiW6F2ZnImCVg/8YY5JtuDWqbL+n/GOafzlNu4
 zNzxHLvZSCMY6WdOEZVqueGLExf1GiPoAEqZGBda0U02UrPo/Lnd0a/gLOBKsnW54hDl
 y1tiPAgKF+QN7gdKwYfAUiiEV3D+cEXtVCD6dK9dQCqO2R/DunWsGGplLY/YP+jG5Aye
 tnJSO1dFySl1v/Do4bIkeVt9C3fikauYdlzcA0T4M1jdmOhcyflqDAKc2xv5fvFecXKe
 /TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=peTib//Ycbs3vZS6Tzhvh2I/PmXZcYoOfUtEJkf9FQ4=;
 b=By545aDpqt+wNmkPSVzFK0FlY88V5pZNc4VYfNHf6nnyHzmjR+/ru+DXwq24m2oYUe
 p0fn2i/aLuyHNg4eTqiaF6jw2Cj9MfrKbs9rXo3ZbI98c2ktvGtYsNpV693B82R4e0a0
 XJIxa6GhJskpOHmugFSLv/lMr0y51KuNLfROzX6r7iY8BipCEjc1cycuEKLbhV+42IAk
 mZvUyOqqZmneljmvt1/T4K8G2HbqrJiUsL96r3KJeVGX1Bh2pxOlv+fB0FRFdZG4KSwD
 DN1aY4GjU0/KFME0xXlX+exW1iX4c/aIXR4peM1OjIvhpPdY/BRqFdhee3CESY18qzcp
 rKsg==
X-Gm-Message-State: AOAM532yrQzMwqyCVAX8rGWHmWJkSxrBZk+F2RO6BNyjLDNjOMHdtO9W
 BT+i8wTMEgadvKhEDu0TuZrNhmaVGCYrGvvZvuJ/Qg==
X-Google-Smtp-Source: ABdhPJy/G5qXm1ukl5loDyRdmsTwPfqXy5EZ5cNbSLODuuUQ6QVNR2nqW9BHNFvqesprokdmT7VA2jvQ5EdHxOgm/2U=
X-Received: by 2002:a7b:c384:: with SMTP id s4mr629291wmj.138.1599752928984;
 Thu, 10 Sep 2020 08:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200910154056.30962-1-rad@semihalf.com>
In-Reply-To: <20200910154056.30962-1-rad@semihalf.com>
From: =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Date: Thu, 10 Sep 2020 17:48:34 +0200
Message-ID: <CAOs-w0JSFOZf_H3puAAkwbhZH1cWKit8R_2BqmEtx8y9n=ebEA@mail.gmail.com>
Subject: Re: [PATCH V4] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 John Hsu <KCHSU0@nuvoton.com>, linux-kernel@vger.kernel.org, "Sienkiewicz,
 Michal" <michal.sienkiewicz@intel.com>, Ben Zhang <benzh@chromium.org>,
 Mac Chiang <mac.chiang@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Marcin Wojtas <mw@semihalf.com>,
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

Sorry, V4 got one stray change for SSP0 ops.
Need to send V5.

czw., 10 wrz 2020 o 17:40 Radoslaw Biernacki <rad@semihalf.com> napisa=C5=
=82(a):
>
> Since 256xFS clocks cannot be generated by SKL, the NAU8825 is
> configured to re-generate its system clock from the BCLK using the
> FLL. The link is configured to use a 48kHz frame rate, and 24 bits in
> 25-bit slot. The SSP configuration is extracted from NHLT settings and
> not dynamically changed. Listening tests and measurements do not show
> any distortion or issues
>
> Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
> Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Ben Zhang <benzh@chromium.org>
> Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
> ---
>
> Notes:
>     v1 -> v2:
>     - adding same changes to skl_nau88l25_max98357a.c
>     v2 -> v3:
>     - removing msleep() in SNDRV_PCM_TRIGGER_RESUME as it unnecessarily i=
ncrease
>       playback/capture latency while actually FLL does not require it.
>     - simplifing commit message
>     v3 -> v4:
>     - simplifing the PM resume callback code for setting the FLL
>     - adding comment for the stream START/RESUME sequence which prevent a=
udio pops
>     - fixing mising var initialization in platform_clock_control()
>
>  .../soc/intel/boards/skl_nau88l25_max98357a.c | 63 ++++++++++++------
>  sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 65 +++++++++++++------
>  2 files changed, 86 insertions(+), 42 deletions(-)
>
> diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/=
intel/boards/skl_nau88l25_max98357a.c
> index d7b8154c43a4..2f0abbd2dd8d 100644
> --- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
> +++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
> @@ -8,6 +8,7 @@
>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/delay.h>
>  #include <sound/core.h>
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
> @@ -47,12 +48,12 @@ enum {
>  };
>
>  static int platform_clock_control(struct snd_soc_dapm_widget *w,
> -       struct snd_kcontrol *k, int  event)
> +       struct snd_kcontrol *k, int event)
>  {
>         struct snd_soc_dapm_context *dapm =3D w->dapm;
>         struct snd_soc_card *card =3D dapm->card;
>         struct snd_soc_dai *codec_dai;
> -       int ret;
> +       int ret =3D 0;
>
>         codec_dai =3D snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_=
DAI);
>         if (!codec_dai) {
> @@ -60,14 +61,7 @@ static int platform_clock_control(struct snd_soc_dapm_=
widget *w,
>                 return -EIO;
>         }
>
> -       if (SND_SOC_DAPM_EVENT_ON(event)) {
> -               ret =3D snd_soc_dai_set_sysclk(codec_dai,
> -                               NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK=
_IN);
> -               if (ret < 0) {
> -                       dev_err(card->dev, "set sysclk err =3D %d\n", ret=
);
> -                       return -EIO;
> -               }
> -       } else {
> +       if (!SND_SOC_DAPM_EVENT_ON(event)) {
>                 ret =3D snd_soc_dai_set_sysclk(codec_dai,
>                                 NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN=
);
>                 if (ret < 0) {
> @@ -292,24 +286,51 @@ static const struct snd_soc_ops skylake_nau8825_fe_=
ops =3D {
>         .startup =3D skl_fe_startup,
>  };
>
> -static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream=
,
> -       struct snd_pcm_hw_params *params)
> +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, =
int cmd)
>  {
>         struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
>         struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
> -       int ret;
> -
> -       ret =3D snd_soc_dai_set_sysclk(codec_dai,
> -                       NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> -
> -       if (ret < 0)
> -               dev_err(rtd->dev, "snd_soc_dai_set_sysclk err =3D %d\n", =
ret);
> +       int ret =3D 0;
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +               /* Since 256xFS clocks cannot be generated by SKL, the NA=
U8825
> +                * is configured to re-generate its system clock from the=
 BCLK
> +                * using the FLL.
> +                * We must switch system clock (FLL to use BCLK) here as =
it is
> +                * not given eariler by FW (like in hw_param). We let nau=
8825 to
> +                * use internal VCO clock till now which reduces the audi=
able
> +                * pop's. */
> +
> +               /* fall through */
> +
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +               /* Once device resumes, the system will only enable power
> +                * sequence for playback without doing hardware parameter=
, audio
> +                * format, and PLL configure. In the mean time, the jack
> +                * detecion sequence has changed PLL parameters and switc=
hed to
> +                * internal clock. Thus, the playback signal distorted wi=
thout
> +                * correct PLL parameters. Therefore we need to configure=
 PLL
> +                * again */
> +               ret =3D snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL=
_FS, 0,
> +                                            SND_SOC_CLOCK_IN);
> +               if (ret < 0) {
> +                       dev_err(codec_dai->dev, "can't set FS clock %d\n"=
, ret);
> +                       break;
> +               }
> +               ret =3D snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rat=
e,
> +                                         runtime->rate * 256);
> +               if (ret < 0)
> +                       dev_err(codec_dai->dev, "can't set FLL: %d\n", re=
t);
> +               break;
> +       }
>
>         return ret;
>  }
>
> -static const struct snd_soc_ops skylake_nau8825_ops =3D {
> -       .hw_params =3D skylake_nau8825_hw_params,
> +static struct snd_soc_ops skylake_nau8825_ops =3D {
> +       .trigger =3D skylake_nau8825_trigger,
>  };
>
>  static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
> diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/in=
tel/boards/skl_nau88l25_ssm4567.c
> index 4b317bcf6ea0..d076f19f9b78 100644
> --- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> +++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> @@ -12,6 +12,7 @@
>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/delay.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/soc.h>
> @@ -57,12 +58,12 @@ static const struct snd_kcontrol_new skylake_controls=
[] =3D {
>  };
>
>  static int platform_clock_control(struct snd_soc_dapm_widget *w,
> -               struct snd_kcontrol *k, int  event)
> +               struct snd_kcontrol *k, int event)
>  {
>         struct snd_soc_dapm_context *dapm =3D w->dapm;
>         struct snd_soc_card *card =3D dapm->card;
>         struct snd_soc_dai *codec_dai;
> -       int ret;
> +       int ret =3D 0;
>
>         codec_dai =3D snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_=
DAI);
>         if (!codec_dai) {
> @@ -70,14 +71,7 @@ static int platform_clock_control(struct snd_soc_dapm_=
widget *w,
>                 return -EIO;
>         }
>
> -       if (SND_SOC_DAPM_EVENT_ON(event)) {
> -               ret =3D snd_soc_dai_set_sysclk(codec_dai,
> -                               NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK=
_IN);
> -               if (ret < 0) {
> -                       dev_err(card->dev, "set sysclk err =3D %d\n", ret=
);
> -                       return -EIO;
> -               }
> -       } else {
> +       if (!SND_SOC_DAPM_EVENT_ON(event)) {
>                 ret =3D snd_soc_dai_set_sysclk(codec_dai,
>                                 NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN=
);
>                 if (ret < 0) {
> @@ -85,6 +79,7 @@ static int platform_clock_control(struct snd_soc_dapm_w=
idget *w,
>                         return -EIO;
>                 }
>         }
> +
>         return ret;
>  }
>
> @@ -344,24 +339,51 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_ru=
ntime *rtd,
>         return 0;
>  }
>
> -static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream=
,
> -       struct snd_pcm_hw_params *params)
> +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, =
int cmd)
>  {
>         struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
>         struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, 0);
> -       int ret;
> -
> -       ret =3D snd_soc_dai_set_sysclk(codec_dai,
> -                       NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> -
> -       if (ret < 0)
> -               dev_err(rtd->dev, "snd_soc_dai_set_sysclk err =3D %d\n", =
ret);
> +       int ret =3D 0;
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +               /* Since 256xFS clocks cannot be generated by SKL, the NA=
U8825
> +                * is configured to re-generate its system clock from the=
 BCLK
> +                * using the FLL.
> +                * We must switch system clock (FLL to use BCLK) here as =
it is
> +                * not given eariler by FW (like in hw_param). We let nau=
8825 to
> +                * use internal VCO clock till now which reduces the audi=
able
> +                * pop's. */
> +
> +               /* fall through */
> +
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +               /* Once device resumes, the system will only enable power
> +                * sequence for playback without doing hardware parameter=
, audio
> +                * format, and PLL configure. In the mean time, the jack
> +                * detecion sequence has changed PLL parameters and switc=
hed to
> +                * internal clock. Thus, the playback signal distorted wi=
thout
> +                * correct PLL parameters. Therefore we need to configure=
 PLL
> +                * again */
> +               ret =3D snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL=
_FS, 0,
> +                                            SND_SOC_CLOCK_IN);
> +               if (ret < 0) {
> +                       dev_err(codec_dai->dev, "can't set FS clock %d\n"=
, ret);
> +                       break;
> +               }
> +               ret =3D snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rat=
e,
> +                                         runtime->rate * 256);
> +               if (ret < 0)
> +                       dev_err(codec_dai->dev, "can't set FLL: %d\n", re=
t);
> +               break;
> +       }
>
>         return ret;
>  }
>
> -static const struct snd_soc_ops skylake_nau8825_ops =3D {
> -       .hw_params =3D skylake_nau8825_hw_params,
> +static struct snd_soc_ops skylake_nau8825_ops =3D {
> +       .trigger =3D skylake_nau8825_trigger,
>  };
>
>  static const unsigned int channels_dmic[] =3D {
> @@ -582,6 +604,7 @@ static struct snd_soc_dai_link skylake_dais[] =3D {
>                 .init =3D skylake_ssm4567_codec_init,
>                 .ignore_pmdown_time =3D 1,
>                 .be_hw_params_fixup =3D skylake_ssp_fixup,
> +               .ops =3D &skylake_nau8825_ops,
>                 .dpcm_playback =3D 1,
>                 .dpcm_capture =3D 1,
>                 SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
> --
> 2.17.1
>
