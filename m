Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D40A3DCAF4
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 11:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E8F189B;
	Sun,  1 Aug 2021 11:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E8F189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627811375;
	bh=dle4XILej63KXMoLEHebTKjf6atXs3yQYDfA7GD/1Kc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gBA7KCv9l6c880glLZeor9XOrBsGs2oF/h4e4KQL/l45KHOoIthW9RuEd7NjBK7Af
	 9g43YYfdEs55Q45KbUwFJDL+LRji6k6dswLdE8BCPnkAThoIoeuJZDffWd0mSosX/3
	 4FNsvshuxSHOovC1jvk14H5TEfpfUBF/CeHjhUD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CE0FF8032C;
	Sun,  1 Aug 2021 11:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED4A8F802E8; Sun,  1 Aug 2021 11:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7518AF8014D
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 11:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7518AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L4zxM4cw"
Received: by mail-pj1-x1031.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so27292887pjb.3
 for <alsa-devel@alsa-project.org>; Sun, 01 Aug 2021 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RHsoGJjgDOnzEi5IVMKsSdRnOK0IUJdpaPMyo84Tl68=;
 b=L4zxM4cwYaEtb0LsuZc0Nq6yIU8PNzb7rVpdAyyjN3Qz09GTkRmqaJG7oKR4dxaWU6
 hlwNuK8q11HeOlO7HMBlY7wOrB3Nsh15pIBdar7tyI7bF8asV+tbIq9Jj33r47HuyhRH
 IOOwlZNlaCV0D10goupNP4TADB/zlHqgo38lYguc64Ns7kaITpqaPlCxHdek9MdIH70v
 xjFAmQlprOBa4hvfclEmvN2iAWEAjA2VpvQqe6wo/pOFmImHCW1BKJiHUqTYiUbJYlKj
 37b5KDgLrWHkk+jYHoKleLNbHCvfF9hcTjZzksPJteti//b61nH8uCC94nx6Le3kwgrL
 nBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RHsoGJjgDOnzEi5IVMKsSdRnOK0IUJdpaPMyo84Tl68=;
 b=Vc4GRgv0wL9VFih+64Psdaxvfi0QYOipGhx80SE8j9Y51supXuhULg9hGRdxrF9+8p
 Jfc8sZUYg9yBuNs3RylGmSwhM2ZAGAoECs2r/LXAL3icVABr6iiiZ1PFD2g2Ud5O4sYi
 w4YI0PrvOQAFaBjfHevTtpMbBMMvNXBoVIBAAsGoxDDjgQ/fQHR6Rh0fVT0XmmlFtBsO
 3Vux6yH9DKXHxGMt7u+ppbdcJZSMN/k9i7AyheKLmu1pautQ0lQ6870aqWwv6tJ3s99v
 BZLnrx4/NoDN3tGseRYDAz9SoPm8U/+8MUnCORG8J7owpQ8Rxb9Rzw77vLsTugG3JiW2
 QcqQ==
X-Gm-Message-State: AOAM532m2RFJfuY9oSks7muTUEXyxAfSmlPP1cAv5m9I9ZcMp4nfweRN
 uEsijB5i6nwV/nZmAQNeo7zClRo3Er7cii1NfQ==
X-Google-Smtp-Source: ABdhPJw+tr2GBOalJTQGoLDnu3vIb3xXi8UtX9Wb7GNDzZbodvVLRBmN/5cJrIfzRPYkc98i2oWEtJMoD7pd10Yhytk=
X-Received: by 2002:a62:4e0f:0:b029:329:20be:287a with SMTP id
 c15-20020a624e0f0000b029032920be287amr11522272pfb.55.1627811276782; Sun, 01
 Aug 2021 02:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210711122055.4529-1-fengzheng923@gmail.com>
 <20210715074750.ewbggulc5kast6ez@gilmour>
In-Reply-To: <20210715074750.ewbggulc5kast6ez@gilmour>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Sun, 1 Aug 2021 17:47:46 +0800
Message-ID: <CAE=m61_=XfhtG9Q1r34McWWCUXt1KP67cjZ0ER62+YaGrG+b4w@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jernej.skrabec@gmail.com,
 lgirdwood@gmail.com, wens@csie.org, Mark Brown <broonie@kernel.org>,
 krzk@kernel.org, p.zabel@pengutronix.de, linux-sunxi@lists.linux.dev,
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

