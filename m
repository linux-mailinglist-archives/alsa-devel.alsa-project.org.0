Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974212FFDB5
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0634C1ACE;
	Fri, 22 Jan 2021 08:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0634C1ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611302293;
	bh=GJ/aa3jITA+iJw08j/JPDoA0jaJJHC2tggC8gsLSnQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rvf/WcrFwGZ1dYMbe70soM5BHMuxhYeFRAZOVNGq2sZuQN9+KK1bEkH4tyO8cwFza
	 Ad7wJaeTf/1iwGpDchJFNzq6R2B185Pxr0JKA+NI9nTlslSE1T1bZxevdTBAX9b9PO
	 tLsrxIyI24Bi+9gJkIsd445MAK10/EwDwztm4YJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81137F804E3;
	Fri, 22 Jan 2021 08:54:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 850F8F80227; Wed, 20 Jan 2021 22:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84A44F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 22:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A44F80164
Received: by mail-ed1-f44.google.com with SMTP id g1so23338edu.4
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 13:18:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R+sF0wg3r8XINJntKCq2KV4V+mR8u2K7/6NUXxJfJmY=;
 b=VAzDIOtmPO/H6G4cTJEJYqb9fIb6/nb9W0gFwjLuarRmdMp36ppef7PcrAJMPWRQa7
 XClaStjW4J22YAEvRzOdhUQMRmj2SxtyJhzozEYWwKmvofkIubWKj34zXzw94RI1IXck
 VH/lYYWUtlYp9bOO68T/vMMUBnK9DlevKj4y/Zj0JIigT2SstCoJMQ/wmFiC/Imme4eR
 i+dmHFBBI151HCCoHdbn5sa6BG3bRm9CiwAARYCzu39XG9BkXVr7Lc4C0+4nPmQ5lKIz
 K7kSLzTujBqejR5M0WQ0YxbJr/zMarcy56zvI2J1UjmL3uVh9eGtbDJAOX2RW9GYC8tp
 1IVA==
X-Gm-Message-State: AOAM533VHlFoETcAt9OaraGJxCiNYGXszet28f7JGlcRczWDuVYIbrK5
 BGBSqf4IlbIlbgdnpQpKddmJt9IDPb97W9dJZGA=
X-Google-Smtp-Source: ABdhPJyGTRiNEqKZLpSpnoiPmaNeBKxr+8eBMLUjTU/s0fvSxkLQC2K59RrITmCTRRVl6rkbG4LkKiaBDcH7KAkIKWQ=
X-Received: by 2002:a50:fd84:: with SMTP id o4mr6474874edt.340.1611177504958; 
 Wed, 20 Jan 2021 13:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20210120162553.21666-1-arnd@kernel.org>
 <20210120162553.21666-2-arnd@kernel.org>
In-Reply-To: <20210120162553.21666-2-arnd@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 21 Jan 2021 10:18:13 +1300
Message-ID: <CAGsJ_4xm3AZ9o7VGeCWSrgpLK8e4Ui6YHvpLpq_4irj11+3Bzw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: remove sirf prima/atlas drivers
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:54:42 +0100
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Arnd Bergmann <arnd@kernel.org> =E4=BA=8E2021=E5=B9=B41=E6=9C=8821=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=885:26=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
>
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Barry Song <baohua@kernel.org>

> ---
>  .../bindings/sound/sirf-audio-codec.txt       |  17 -
>  .../devicetree/bindings/sound/sirf-usp.txt    |  27 -
>  sound/soc/Kconfig                             |   1 -
>  sound/soc/Makefile                            |   1 -
>  sound/soc/codecs/Makefile                     |   2 -
>  sound/soc/codecs/sirf-audio-codec.c           | 575 ------------------
>  sound/soc/sirf/Kconfig                        |  21 -
>  sound/soc/sirf/Makefile                       |   8 -
>  sound/soc/sirf/sirf-audio-port.c              |  86 ---
>  sound/soc/sirf/sirf-audio.c                   | 160 -----
>  sound/soc/sirf/sirf-usp.c                     | 435 -------------
>  sound/soc/sirf/sirf-usp.h                     | 292 ---------
>  12 files changed, 1625 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/sirf-audio-co=
dec.txt
>  delete mode 100644 Documentation/devicetree/bindings/sound/sirf-usp.txt
>  delete mode 100644 sound/soc/codecs/sirf-audio-codec.c
>  delete mode 100644 sound/soc/sirf/Kconfig
>  delete mode 100644 sound/soc/sirf/Makefile
>  delete mode 100644 sound/soc/sirf/sirf-audio-port.c
>  delete mode 100644 sound/soc/sirf/sirf-audio.c
>  delete mode 100644 sound/soc/sirf/sirf-usp.c
>  delete mode 100644 sound/soc/sirf/sirf-usp.h
>
> diff --git a/Documentation/devicetree/bindings/sound/sirf-audio-codec.txt=
 b/Documentation/devicetree/bindings/sound/sirf-audio-codec.txt
> deleted file mode 100644
> index 062f5ec36f9b..000000000000
> --- a/Documentation/devicetree/bindings/sound/sirf-audio-codec.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SiRF internal audio CODEC
> -
> -Required properties:
> -
> -  - compatible : "sirf,atlas6-audio-codec" or "sirf,prima2-audio-codec"
> -
> -  - reg : the register address of the device.
> -
> -  - clocks: the clock of SiRF internal audio codec
> -
> -Example:
> -
> -audiocodec: audiocodec@b0040000 {
> -       compatible =3D "sirf,atlas6-audio-codec";
> -       reg =3D <0xb0040000 0x10000>;
> -       clocks =3D <&clks 27>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/sirf-usp.txt b/Docum=
entation/devicetree/bindings/sound/sirf-usp.txt
> deleted file mode 100644
> index 02f85b32d359..000000000000
> --- a/Documentation/devicetree/bindings/sound/sirf-usp.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* SiRF SoC USP module
> -
> -Required properties:
> -- compatible: "sirf,prima2-usp-pcm"
> -- reg: Base address and size entries:
> -- dmas: List of DMA controller phandle and DMA request line ordered pair=
s.
> -- dma-names: Identifier string for each DMA request line in the dmas pro=
perty.
> -  These strings correspond 1:1 with the ordered pairs in dmas.
> -
> -  One of the DMA channels will be responsible for transmission (should b=
e
> -  named "tx") and one for reception (should be named "rx").
> -
> -- clocks: USP controller clock source
> -- pinctrl-names: Must contain a "default" entry.
> -- pinctrl-NNN: One property must exist for each entry in pinctrl-names.
> -
> -Example:
> -usp0: usp@b0080000 {
> -       compatible =3D "sirf,prima2-usp-pcm";
> -       reg =3D <0xb0080000 0x10000>;
> -       clocks =3D <&clks 28>;
> -       dmas =3D <&dmac1 1>, <&dmac1 2>;
> -       dma-names =3D "rx", "tx";
> -       pinctrl-names =3D "default";
> -       pinctrl-0 =3D <&usp0_only_utfs_pins_a>;
> -};
> -
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 71a6fe87d1a1..1fb61e689031 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -62,7 +62,6 @@ source "sound/soc/qcom/Kconfig"
>  source "sound/soc/rockchip/Kconfig"
>  source "sound/soc/samsung/Kconfig"
>  source "sound/soc/sh/Kconfig"
> -source "sound/soc/sirf/Kconfig"
>  source "sound/soc/sof/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index ddbac3a2169f..d2b7a23f0e7b 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -45,7 +45,6 @@ obj-$(CONFIG_SND_SOC) +=3D qcom/
>  obj-$(CONFIG_SND_SOC)  +=3D rockchip/
>  obj-$(CONFIG_SND_SOC)  +=3D samsung/
>  obj-$(CONFIG_SND_SOC)  +=3D sh/
> -obj-$(CONFIG_SND_SOC)  +=3D sirf/
>  obj-$(CONFIG_SND_SOC)  +=3D sof/
>  obj-$(CONFIG_SND_SOC)  +=3D spear/
>  obj-$(CONFIG_SND_SOC)  +=3D sprd/
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index d277f0366e09..c30762fc9b87 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -201,7 +201,6 @@ snd-soc-sigmadsp-objs :=3D sigmadsp.o
>  snd-soc-sigmadsp-i2c-objs :=3D sigmadsp-i2c.o
>  snd-soc-sigmadsp-regmap-objs :=3D sigmadsp-regmap.o
>  snd-soc-si476x-objs :=3D si476x.o
> -snd-soc-sirf-audio-codec-objs :=3D sirf-audio-codec.o
>  snd-soc-spdif-tx-objs :=3D spdif_transmitter.o
>  snd-soc-spdif-rx-objs :=3D spdif_receiver.o
>  snd-soc-ssm2305-objs :=3D ssm2305.o
> @@ -516,7 +515,6 @@ obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)  +=3D snd-soc-sigm=
adsp-i2c.o
>  obj-$(CONFIG_SND_SOC_SIGMADSP_REGMAP)  +=3D snd-soc-sigmadsp-regmap.o
>  obj-$(CONFIG_SND_SOC_SI476X)   +=3D snd-soc-si476x.o
>  obj-$(CONFIG_SND_SOC_SPDIF)    +=3D snd-soc-spdif-rx.o snd-soc-spdif-tx.=
o
> -obj-$(CONFIG_SND_SOC_SIRF_AUDIO_CODEC) +=3D sirf-audio-codec.o
>  obj-$(CONFIG_SND_SOC_SSM2305)  +=3D snd-soc-ssm2305.o
>  obj-$(CONFIG_SND_SOC_SSM2518)  +=3D snd-soc-ssm2518.o
>  obj-$(CONFIG_SND_SOC_SSM2602)  +=3D snd-soc-ssm2602.o
> diff --git a/sound/soc/codecs/sirf-audio-codec.c b/sound/soc/codecs/sirf-=
audio-codec.c
> deleted file mode 100644
> index a061d78473ac..000000000000
> --- a/sound/soc/codecs/sirf-audio-codec.c
> +++ /dev/null
> @@ -1,575 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * SiRF audio codec driver
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group c=
ompany.
> - */
> -
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/clk.h>
> -#include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/regmap.h>
> -#include <sound/core.h>
> -#include <sound/pcm.h>
> -#include <sound/pcm_params.h>
> -#include <sound/initval.h>
> -#include <sound/tlv.h>
> -#include <sound/soc.h>
> -#include <sound/dmaengine_pcm.h>
> -
> -#include "sirf-audio-codec.h"
> -
> -struct sirf_audio_codec {
> -       struct clk *clk;
> -       struct regmap *regmap;
> -       u32 reg_ctrl0, reg_ctrl1;
> -};
> -
> -static const char * const input_mode_mux[] =3D {"Single-ended",
> -       "Differential"};
> -
> -static const struct soc_enum input_mode_mux_enum =3D
> -       SOC_ENUM_SINGLE(AUDIO_IC_CODEC_CTRL1, 4, 2, input_mode_mux);
> -
> -static const struct snd_kcontrol_new sirf_audio_codec_input_mode_control=
 =3D
