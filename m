Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFA3AB621
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:38:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD69A1717;
	Thu, 17 Jun 2021 16:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD69A1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940708;
	bh=n1AHFB+tNWFk2CE9ZxL2MStJuVmPdpkCB/eMdh382D0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3a5yHotgdoYVhz0dR4hQsoz3G1PuzxMp0Q3LYZdjPcO3BNv7JAAszkWBiFit1VRs
	 LwcltZJbkF2lhGcwJUbyHBZwxpi13qEEsSZTyTn8X9JlrKpvp6pZYlGR3laQ5giuP+
	 uyErDkG5ZBk9iqj6tm4MqsSZCablBewwafeWRjY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E35B0F804ED;
	Thu, 17 Jun 2021 16:34:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4EACF80423; Wed, 16 Jun 2021 08:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32485F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 08:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32485F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j8tWZmRG"
Received: by mail-pg1-x534.google.com with SMTP id e22so1101783pgv.10
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUKPzYq+e8ssftHrlny2eMnsAcQaLXPWbj9+hBUE48Q=;
 b=j8tWZmRGOUF2VsNtzRPSknSHcgIKOkUUxqNPpKo6qPghtRUq+MFiYSRZDHe/r2dQ/g
 0mvj7ah8VzLM/ifGAc4Z1Qbz6qbHRt4idI9M3ROSddiIb+/2kril88CMacZnPnVeGnNn
 NpAujw+6ZRs442ki097pmkORi4fzwawTlurNqBg0bmKubt4WKspthzTLYbHgL8dVhl0M
 WHRd58aTrWvN/HbcFycnFFRStEvpDstzv6Uwl+7x8ZFhdZnQ5izlMAaqqYhKDGF9baK0
 31qHFiZuUBRzggXJf0XEtU7t9hqWYGv3ZR1JtDVjn9SSy7riNkMwcXQzcCBQADunrblL
 2W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUKPzYq+e8ssftHrlny2eMnsAcQaLXPWbj9+hBUE48Q=;
 b=Enomk69w2NnZ83rhUQbfMJKLX8Cui06/vZ7z+aCuTaLriJkqPeQk1TQQtA6NM7T8jn
 Gq3q3gAeXfw+nvTxBmecDakUVfSrq47h54gPC5sbFFkHJ6EItZWmkhFi+W700XmCx7rf
 VWLfIgpbSyMjK9keuwYrtLfhqOr3nBwMU1wobCgbdrleINSHq38XQ8AZ/GQLHWQRCZnZ
 Toa+rtyD//LR/e0qsYqtoRnDVqOkDUdGL2cdFEXslWHsXWwNZxLEJ7dmJD9i7PQJNaB1
 eLeXO3pyefemRz1n2btbyfNNN5POoiPagvzDnSG2QQFJg4XXm8uJKvAybZkq+lCyvsEy
 19CQ==
X-Gm-Message-State: AOAM532K3byARk5VVLXi+U0QAd6aFbu2fJLLD6ZUbAJPS1ikRU4+O6un
 zyAQw0OFYTosU7gALPvi9/VO6ETRgIgCSUdbxQ==
X-Google-Smtp-Source: ABdhPJz/KZcAyX6f1bCjb2e9wpVUML6zwKBQBY6qJh626UVdepLMsEeAb0j3JpKy36OzV+PlJ2zdio4CP5YLkFvguIQ=
X-Received: by 2002:a63:f344:: with SMTP id t4mr3442543pgj.314.1623824481595; 
 Tue, 15 Jun 2021 23:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210615130326.2044-1-fengzheng923@gmail.com>
 <8fa2cd5b-b7b0-f39f-2c97-a8a839642fc2@sholland.org>
In-Reply-To: <8fa2cd5b-b7b0-f39f-2c97-a8a839642fc2@sholland.org>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Wed, 16 Jun 2021 14:21:10 +0800
Message-ID: <CAE=m61_aiPWUvDEcjRTG9+FmMzPTxaL7-n2ZM3r3e7fqg2B1TQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Samuel Holland <samuel@sholland.org>
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:45 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, krzk@kernel.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, mripard@kernel.org, lgirdwood@gmail.com, wens@csie.org,
 broonie@kernel.org, jernej.skrabec@gmail.com, p.zabel@pengutronix.de,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Hi=EF=BC=8C

Samuel Holland <samuel@sholland.org> =E4=BA=8E2021=E5=B9=B46=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8811:06=E5=86=99=E9=81=93=EF=BC=9A