Hi, Dear:


Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B47=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=883:47=E5=86=99=E9=81=93=EF=BC=9A

>
> Hi
>
> On Sun, Jul 11, 2021 at 08:20:55AM -0400, fengzheng923@gmail.com wrote:
> > From: Ban Tao <fengzheng923@gmail.com>
> >
> > The Allwinner H6 and later SoCs have an DMIC block
> > which is capable of capture.
> >
> > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> >
> > ---
> > v1->v2:
> > 1.Fix some compilation errors.
> > 2.Modify some code styles.
> > ---
> > v2->v3:
> > None.
> > ---
> > v3->v4:
> > 1.add sig_bits.
> > ---
> > v4->v5:
> > None.
> > ---
> > v5->v6:
> > 1.Modify RXFIFO_CTL_MODE to mode 1.
> > ---
> >  MAINTAINERS                   |   7 +
> >  sound/soc/sunxi/Kconfig       |   8 +
> >  sound/soc/sunxi/Makefile      |   1 +
> >  sound/soc/sunxi/sun50i-dmic.c | 403 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 419 insertions(+)
> >  create mode 100644 sound/soc/sunxi/sun50i-dmic.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e924f9e5df97..8d700baaa3ca 100644
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
> > +F:   Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.=
yaml
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
> >         Say Y or M to add support for the S/PDIF audio block in the All=
winner
> >         A10 and affiliated SoCs.
> >
> > +config SND_SUN50I_DMIC
> > +     tristate "Allwinner H6 DMIC Support"
> > +     depends on (OF && ARCH_SUNXI) || COMPILE_TEST
> > +     select SND_SOC_GENERIC_DMAENGINE_PCM
> > +     help
> > +       Say Y or M to add support for the DMIC audio block in the Allwi=
nner
> > +       H6 and affiliated SoCs.
> > +
> >  config SND_SUN8I_ADDA_PR_REGMAP
> >       tristate
> >       select REGMAP
> > diff --git a/sound/soc/sunxi/Makefile b/sound/soc/sunxi/Makefile
> > index a86be340a076..4483fe9c94ef 100644
> > --- a/sound/soc/sunxi/Makefile
> > +++ b/sound/soc/sunxi/Makefile
> > @@ -6,3 +6,4 @@ obj-$(CONFIG_SND_SUN8I_CODEC_ANALOG) +=3D sun8i-codec-a=
nalog.o
> >  obj-$(CONFIG_SND_SUN50I_CODEC_ANALOG) +=3D sun50i-codec-analog.o
> >  obj-$(CONFIG_SND_SUN8I_CODEC) +=3D sun8i-codec.o
> >  obj-$(CONFIG_SND_SUN8I_ADDA_PR_REGMAP) +=3D sun8i-adda-pr-regmap.o
> > +obj-$(CONFIG_SND_SUN50I_DMIC) +=3D sun50i-dmic.o
> > diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmi=
c.c
> > new file mode 100644
> > index 000000000000..bbac836ba4de
> > --- /dev/null
> > +++ b/sound/soc/sunxi/sun50i-dmic.c
> > @@ -0,0 +1,403 @@
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
> > +#define SUN50I_DMIC_EN_CTL           (0x00)
> > +     #define SUN50I_DMIC_EN_CTL_GLOBE                        BIT(8)
> > +     #define SUN50I_DMIC_EN_CTL_CHAN(v)              ((v) << 0)
> > +     #define SUN50I_DMIC_EN_CTL_CHAN_MASK            GENMASK(7, 0)
> > +#define SUN50I_DMIC_SR                       (0x04)
> > +     #define SUN50I_DMIC_SR_SAMPLE_RATE(v)           ((v) << 0)
> > +     #define SUN50I_DMIC_SR_SAMPLE_RATE_MASK         GENMASK(2, 0)
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
>
> There's multiple blank lines here
>
> > +struct sun50i_dmic_dev {
> > +     struct clk *dmic_clk;
> > +     struct clk *bus_clk;
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
> > +static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
> > +                            struct snd_soc_dai *cpu_dai)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(asoc_rtd=
_to_cpu(rtd, 0));
> > +
> > +     /* only support capture */
> > +     if (substream->stream !=3D SNDRV_PCM_STREAM_CAPTURE)
> > +             return -EINVAL;
> > +
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
> > +     unsigned int mclk =3D 0;
> > +     unsigned int channels =3D params_channels(params);
> > +     struct sun50i_dmic_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
> > +     static struct dmic_rate dmic_rate_s[] =3D {
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
>
> We should order these items. It looks like descending rate makes the
> most sense?
>
> Also, I'm not sure why we need to make that array local, can't this be a
> global variable?
>
> > +     /* DMIC num is N+1 */
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
> > +                        SUN50I_DMIC_CH_NUM_N_MASK,
> > +                        SUN50I_DMIC_CH_NUM_N(channels - 1));
> > +     host->chan_en =3D (1 << channels) - 1;
> > +     regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, host->chan_en);
>
> Do we need to store the channels bitmask in the main structure? It looks
> fairly easy to generate, so I guess we could just use a macro

