Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BF59E5B7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:10:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355171685;
	Tue, 23 Aug 2022 17:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355171685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661267406;
	bh=Itw62WtCoer+KxQdYBa+/V4h7PdjPJ07N8FbDjzX3a4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kXqnmEoOvyAqzEzU76lXZK2eU6CvZzsOUxPpN6BFlHcrl4PTizCOQ3+YPsdKkYLs+
	 1VCrB5IAM5j6fZivv7ldJqiG3a+3RPs8yGTrxhcNghOKv+kwOdlu+8dVhzxe6WChws
	 0DsefhEfdudmry4tW9q08fRGRMa8FH9Nz8vrXlkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E72F8027B;
	Tue, 23 Aug 2022 17:09:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D68E3F8020D; Tue, 23 Aug 2022 17:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 978A2F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 17:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 978A2F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UKW7R+gh"
Received: by mail-lf1-x132.google.com with SMTP id z25so20104287lfr.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=R+6hotN72WsKR+MyaA09YZfPQeG0rKUjdRd+ZVLR8X4=;
 b=UKW7R+ghOhXNZ5JysWvVMcWvnKibNZB35Dnc5/nlt0wy+Ro4O2DLzIqFgjkyP6mh3u
 3SxZWjCNOWp8+eq53Ej+u+R/IqZ35MITG68pvaqyCsqce7aRqfVmmCxaYYtmZWU6t3ed
 fgHGD+A9+h+riWe+eTlYsoP//YzC3J3yYIwVapOQyrYLs9ApgSdS1yjeSk+TVSMMnC6U
 3BH9473bpe5JP/5DedBg1jyXSaRQtAD6UAkEzPA1tWooEJGoH/DYSr2v8oTZHaA3LBbL
 zCGGLps2RbwH++/jbWUlEyu7kjFttVyiiEVTnfaQ4zWxPiyMJe5gKCUOG0CRDQHzKbkI
 l0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=R+6hotN72WsKR+MyaA09YZfPQeG0rKUjdRd+ZVLR8X4=;
 b=AIs6j6lmwmFMpulKmmBaxGhGG7SWyxhNhzo8nourEDdfftKIXtCatsASBjKqYy2vuV
 0y0WKuNfYxCy4MvoLAIRHdaa8qjcEkFUltCkrAUwVMBZFXPm9X6+9GYZVDLgvNOEJaYP
 VTrRTALTlTQrv/u2jtuz5rzx3929ZaHztWUDCHWCftlZK1YtHbyvCI0eXa/+pSuQXWBO
 parSQ0BsdwcJz7VTYR89e5Yem388XS1nq9P4JdHhIO4lSJjI4Po212OZ7Xc+4FGxBHVg
 Zg4xD47tm7zNAwRsFmrP06uHpxnrlQc9MJkFV1Mi2rXYu2Rg/VnF6HJTv+Ee9i8I010M
 UkQA==
X-Gm-Message-State: ACgBeo1NHG/P1v94LoQdyonjhxZyXi+7fBBguG/80oMRVCWkc8qNjgvH
 7zEgymrsEshHDTIPWkfXycT1fJHivJ5qYTrWww==
X-Google-Smtp-Source: AA6agR4V4fIHHKltVbUAiYvtiCLEsct31CgbF7CwPI7E7Q4Z59WkUE6ckp0YfxeMDBbEBfC8jG8ADO5sbqAdpeqDNjQ=
X-Received: by 2002:a05:6512:3184:b0:492:add0:b591 with SMTP id
 i4-20020a056512318400b00492add0b591mr9646066lfe.352.1661267336193; Tue, 23
 Aug 2022 08:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <1660229343-14133-1-git-send-email-fengzheng923@gmail.com>
 <3fb9adb7-96ef-c85e-069d-ef7f7ff09bc3@sholland.org>
In-Reply-To: <3fb9adb7-96ef-c85e-069d-ef7f7ff09bc3@sholland.org>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Tue, 23 Aug 2022 23:08:44 +0800
Message-ID: <CAE=m618gz8mzRnvX-w6fpNmTc=5Bd0KTKeR1NvpNZkbj29=ayg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 jernej.skrabec@gmail.com, lgirdwood@gmail.com, wens@csie.org,
 broonie@kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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

Samuel Holland <samuel@sholland.org> =E4=BA=8E2022=E5=B9=B48=E6=9C=8820=E6=
=97=A5=E5=91=A8=E5=85=AD 14:57=E5=86=99=E9=81=93=EF=BC=9A