> -       SOC_DAPM_ENUM("Route", input_mode_mux_enum);
> -
> -static const DECLARE_TLV_DB_SCALE(playback_vol_tlv, -12400, 100, 0);
> -static const DECLARE_TLV_DB_SCALE(capture_vol_tlv_prima2, 500, 100, 0);
> -static const DECLARE_TLV_DB_RANGE(capture_vol_tlv_atlas6,
> -       0, 7, TLV_DB_SCALE_ITEM(-100, 100, 0),
> -       0x22, 0x3F, TLV_DB_SCALE_ITEM(700, 100, 0),
> -);
> -
> -static struct snd_kcontrol_new volume_controls_atlas6[] =3D {
> -       SOC_DOUBLE_TLV("Playback Volume", AUDIO_IC_CODEC_CTRL0, 21, 14,
> -                       0x7F, 0, playback_vol_tlv),
> -       SOC_DOUBLE_TLV("Capture Volume", AUDIO_IC_CODEC_CTRL1, 16, 10,
> -                       0x3F, 0, capture_vol_tlv_atlas6),
> -};
> -
> -static struct snd_kcontrol_new volume_controls_prima2[] =3D {
> -       SOC_DOUBLE_TLV("Speaker Volume", AUDIO_IC_CODEC_CTRL0, 21, 14,
> -                       0x7F, 0, playback_vol_tlv),
> -       SOC_DOUBLE_TLV("Capture Volume", AUDIO_IC_CODEC_CTRL1, 15, 10,
> -                       0x1F, 0, capture_vol_tlv_prima2),
> -};
> -
> -static struct snd_kcontrol_new left_input_path_controls[] =3D {
> -       SOC_DAPM_SINGLE("Line Left Switch", AUDIO_IC_CODEC_CTRL1, 6, 1, 0=
),
> -       SOC_DAPM_SINGLE("Mic Left Switch", AUDIO_IC_CODEC_CTRL1, 3, 1, 0)=
,
> -};
> -
> -static struct snd_kcontrol_new right_input_path_controls[] =3D {
> -       SOC_DAPM_SINGLE("Line Right Switch", AUDIO_IC_CODEC_CTRL1, 5, 1, =
0),
> -       SOC_DAPM_SINGLE("Mic Right Switch", AUDIO_IC_CODEC_CTRL1, 2, 1, 0=
),
> -};
> -
> -static struct snd_kcontrol_new left_dac_to_hp_left_amp_switch_control =
=3D
> -       SOC_DAPM_SINGLE("Switch", AUDIO_IC_CODEC_CTRL0, 9, 1, 0);
> -
> -static struct snd_kcontrol_new left_dac_to_hp_right_amp_switch_control =
=3D
> -       SOC_DAPM_SINGLE("Switch", AUDIO_IC_CODEC_CTRL0, 8, 1, 0);
> -
> -static struct snd_kcontrol_new right_dac_to_hp_left_amp_switch_control =
=3D
> -       SOC_DAPM_SINGLE("Switch", AUDIO_IC_CODEC_CTRL0, 7, 1, 0);
> -
> -static struct snd_kcontrol_new right_dac_to_hp_right_amp_switch_control =
=3D
> -       SOC_DAPM_SINGLE("Switch", AUDIO_IC_CODEC_CTRL0, 6, 1, 0);
> -
> -static struct snd_kcontrol_new left_dac_to_speaker_lineout_switch_contro=
l =3D
> -       SOC_DAPM_SINGLE("Switch", AUDIO_IC_CODEC_CTRL0, 11, 1, 0);
> -
> -static struct snd_kcontrol_new right_dac_to_speaker_lineout_switch_contr=
ol =3D
> -       SOC_DAPM_SINGLE("Switch", AUDIO_IC_CODEC_CTRL0, 10, 1, 0);
> -
> -/* After enable adc, Delay 200ms to avoid pop noise */
> -static int adc_enable_delay_event(struct snd_soc_dapm_widget *w,
> -               struct snd_kcontrol *kcontrol, int event)
> -{
> -       switch (event) {
> -       case SND_SOC_DAPM_POST_PMU:
> -               msleep(200);
> -               break;
> -       default:
> -               break;
> -       }
> -
> -       return 0;
> -}
> -
> -static void enable_and_reset_codec(struct regmap *regmap,
> -               u32 codec_enable_bits, u32 codec_reset_bits)
> -{
> -       regmap_update_bits(regmap, AUDIO_IC_CODEC_CTRL1,
> -                       codec_enable_bits | codec_reset_bits,
> -                       codec_enable_bits);
> -       msleep(20);
> -       regmap_update_bits(regmap, AUDIO_IC_CODEC_CTRL1,
> -                       codec_reset_bits, codec_reset_bits);
> -}
> -
> -static int atlas6_codec_enable_and_reset_event(struct snd_soc_dapm_widge=
t *w,
> -               struct snd_kcontrol *kcontrol, int event)
> -{
> -#define ATLAS6_CODEC_ENABLE_BITS (1 << 29)
> -#define ATLAS6_CODEC_RESET_BITS (1 << 28)
> -       struct snd_soc_component *component =3D snd_soc_dapm_to_component=
(w->dapm);
> -       struct sirf_audio_codec *sirf_audio_codec =3D snd_soc_component_g=
et_drvdata(component);
> -       switch (event) {
> -       case SND_SOC_DAPM_PRE_PMU:
> -               enable_and_reset_codec(sirf_audio_codec->regmap,
> -                       ATLAS6_CODEC_ENABLE_BITS, ATLAS6_CODEC_RESET_BITS=
);
> -               break;
> -       case SND_SOC_DAPM_POST_PMD:
> -               regmap_update_bits(sirf_audio_codec->regmap,
> -                       AUDIO_IC_CODEC_CTRL1, ATLAS6_CODEC_ENABLE_BITS, 0=
);
> -               break;
> -       default:
> -               break;
> -       }
> -
> -       return 0;
> -}
> -
> -static int prima2_codec_enable_and_reset_event(struct snd_soc_dapm_widge=
t *w,
> -               struct snd_kcontrol *kcontrol, int event)
> -{
> -#define PRIMA2_CODEC_ENABLE_BITS (1 << 27)
> -#define PRIMA2_CODEC_RESET_BITS (1 << 26)
> -       struct snd_soc_component *component =3D snd_soc_dapm_to_component=
(w->dapm);
> -       struct sirf_audio_codec *sirf_audio_codec =3D snd_soc_component_g=
et_drvdata(component);
> -       switch (event) {
> -       case SND_SOC_DAPM_POST_PMU:
> -               enable_and_reset_codec(sirf_audio_codec->regmap,
> -                       PRIMA2_CODEC_ENABLE_BITS, PRIMA2_CODEC_RESET_BITS=
);
> -               break;
> -       case SND_SOC_DAPM_POST_PMD:
> -               regmap_update_bits(sirf_audio_codec->regmap,
> -                       AUDIO_IC_CODEC_CTRL1, PRIMA2_CODEC_ENABLE_BITS, 0=
);
> -               break;
> -       default:
> -               break;
> -       }
> -
> -       return 0;
> -}
> -
> -static const struct snd_soc_dapm_widget atlas6_output_driver_dapm_widget=
s[] =3D {
> -       SND_SOC_DAPM_OUT_DRV("HP Left Driver", AUDIO_IC_CODEC_CTRL1,
> -                       25, 0, NULL, 0),
> -       SND_SOC_DAPM_OUT_DRV("HP Right Driver", AUDIO_IC_CODEC_CTRL1,
> -                       26, 0, NULL, 0),
> -       SND_SOC_DAPM_OUT_DRV("Speaker Driver", AUDIO_IC_CODEC_CTRL1,
> -                       27, 0, NULL, 0),
> -};
> -
> -static const struct snd_soc_dapm_widget prima2_output_driver_dapm_widget=
s[] =3D {
> -       SND_SOC_DAPM_OUT_DRV("HP Left Driver", AUDIO_IC_CODEC_CTRL1,
> -                       23, 0, NULL, 0),
> -       SND_SOC_DAPM_OUT_DRV("HP Right Driver", AUDIO_IC_CODEC_CTRL1,
> -                       24, 0, NULL, 0),
> -       SND_SOC_DAPM_OUT_DRV("Speaker Driver", AUDIO_IC_CODEC_CTRL1,
> -                       25, 0, NULL, 0),
> -};
> -
> -static const struct snd_soc_dapm_widget atlas6_codec_clock_dapm_widget =
=3D
> -       SND_SOC_DAPM_SUPPLY("codecclk", SND_SOC_NOPM, 0, 0,
> -                       atlas6_codec_enable_and_reset_event,
> -                       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD);
> -
> -static const struct snd_soc_dapm_widget prima2_codec_clock_dapm_widget =
=3D
> -       SND_SOC_DAPM_SUPPLY("codecclk", SND_SOC_NOPM, 0, 0,
> -                       prima2_codec_enable_and_reset_event,
> -                       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD);
> -
> -static const struct snd_soc_dapm_widget sirf_audio_codec_dapm_widgets[] =
=3D {
> -       SND_SOC_DAPM_DAC("DAC left", NULL, AUDIO_IC_CODEC_CTRL0, 1, 0),
> -       SND_SOC_DAPM_DAC("DAC right", NULL, AUDIO_IC_CODEC_CTRL0, 0, 0),
> -       SND_SOC_DAPM_SWITCH("Left dac to hp left amp", SND_SOC_NOPM, 0, 0=
,
> -                       &left_dac_to_hp_left_amp_switch_control),
> -       SND_SOC_DAPM_SWITCH("Left dac to hp right amp", SND_SOC_NOPM, 0, =
0,
> -                       &left_dac_to_hp_right_amp_switch_control),
> -       SND_SOC_DAPM_SWITCH("Right dac to hp left amp", SND_SOC_NOPM, 0, =
0,
> -                       &right_dac_to_hp_left_amp_switch_control),
> -       SND_SOC_DAPM_SWITCH("Right dac to hp right amp", SND_SOC_NOPM, 0,=
 0,
> -                       &right_dac_to_hp_right_amp_switch_control),
> -       SND_SOC_DAPM_OUT_DRV("HP amp left driver", AUDIO_IC_CODEC_CTRL0, =
3, 0,
> -                       NULL, 0),
> -       SND_SOC_DAPM_OUT_DRV("HP amp right driver", AUDIO_IC_CODEC_CTRL0,=
 3, 0,
> -                       NULL, 0),
> -
> -       SND_SOC_DAPM_SWITCH("Left dac to speaker lineout", SND_SOC_NOPM, =
0, 0,
> -                       &left_dac_to_speaker_lineout_switch_control),
> -       SND_SOC_DAPM_SWITCH("Right dac to speaker lineout", SND_SOC_NOPM,=
 0, 0,
> -                       &right_dac_to_speaker_lineout_switch_control),
> -       SND_SOC_DAPM_OUT_DRV("Speaker amp driver", AUDIO_IC_CODEC_CTRL0, =
4, 0,
> -                       NULL, 0),
> -
> -       SND_SOC_DAPM_OUTPUT("HPOUTL"),
> -       SND_SOC_DAPM_OUTPUT("HPOUTR"),
> -       SND_SOC_DAPM_OUTPUT("SPKOUT"),
> -
> -       SND_SOC_DAPM_ADC_E("ADC left", NULL, AUDIO_IC_CODEC_CTRL1, 8, 0,
> -                       adc_enable_delay_event, SND_SOC_DAPM_POST_PMU),
> -       SND_SOC_DAPM_ADC_E("ADC right", NULL, AUDIO_IC_CODEC_CTRL1, 7, 0,
> -                       adc_enable_delay_event, SND_SOC_DAPM_POST_PMU),
> -       SND_SOC_DAPM_MIXER("Left PGA mixer", AUDIO_IC_CODEC_CTRL1, 1, 0,
> -               &left_input_path_controls[0],
> -               ARRAY_SIZE(left_input_path_controls)),
> -       SND_SOC_DAPM_MIXER("Right PGA mixer", AUDIO_IC_CODEC_CTRL1, 0, 0,
> -               &right_input_path_controls[0],
> -               ARRAY_SIZE(right_input_path_controls)),
> -
> -       SND_SOC_DAPM_MUX("Mic input mode mux", SND_SOC_NOPM, 0, 0,
> -                       &sirf_audio_codec_input_mode_control),
> -       SND_SOC_DAPM_MICBIAS("Mic Bias", AUDIO_IC_CODEC_PWR, 3, 0),
> -       SND_SOC_DAPM_INPUT("MICIN1"),
> -       SND_SOC_DAPM_INPUT("MICIN2"),
> -       SND_SOC_DAPM_INPUT("LINEIN1"),
> -       SND_SOC_DAPM_INPUT("LINEIN2"),
> -
> -       SND_SOC_DAPM_SUPPLY("HSL Phase Opposite", AUDIO_IC_CODEC_CTRL0,
> -                       30, 0, NULL, 0),
> -};
> -
> -static const struct snd_soc_dapm_route sirf_audio_codec_map[] =3D {
> -       {"SPKOUT", NULL, "Speaker Driver"},
> -       {"Speaker Driver", NULL, "Speaker amp driver"},
> -       {"Speaker amp driver", NULL, "Left dac to speaker lineout"},
> -       {"Speaker amp driver", NULL, "Right dac to speaker lineout"},
> -       {"Left dac to speaker lineout", "Switch", "DAC left"},
> -       {"Right dac to speaker lineout", "Switch", "DAC right"},
> -       {"HPOUTL", NULL, "HP Left Driver"},
> -       {"HPOUTR", NULL, "HP Right Driver"},
> -       {"HP Left Driver", NULL, "HP amp left driver"},
> -       {"HP Right Driver", NULL, "HP amp right driver"},
> -       {"HP amp left driver", NULL, "Right dac to hp left amp"},
> -       {"HP amp right driver", NULL , "Right dac to hp right amp"},
> -       {"HP amp left driver", NULL, "Left dac to hp left amp"},
> -       {"HP amp right driver", NULL , "Right dac to hp right amp"},
> -       {"Right dac to hp left amp", "Switch", "DAC left"},
> -       {"Right dac to hp right amp", "Switch", "DAC right"},
> -       {"Left dac to hp left amp", "Switch", "DAC left"},
> -       {"Left dac to hp right amp", "Switch", "DAC right"},
> -       {"DAC left", NULL, "codecclk"},
> -       {"DAC right", NULL, "codecclk"},
> -       {"DAC left", NULL, "Playback"},
> -       {"DAC right", NULL, "Playback"},
> -       {"DAC left", NULL, "HSL Phase Opposite"},
> -       {"DAC right", NULL, "HSL Phase Opposite"},
> -
> -       {"Capture", NULL, "ADC left"},
> -       {"Capture", NULL, "ADC right"},
> -       {"ADC left", NULL, "codecclk"},
> -       {"ADC right", NULL, "codecclk"},
> -       {"ADC left", NULL, "Left PGA mixer"},
> -       {"ADC right", NULL, "Right PGA mixer"},
> -       {"Left PGA mixer", "Line Left Switch", "LINEIN2"},
> -       {"Right PGA mixer", "Line Right Switch", "LINEIN1"},
> -       {"Left PGA mixer", "Mic Left Switch", "MICIN2"},
> -       {"Right PGA mixer", "Mic Right Switch", "Mic input mode mux"},
> -       {"Mic input mode mux", "Single-ended", "MICIN1"},
> -       {"Mic input mode mux", "Differential", "MICIN1"},
> -};
> -
> -static void sirf_audio_codec_tx_enable(struct sirf_audio_codec *sirf_aud=
io_codec)
> -{
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_PORT_IC_TXFIFO=
_OP,
> -               AUDIO_FIFO_RESET, AUDIO_FIFO_RESET);
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_PORT_IC_TXFIFO=
_OP,
> -               AUDIO_FIFO_RESET, ~AUDIO_FIFO_RESET);
> -       regmap_write(sirf_audio_codec->regmap, AUDIO_PORT_IC_TXFIFO_INT_M=
SK, 0);
> -       regmap_write(sirf_audio_codec->regmap, AUDIO_PORT_IC_TXFIFO_OP, 0=
);
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_PORT_IC_TXFIFO=
_OP,
> -               AUDIO_FIFO_START, AUDIO_FIFO_START);
> -       regmap_update_bits(sirf_audio_codec->regmap,
> -               AUDIO_PORT_IC_CODEC_TX_CTRL, IC_TX_ENABLE, IC_TX_ENABLE);
> -}
> -
> -static void sirf_audio_codec_tx_disable(struct sirf_audio_codec *sirf_au=
dio_codec)
> -{
> -       regmap_write(sirf_audio_codec->regmap, AUDIO_PORT_IC_TXFIFO_OP, 0=
);
> -       regmap_update_bits(sirf_audio_codec->regmap,
> -               AUDIO_PORT_IC_CODEC_TX_CTRL, IC_TX_ENABLE, ~IC_TX_ENABLE)=
;
> -}
> -
> -static void sirf_audio_codec_rx_enable(struct sirf_audio_codec *sirf_aud=
io_codec,
> -       int channels)
> -{
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_PORT_IC_RXFIFO=
_OP,
> -               AUDIO_FIFO_RESET, AUDIO_FIFO_RESET);
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_PORT_IC_RXFIFO=
_OP,
> -               AUDIO_FIFO_RESET, ~AUDIO_FIFO_RESET);
> -       regmap_write(sirf_audio_codec->regmap,
> -               AUDIO_PORT_IC_RXFIFO_INT_MSK, 0);
> -       regmap_write(sirf_audio_codec->regmap, AUDIO_PORT_IC_RXFIFO_OP, 0=
);
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_PORT_IC_RXFIFO=
_OP,
> -               AUDIO_FIFO_START, AUDIO_FIFO_START);
> -       if (channels =3D=3D 1)
> -               regmap_update_bits(sirf_audio_codec->regmap,
> -                       AUDIO_PORT_IC_CODEC_RX_CTRL,
> -                       IC_RX_ENABLE_MONO, IC_RX_ENABLE_MONO);
> -       else
> -               regmap_update_bits(sirf_audio_codec->regmap,
> -                       AUDIO_PORT_IC_CODEC_RX_CTRL,
> -                       IC_RX_ENABLE_STEREO, IC_RX_ENABLE_STEREO);
> -}
> -
> -static void sirf_audio_codec_rx_disable(struct sirf_audio_codec *sirf_au=
dio_codec)
> -{
> -       regmap_update_bits(sirf_audio_codec->regmap,
> -                       AUDIO_PORT_IC_CODEC_RX_CTRL,
> -                       IC_RX_ENABLE_STEREO, ~IC_RX_ENABLE_STEREO);
> -}
> -
> -static int sirf_audio_codec_trigger(struct snd_pcm_substream *substream,
> -               int cmd,
> -               struct snd_soc_dai *dai)
> -{
> -       struct snd_soc_component *component =3D dai->component;
> -       struct sirf_audio_codec *sirf_audio_codec =3D snd_soc_component_g=
et_drvdata(component);
> -       int playback =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBA=
CK;
> -
> -       /*
> -        * This is a workaround, When stop playback,
> -        * need disable HP amp, avoid the current noise.
> -        */
> -       switch (cmd) {
> -       case SNDRV_PCM_TRIGGER_STOP:
> -       case SNDRV_PCM_TRIGGER_SUSPEND:
> -       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -               if (playback) {
> -                       snd_soc_component_update_bits(component, AUDIO_IC=
_CODEC_CTRL0,
> -                               IC_HSLEN | IC_HSREN, 0);
> -                       sirf_audio_codec_tx_disable(sirf_audio_codec);
> -               } else
> -                       sirf_audio_codec_rx_disable(sirf_audio_codec);
> -               break;
> -       case SNDRV_PCM_TRIGGER_START:
> -       case SNDRV_PCM_TRIGGER_RESUME:
> -       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -               if (playback) {
> -                       sirf_audio_codec_tx_enable(sirf_audio_codec);
> -                       snd_soc_component_update_bits(component, AUDIO_IC=
_CODEC_CTRL0,
> -                               IC_HSLEN | IC_HSREN, IC_HSLEN | IC_HSREN)=
;
> -               } else
> -                       sirf_audio_codec_rx_enable(sirf_audio_codec,
> -                               substream->runtime->channels);
> -               break;
> -       default:
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
> -static const struct snd_soc_dai_ops sirf_audio_codec_dai_ops =3D {
> -       .trigger =3D sirf_audio_codec_trigger,
> -};
> -
> -static struct snd_soc_dai_driver sirf_audio_codec_dai =3D {
> -       .name =3D "sirf-audio-codec",
> -       .playback =3D {
> -               .stream_name =3D "Playback",
> -               .channels_min =3D 2,
> -               .channels_max =3D 2,
> -               .rates =3D SNDRV_PCM_RATE_48000,
> -               .formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> -       },
> -       .capture =3D {
> -               .stream_name =3D "Capture",
> -               .channels_min =3D 1,
> -               .channels_max =3D 2,
> -               .rates =3D SNDRV_PCM_RATE_48000,
> -               .formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> -       },
> -       .ops =3D &sirf_audio_codec_dai_ops,
> -};
> -
> -static int sirf_audio_codec_probe(struct snd_soc_component *component)
> -{
> -       struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(=
component);
> -
> -       pm_runtime_enable(component->dev);
> -
> -       if (of_device_is_compatible(component->dev->of_node, "sirf,prima2=
-audio-codec")) {
> -               snd_soc_dapm_new_controls(dapm,
> -                       prima2_output_driver_dapm_widgets,
> -                       ARRAY_SIZE(prima2_output_driver_dapm_widgets));
> -               snd_soc_dapm_new_controls(dapm,
> -                       &prima2_codec_clock_dapm_widget, 1);
> -               return snd_soc_add_component_controls(component,
> -                       volume_controls_prima2,
> -                       ARRAY_SIZE(volume_controls_prima2));
> -       }
> -       if (of_device_is_compatible(component->dev->of_node, "sirf,atlas6=
-audio-codec")) {
> -               snd_soc_dapm_new_controls(dapm,
> -                       atlas6_output_driver_dapm_widgets,
> -                       ARRAY_SIZE(atlas6_output_driver_dapm_widgets));
> -               snd_soc_dapm_new_controls(dapm,
> -                       &atlas6_codec_clock_dapm_widget, 1);
> -               return snd_soc_add_component_controls(component,
> -                       volume_controls_atlas6,
> -                       ARRAY_SIZE(volume_controls_atlas6));
> -       }
> -
> -       return -EINVAL;
> -}
> -
> -static void sirf_audio_codec_remove(struct snd_soc_component *component)
> -{
> -       pm_runtime_disable(component->dev);
> -}
> -
> -static const struct snd_soc_component_driver soc_codec_device_sirf_audio=
_codec =3D {
> -       .probe                  =3D sirf_audio_codec_probe,
> -       .remove                 =3D sirf_audio_codec_remove,
> -       .dapm_widgets           =3D sirf_audio_codec_dapm_widgets,
> -       .num_dapm_widgets       =3D ARRAY_SIZE(sirf_audio_codec_dapm_widg=
ets),
> -       .dapm_routes            =3D sirf_audio_codec_map,
> -       .num_dapm_routes        =3D ARRAY_SIZE(sirf_audio_codec_map),
> -       .use_pmdown_time        =3D 1,
> -       .endianness             =3D 1,
> -       .non_legacy_dai_naming  =3D 1,
> -};
> -
> -static const struct of_device_id sirf_audio_codec_of_match[] =3D {
> -       { .compatible =3D "sirf,prima2-audio-codec" },
> -       { .compatible =3D "sirf,atlas6-audio-codec" },
> -       {}
> -};
> -MODULE_DEVICE_TABLE(of, sirf_audio_codec_of_match);
> -
> -static const struct regmap_config sirf_audio_codec_regmap_config =3D {
> -       .reg_bits =3D 32,
> -       .reg_stride =3D 4,
> -       .val_bits =3D 32,
> -       .max_register =3D AUDIO_PORT_IC_RXFIFO_INT_MSK,
> -       .cache_type =3D REGCACHE_NONE,
> -};
> -
> -static int sirf_audio_codec_driver_probe(struct platform_device *pdev)
> -{
> -       int ret;
> -       struct sirf_audio_codec *sirf_audio_codec;
> -       void __iomem *base;
> -
> -       sirf_audio_codec =3D devm_kzalloc(&pdev->dev,
> -               sizeof(struct sirf_audio_codec), GFP_KERNEL);
> -       if (!sirf_audio_codec)
> -               return -ENOMEM;
> -
> -       platform_set_drvdata(pdev, sirf_audio_codec);
> -
> -       base =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -
> -       sirf_audio_codec->regmap =3D devm_regmap_init_mmio(&pdev->dev, ba=
se,
> -                                           &sirf_audio_codec_regmap_conf=
ig);
> -       if (IS_ERR(sirf_audio_codec->regmap))
> -               return PTR_ERR(sirf_audio_codec->regmap);
> -
> -       sirf_audio_codec->clk =3D devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(sirf_audio_codec->clk)) {
> -               dev_err(&pdev->dev, "Get clock failed.\n");
> -               return PTR_ERR(sirf_audio_codec->clk);
> -       }
> -
> -       ret =3D clk_prepare_enable(sirf_audio_codec->clk);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Enable clock failed.\n");
> -               return ret;
> -       }
> -
> -       ret =3D devm_snd_soc_register_component(&(pdev->dev),
> -                       &soc_codec_device_sirf_audio_codec,
> -                       &sirf_audio_codec_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Register Audio Codec dai failed.\n")=
;
> -               goto err_clk_put;
> -       }
> -
> -       /*
> -        * Always open charge pump, if not, when the charge pump closed t=
he
> -        * adc will not stable
> -        */
> -       regmap_update_bits(sirf_audio_codec->regmap, AUDIO_IC_CODEC_CTRL0=
,
> -               IC_CPFREQ, IC_CPFREQ);
> -
> -       if (of_device_is_compatible(pdev->dev.of_node, "sirf,atlas6-audio=
-codec"))
> -               regmap_update_bits(sirf_audio_codec->regmap,
> -                               AUDIO_IC_CODEC_CTRL0, IC_CPEN, IC_CPEN);
> -       return 0;
> -
> -err_clk_put:
> -       clk_disable_unprepare(sirf_audio_codec->clk);
> -       return ret;
> -}
> -
> -static int sirf_audio_codec_driver_remove(struct platform_device *pdev)
> -{
> -       struct sirf_audio_codec *sirf_audio_codec =3D platform_get_drvdat=
a(pdev);
> -
> -       clk_disable_unprepare(sirf_audio_codec->clk);
> -
> -       return 0;
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int sirf_audio_codec_suspend(struct device *dev)
> -{
> -       struct sirf_audio_codec *sirf_audio_codec =3D dev_get_drvdata(dev=
);
> -
> -       regmap_read(sirf_audio_codec->regmap, AUDIO_IC_CODEC_CTRL0,
> -               &sirf_audio_codec->reg_ctrl0);
> -       regmap_read(sirf_audio_codec->regmap, AUDIO_IC_CODEC_CTRL1,
> -               &sirf_audio_codec->reg_ctrl1);
> -       clk_disable_unprepare(sirf_audio_codec->clk);
> -
> -       return 0;
> -}
> -
> -static int sirf_audio_codec_resume(struct device *dev)
> -{
> -       struct sirf_audio_codec *sirf_audio_codec =3D dev_get_drvdata(dev=
);
> -       int ret;
> -
> -       ret =3D clk_prepare_enable(sirf_audio_codec->clk);
> -       if (ret)
> -               return ret;
> -
> -       regmap_write(sirf_audio_codec->regmap, AUDIO_IC_CODEC_CTRL0,
> -               sirf_audio_codec->reg_ctrl0);
> -       regmap_write(sirf_audio_codec->regmap, AUDIO_IC_CODEC_CTRL1,
> -               sirf_audio_codec->reg_ctrl1);
> -
> -       return 0;
> -}
> -#endif
> -
> -static const struct dev_pm_ops sirf_audio_codec_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(sirf_audio_codec_suspend, sirf_audio_code=
c_resume)
> -};
> -
> -static struct platform_driver sirf_audio_codec_driver =3D {
> -       .driver =3D {
> -               .name =3D "sirf-audio-codec",
> -               .of_match_table =3D sirf_audio_codec_of_match,
> -               .pm =3D &sirf_audio_codec_pm_ops,
> -       },
> -       .probe =3D sirf_audio_codec_driver_probe,
> -       .remove =3D sirf_audio_codec_driver_remove,
> -};
> -
> -module_platform_driver(sirf_audio_codec_driver);
> -
> -MODULE_DESCRIPTION("SiRF audio codec driver");
> -MODULE_AUTHOR("RongJun Ying <Rongjun.Ying@csr.com>");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/sirf/Kconfig b/sound/soc/sirf/Kconfig
> deleted file mode 100644
> index 094a1c89c59d..000000000000
> --- a/sound/soc/sirf/Kconfig
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -config SND_SOC_SIRF
> -       tristate "SoC Audio for the SiRF SoC chips"
> -       depends on ARCH_SIRF || COMPILE_TEST
> -       select SND_SOC_GENERIC_DMAENGINE_PCM
> -
> -config SND_SOC_SIRF_AUDIO
> -       tristate "SoC Audio support for SiRF internal audio codec"
> -       depends on SND_SOC_SIRF
> -       select SND_SOC_SIRF_AUDIO_CODEC
> -       select SND_SOC_SIRF_AUDIO_PORT
> -
> -config SND_SOC_SIRF_AUDIO_PORT
> -       select REGMAP_MMIO
> -       tristate
> -
> -config SND_SOC_SIRF_USP
> -       tristate "SoC Audio (I2S protocol) for SiRF SoC USP interface"
> -       depends on SND_SOC_SIRF
> -       select REGMAP_MMIO
> -       tristate
> diff --git a/sound/soc/sirf/Makefile b/sound/soc/sirf/Makefile
> deleted file mode 100644
> index 16ed11965ff9..000000000000
> --- a/sound/soc/sirf/Makefile
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -snd-soc-sirf-audio-objs :=3D sirf-audio.o
> -snd-soc-sirf-audio-port-objs :=3D sirf-audio-port.o
> -snd-soc-sirf-usp-objs :=3D sirf-usp.o
> -
> -obj-$(CONFIG_SND_SOC_SIRF_AUDIO) +=3D snd-soc-sirf-audio.o
> -obj-$(CONFIG_SND_SOC_SIRF_AUDIO_PORT) +=3D snd-soc-sirf-audio-port.o
> -obj-$(CONFIG_SND_SOC_SIRF_USP) +=3D snd-soc-sirf-usp.o
> diff --git a/sound/soc/sirf/sirf-audio-port.c b/sound/soc/sirf/sirf-audio=
-port.c
> deleted file mode 100644
> index 8be2f0bc477b..000000000000
> --- a/sound/soc/sirf/sirf-audio-port.c
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * SiRF Audio port driver
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group c=
ompany.
> - */
> -#include <linux/module.h>
> -#include <sound/soc.h>
> -#include <sound/dmaengine_pcm.h>
> -
> -struct sirf_audio_port {
> -       struct regmap *regmap;
> -       struct snd_dmaengine_dai_dma_data playback_dma_data;
> -       struct snd_dmaengine_dai_dma_data capture_dma_data;
> -};
> -
> -
> -static int sirf_audio_port_dai_probe(struct snd_soc_dai *dai)
> -{
> -       struct sirf_audio_port *port =3D snd_soc_dai_get_drvdata(dai);
> -
> -       snd_soc_dai_init_dma_data(dai, &port->playback_dma_data,
> -                       &port->capture_dma_data);
> -       return 0;
> -}
> -
> -static struct snd_soc_dai_driver sirf_audio_port_dai =3D {
> -       .probe =3D sirf_audio_port_dai_probe,
> -       .name =3D "sirf-audio-port",
> -       .id =3D 0,
> -       .playback =3D {
> -               .channels_min =3D 2,
> -               .channels_max =3D 2,
> -               .rates =3D SNDRV_PCM_RATE_48000,
> -               .formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> -       },
> -       .capture =3D {
> -               .channels_min =3D 1,
> -               .channels_max =3D 2,
> -               .rates =3D SNDRV_PCM_RATE_48000,
> -               .formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> -       },
> -};
> -
> -static const struct snd_soc_component_driver sirf_audio_port_component =
=3D {
> -       .name       =3D "sirf-audio-port",
> -};
> -
> -static int sirf_audio_port_probe(struct platform_device *pdev)
> -{
> -       int ret;
> -       struct sirf_audio_port *port;
> -
> -       port =3D devm_kzalloc(&pdev->dev,
> -                       sizeof(struct sirf_audio_port), GFP_KERNEL);
> -       if (!port)
> -               return -ENOMEM;
> -
> -       ret =3D devm_snd_soc_register_component(&pdev->dev,
> -                       &sirf_audio_port_component, &sirf_audio_port_dai,=
 1);
> -       if (ret)
> -               return ret;
> -
> -       platform_set_drvdata(pdev, port);
> -       return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> -}
> -
> -static const struct of_device_id sirf_audio_port_of_match[] =3D {
> -       { .compatible =3D "sirf,audio-port", },
> -       {}
> -};
> -MODULE_DEVICE_TABLE(of, sirf_audio_port_of_match);
> -
> -static struct platform_driver sirf_audio_port_driver =3D {
> -       .driver =3D {
> -               .name =3D "sirf-audio-port",
> -               .of_match_table =3D sirf_audio_port_of_match,
> -       },
> -       .probe =3D sirf_audio_port_probe,
> -};
> -
> -module_platform_driver(sirf_audio_port_driver);
> -
> -MODULE_DESCRIPTION("SiRF Audio Port driver");
> -MODULE_AUTHOR("RongJun Ying <Rongjun.Ying@csr.com>");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/sirf/sirf-audio.c b/sound/soc/sirf/sirf-audio.c
> deleted file mode 100644
> index c923b6772b22..000000000000
> --- a/sound/soc/sirf/sirf-audio.c
> +++ /dev/null
> @@ -1,160 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * SiRF audio card driver
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group c=
ompany.
> - */
> -
> -#include <linux/platform_device.h>
> -#include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
> -#include <sound/core.h>
> -#include <sound/pcm.h>
> -#include <sound/soc.h>
> -
> -struct sirf_audio_card {
> -       unsigned int            gpio_hp_pa;
> -       unsigned int            gpio_spk_pa;
> -};
> -
> -static int sirf_audio_hp_event(struct snd_soc_dapm_widget *w,
> -                               struct snd_kcontrol *ctrl, int event)
> -{
> -       struct snd_soc_dapm_context *dapm =3D w->dapm;
> -       struct snd_soc_card *card =3D dapm->card;
> -       struct sirf_audio_card *sirf_audio_card =3D snd_soc_card_get_drvd=
ata(card);
> -       int on =3D !SND_SOC_DAPM_EVENT_OFF(event);
> -
> -       if (gpio_is_valid(sirf_audio_card->gpio_hp_pa))
> -               gpio_set_value(sirf_audio_card->gpio_hp_pa, on);
> -       return 0;
> -}
> -
> -static int sirf_audio_spk_event(struct snd_soc_dapm_widget *w,
> -                               struct snd_kcontrol *ctrl, int event)
> -{
> -       struct snd_soc_dapm_context *dapm =3D w->dapm;
> -       struct snd_soc_card *card =3D dapm->card;
> -       struct sirf_audio_card *sirf_audio_card =3D snd_soc_card_get_drvd=
ata(card);
> -       int on =3D !SND_SOC_DAPM_EVENT_OFF(event);
> -
> -       if (gpio_is_valid(sirf_audio_card->gpio_spk_pa))
> -               gpio_set_value(sirf_audio_card->gpio_spk_pa, on);
> -
> -       return 0;
> -}
> -static const struct snd_soc_dapm_widget sirf_audio_dapm_widgets[] =3D {
> -       SND_SOC_DAPM_HP("Hp", sirf_audio_hp_event),
> -       SND_SOC_DAPM_SPK("Ext Spk", sirf_audio_spk_event),
> -       SND_SOC_DAPM_MIC("Ext Mic", NULL),
> -};
> -
> -static const struct snd_soc_dapm_route intercon[] =3D {
> -       {"Hp", NULL, "HPOUTL"},
> -       {"Hp", NULL, "HPOUTR"},
> -       {"Ext Spk", NULL, "SPKOUT"},
> -       {"MICIN1", NULL, "Mic Bias"},
> -       {"Mic Bias", NULL, "Ext Mic"},
> -};
> -
> -/* Digital audio interface glue - connects codec <--> CPU */
> -SND_SOC_DAILINK_DEFS(sirf,
> -       DAILINK_COMP_ARRAY(COMP_EMPTY()),
> -       DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sirf-audio-codec")),
> -       DAILINK_COMP_ARRAY(COMP_EMPTY()));
> -
> -static struct snd_soc_dai_link sirf_audio_dai_link[] =3D {
> -       {
> -               .name =3D "SiRF audio card",
> -               .stream_name =3D "SiRF audio HiFi",
> -               SND_SOC_DAILINK_REG(sirf),
> -       },
> -};
> -
> -/* Audio machine driver */
> -static struct snd_soc_card snd_soc_sirf_audio_card =3D {
> -       .name =3D "SiRF audio card",
> -       .owner =3D THIS_MODULE,
> -       .dai_link =3D sirf_audio_dai_link,
> -       .num_links =3D ARRAY_SIZE(sirf_audio_dai_link),
> -       .dapm_widgets =3D sirf_audio_dapm_widgets,
> -       .num_dapm_widgets =3D ARRAY_SIZE(sirf_audio_dapm_widgets),
> -       .dapm_routes =3D intercon,
> -       .num_dapm_routes =3D ARRAY_SIZE(intercon),
> -};
> -
> -static int sirf_audio_probe(struct platform_device *pdev)
> -{
> -       struct snd_soc_card *card =3D &snd_soc_sirf_audio_card;
> -       struct sirf_audio_card *sirf_audio_card;
> -       int ret;
> -
> -       sirf_audio_card =3D devm_kzalloc(&pdev->dev, sizeof(struct sirf_a=
udio_card),
> -                       GFP_KERNEL);
> -       if (sirf_audio_card =3D=3D NULL)
> -               return -ENOMEM;
> -
> -       sirf_audio_dai_link[0].cpus->of_node =3D
> -               of_parse_phandle(pdev->dev.of_node, "sirf,audio-platform"=
, 0);
> -       sirf_audio_dai_link[0].platforms->of_node =3D
> -               of_parse_phandle(pdev->dev.of_node, "sirf,audio-platform"=
, 0);
> -       sirf_audio_dai_link[0].codecs->of_node =3D
> -               of_parse_phandle(pdev->dev.of_node, "sirf,audio-codec", 0=
);
> -       sirf_audio_card->gpio_spk_pa =3D of_get_named_gpio(pdev->dev.of_n=
ode,
> -                       "spk-pa-gpios", 0);
> -       sirf_audio_card->gpio_hp_pa =3D  of_get_named_gpio(pdev->dev.of_n=
ode,
> -                       "hp-pa-gpios", 0);
> -       if (gpio_is_valid(sirf_audio_card->gpio_spk_pa)) {
> -               ret =3D devm_gpio_request_one(&pdev->dev,
> -                               sirf_audio_card->gpio_spk_pa,
> -                               GPIOF_OUT_INIT_LOW, "SPA_PA_SD");
> -               if (ret) {
> -                       dev_err(&pdev->dev,
> -                               "Failed to request GPIO_%d for reset: %d\=
n",
> -                               sirf_audio_card->gpio_spk_pa, ret);
> -                       return ret;
> -               }
> -       }
> -       if (gpio_is_valid(sirf_audio_card->gpio_hp_pa)) {
> -               ret =3D devm_gpio_request_one(&pdev->dev,
> -                               sirf_audio_card->gpio_hp_pa,
> -                               GPIOF_OUT_INIT_LOW, "HP_PA_SD");
> -               if (ret) {
> -                       dev_err(&pdev->dev,
> -                               "Failed to request GPIO_%d for reset: %d\=
n",
> -                               sirf_audio_card->gpio_hp_pa, ret);
> -                       return ret;
> -               }
> -       }
> -
> -       card->dev =3D &pdev->dev;
> -       snd_soc_card_set_drvdata(card, sirf_audio_card);
> -
> -       ret =3D devm_snd_soc_register_card(&pdev->dev, card);
> -       if (ret)
> -               dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n"=
, ret);
> -
> -       return ret;
> -}
> -
> -static const struct of_device_id sirf_audio_of_match[] =3D {
> -       {.compatible =3D "sirf,sirf-audio-card", },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, sirf_audio_of_match);
> -
> -static struct platform_driver sirf_audio_driver =3D {
> -       .driver =3D {
> -               .name =3D "sirf-audio-card",
> -               .pm =3D &snd_soc_pm_ops,
> -               .of_match_table =3D sirf_audio_of_match,
> -       },
> -       .probe =3D sirf_audio_probe,
> -};
> -module_platform_driver(sirf_audio_driver);
> -
> -MODULE_AUTHOR("RongJun Ying <RongJun.Ying@csr.com>");
> -MODULE_DESCRIPTION("ALSA SoC SIRF audio card driver");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/sirf/sirf-usp.c b/sound/soc/sirf/sirf-usp.c
> deleted file mode 100644
> index 2af0c6f14ee6..000000000000
> --- a/sound/soc/sirf/sirf-usp.c
> +++ /dev/null
> @@ -1,435 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * SiRF USP in I2S/DSP mode
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group c=
ompany.
> - */
> -#include <linux/module.h>
> -#include <linux/io.h>
> -#include <linux/of.h>
> -#include <linux/clk.h>
> -#include <linux/pm_runtime.h>
> -#include <sound/soc.h>
> -#include <sound/pcm_params.h>
> -#include <sound/dmaengine_pcm.h>
> -
> -#include "sirf-usp.h"
> -
> -struct sirf_usp {
> -       struct regmap *regmap;
> -       struct clk *clk;
> -       u32 mode1_reg;
> -       u32 mode2_reg;
> -       int daifmt_format;
> -       struct snd_dmaengine_dai_dma_data playback_dma_data;
> -       struct snd_dmaengine_dai_dma_data capture_dma_data;
> -};
> -
> -static void sirf_usp_tx_enable(struct sirf_usp *usp)
> -{
> -       regmap_update_bits(usp->regmap, USP_TX_FIFO_OP,
> -               USP_TX_FIFO_RESET, USP_TX_FIFO_RESET);
> -       regmap_write(usp->regmap, USP_TX_FIFO_OP, 0);
> -
> -       regmap_update_bits(usp->regmap, USP_TX_FIFO_OP,
> -               USP_TX_FIFO_START, USP_TX_FIFO_START);
> -
> -       regmap_update_bits(usp->regmap, USP_TX_RX_ENABLE,
> -               USP_TX_ENA, USP_TX_ENA);
> -}
> -
> -static void sirf_usp_tx_disable(struct sirf_usp *usp)
> -{
> -       regmap_update_bits(usp->regmap, USP_TX_RX_ENABLE,
> -               USP_TX_ENA, ~USP_TX_ENA);
> -       /* FIFO stop */
> -       regmap_write(usp->regmap, USP_TX_FIFO_OP, 0);
> -}
> -
> -static void sirf_usp_rx_enable(struct sirf_usp *usp)
> -{
> -       regmap_update_bits(usp->regmap, USP_RX_FIFO_OP,
> -               USP_RX_FIFO_RESET, USP_RX_FIFO_RESET);
> -       regmap_write(usp->regmap, USP_RX_FIFO_OP, 0);
> -
> -       regmap_update_bits(usp->regmap, USP_RX_FIFO_OP,
> -               USP_RX_FIFO_START, USP_RX_FIFO_START);
> -
> -       regmap_update_bits(usp->regmap, USP_TX_RX_ENABLE,
> -               USP_RX_ENA, USP_RX_ENA);
> -}
> -
> -static void sirf_usp_rx_disable(struct sirf_usp *usp)
> -{
> -       regmap_update_bits(usp->regmap, USP_TX_RX_ENABLE,
> -               USP_RX_ENA, ~USP_RX_ENA);
> -       /* FIFO stop */
> -       regmap_write(usp->regmap, USP_RX_FIFO_OP, 0);
> -}
> -
> -static int sirf_usp_pcm_dai_probe(struct snd_soc_dai *dai)
> -{
> -       struct sirf_usp *usp =3D snd_soc_dai_get_drvdata(dai);
> -
> -       snd_soc_dai_init_dma_data(dai, &usp->playback_dma_data,
> -                       &usp->capture_dma_data);
> -       return 0;
> -}
> -
> -static int sirf_usp_pcm_set_dai_fmt(struct snd_soc_dai *dai,
> -               unsigned int fmt)
> -{
> -       struct sirf_usp *usp =3D snd_soc_dai_get_drvdata(dai);
> -
> -       /* set master/slave audio interface */
> -       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -       case SND_SOC_DAIFMT_CBM_CFM:
> -               break;
> -       default:
> -               dev_err(dai->dev, "Only CBM and CFM supported\n");
> -               return -EINVAL;
> -       }
> -
> -       switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> -       case SND_SOC_DAIFMT_I2S:
> -       case SND_SOC_DAIFMT_DSP_A:
> -               usp->daifmt_format =3D (fmt & SND_SOC_DAIFMT_FORMAT_MASK)=
;
> -               break;
> -       default:
> -               dev_err(dai->dev, "Only I2S and DSP_A format supported\n"=
);
> -               return -EINVAL;
> -       }
> -
> -       switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> -       case SND_SOC_DAIFMT_NB_NF:
> -               break;
> -       case SND_SOC_DAIFMT_IB_NF:
> -               usp->daifmt_format |=3D (fmt & SND_SOC_DAIFMT_INV_MASK);
> -               break;
> -       default:
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
> -static void sirf_usp_i2s_init(struct sirf_usp *usp)
> -{
> -       /* Configure RISC mode */
> -       regmap_update_bits(usp->regmap, USP_RISC_DSP_MODE,
> -               USP_RISC_DSP_SEL, ~USP_RISC_DSP_SEL);
> -
> -       /*
> -        * Configure DMA IO Length register
> -        * Set no limit, USP can receive data continuously until it is di=
abled
> -        */
> -       regmap_write(usp->regmap, USP_TX_DMA_IO_LEN, 0);
> -       regmap_write(usp->regmap, USP_RX_DMA_IO_LEN, 0);
> -
> -       /* Configure Mode2 register */
> -       regmap_write(usp->regmap, USP_MODE2, (1 << USP_RXD_DELAY_LEN_OFFS=
ET) |
> -               (0 << USP_TXD_DELAY_LEN_OFFSET) |
> -               USP_TFS_CLK_SLAVE_MODE | USP_RFS_CLK_SLAVE_MODE);
> -
> -       /* Configure Mode1 register */
> -       regmap_write(usp->regmap, USP_MODE1,
> -               USP_SYNC_MODE | USP_EN | USP_TXD_ACT_EDGE_FALLING |
> -               USP_RFS_ACT_LEVEL_LOGIC1 | USP_TFS_ACT_LEVEL_LOGIC1 |
> -               USP_TX_UFLOW_REPEAT_ZERO | USP_CLOCK_MODE_SLAVE);
> -
> -       /* Configure RX DMA IO Control register */
> -       regmap_write(usp->regmap, USP_RX_DMA_IO_CTRL, 0);
> -
> -       /* Congiure RX FIFO Control register */
> -       regmap_write(usp->regmap, USP_RX_FIFO_CTRL,
> -               (USP_RX_FIFO_THRESHOLD << USP_RX_FIFO_THD_OFFSET) |
> -               (USP_TX_RX_FIFO_WIDTH_DWORD << USP_RX_FIFO_WIDTH_OFFSET))=
;
> -
> -       /* Congiure RX FIFO Level Check register */
> -       regmap_write(usp->regmap, USP_RX_FIFO_LEVEL_CHK,
> -               RX_FIFO_SC(0x04) | RX_FIFO_LC(0x0E) | RX_FIFO_HC(0x1B));
> -
> -       /* Configure TX DMA IO Control register*/
> -       regmap_write(usp->regmap, USP_TX_DMA_IO_CTRL, 0);
> -
> -       /* Configure TX FIFO Control register */
> -       regmap_write(usp->regmap, USP_TX_FIFO_CTRL,
> -               (USP_TX_FIFO_THRESHOLD << USP_TX_FIFO_THD_OFFSET) |
> -               (USP_TX_RX_FIFO_WIDTH_DWORD << USP_TX_FIFO_WIDTH_OFFSET))=
;
> -       /* Congiure TX FIFO Level Check register */
> -       regmap_write(usp->regmap, USP_TX_FIFO_LEVEL_CHK,
> -               TX_FIFO_SC(0x1B) | TX_FIFO_LC(0x0E) | TX_FIFO_HC(0x04));
> -}
> -
> -static int sirf_usp_pcm_hw_params(struct snd_pcm_substream *substream,
> -               struct snd_pcm_hw_params *params, struct snd_soc_dai *dai=
)
> -{
> -       struct sirf_usp *usp =3D snd_soc_dai_get_drvdata(dai);
> -       u32 data_len, frame_len, shifter_len;
> -
> -       switch (params_format(params)) {
> -       case SNDRV_PCM_FORMAT_S16_LE:
> -               data_len =3D 16;
> -               frame_len =3D 16;
> -               break;
> -       case SNDRV_PCM_FORMAT_S24_LE:
> -               data_len =3D 24;
> -               frame_len =3D 32;
> -               break;
> -       case SNDRV_PCM_FORMAT_S24_3LE:
> -               data_len =3D 24;
> -               frame_len =3D 24;
> -               break;
> -       default:
> -               dev_err(dai->dev, "Format unsupported\n");
> -               return -EINVAL;
> -       }
> -
> -       shifter_len =3D data_len;
> -
> -       switch (usp->daifmt_format & SND_SOC_DAIFMT_FORMAT_MASK) {
> -       case SND_SOC_DAIFMT_I2S:
> -               regmap_update_bits(usp->regmap, USP_RX_FRAME_CTRL,
> -                       USP_I2S_SYNC_CHG, USP_I2S_SYNC_CHG);
> -               break;
> -       case SND_SOC_DAIFMT_DSP_A:
> -               regmap_update_bits(usp->regmap, USP_RX_FRAME_CTRL,
> -                       USP_I2S_SYNC_CHG, 0);
> -               frame_len =3D data_len * params_channels(params);
> -               data_len =3D frame_len;
> -               break;
> -       default:
> -               dev_err(dai->dev, "Only support I2S and DSP_A mode\n");
> -               return -EINVAL;
> -       }
> -
> -       switch (usp->daifmt_format & SND_SOC_DAIFMT_INV_MASK) {
> -       case SND_SOC_DAIFMT_NB_NF:
> -               break;
> -       case SND_SOC_DAIFMT_IB_NF:
> -               regmap_update_bits(usp->regmap, USP_MODE1,
> -                       USP_RXD_ACT_EDGE_FALLING | USP_TXD_ACT_EDGE_FALLI=
NG,
> -                       USP_RXD_ACT_EDGE_FALLING);
> -               break;
> -       default:
> -               return -EINVAL;
> -       }
> -
> -       if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> -               regmap_update_bits(usp->regmap, USP_TX_FRAME_CTRL,
> -                       USP_TXC_DATA_LEN_MASK | USP_TXC_FRAME_LEN_MASK
> -                       | USP_TXC_SHIFTER_LEN_MASK | USP_TXC_SLAVE_CLK_SA=
MPLE,
> -                       ((data_len - 1) << USP_TXC_DATA_LEN_OFFSET)
> -                       | ((frame_len - 1) << USP_TXC_FRAME_LEN_OFFSET)
> -                       | ((shifter_len - 1) << USP_TXC_SHIFTER_LEN_OFFSE=
T)
> -                       | USP_TXC_SLAVE_CLK_SAMPLE);
> -       else
> -               regmap_update_bits(usp->regmap, USP_RX_FRAME_CTRL,
> -                       USP_RXC_DATA_LEN_MASK | USP_RXC_FRAME_LEN_MASK
> -                       | USP_RXC_SHIFTER_LEN_MASK | USP_SINGLE_SYNC_MODE=
,
> -                       ((data_len - 1) << USP_RXC_DATA_LEN_OFFSET)
> -                       | ((frame_len - 1) << USP_RXC_FRAME_LEN_OFFSET)
> -                       | ((shifter_len - 1) << USP_RXC_SHIFTER_LEN_OFFSE=
T)
> -                       | USP_SINGLE_SYNC_MODE);
> -
> -       return 0;
> -}
> -
> -static int sirf_usp_pcm_trigger(struct snd_pcm_substream *substream, int=
 cmd,
> -                               struct snd_soc_dai *dai)
> -{
> -       struct sirf_usp *usp =3D snd_soc_dai_get_drvdata(dai);
> -
> -       switch (cmd) {
> -       case SNDRV_PCM_TRIGGER_START:
> -       case SNDRV_PCM_TRIGGER_RESUME:
> -       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -               if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> -                       sirf_usp_tx_enable(usp);
> -               else
> -                       sirf_usp_rx_enable(usp);
> -               break;
> -       case SNDRV_PCM_TRIGGER_STOP:
> -       case SNDRV_PCM_TRIGGER_SUSPEND:
> -       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -               if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> -                       sirf_usp_tx_disable(usp);
> -               else
> -                       sirf_usp_rx_disable(usp);
> -               break;
> -       }
> -
> -       return 0;
> -}
> -
> -static const struct snd_soc_dai_ops sirf_usp_pcm_dai_ops =3D {
> -       .trigger =3D sirf_usp_pcm_trigger,
> -       .set_fmt =3D sirf_usp_pcm_set_dai_fmt,
> -       .hw_params =3D sirf_usp_pcm_hw_params,
> -};
> -
> -static struct snd_soc_dai_driver sirf_usp_pcm_dai =3D {
> -       .probe =3D sirf_usp_pcm_dai_probe,
> -       .name =3D "sirf-usp-pcm",
> -       .id =3D 0,
> -       .playback =3D {
> -               .stream_name =3D "SiRF USP PCM Playback",
> -               .channels_min =3D 1,
> -               .channels_max =3D 2,
> -               .rates =3D SNDRV_PCM_RATE_8000_192000,
> -               .formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S=
24_LE |
> -                       SNDRV_PCM_FMTBIT_S24_3LE,
> -       },
> -       .capture =3D {
> -               .stream_name =3D "SiRF USP PCM Capture",
> -               .channels_min =3D 1,
> -               .channels_max =3D 2,
> -               .rates =3D SNDRV_PCM_RATE_8000_192000,
> -               .formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S=
24_LE |
> -                       SNDRV_PCM_FMTBIT_S24_3LE,
> -       },
> -       .ops =3D &sirf_usp_pcm_dai_ops,
> -};
> -
> -static int sirf_usp_pcm_runtime_suspend(struct device *dev)
> -{
> -       struct sirf_usp *usp =3D dev_get_drvdata(dev);
> -
> -       clk_disable_unprepare(usp->clk);
> -       return 0;
> -}
> -
> -static int sirf_usp_pcm_runtime_resume(struct device *dev)
> -{
> -       struct sirf_usp *usp =3D dev_get_drvdata(dev);
> -       int ret;
> -
> -       ret =3D clk_prepare_enable(usp->clk);
> -       if (ret) {
> -               dev_err(dev, "clk_enable failed: %d\n", ret);
> -               return ret;
> -       }
> -       sirf_usp_i2s_init(usp);
> -       return 0;
> -}
> -
> -#ifdef CONFIG_PM_SLEEP
> -static int sirf_usp_pcm_suspend(struct device *dev)
> -{
> -       struct sirf_usp *usp =3D dev_get_drvdata(dev);
> -
> -       if (!pm_runtime_status_suspended(dev)) {
> -               regmap_read(usp->regmap, USP_MODE1, &usp->mode1_reg);
> -               regmap_read(usp->regmap, USP_MODE2, &usp->mode2_reg);
> -               sirf_usp_pcm_runtime_suspend(dev);
> -       }
> -       return 0;
> -}
> -
> -static int sirf_usp_pcm_resume(struct device *dev)
> -{
> -       struct sirf_usp *usp =3D dev_get_drvdata(dev);
> -       int ret;
> -
> -       if (!pm_runtime_status_suspended(dev)) {
> -               ret =3D sirf_usp_pcm_runtime_resume(dev);
> -               if (ret)
> -                       return ret;
> -               regmap_write(usp->regmap, USP_MODE1, usp->mode1_reg);
> -               regmap_write(usp->regmap, USP_MODE2, usp->mode2_reg);
> -       }
> -       return 0;
> -}
> -#endif
> -
> -static const struct snd_soc_component_driver sirf_usp_component =3D {
> -       .name           =3D "sirf-usp",
> -};
> -
> -static const struct regmap_config sirf_usp_regmap_config =3D {
> -       .reg_bits =3D 32,
> -       .reg_stride =3D 4,
> -       .val_bits =3D 32,
> -       .max_register =3D USP_RX_FIFO_DATA,
> -       .cache_type =3D REGCACHE_NONE,
> -};
> -
> -static int sirf_usp_pcm_probe(struct platform_device *pdev)
> -{
> -       int ret;
> -       struct sirf_usp *usp;
> -       void __iomem *base;
> -
> -       usp =3D devm_kzalloc(&pdev->dev, sizeof(struct sirf_usp),
> -                       GFP_KERNEL);
> -       if (!usp)
> -               return -ENOMEM;
> -
> -       platform_set_drvdata(pdev, usp);
> -
> -       base =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -       usp->regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> -                                           &sirf_usp_regmap_config);
> -       if (IS_ERR(usp->regmap))
> -               return PTR_ERR(usp->regmap);
> -
> -       usp->clk =3D devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(usp->clk)) {
> -               dev_err(&pdev->dev, "Get clock failed.\n");
> -               return PTR_ERR(usp->clk);
> -       }
> -
> -       pm_runtime_enable(&pdev->dev);
> -       if (!pm_runtime_enabled(&pdev->dev)) {
> -               ret =3D sirf_usp_pcm_runtime_resume(&pdev->dev);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       ret =3D devm_snd_soc_register_component(&pdev->dev, &sirf_usp_com=
ponent,
> -               &sirf_usp_pcm_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Register Audio SoC dai failed.\n");
> -               return ret;
> -       }
> -       return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> -}
> -
> -static int sirf_usp_pcm_remove(struct platform_device *pdev)
> -{
> -       if (!pm_runtime_enabled(&pdev->dev))
> -               sirf_usp_pcm_runtime_suspend(&pdev->dev);
> -       else
> -               pm_runtime_disable(&pdev->dev);
> -       return 0;
> -}
> -
> -static const struct of_device_id sirf_usp_pcm_of_match[] =3D {
> -       { .compatible =3D "sirf,prima2-usp-pcm", },
> -       {}
> -};
> -MODULE_DEVICE_TABLE(of, sirf_usp_pcm_of_match);
> -
> -static const struct dev_pm_ops sirf_usp_pcm_pm_ops =3D {
> -       SET_RUNTIME_PM_OPS(sirf_usp_pcm_runtime_suspend,
> -               sirf_usp_pcm_runtime_resume, NULL)
> -       SET_SYSTEM_SLEEP_PM_OPS(sirf_usp_pcm_suspend, sirf_usp_pcm_resume=
)
> -};
> -
> -static struct platform_driver sirf_usp_pcm_driver =3D {
> -       .driver =3D {
> -               .name =3D "sirf-usp-pcm",
> -               .of_match_table =3D sirf_usp_pcm_of_match,
> -               .pm =3D &sirf_usp_pcm_pm_ops,
> -       },
> -       .probe =3D sirf_usp_pcm_probe,
> -       .remove =3D sirf_usp_pcm_remove,
> -};
> -
> -module_platform_driver(sirf_usp_pcm_driver);
> -
> -MODULE_DESCRIPTION("SiRF SoC USP PCM bus driver");
> -MODULE_AUTHOR("RongJun Ying <Rongjun.Ying@csr.com>");
> -MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/sirf/sirf-usp.h b/sound/soc/sirf/sirf-usp.h
> deleted file mode 100644
> index 08993b5992c4..000000000000
> --- a/sound/soc/sirf/sirf-usp.h
> +++ /dev/null
> @@ -1,292 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * arch/arm/mach-prima2/include/mach/sirfsoc_usp.h
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group c=
ompany.
> - */
> -
> -#ifndef _SIRF_USP_H
> -#define _SIRF_USP_H
> -
> -/* USP Registers */
> -#define USP_MODE1              0x00
> -#define USP_MODE2              0x04
> -#define USP_TX_FRAME_CTRL      0x08
> -#define USP_RX_FRAME_CTRL      0x0C
> -#define USP_TX_RX_ENABLE       0x10
> -#define USP_INT_ENABLE         0x14
> -#define USP_INT_STATUS         0x18
> -#define USP_PIN_IO_DATA                0x1C
> -#define USP_RISC_DSP_MODE      0x20
> -#define USP_AYSNC_PARAM_REG    0x24
> -#define USP_IRDA_X_MODE_DIV    0x28
> -#define USP_SM_CFG             0x2C
> -#define USP_TX_DMA_IO_CTRL     0x100
> -#define USP_TX_DMA_IO_LEN      0x104
> -#define USP_TX_FIFO_CTRL       0x108
> -#define USP_TX_FIFO_LEVEL_CHK  0x10C
> -#define USP_TX_FIFO_OP         0x110
> -#define USP_TX_FIFO_STATUS     0x114
> -#define USP_TX_FIFO_DATA       0x118
> -#define USP_RX_DMA_IO_CTRL     0x120
> -#define USP_RX_DMA_IO_LEN      0x124
> -#define USP_RX_FIFO_CTRL       0x128
> -#define USP_RX_FIFO_LEVEL_CHK  0x12C
> -#define USP_RX_FIFO_OP         0x130
> -#define USP_RX_FIFO_STATUS     0x134
> -#define USP_RX_FIFO_DATA       0x138
> -
> -/* USP MODE register-1 */
> -#define USP_SYNC_MODE                  0x00000001
> -#define USP_CLOCK_MODE_SLAVE           0x00000002
> -#define USP_LOOP_BACK_EN               0x00000004
> -#define USP_HPSIR_EN                   0x00000008
> -#define USP_ENDIAN_CTRL_LSBF           0x00000010
> -#define USP_EN                         0x00000020
> -#define USP_RXD_ACT_EDGE_FALLING       0x00000040
> -#define USP_TXD_ACT_EDGE_FALLING       0x00000080
> -#define USP_RFS_ACT_LEVEL_LOGIC1       0x00000100
> -#define USP_TFS_ACT_LEVEL_LOGIC1       0x00000200
> -#define USP_SCLK_IDLE_MODE_TOGGLE      0x00000400
> -#define USP_SCLK_IDLE_LEVEL_LOGIC1     0x00000800
> -#define USP_SCLK_PIN_MODE_IO   0x00001000
> -#define USP_RFS_PIN_MODE_IO    0x00002000
> -#define USP_TFS_PIN_MODE_IO    0x00004000
> -#define USP_RXD_PIN_MODE_IO    0x00008000
> -#define USP_TXD_PIN_MODE_IO    0x00010000
> -#define USP_SCLK_IO_MODE_INPUT 0x00020000
> -#define USP_RFS_IO_MODE_INPUT  0x00040000
> -#define USP_TFS_IO_MODE_INPUT  0x00080000
> -#define USP_RXD_IO_MODE_INPUT  0x00100000
> -#define USP_TXD_IO_MODE_INPUT  0x00200000
> -#define USP_IRDA_WIDTH_DIV_MASK        0x3FC00000
> -#define USP_IRDA_WIDTH_DIV_OFFSET      0
> -#define USP_IRDA_IDLE_LEVEL_HIGH       0x40000000
> -#define USP_TX_UFLOW_REPEAT_ZERO       0x80000000
> -#define USP_TX_ENDIAN_MODE             0x00000020
> -#define USP_RX_ENDIAN_MODE             0x00000020
> -
> -/* USP Mode Register-2 */
> -#define USP_RXD_DELAY_LEN_MASK         0x000000FF
> -#define USP_RXD_DELAY_LEN_OFFSET       0
> -
> -#define USP_TXD_DELAY_LEN_MASK         0x0000FF00
> -#define USP_TXD_DELAY_LEN_OFFSET       8
> -
> -#define USP_ENA_CTRL_MODE              0x00010000
> -#define USP_FRAME_CTRL_MODE            0x00020000
> -#define USP_TFS_SOURCE_MODE             0x00040000
> -#define USP_TFS_MS_MODE                 0x00080000
> -#define USP_CLK_DIVISOR_MASK           0x7FE00000
> -#define USP_CLK_DIVISOR_OFFSET         21
> -
> -#define USP_TFS_CLK_SLAVE_MODE         (1<<20)
> -#define USP_RFS_CLK_SLAVE_MODE         (1<<19)
> -
> -#define USP_IRDA_DATA_WIDTH            0x80000000
> -
> -/* USP Transmit Frame Control Register */
> -
> -#define USP_TXC_DATA_LEN_MASK          0x000000FF
> -#define USP_TXC_DATA_LEN_OFFSET                0
> -
> -#define USP_TXC_SYNC_LEN_MASK          0x0000FF00
> -#define USP_TXC_SYNC_LEN_OFFSET                8
> -
> -#define USP_TXC_FRAME_LEN_MASK         0x00FF0000
> -#define USP_TXC_FRAME_LEN_OFFSET       16
> -
> -#define USP_TXC_SHIFTER_LEN_MASK       0x1F000000
> -#define USP_TXC_SHIFTER_LEN_OFFSET     24
> -
> -#define USP_TXC_SLAVE_CLK_SAMPLE       0x20000000
> -
> -#define USP_TXC_CLK_DIVISOR_MASK       0xC0000000
> -#define USP_TXC_CLK_DIVISOR_OFFSET     30
> -
> -/* USP Receive Frame Control Register */
> -
> -#define USP_RXC_DATA_LEN_MASK          0x000000FF
> -#define USP_RXC_DATA_LEN_OFFSET                0
> -
> -#define USP_RXC_FRAME_LEN_MASK         0x0000FF00
> -#define USP_RXC_FRAME_LEN_OFFSET       8
> -
> -#define USP_RXC_SHIFTER_LEN_MASK       0x001F0000
> -#define USP_RXC_SHIFTER_LEN_OFFSET     16
> -
> -#define USP_START_EDGE_MODE    0x00800000
> -#define USP_I2S_SYNC_CHG       0x00200000
> -
> -#define USP_RXC_CLK_DIVISOR_MASK       0x0F000000
> -#define USP_RXC_CLK_DIVISOR_OFFSET     24
> -#define USP_SINGLE_SYNC_MODE           0x00400000
> -
> -/* Tx - RX Enable Register */
> -
> -#define USP_RX_ENA             0x00000001
> -#define USP_TX_ENA             0x00000002
> -
> -/* USP Interrupt Enable and status Register */
> -#define USP_RX_DONE_INT                        0x00000001
> -#define USP_TX_DONE_INT                        0x00000002
> -#define USP_RX_OFLOW_INT               0x00000004
> -#define USP_TX_UFLOW_INT               0x00000008
> -#define USP_RX_IO_DMA_INT              0x00000010
> -#define USP_TX_IO_DMA_INT              0x00000020
> -#define USP_RXFIFO_FULL_INT            0x00000040
> -#define USP_TXFIFO_EMPTY_INT           0x00000080
> -#define USP_RXFIFO_THD_INT             0x00000100
> -#define USP_TXFIFO_THD_INT             0x00000200
> -#define USP_UART_FRM_ERR_INT           0x00000400
> -#define USP_RX_TIMEOUT_INT             0x00000800
> -#define USP_TX_ALLOUT_INT              0x00001000
> -#define USP_RXD_BREAK_INT              0x00008000
> -
> -/* All possible TX interruots */
> -#define USP_TX_INTERRUPT               (USP_TX_DONE_INT|USP_TX_UFLOW_INT=
|\
> -                                       USP_TX_IO_DMA_INT|\
> -                                       USP_TXFIFO_EMPTY_INT|\
> -                                       USP_TXFIFO_THD_INT)
> -/* All possible RX interruots */
> -#define USP_RX_INTERRUPT               (USP_RX_DONE_INT|USP_RX_OFLOW_INT=
|\
> -                                       USP_RX_IO_DMA_INT|\
> -                                       USP_RXFIFO_FULL_INT|\
> -                                       USP_RXFIFO_THD_INT|\
> -                                       USP_RX_TIMEOUT_INT)
> -
> -#define USP_INT_ALL        0x1FFF
> -
> -/* USP Pin I/O Data Register */
> -
> -#define USP_RFS_PIN_VALUE_MASK 0x00000001
> -#define USP_TFS_PIN_VALUE_MASK 0x00000002
> -#define USP_RXD_PIN_VALUE_MASK 0x00000004
> -#define USP_TXD_PIN_VALUE_MASK 0x00000008
> -#define USP_SCLK_PIN_VALUE_MASK        0x00000010
> -
> -/* USP RISC/DSP Mode Register */
> -#define USP_RISC_DSP_SEL       0x00000001
> -
> -/* USP ASYNC PARAMETER Register*/
> -
> -#define USP_ASYNC_TIMEOUT_MASK 0x0000FFFF
> -#define USP_ASYNC_TIMEOUT_OFFSET       0
> -#define USP_ASYNC_TIMEOUT(x)   (((x)&USP_ASYNC_TIMEOUT_MASK) \
> -                               <<USP_ASYNC_TIMEOUT_OFFSET)
> -
> -#define USP_ASYNC_DIV2_MASK            0x003F0000
> -#define USP_ASYNC_DIV2_OFFSET          16
> -
> -/* USP TX DMA I/O MODE Register */
> -#define USP_TX_MODE_IO                 0x00000001
> -
> -/* USP TX DMA I/O Length Register */
> -#define USP_TX_DATA_LEN_MASK           0xFFFFFFFF
> -#define USP_TX_DATA_LEN_OFFSET         0
> -
> -/* USP TX FIFO Control Register */
> -#define USP_TX_FIFO_WIDTH_MASK         0x00000003
> -#define USP_TX_FIFO_WIDTH_OFFSET       0
> -
> -#define USP_TX_FIFO_THD_MASK           0x000001FC
> -#define USP_TX_FIFO_THD_OFFSET         2
> -
> -/* USP TX FIFO Level Check Register */
> -#define USP_TX_FIFO_LEVEL_CHECK_MASK   0x1F
> -#define USP_TX_FIFO_SC_OFFSET  0
> -#define USP_TX_FIFO_LC_OFFSET  10
> -#define USP_TX_FIFO_HC_OFFSET  20
> -
> -#define TX_FIFO_SC(x)          (((x) & USP_TX_FIFO_LEVEL_CHECK_MASK) \
> -                               << USP_TX_FIFO_SC_OFFSET)
> -#define TX_FIFO_LC(x)          (((x) & USP_TX_FIFO_LEVEL_CHECK_MASK) \
> -                               << USP_TX_FIFO_LC_OFFSET)
> -#define TX_FIFO_HC(x)          (((x) & USP_TX_FIFO_LEVEL_CHECK_MASK) \
> -                               << USP_TX_FIFO_HC_OFFSET)
> -
> -/* USP TX FIFO Operation Register */
> -#define USP_TX_FIFO_RESET              0x00000001
> -#define USP_TX_FIFO_START              0x00000002
> -
> -/* USP TX FIFO Status Register */
> -#define USP_TX_FIFO_LEVEL_MASK         0x0000007F
> -#define USP_TX_FIFO_LEVEL_OFFSET       0
> -
> -#define USP_TX_FIFO_FULL               0x00000080
> -#define USP_TX_FIFO_EMPTY              0x00000100
> -
> -/* USP TX FIFO Data Register */
> -#define USP_TX_FIFO_DATA_MASK          0xFFFFFFFF
> -#define USP_TX_FIFO_DATA_OFFSET                0
> -
> -/* USP RX DMA I/O MODE Register */
> -#define USP_RX_MODE_IO                 0x00000001
> -#define USP_RX_DMA_FLUSH               0x00000004
> -
> -/* USP RX DMA I/O Length Register */
> -#define USP_RX_DATA_LEN_MASK           0xFFFFFFFF
> -#define USP_RX_DATA_LEN_OFFSET         0
> -
> -/* USP RX FIFO Control Register */
> -#define USP_RX_FIFO_WIDTH_MASK         0x00000003
> -#define USP_RX_FIFO_WIDTH_OFFSET       0
> -
> -#define USP_RX_FIFO_THD_MASK           0x000001FC
> -#define USP_RX_FIFO_THD_OFFSET         2
> -
> -/* USP RX FIFO Level Check Register */
> -
> -#define USP_RX_FIFO_LEVEL_CHECK_MASK   0x1F
> -#define USP_RX_FIFO_SC_OFFSET  0
> -#define USP_RX_FIFO_LC_OFFSET  10
> -#define USP_RX_FIFO_HC_OFFSET  20
> -
> -#define RX_FIFO_SC(x)          (((x) & USP_RX_FIFO_LEVEL_CHECK_MASK) \
> -                               << USP_RX_FIFO_SC_OFFSET)
> -#define RX_FIFO_LC(x)          (((x) & USP_RX_FIFO_LEVEL_CHECK_MASK) \
> -                               << USP_RX_FIFO_LC_OFFSET)
> -#define RX_FIFO_HC(x)          (((x) & USP_RX_FIFO_LEVEL_CHECK_MASK) \
> -                               << USP_RX_FIFO_HC_OFFSET)
> -
> -/* USP RX FIFO Operation Register */
> -#define USP_RX_FIFO_RESET              0x00000001
> -#define USP_RX_FIFO_START              0x00000002
> -
> -/* USP RX FIFO Status Register */
> -
> -#define USP_RX_FIFO_LEVEL_MASK         0x0000007F
> -#define USP_RX_FIFO_LEVEL_OFFSET       0
> -
> -#define USP_RX_FIFO_FULL               0x00000080
> -#define USP_RX_FIFO_EMPTY              0x00000100
> -
> -/* USP RX FIFO Data Register */
> -
> -#define USP_RX_FIFO_DATA_MASK          0xFFFFFFFF
> -#define USP_RX_FIFO_DATA_OFFSET                0
> -
> -/*
> - * When rx thd irq occur, sender just disable tx empty irq,
> - * Remaining data in tx fifo wil also be sent out.
> - */
> -#define USP_FIFO_SIZE                  128
> -#define USP_TX_FIFO_THRESHOLD          (USP_FIFO_SIZE/2)
> -#define USP_RX_FIFO_THRESHOLD          (USP_FIFO_SIZE/2)
> -
> -/* FIFO_WIDTH for the USP_TX_FIFO_CTRL and USP_RX_FIFO_CTRL registers */
> -#define USP_FIFO_WIDTH_BYTE  0x00
> -#define USP_FIFO_WIDTH_WORD  0x01
> -#define USP_FIFO_WIDTH_DWORD 0x02
> -
> -#define USP_ASYNC_DIV2          16
> -
> -#define USP_PLUGOUT_RETRY_CNT  2
> -
> -#define USP_TX_RX_FIFO_WIDTH_DWORD    2
> -
> -#define SIRF_USP_DIV_MCLK      0
> -
> -#define SIRF_USP_I2S_TFS_SYNC  0
> -#define SIRF_USP_I2S_RFS_SYNC  1
> -#endif
> --
> 2.29.2
>