> Hello,
>
> On 6/15/21 8:03 AM, Ban Tao wrote:
> > The Allwinner H6 and later SoCs have an DMIC block
> > which is capable of capture.
> >
> > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> > ---
> >  MAINTAINERS                   |   7 +
> >  sound/soc/sunxi/Kconfig       |   8 +
> >  sound/soc/sunxi/Makefile      |   1 +
> >  sound/soc/sunxi/sun50i-dmic.c | 408 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 424 insertions(+)
> >  create mode 100644 sound/soc/sunxi/sun50i-dmic.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b4094f07214e..1b87225c39b0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -760,6 +760,13 @@ L:       linux-media@vger.kernel.org
> >  S:   Maintained
> >  F:   drivers/staging/media/sunxi/cedrus/
> >
> > +ALLWINNER DMIC DRIVERS
> > +M:   Ban Tao <fengzheng923@gmail.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +S:   Maintained
> > +F:
>  Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> > +F:   sound/soc/sunxi/sun50i-dmic.c
> > +
> >  ALPHA PORT
> >  M:   Richard Henderson <rth@twiddle.net>
> >  M:   Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> > diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
> > index ddcaaa98d3cb..2a3bf7722e11 100644
> > --- a/sound/soc/sunxi/Kconfig
> > +++ b/sound/soc/sunxi/Kconfig
> > @@ -56,6 +56,14 @@ config SND_SUN4I_SPDIF
> >         Say Y or M to add support for the S/PDIF audio block in the
> Allwinner
> >         A10 and affiliated SoCs.
> >
> > +config SND_SUN50I_DMIC
> > +     tristate "Allwinner H6 DMIC Support"
> > +     depends on (OF && ARCH_SUNXI) || COMPILE_TEST
> > +     select SND_SOC_GENERIC_DMAENGINE_PCM
> > +     help
> > +       Say Y or M to add support for the DMIC audio block in the
> Allwinner
> > +       H6 and affiliated SoCs.
> > +
> >  config SND_SUN8I_ADDA_PR_REGMAP
> >       tristate
> >       select REGMAP
> > diff --git a/sound/soc/sunxi/Makefile b/sound/soc/sunxi/Makefile
> > index a86be340a076..4483fe9c94ef 100644
> > --- a/sound/soc/sunxi/Makefile
> > +++ b/sound/soc/sunxi/Makefile
> > @@ -6,3 +6,4 @@ obj-$(CONFIG_SND_SUN8I_CODEC_ANALOG) +=3D
> sun8i-codec-analog.o
> >  obj-$(CONFIG_SND_SUN50I_CODEC_ANALOG) +=3D sun50i-codec-analog.o
> >  obj-$(CONFIG_SND_SUN8I_CODEC) +=3D sun8i-codec.o
> >  obj-$(CONFIG_SND_SUN8I_ADDA_PR_REGMAP) +=3D sun8i-adda-pr-regmap.o
> > +obj-$(CONFIG_SND_SUN50I_DMIC) +=3D sun50i-dmic.o
> > diff --git a/sound/soc/sunxi/sun50i-dmic.c
> b/sound/soc/sunxi/sun50i-dmic.c
> > new file mode 100644
> > index 000000000000..78d512d93974
> > --- /dev/null
> > +++ b/sound/soc/sunxi/sun50i-dmic.c
> > @@ -0,0 +1,408 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * ALSA SoC DMIC Audio Layer
> > + *
> > + * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> > + *
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +#include <sound/dmaengine_pcm.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/soc.h>
> > +
> > +
> > +#define SUN50I_DMIC_EN_CTL           (0x00)
> > +     #define SUN50I_DMIC_EN_CTL_GLOBE                        BIT(8)
> > +     #define SUN50I_DMIC_EN_CTL_CHAN(v)              ((v) << 0)
> > +     #define SUN50I_DMIC_EN_CTL_CHAN_MASK            GENMASK(7, 0)
> > +#define SUN50I_DMIC_SR                       (0x04)
> > +     #define SUN50I_DMIC_SR_SAMOLE_RATE(v)           ((v) << 0)
> > +     #define SUN50I_DMIC_SR_SAMOLE_RATE_MASK         GENMASK(2, 0)
> > +#define SUN50I_DMIC_CTL                      (0x08)
> > +     #define SUN50I_DMIC_CTL_OVERSAMPLE_RATE         BIT(0)
> > +#define SUN50I_DMIC_DATA                     (0x10)
> > +#define SUN50I_DMIC_INTC                     (0x14)
> > +     #define SUN50I_DMIC_FIFO_DRQ_EN                 BIT(2)
> > +#define SUN50I_DMIC_INT_STA          (0x18)
> > +     #define SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING BIT(1)
> > +     #define SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING    BIT(0)
> > +#define SUN50I_DMIC_RXFIFO_CTL               (0x1c)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_FLUSH            BIT(31)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_MODE             BIT(9)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_RESOLUTION       BIT(8)
> > +#define SUN50I_DMIC_CH_NUM           (0x24)
> > +     #define SUN50I_DMIC_CH_NUM_N(v)                 ((v) << 0)
> > +     #define SUN50I_DMIC_CH_NUM_N_MASK               GENMASK(2, 0)
> > +#define SUN50I_DMIC_CNT                      (0x2c)
> > +     #define SUN50I_DMIC_CNT_N                       BIT(0)
> > +#define SUN50I_DMIC_HPF_CTRL         (0x38)
> > +#define SUN50I_DMIC_VERSION          (0x50)
> > +
> > +
> > +struct sun50i_dmic_dev {
> > +     struct platform_device *pdev;
> > +     struct clk *dmic_clk;
> > +     struct clk *apb_clk;
> > +     struct reset_control *rst;
> > +     struct regmap *regmap;
> > +     struct snd_dmaengine_dai_dma_data dma_params_rx;
> > +     unsigned int chan_en;
> > +};
> > +
> > +struct dmic_rate {
> > +     unsigned int samplerate;
> > +     unsigned int rate_bit;
> > +};
> > +
> > +static void sun50i_snd_rxctrl_enable(struct snd_pcm_substream
> *substream,
> > +                                 struct sun50i_dmic_dev *host, bool
> enable)
> > +{
> > +     if (enable) {
> > +             /* DRQ ENABLE */
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
> > +                                SUN50I_DMIC_FIFO_DRQ_EN,
> > +                                SUN50I_DMIC_FIFO_DRQ_EN);
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                                SUN50I_DMIC_EN_CTL_CHAN_MASK,
> > +                                SUN50I_DMIC_EN_CTL_CHAN(host->chan_en)=
);
> > +             /* Global enable */
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                                SUN50I_DMIC_EN_CTL_GLOBE,
> > +                                SUN50I_DMIC_EN_CTL_GLOBE);
> > +     } else {
> > +             /* DRQ DISABLE */
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
> > +                                SUN50I_DMIC_FIFO_DRQ_EN, 0);
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                                SUN50I_DMIC_EN_CTL_CHAN_MASK,
> > +                                SUN50I_DMIC_EN_CTL_CHAN(0));
> > +             /* Global disable */
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                                SUN50I_DMIC_EN_CTL_GLOBE, 0);
> > +     }
> > +}
> > +
> > +static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
> > +                            struct snd_soc_dai *cpu_dai)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     struct sun50i_dmic_dev *host =3D
> snd_soc_dai_get_drvdata(rtd->cpu_dai);
>
> This is equivalent to the simpler code you use below:
>
> struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai);
>
> > +
> > +     /* only support capture */
> > +     if (substream->stream !=3D SNDRV_PCM_STREAM_CAPTURE)
> > +             return -EINVAL;
> > +
> > +     regmap_write(host->regmap, SUN50I_DMIC_INT_STA,
> > +                  SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING |
> > +                  SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING);
>
> The interrupt is never enabled, so do we really care about IRQ status?
>