> On 8/11/22 9:49 AM, Ban Tao wrote:
> > The Allwinner H6 and later SoCs have an DMIC block
> > which is capable of capture.
> >
> > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
>
> First of all, I tested this driver on the Lichee RV 86 Panel (the only
> board I
> have with DMIC hardware), and it works great, so:
>
> Tested-by: Samuel Holland <samuel@sholland.org>
>
> > ---
> > v1->v2:
> > 1.Fix some compilation errors.
> > 2.Modify some code styles.
> >
> > v2->v3:
> > None.
> >
> > v3->v4:
> > 1.add sig_bits.
> >
> > v4->v5:
> > None.
> >
> > v5->v6:
> > 1.Modify RXFIFO_CTL_MODE to mode 1.
> >
> > v6->v7:
> > 1.Modify dmic_rate_s to be a global variable.
> > 2.Changed some macro names to make more sense.
> > 3.Align code format.
> > 4.Add a depends on PM to Kconfig entry.
> >
> > v7->v8:
> > None.
> > ---
> >  MAINTAINERS                   |   7 +
> >  sound/soc/sunxi/Kconfig       |   8 +
> >  sound/soc/sunxi/Makefile      |   1 +
> >  sound/soc/sunxi/sun50i-dmic.c | 405
> ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 421 insertions(+)
> >  create mode 100644 sound/soc/sunxi/sun50i-dmic.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9d5b05..839f625 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -796,6 +796,13 @@ L:       linux-media@vger.kernel.org
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
> > index ddcaaa9..8543234 100644
> > --- a/sound/soc/sunxi/Kconfig
> > +++ b/sound/soc/sunxi/Kconfig
> > @@ -56,6 +56,14 @@ config SND_SUN4I_SPDIF
> >         Say Y or M to add support for the S/PDIF audio block in the
> Allwinner
> >         A10 and affiliated SoCs.
> >
> > +config SND_SUN50I_DMIC
> > +     tristate "Allwinner H6 DMIC Support"
> > +     depends on (OF && PM && ARCH_SUNXI) || COMPILE_TEST
>
> You do not need any of these dependencies. The driver compiles fine with
> !OF,
> and runs fine with !PM. The "ARCH_SUNXI || COMPILE_TEST" dependency is
> already
> covered by the "menu" line at the top of the file.
>

OK! I will delete OF and PM in next version.