I need to store channels bitmask and use it in sun50i_dmic_trigger function=
.

>
> > +     switch (params_format(params)) {
> > +     case SNDRV_PCM_FORMAT_S16_LE:
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION, 0);
> > +             break;
> > +     case SNDRV_PCM_FORMAT_S24_LE:
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION,
> > +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION);
> > +             break;
>
> These two defines could be named a bit better, it's not really clear
> what SUN50I_DMIC_RXFIFO_CTL_RESOLUTION means, exactly, as opposed to 0
> (while it's actually the sample width).
>
> What about something like SUN50I_DMIC_RXFIFO_CTL_SAMPLE_16 (for 0) and
> _24 (for 1), while changing SUN50I_DMIC_RXFIFO_CTL_RESOLUTION for
> SUN50I_DMIC_RXFIFO_CTL_SAMPLE_MASK ?
>
> > +     default:
> > +             dev_err(cpu_dai->dev, "Invalid format!\n");
> > +             return -EINVAL;
> > +     }
> > +     regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> > +                        SUN50I_DMIC_RXFIFO_CTL_MODE,
> > +                        SUN50I_DMIC_RXFIFO_CTL_MODE);
>
> Same thing here, MODE doesn't really explain what this does, and why
> we'd want to always set it.
>
> I guess 0 is LSB_ZERO and 1 is MSB_SIGN?

Yes.