Ok, I will delete it .

>
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                        SUN50I_DMIC_RXFIFO_CTL_FLUSH,
> > +                        SUN50I_DMIC_RXFIFO_CTL_FLUSH);
> > +     regmap_write(host->regmap, SUN50I_DMIC_CNT, SUN50I_DMIC_CNT_N);
> > +
> > +     return 0;
> > +}
> > +
> > +static int sun50i_dmic_hw_params(struct snd_pcm_substream *substream,
> > +                              struct snd_pcm_hw_params *params,
> > +                              struct snd_soc_dai *cpu_dai)
> > +{
> > +     int i =3D 0;
> > +     unsigned long rate =3D params_rate(params);
> > +     unsigned int channels =3D params_channels(params);
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
> > +     struct platform_device *pdev =3D host->pdev;
> > +     struct dmic_rate dmic_rate_s[] =3D {
> > +             {44100, 0x0},
> > +             {48000, 0x0},
> > +             {22050, 0x2},
> > +             {24000, 0x2},
> > +             {11025, 0x4},
> > +             {12000, 0x4},
> > +             {32000, 0x1},
> > +             {16000, 0x3},
> > +             {8000,  0x5},
> > +     };
> > +
> > +     /* DMIC num is N+1 */
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
> > +                        SUN50I_DMIC_CH_NUM_N_MASK,
> > +                        SUN50I_DMIC_CH_NUM_N(channels - 1));
> > +     host->chan_en =3D (1 << channels) - 1;
> > +     regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, host->chan_en);
> > +
> > +     switch (params_format(params)) {
> > +     case SNDRV_PCM_FORMAT_S16_LE:
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_MODE,
> > +                                SUN50I_DMIC_RXFIFO_CTL_MODE);
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION, 0);
> > +             break;
> > +     case SNDRV_PCM_FORMAT_S24_LE:
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_MODE, 0);
>
> In SNDRV_PCM_FORMAT_S24_LE, the sample is in the three least significant
> bytes, so wouldn't we want to still use mode 1 here? To me, mode 0 only
> makes sense when using SNDRV_PCM_FORMAT_S32_LE.
>