>
> (In a previous version, Maxime suggested adding a PM dependency and
> removing the
> fallback code. Since you kept the fallback code, you do not need the PM
> dependency.)
>
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
> > index a86be34..4483fe9 100644
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
> > index 0000000..76b3378
> > --- /dev/null
> > +++ b/sound/soc/sunxi/sun50i-dmic.c
> > @@ -0,0 +1,405 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +//
> > +// This driver supports the DMIC in Allwinner's H6 SoCs.
> > +//
> > +// Copyright 2021 Ban Tao <fengzheng923@gmail.com>
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
> > +#define SUN50I_DMIC_EN_CTL             (0x00)
> > +     #define SUN50I_DMIC_EN_CTL_GLOBE                BIT(8)
> > +     #define SUN50I_DMIC_EN_CTL_CHAN(v)              ((v) << 0)
> > +     #define SUN50I_DMIC_EN_CTL_CHAN_MASK            GENMASK(7, 0)
> > +#define SUN50I_DMIC_SR                 (0x04)
> > +     #define SUN50I_DMIC_SR_SAMPLE_RATE(v)           ((v) << 0)
> > +     #define SUN50I_DMIC_SR_SAMPLE_RATE_MASK         GENMASK(2, 0)
> > +#define SUN50I_DMIC_CTL                (0x08)
> > +     #define SUN50I_DMIC_CTL_OVERSAMPLE_RATE         BIT(0)
> > +#define SUN50I_DMIC_DATA               (0x10)
> > +#define SUN50I_DMIC_INTC               (0x14)
> > +     #define SUN50I_DMIC_FIFO_DRQ_EN                 BIT(2)
> > +#define SUN50I_DMIC_INT_STA            (0x18)
> > +     #define SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING BIT(1)
> > +     #define SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING    BIT(0)
>
> Please consistently use tabs (not spaces) for aligning the macro values.
> You
> have a mix here.
>
> > +#define SUN50I_DMIC_RXFIFO_CTL         (0x1c)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_FLUSH            BIT(31)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_MODE_MASK        BIT(9)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_MODE_LSB         (0 << 9)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_MODE_MSB         (1 << 9)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK      BIT(8)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_SAMPLE_16        (0 << 8)
> > +     #define SUN50I_DMIC_RXFIFO_CTL_SAMPLE_24        (1 << 8)
> > +#define SUN50I_DMIC_CH_NUM             (0x24)
> > +     #define SUN50I_DMIC_CH_NUM_N(v)                 ((v) << 0)
> > +     #define SUN50I_DMIC_CH_NUM_N_MASK               GENMASK(2, 0)
> > +#define SUN50I_DMIC_CNT                (0x2c)
> > +     #define SUN50I_DMIC_CNT_N                       BIT(0)
>
> This is a count of samples, not a bit mask, so the BIT() macro is
> misleading here.
>
> > +#define SUN50I_DMIC_HPF_CTRL           (0x38)
> > +#define SUN50I_DMIC_VERSION            (0x50)
> > +
> > +struct sun50i_dmic_dev {
> > +     struct clk *dmic_clk;
> > +     struct clk *bus_clk;
> > +     struct reset_control *rst;
> > +     struct regmap *regmap;
> > +     struct snd_dmaengine_dai_dma_data dma_params_rx;
> > +};
> > +
> > +struct dmic_rate {
> > +     unsigned int samplerate;
> > +     unsigned int rate_bit;
> > +};
> > +
> > +static struct dmic_rate dmic_rate_s[] =3D {
>
> Please make this const.
>
> > +     {48000, 0x0},
> > +     {44100, 0x0},
> > +     {32000, 0x1},
> > +     {24000, 0x2},
> > +     {22050, 0x2},
> > +     {16000, 0x3},
> > +     {12000, 0x4},
> > +     {11025, 0x4},
> > +     {8000,  0x5},
> > +};
> > +
> > +static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
> > +                            struct snd_soc_dai *cpu_dai)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     struct sun50i_dmic_dev *host =3D
> snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
> > +
> > +     /* only support capture */
> > +     if (substream->stream !=3D SNDRV_PCM_STREAM_CAPTURE)
> > +             return -EINVAL;
> > +
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                     SUN50I_DMIC_RXFIFO_CTL_FLUSH,
> > +                     SUN50I_DMIC_RXFIFO_CTL_FLUSH);
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
> > +     unsigned int mclk =3D 0;
> > +     unsigned int channels =3D params_channels(params);
> > +     unsigned int chan_en =3D (1 << channels) - 1;
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
> > +
> > +     /* DMIC num is N+1 */
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
> > +                        SUN50I_DMIC_CH_NUM_N_MASK,
> > +                        SUN50I_DMIC_CH_NUM_N(channels - 1));
> > +     regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, chan_en);
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                        SUN50I_DMIC_EN_CTL_CHAN_MASK,
> > +                        SUN50I_DMIC_EN_CTL_CHAN(chan_en));
> > +
> > +     switch (params_format(params)) {
> > +     case SNDRV_PCM_FORMAT_S16_LE:
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK,
> > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_16);
> > +             break;
> > +     case SNDRV_PCM_FORMAT_S24_LE:
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK,
> > +                                SUN50I_DMIC_RXFIFO_CTL_SAMPLE_24);
> > +             break;
> > +     default:
> > +             dev_err(cpu_dai->dev, "Invalid format!\n");
> > +             return -EINVAL;
> > +     }
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                        SUN50I_DMIC_RXFIFO_CTL_MODE_MASK,
> > +                        SUN50I_DMIC_RXFIFO_CTL_MODE_MSB);
>
> I checked the manuals again, and I may have given you bad information.
> There
> appear to be two variants of the DMIC hardware.
>
> A63, H6, V5 V100, and V5x6 manuals list Mode 1 as "reserved" for a 24-bit
> sample
> resolution. The newer SoCs (A50, A133, D1, H616, and R329) describe Mode =
1
> as
> extending the 21-bit sample with three zeros at the LSB to make 24 bits,
> which
> is what we want.
>
> On my D1 board, recording in S24_LE gives me good audio data, with
> equivalent
> loudness to S16_LE, as I would expect. If this also works on older SoCs
> like H6,
> then the manual is wrong, and the driver is fine.
>
>
I checked the H6 manual, DMIC also supports 24bits. The H6 SoC works fine
in mode 1. I don't know where your manual came from, mine is provided by
SUNXI.

However, if recording in S24_LE does not work on H6, then we will need to
> limit
> the driver to only S16_LE on H6. We could enable S24_LE on later SoCs wit=
h
> a
> separate compatible string.
>
> Please, can you test S24_LE on one of the older SoCs? (or let me know how
> it
> works if you have already tested it)
>
> The rest of the driver looks good to me.
>
> Regards,
> Samuel
>