>
> > +     switch (rate) {
> > +     case 11025:
> > +     case 22050:
> > +     case 44100:
> > +             mclk =3D 22579200;
> > +             break;
> > +     case 8000:
> > +     case 12000:
> > +     case 16000:
> > +     case 24000:
> > +     case 32000:
> > +     case 48000:
> > +             mclk =3D 24576000;
> > +             break;
> > +     default:
> > +             dev_err(cpu_dai->dev, "Invalid rate!\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (clk_set_rate(host->dmic_clk, mclk)) {
> > +             dev_err(cpu_dai->dev, "mclk : %u not support\n", mclk);
> > +             return -EINVAL;
> > +     }
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dmic_rate_s); i++) {
> > +             if (dmic_rate_s[i].samplerate =3D=3D rate) {
> > +                     regmap_update_bits(host->regmap, SUN50I_DMIC_SR,
> > +                                        SUN50I_DMIC_SR_SAMPLE_RATE_MAS=
K,
> > +                                        SUN50I_DMIC_SR_SAMPLE_RATE(dmi=
c_rate_s[i].rate_bit));
> > +                     break;
> > +             }
> > +     }
> > +
> > +     switch (params_physical_width(params)) {
> > +     case 16:
> > +             host->dma_params_rx.addr_width =3D DMA_SLAVE_BUSWIDTH_2_B=
YTES;
> > +             break;
> > +     case 32:
> > +             host->dma_params_rx.addr_width =3D DMA_SLAVE_BUSWIDTH_4_B=
YTES;
> > +             break;
> > +     default:
> > +             dev_err(cpu_dai->dev, "Unsupported physical sample width:=
 %d\n",
> > +                     params_physical_width(params));
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
t cmd,
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
> > +             break;
>
> Do we really need to clear the channel and global enable bits? and DRQ?

Why not? I think we should clear them when not in use......

>
> > +     case SNDRV_PCM_TRIGGER_STOP:
> > +     case SNDRV_PCM_TRIGGER_SUSPEND:
> > +     case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> > +             /* DRQ DISABLE */
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
> > +                                SUN50I_DMIC_FIFO_DRQ_EN, 0);
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                                SUN50I_DMIC_EN_CTL_CHAN_MASK,
> > +                                SUN50I_DMIC_EN_CTL_CHAN(0));
> > +             /* Global disable */
> > +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> > +                                SUN50I_DMIC_EN_CTL_GLOBE, 0);
> > +             break;
> > +
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +     return ret;
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
> > +#define      SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000)
> > +#define SUN50I_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTB=
IT_S24_LE)
>
> SUN50I_DMIC_RATES has a tab between the define and its name, while
> SUN50I_FORMATS has the tab after the name. We should be consistent.
> Similarly, we should name both with the SUN50I_DMIC prefix.
>
> > +static struct snd_soc_dai_driver sun50i_dmic_dai =3D {
> > +     .capture =3D {
> > +             .channels_min =3D 1,
> > +             .channels_max =3D 8,
> > +             .rates =3D SUN50I_DMIC_RATES,
> > +             .formats =3D SUN50I_FORMATS,
> > +             .sig_bits =3D 21,
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
> > +     clk_disable_unprepare(host->bus_clk);
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
>
> A new line here would be great.
>
> > +     ret =3D clk_prepare_enable(host->bus_clk);
> > +     if (ret)
> > +             clk_disable_unprepare(host->dmic_clk);
> > +
> > +     return ret;
>
> In general we prefer to treat the error path and the success path
> differently. In this case it would mean changing that part to
>
> ret =3D clk_prepare_enable(host->bus_clk);
> if (ret) {
>          clk_disable_unprepare(host->dmic_clk);
>          return ret;
> }
>
> return 0;
>
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
> > +     /* Get the addresses */
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     base =3D devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(base))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(base),
> > +                                  "get resource failed.\n");
> > +
> > +     host->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> > +                                             &sun50i_dmic_regmap_confi=
g);
>
> Your second line should be aligned on the opening parenthesis
>
> > +     /* Clocks */
> > +     host->bus_clk =3D devm_clk_get(&pdev->dev, "bus");
> > +     if (IS_ERR(host->bus_clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->bus_clk),
> > +                                  "failed to get bus clock.\n");
> > +
> > +     host->dmic_clk =3D devm_clk_get(&pdev->dev, "mod");
> > +     if (IS_ERR(host->dmic_clk))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->dmic_clk),
> > +                                  "failed to get dmic clock.\n");
> > +
> > +     host->dma_params_rx.addr =3D res->start + SUN50I_DMIC_DATA;
> > +     host->dma_params_rx.maxburst =3D 8;
> > +
> > +     platform_set_drvdata(pdev, host);
> > +
> > +     host->rst =3D devm_reset_control_get_optional_exclusive(&pdev->de=
v, NULL);
> > +     if (IS_ERR(host->rst))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
> > +                                  "Failed to get reset.\n");
>
> Your binding states that the reset is mandatory so you don't need the
> optional variant.
>
> > +     reset_control_deassert(host->rst);
>
> Can't this be moved to the runtime_pm hooks?

Is this necessary? I see that most of the driver files execute
reset_control_deassert in the probe function, and reset_control_assert
in the remove function.

>
> > +     ret =3D devm_snd_soc_register_component(&pdev->dev,
> > +                             &sun50i_dmic_component, &sun50i_dmic_dai,=
 1);
>
> Your second line should be aligned on the opening parenthesis
>
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to register component.\n");
> > +
> > +     pm_runtime_enable(&pdev->dev);
> > +     if (!pm_runtime_enabled(&pdev->dev)) {
> > +             ret =3D sun50i_dmic_runtime_resume(&pdev->dev);
> > +             if (ret)
> > +                     goto err_unregister;
> > +     }
>
> We have a depends on PM on some drivers already, so I guess it would
> just make sense to add one more here instead of dealing with whether
> runtime_pm is compiled in or not.

I don't understand. I am referring to the sun4i-spdif.c file. Which
driver files should I refer to?

>
> Also, the name of the label is misleading: it's called err_unregister
> but you don't need to unregister anything and you actually disable
> runtime_pm for that device.
>
> err_disable_runtime_pm or something similar would be a better pick
>
> Thanks!
> Maxime