I don't understand. The DMIC does not support 32bits, why use
SNDRV_PCM_FORMAT_S32_LE ?

>
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION,
> > +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION);
> > +             break;
> > +     default:
> > +             dev_err(&pdev->dev, "Invalid format!\n");
>
> The calls to dev_err() can use cpu_dai->dev. Then you don't need to keep
> a pointer to pdev in the driver data.
>
> > +             return -EINVAL;
> > +     }
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dmic_rate_s); i++) {
> > +             if (dmic_rate_s[i].samplerate =3D=3D rate) {
> > +                     regmap_update_bits(host->regmap, SUN50I_DMIC_SR,
> > +                                        SUN50I_DMIC_SR_SAMOLE_RATE_MAS=
K,
> > +
> SUN50I_DMIC_SR_SAMOLE_RATE(dmic_rate_s[i].rate_bit));
> > +                     break;
> > +             }
> > +     }
> > +     if (i =3D=3D ARRAY_SIZE(dmic_rate_s)) {
> > +             dev_err(&pdev->dev, "Invalid rate!\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* oversamplerate adjust */
> > +     if (params_rate(params) >=3D 24000)
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
> > +                                SUN50I_DMIC_CTL_OVERSAMPLE_RATE,
> > +                                SUN50I_DMIC_CTL_OVERSAMPLE_RATE);
> > +     else
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
> > +                                SUN50I_DMIC_CTL_OVERSAMPLE_RATE, 0);
> > +
> > +     return 0;
> > +}
> > +
> > +static int sun50i_dmic_trigger(struct snd_pcm_substream *substream, in=
t
> cmd,
> > +                            struct snd_soc_dai *dai)
> > +{
> > +     int ret =3D 0;
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(dai);
> > +
> > +     if (substream->stream !=3D SNDRV_PCM_STREAM_CAPTURE)
> > +             return -EINVAL;
> > +
> > +     switch (cmd) {
> > +     case SNDRV_PCM_TRIGGER_START:
> > +     case SNDRV_PCM_TRIGGER_RESUME:
> > +     case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > +             sun50i_snd_rxctrl_enable(substream, host, true);
> > +             break;
> > +
> > +     case SNDRV_PCM_TRIGGER_STOP:
> > +     case SNDRV_PCM_TRIGGER_SUSPEND:
> > +     case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> > +             sun50i_snd_rxctrl_enable(substream, host, false);
> > +             break;
> > +
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +     return ret;
> > +}
> > +
> > +static int sun50i_dmic_set_sysclk(struct snd_soc_dai *dai, int clk_id,
> > +                              unsigned int freq, int dir)
> > +{
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(dai);
> > +
> > +     if (clk_set_rate(host->dmic_clk, freq)) {
>
> Currently, mainline does not have any sunxi-specific machine drivers. We
> are using simple-audio-card for sun50i. And asoc_simple_hw_params() only
> calls .set_sysclk if mclk-fs is set to some fixed value, from the device
> tree. However, for sunxi, mclk-fs cannot be a fixed value, because
> sysclk is the same 22/24 MHz regardless of sample rate. So .set_sysclk
> will never be called.
>
> So for now I would suggest calling clk_set_rate() from .hw_params, using
> something like sun8i_codec_get_sysclk_rate() to get the right frequency.
>

Thanks, i will do it

>
> > +             dev_err(dai->dev, "Freq : %u not support\n", freq);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai *dai)
> > +{
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(dai);
> > +
> > +     snd_soc_dai_init_dma_data(dai, NULL, &host->dma_params_rx);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct snd_soc_dai_ops sun50i_dmic_dai_ops =3D {
> > +     .startup        =3D sun50i_dmic_startup,
> > +     .trigger        =3D sun50i_dmic_trigger,
> > +     .hw_params      =3D sun50i_dmic_hw_params,
> > +     .set_sysclk     =3D sun50i_dmic_set_sysclk,
> > +};
> > +
> > +static const struct regmap_config sun50i_dmic_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .val_bits =3D 32,
> > +     .max_register =3D SUN50I_DMIC_VERSION,
> > +     .cache_type =3D REGCACHE_NONE,
> > +};
> > +
> > +#define      SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000 |
> SNDRV_PCM_RATE_KNOT)
>
> If you use SNDRV_PCM_RATE_KNOT, you also need to provide a list of
> sample rates as a constraint in .startup.
>
> > +#define SUN50I_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S24_LE)
> > +
> > +static struct snd_soc_dai_driver sun50i_dmic_dai =3D {
> > +     .capture =3D {
> > +             .channels_min =3D 1,
> > +             .channels_max =3D 8,
> > +             .rates =3D SUN50I_DMIC_RATES,
> > +             .formats =3D SUN50I_FORMATS,
> > +     },
> > +     .probe =3D sun50i_dmic_soc_dai_probe,
> > +     .ops =3D &sun50i_dmic_dai_ops,
> > +     .name =3D "dmic",
> > +};
> > +
> > +static const struct of_device_id sun50i_dmic_of_match[] =3D {
> > +     {
> > +             .compatible =3D "allwinner,sun50i-h6-dmic",
> > +     },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
> > +
> > +static const struct snd_soc_component_driver sun50i_dmic_component =3D=
 {
> > +     .name           =3D "sun50i-dmic",
> > +};
> > +
> > +static int sun50i_dmic_runtime_suspend(struct device *dev)
> > +{
> > +     struct sun50i_dmic_dev *host  =3D dev_get_drvdata(dev);
> > +
> > +     clk_disable_unprepare(host->dmic_clk);
> > +     clk_disable_unprepare(host->apb_clk);
> > +
> > +     return 0;
> > +}
> > +
> > +static int sun50i_dmic_runtime_resume(struct device *dev)
> > +{
> > +     struct sun50i_dmic_dev *host  =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret =3D clk_prepare_enable(host->dmic_clk);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D clk_prepare_enable(host->apb_clk);
> > +     if (ret)
> > +             clk_disable_unprepare(host->dmic_clk);
> > +
> > +     return ret;
> > +}
> > +
> > +static int sun50i_dmic_probe(struct platform_device *pdev)
> > +{
> > +     struct sun50i_dmic_dev *host;
> > +     struct resource *res;
> > +     int ret;
> > +     void __iomem *base;
> > +
> > +     host =3D devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> > +     if (!host)
> > +             return -ENOMEM;
> > +
> > +     host->pdev =3D pdev;
> > +
> > +     /* Get the addresses */
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     base =3D devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(base))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(base),
> > +                                  "get resource failed.\n");
> > +
> > +     host->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> > +
>  &sun50i_dmic_regmap_config);
> > +
> > +     /* Clocks */
> > +     host->apb_clk =3D devm_clk_get(&pdev->dev, "apb");
> > +     if (IS_ERR(host->apb_clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->apb_clk),
> > +                                  "failed to get apb clock.\n");
> > +
> > +     host->dmic_clk =3D devm_clk_get(&pdev->dev, "dmic");
> > +     if (IS_ERR(host->dmic_clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->dmic_clk),
> > +                                  "failed to get dmic clock.\n");
> > +
> > +     host->dma_params_rx.addr =3D res->start + SUN50I_DMIC_DATA;
> > +     host->dma_params_rx.maxburst =3D 8;
> > +     host->dma_params_rx.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
>
> This needs to be DMA_SLAVE_BUSWIDTH_4_BYTES if you are using larger than
> 16-bit samples. See for example sun4i_i2s_hw_params().
>
> Regards,
> Samuel
>
