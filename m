Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E547946BBE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 23:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6515D189A;
	Fri, 14 Jun 2019 23:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6515D189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560547132;
	bh=eJ1Tw1QqvRFtnZfCtfeoYH3vBd6N6rPoHijwzJaSssM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q9j6Gj4T8hwndFy29SvUFtEPUFqXInknrnESkn4Wy08yF78MJiAapQjjgBNspMbA1
	 h8SkdgCZ315rHur1KznScq3JMEfg22WMtq6j4tOv3fqwDKk4eyFGWqpNeQsIUBCVYg
	 yUJzb6T8F/oBfWwK2ZCKNP1YJAPJhy08+XAU2fl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB00CF896E0;
	Fri, 14 Jun 2019 23:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C68F1F896E0; Fri, 14 Jun 2019 23:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE7AF80764
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 23:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE7AF80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.tech header.i=@birdec.tech
 header.b="i3Ts/BZd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.tech
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Cc:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6La/5dULud0ut0vUkllEdQRlci1MhOsDmT+MMElZ6OM=; b=i3Ts/BZdPj9RmQ/X0sAHEPpwBm
 L1qz+WEmW6LT2VvrAIFmCGDMMkKITzqJvtcHH3wAUc8/JiZuSEVnm/qu0XwbdGXjYNaA95S0HSSj4
 xIv/+Zj1/AvngF5PfbLl1aLqp5RkI7hCMnOEubn92JeRRcj1IMrtYQFO0f9QT5/YzFEYGJMnHHDeq
 e0XGTXhKu92U/0xImfrej6DjqFYhjgizkOSpQ7NkaaTOlZIvfpBOWLKG8+zIxGPr4s4XRGJKMZpgr
 sP0QXueJxQ0hWTWMO5xG3M18XqTkSYLOVPdO8v2fJ4LfD0xOK8CbznhJRRoGPtqZosLu5Lx1fcfxy
 K1owFGUw==;
Received: from x5f70b78f.dyn.telefonica.de ([95.112.183.143]:56450
 helo=[192.168.1.2])
 by host.euro-space.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <kmarinushkin@birdec.tech>)
 id 1hbtZD-0004CT-1w; Fri, 14 Jun 2019 22:16:59 +0100
To: Thomas Preston <thomas.preston@codethink.co.uk>
References: <20190611174909.12162-1-thomas.preston@codethink.co.uk>
 <20190611174909.12162-3-thomas.preston@codethink.co.uk>
From: Kirill Marinushkin <kmarinushkin@birdec.tech>
Message-ID: <1ac9e607-f1b3-d32e-b87f-d54325923417@birdec.tech>
Date: Fri, 14 Jun 2019 23:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20190611174909.12162-3-thomas.preston@codethink.co.uk>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.tech
X-Get-Message-Sender-Via: host.euro-space.net: authenticated_id:
 kmarinushkin@birdec.tech
X-Authenticated-Sender: host.euro-space.net: kmarinushkin@birdec.tech
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Marco Felsch <m.felsch@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v1 2/4] ASoC: Add codec driver for ST
	TDA7802
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

On 06/11/19 19:49, Thomas Preston wrote:
> Add an I2C based codec driver for ST TDA7802 amplifier. By default, the
> amplifier supports 4 audio channels but can support up to 16 with
> multiple devices. Input is configurable for I2S or TDM.
> 
> The unified device properties API is used to get board-specific config from
> device tree / ACPI.
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Cc: Patrick Glaser <pglaser@tesla.com>
> Cc: Rob Duncan <rduncan@tesla.com>
> Cc: Nate Case <ncase@tesla.com>
> ---
>  sound/soc/codecs/Kconfig   |   6 +
>  sound/soc/codecs/Makefile  |   2 +
>  sound/soc/codecs/tda7802.c | 580 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 588 insertions(+)
>  create mode 100644 sound/soc/codecs/tda7802.c
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index e730d47ac85b..1d30c2333cb1 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -176,6 +176,7 @@ config SND_SOC_ALL_CODECS
>  	select SND_SOC_TAS5720 if I2C
>  	select SND_SOC_TAS6424 if I2C
>  	select SND_SOC_TDA7419 if I2C
> +	select SND_SOC_TDA7802 if I2C
>  	select SND_SOC_TFA9879 if I2C
>  	select SND_SOC_TLV320AIC23_I2C if I2C
>  	select SND_SOC_TLV320AIC23_SPI if SPI_MASTER
> @@ -1078,6 +1079,11 @@ config SND_SOC_TDA7419
>  	depends on I2C
>  	select REGMAP_I2C
>  
> +config SND_SOC_TDA7802
> +	tristate "ST TDA7802 audio processor"
> +	depends on I2C
> +	select REGMAP_I2C
> +
>  config SND_SOC_TFA9879
>  	tristate "NXP Semiconductors TFA9879 amplifier"
>  	depends on I2C
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index aa7720a7a0aa..fc3fc672bc4b 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -187,6 +187,7 @@ snd-soc-tas571x-objs := tas571x.o
>  snd-soc-tas5720-objs := tas5720.o
>  snd-soc-tas6424-objs := tas6424.o
>  snd-soc-tda7419-objs := tda7419.o
> +snd-soc-tda7802-objs := tda7802.o
>  snd-soc-tfa9879-objs := tfa9879.o
>  snd-soc-tlv320aic23-objs := tlv320aic23.o
>  snd-soc-tlv320aic23-i2c-objs := tlv320aic23-i2c.o
> @@ -460,6 +461,7 @@ obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
>  obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
>  obj-$(CONFIG_SND_SOC_TAS6424)	+= snd-soc-tas6424.o
>  obj-$(CONFIG_SND_SOC_TDA7419)	+= snd-soc-tda7419.o
> +obj-$(CONFIG_SND_SOC_TDA7802)	+= snd-soc-tda7802.o
>  obj-$(CONFIG_SND_SOC_TFA9879)	+= snd-soc-tfa9879.o
>  obj-$(CONFIG_SND_SOC_TLV320AIC23)	+= snd-soc-tlv320aic23.o
>  obj-$(CONFIG_SND_SOC_TLV320AIC23_I2C)	+= snd-soc-tlv320aic23-i2c.o
> diff --git a/sound/soc/codecs/tda7802.c b/sound/soc/codecs/tda7802.c
> new file mode 100644
> index 000000000000..38ca52de85f0
> --- /dev/null
> +++ b/sound/soc/codecs/tda7802.c
> @@ -0,0 +1,580 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * tda7802.c  --  codec driver for ST TDA7802
> + *
> + * Copyright (C) 2016-2019 Tesla Motors, Inc.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + */
> +
> +#include <linux/regulator/consumer.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/delay.h>
> +#include <linux/regmap.h>
> +#include <linux/string.h>
> +#include <sound/soc.h>
> +
> +enum tda7802_type {
> +	tda7802_base,
> +};
> +
> +#define I2C_BUS				   4
> +
> +#define CHANNELS_PER_AMP		   4
> +#define MAX_NUM_AMPS			   4
> +
> +#define ENABLE_DELAY_MS			   10
> +
> +#define TDA7802_IB0			   0x00
> +#define TDA7802_IB1			   0x01
> +#define TDA7802_IB2			   0x02
> +#define TDA7802_IB3			   0x03
> +#define TDA7802_IB4			   0x04
> +#define TDA7802_IB5			   0x05
> +
> +#define TDA7802_DB0			   0x10
> +#define TDA7802_DB1			   0x11
> +#define TDA7802_DB2			   0x12
> +#define TDA7802_DB3			   0x13
> +#define TDA7802_DB4			   0x14
> +#define TDA7802_DB5			   0x15
> +
> +#define IB0_CH4_TRISTATE_ON		   (1 << 7)
> +#define IB0_CH3_TRISTATE_ON		   (1 << 6)
> +#define IB0_CH2_TRISTATE_ON		   (1 << 5)
> +#define IB0_CH1_TRISTATE_ON		   (1 << 4)
> +#define IB0_CH4_HIGH_EFF		   (0 << 3)
> +#define IB0_CH4_CLASS_AB		   (1 << 3)
> +#define IB0_CH3_HIGH_EFF		   (0 << 2)
> +#define IB0_CH3_CLASS_AB		   (1 << 2)
> +#define IB0_CH2_HIGH_EFF		   (0 << 0)
> +#define IB0_CH2_CLASS_AB		   (1 << 1)
> +#define IB0_CH1_HIGH_EFF		   (0 << 0)
> +#define IB0_CH1_CLASS_AB		   (1 << 0)
> +
> +#define IB1_REAR_IMPEDANCE_2_OHM	   (0 << 7)
> +#define IB1_REAR_IMPEDANCE_4_OHM	   (1 << 7)
> +#define IB1_LONG_DIAG_TIMING_x1		   (0 << 5)
> +#define IB1_LONG_DIAG_TIMING_x2		   (1 << 5)
> +#define IB1_LONG_DIAG_TIMING_x4		   (2 << 5)
> +#define IB1_LONG_DIAG_TIMING_x8		   (3 << 5)
> +#define IB1_GAIN_CH13_GV1		   (0 << 3)
> +#define IB1_GAIN_CH13_GV2		   (1 << 3)
> +#define IB1_GAIN_CH13_GV3		   (2 << 3)
> +#define IB1_GAIN_CH13_GV4		   (3 << 3)
> +#define IB1_GAIN_CH24_GV1		   (0 << 1)
> +#define IB1_GAIN_CH24_GV2		   (1 << 1)
> +#define IB1_GAIN_CH24_GV3		   (2 << 1)
> +#define IB1_GAIN_CH24_GV4		   (3 << 1)
> +#define IB1_DIGITAL_GAIN_BOOST		   (1 << 0)
> +
> +#define IB2_MUTE_TIME_1_MS		   (0 << 5)
> +#define IB2_MUTE_TIME_5_MS		   (1 << 5)
> +#define IB2_MUTE_TIME_11_MS		   (2 << 5)
> +#define IB2_MUTE_TIME_23_MS		   (3 << 5)
> +#define IB2_MUTE_TIME_46_MS		   (4 << 5)
> +#define IB2_MUTE_TIME_92_MS		   (5 << 5)
> +#define IB2_MUTE_TIME_185_MS		   (6 << 5)
> +#define IB2_MUTE_TIME_371_MS		   (7 << 5)
> +#define IB2_CH13_UNMUTED		   (1 << 4)
> +#define IB2_CH24_UNMUTED		   (1 << 3)
> +#define IB2_DIGITAL_MUTE_DISABLED	   (1 << 2)
> +#define IB2_AUTOMUTE_THRESHOLD_5V3	   (0 << 1)
> +#define IB2_AUTOMUTE_THRESHOLD_7V3	   (1 << 1)
> +#define IB2_FRONT_IMPEDANCE_2_OHM	   (0 << 0)
> +#define IB2_FRONT_IMPEDANCE_4_OHM	   (1 << 0)
> +
> +#define IB3_SAMPLE_RATE_44_KHZ		   (0 << 6)
> +#define IB3_SAMPLE_RATE_48_KHZ		   (1 << 6)
> +#define IB3_SAMPLE_RATE_96_KHZ		   (2 << 6)
> +#define IB3_SAMPLE_RATE_192_KHZ		   (3 << 6)
> +#define IB3_FORMAT_I2S			   (0 << 3)
> +#define IB3_FORMAT_TDM4			   (1 << 3)
> +#define IB3_FORMAT_TDM8_DEV1		   (2 << 3)
> +#define IB3_FORMAT_TDM8_DEV2		   (3 << 3)
> +#define IB3_FORMAT_TDM16_DEV1		   (4 << 3)
> +#define IB3_FORMAT_TDM16_DEV2		   (5 << 3)
> +#define IB3_FORMAT_TDM16_DEV3		   (6 << 3)
> +#define IB3_FORMAT_TDM16_DEV4		   (7 << 3)
> +#define IB3_I2S_FRAME_PERIOD_64		   (0 << 2)
> +#define IB3_I2S_FRAME_PERIOD_50		   (1 << 2)
> +#define IB3_PLL_CLOCK_DITHER_ENABLE	   (1 << 1)
> +#define IB3_HIGH_PASS_FILTER_ENABLE	   (1 << 0)

More unused defines - do you want them?

> +
> +static const u8 IB3_FORMAT[4][4] = {
> +	/* 1x amp, 4 channels */
> +	{ IB3_FORMAT_TDM4 },
> +	/* 2x amp, 8 channels */
> +	{ IB3_FORMAT_TDM8_DEV1,
> +		IB3_FORMAT_TDM8_DEV2 },
> +	/* 3x amp not supported */
> +	{ },
> +	/* 4x amp, 16 channels */
> +	{ IB3_FORMAT_TDM16_DEV1,
> +		IB3_FORMAT_TDM16_DEV2,
> +		IB3_FORMAT_TDM16_DEV3,
> +		IB3_FORMAT_TDM16_DEV4 },
> +};
> +
> +#define IB4_NOISE_GATE_DISABLE		   (1 << 7)
> +#define IB4_SHORT_FAULT_ON_CDDIAG_YES	   (0 << 6)
> +#define IB4_SHORT_FAULT_ON_CDDIAG_NO	   (1 << 6)
> +#define IB4_OFFSET_ON_CDDIAG_YES	   (0 << 5)
> +#define IB4_OFFSET_ON_CDDIAG_NO		   (1 << 5)
> +#define IB4_AC_DIAG_CURRENT_THRESHOLD_HIGH (0 << 4)
> +#define IB4_AC_DIAG_CURRENT_THRESHOLD_LOW  (1 << 4)
> +#define IB4_AC_DIAG_ENABLE		   (1 << 3)
> +#define IB4_CH13_DIAG_MODE_SPEAKER	   (0 << 2)
> +#define IB4_CH13_DIAG_MODE_BOOSTER	   (1 << 2)
> +#define IB4_CH24_DIAG_MODE_SPEAKER	   (0 << 1)
> +#define IB4_CH24_DIAG_MODE_BOOSTER	   (1 << 1)
> +#define IB4_DIAG_MODE_ENABLE		   (1 << 0)
> +
> +#define IB5_TEMP_WARNING_ON_CDDIAG_TW1	   (0 << 5)
> +#define IB5_TEMP_WARNING_ON_CDDIAG_TW2	   (1 << 5)
> +#define IB5_TEMP_WARNING_ON_CDDIAG_TW3	   (2 << 5)
> +#define IB5_TEMP_WARNING_ON_CDDIAG_TW4	   (3 << 5)
> +#define IB5_TEMP_WARNING_ON_CDDIAG_NONE	   (4 << 5)
> +#define IB5_CLIP_DETECT_FRONT_1PC	   (0 << 3)
> +#define IB5_CLIP_DETECT_FRONT_5PC	   (1 << 3)
> +#define IB5_CLIP_DETECT_FRONT_10PC	   (2 << 3)
> +#define IB5_CLIP_DETECT_FRONT_NONE	   (3 << 3)
> +#define IB5_CLIP_DETECT_REAR_1PC	   (0 << 1)
> +#define IB5_CLIP_DETECT_REAR_5PC	   (1 << 1)
> +#define IB5_CLIP_DETECT_REAR_10PC	   (2 << 1)
> +#define IB5_CLIP_DETECT_REAR_NONE	   (3 << 1)
> +#define IB5_AMPLIFIER_ON		   (1 << 0)
> +
> +#define DB0_STARTUP_DIAG_STATUS		   0x40
> +
> +#define DUMP_NUM_BLOCK			   6
> +#define DUMP_NUM_REGS			   (DUMP_NUM_BLOCK * 2)
> +
> +struct tda7802_priv {
> +	struct i2c_client *i2c;
> +	struct regmap *regmap;
> +	struct regulator *enable_reg;
> +	const char *diag_mode_ch13, *diag_mode_ch24;
> +	u8 gain_ch13, gain_ch24;
> +};
> +
> +static bool tda7802_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case TDA7802_IB0 ... TDA7802_IB5:`
Oh, I didn't know it is possible to use such `...` syntax in switch cases. This
is interesting!

> +	case TDA7802_DB0 ... TDA7802_DB5:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool tda7802_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case TDA7802_IB0 ... TDA7802_IB5:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config tda7802_regmap_config = {
> +	.val_bits      = 8,
> +	.reg_bits      = 8,
> +	.max_register  = TDA7802_DB5,
> +	.use_single_read = 1,
> +	.use_single_write = 1,
> +
> +	.readable_reg  = tda7802_readable_reg,
> +	.writeable_reg = tda7802_writeable_reg,

Maybe add default values?

> +};
> +
> +#ifdef DEBUG
> +static int tda7802_dump_regs(struct tda7802_priv *tda7802)
> +{
> +	u8 regs[DUMP_NUM_REGS];
> +	const char *prefix;
> +	int err = 0;
> +
> +	prefix = kasprintf(GFP_KERNEL, "%s ", dev_name(&tda7802->i2c->dev));
> +	if (!prefix)
> +		return -ENOMEM;
> +
> +	err = regmap_bulk_read(tda7802->regmap, TDA7802_IB0, &regs[0],
> +			DUMP_NUM_BLOCK);
> +	if (err < 0)
> +		goto cleanup_dump_regs;
> +
> +	err = regmap_bulk_read(tda7802->regmap, TDA7802_DB0,
> +			&regs[DUMP_NUM_BLOCK], DUMP_NUM_BLOCK);
> +	if (err < 0)
> +		goto cleanup_dump_regs;
> +
> +	print_hex_dump_bytes(prefix, DUMP_PREFIX_NONE, &regs[0], DUMP_NUM_REGS);
> +
> +cleanup_dump_regs:
> +	kfree(prefix);
> +	return err;
> +}
> +#else
> +static int tda7802_dump_regs(struct tda7802_priv *tda7802)
> +{
> +	return 0;
> +}
> +#endif
> +
> +static int tda7802_dai_startup(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct tda7802_priv *tda7802 =
> +		snd_soc_component_get_drvdata(dai->component);
> +	struct device *dev = dai->dev;
> +	u8 data[6] = { 0 };
> +	int err;
> +
> +	dev_dbg(dev, "%s\n", __func__);
> +
> +	/* enable the device */
> +	err = regulator_enable(tda7802->enable_reg);
> +	if (err < 0) {
> +		dev_err(dev, "Could not enable (startup).\n");
> +		return err;
> +	}
> +	msleep(ENABLE_DELAY_MS);
> +
> +	/* All channels out of tri-state mode, all channels in Standard Class
> +	 * AB mode (not High-efficiency)
> +	 */
> +	data[0] = IB0_CH4_CLASS_AB | IB0_CH3_CLASS_AB | IB0_CH2_CLASS_AB |
> +		IB0_CH1_CLASS_AB;
> +
> +	/* Rear channel load impedance set to 2-Ohm, default diagnostic timing,
> +	 * GV1 gain on all channels (default), no digital gain increase
> +	 */
> +	data[1] = IB1_REAR_IMPEDANCE_2_OHM | IB1_LONG_DIAG_TIMING_x1;
> +	switch (tda7802->gain_ch13) {
> +	case 4:
> +		data[1] |= IB1_GAIN_CH13_GV4;
> +		break;
> +	case 3:
> +		data[1] |= IB1_GAIN_CH13_GV3;
> +		break;
> +	case 2:
> +		data[1] |= IB1_GAIN_CH13_GV2;
> +		break;
> +	default:
> +		dev_err(dev, "Unknown gain for channel 1,3 %d, setting to 1\n",
> +				tda7802->gain_ch13);
> +	case 1:
> +		data[1] |= IB1_GAIN_CH13_GV1;
> +		break;
> +	}
> +	switch (tda7802->gain_ch24) {
> +	case 4:
> +		data[1] |= IB1_GAIN_CH24_GV4;
> +		break;
> +	case 3:
> +		data[1] |= IB1_GAIN_CH24_GV3;
> +		break;
> +	case 2:
> +		data[1] |= IB1_GAIN_CH24_GV2;
> +		break;
> +	default:
> +		dev_err(dev, "Unknown gain for channel 2,4 %d, setting to 1\n",
> +				tda7802->gain_ch24);
> +	case 1:
> +		data[1] |= IB1_GAIN_CH24_GV1;
> +		break;
> +	}
> +
> +	/* Mute timing 1.45ms, all channels un-muted, digital mute enabled,
> +	 * 5.3V undervoltage threshold, front-channel load impedance set to
> +	 * 2-Ohms
> +	 */
> +	data[2] = IB2_MUTE_TIME_1_MS | IB2_CH13_UNMUTED | IB2_CH24_UNMUTED |
> +		IB2_AUTOMUTE_THRESHOLD_5V3 | IB2_FRONT_IMPEDANCE_2_OHM> +
> +	/* Don't set IB3 here, we should set it in set_tdm_slot
> +	 * data[3] = 0;
> +	 */
> +
> +	/* Noise gating enabled, short and offset info on CD-Diag (fault) pin,
> +	 * diagnostics disabled. Default to speaker.
> +	 */
> +	if (strcmp(tda7802->diag_mode_ch13, "Booster") == 0)
> +		data[4] |= IB4_CH13_DIAG_MODE_BOOSTER;
> +	else
> +		data[4] |= IB4_CH13_DIAG_MODE_SPEAKER;
> +
> +	if (strcmp(tda7802->diag_mode_ch24, "Booster") == 0)
> +		data[4] |= IB4_CH24_DIAG_MODE_BOOSTER;
> +	else
> +		data[4] |= IB4_CH24_DIAG_MODE_SPEAKER;
> +
> +	/* Temperature warning on diag pin set to TW1 (highest setting), clip
> +	 * detection set to 1% on all channels
> +	 */
> +	data[5] = IB5_TEMP_WARNING_ON_CDDIAG_TW1 | IB5_CLIP_DETECT_FRONT_1PC |
> +		IB5_CLIP_DETECT_REAR_1PC,

Would be nicer to have `;` in the end of the line, instead of `,`

> +
> +	err = regmap_bulk_write(tda7802->regmap, TDA7802_IB0, data,
> +			ARRAY_SIZE(data));
> +	if (err < 0) {
> +		dev_err(dev, "Cannot configure amp %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tda7802_dai_shutdown(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct tda7802_priv *tda7802 =
> +		snd_soc_component_get_drvdata(dai->component);
> +	struct device *dev = dai->dev;
> +	int err;
> +
> +	dev_dbg(dev, "%s\n", __func__);
> +
> +	err = regulator_disable(tda7802->enable_reg);
> +	if (err < 0)
> +		dev_err(dev, "Could not disable (shutdown)\n");
> +}
> +
> +static int tda7802_digital_mute(struct snd_soc_dai *dai, int mute)
> +{
> +	struct device *dev = dai->dev;
> +	int err;
> +
> +	dev_dbg(dev, "%s mute=%d\n", __func__, mute);
> +
> +	if (mute) {
> +		/* digital mute */
> +		err = snd_soc_component_update_bits(dai->component, TDA7802_IB2,
> +				IB2_DIGITAL_MUTE_DISABLED,
> +				~IB2_DIGITAL_MUTE_DISABLED);

In such situations, the last argument is usually `0`, not `~(mask)`

> +		if (err < 0)
> +			dev_err(dev, "Cannot mute amp %d\n", err);

I think you want to `return err` here, right?

> +
> +		/* amp off */
> +		err = snd_soc_component_update_bits(dai->component, TDA7802_IB5,
> +				IB5_AMPLIFIER_ON, ~IB5_AMPLIFIER_ON);
> +		if (err < 0)
> +			dev_err(dev, "Cannot amp off %d\n", err);
> +
> +	} else {
> +		/* amp on */
> +		err = snd_soc_component_update_bits(dai->component, TDA7802_IB5,
> +				IB5_AMPLIFIER_ON, IB5_AMPLIFIER_ON);
> +		if (err < 0)
> +			dev_err(dev, "Cannot amp on %d\n", err);
> +
> +		/* digital unmute */
> +		err = snd_soc_component_update_bits(dai->component, TDA7802_IB2,
> +				IB2_DIGITAL_MUTE_DISABLED,
> +				IB2_DIGITAL_MUTE_DISABLED);
> +		if (err < 0)
> +			dev_err(dev, "Cannot unmute amp %d\n", err);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tda7802_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +		unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct tda7802_priv *tda7802 =
> +		snd_soc_component_get_drvdata(dai->component);
> +	int width_index, slot_index, ret;
> +	struct device *dev = dai->dev;
> +	u8 data;
> +
> +	if (!(slots == 4 || slots == 8 || slots == 16)) {
> +		dev_err(dev, "Failed to set %d slots, supported: 4, 8, 16\n",
> +				slots);
> +		return -ENOTSUPP;
> +	}
> +	width_index = (slots / 4) - 1;
> +
> +	switch (tx_mask) {
> +	case 0x000f:
> +		slot_index = 0;
> +		break;
> +	case 0x00f0:
> +		slot_index = 1;
> +		break;
> +	case 0x0f00:
> +		slot_index = 2;
> +		break;
> +	case 0xf000:
> +		slot_index = 3;
> +		break;
> +	default:
> +		/* must be contigious nibble */
> +		dev_err(dev, "Failed to set tx_mask %08x\n", tx_mask);
> +		return -ENOTSUPP;
> +	}
> +
> +	/* 48kHz sample rate, TDM configuration, 64-bit I2S frame period, PLL
> +	 * clock dither disabled, high-pass filter enabled (blocks DC output)
> +	 */
> +	data = IB3_SAMPLE_RATE_48_KHZ | IB3_FORMAT[width_index][slot_index] |
> +		IB3_I2S_FRAME_PERIOD_64 | IB3_HIGH_PASS_FILTER_ENABLE;
> +	ret = snd_soc_component_write(dai->component, TDA7802_IB3, data);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to write IB3 config %d\n", ret);
> +		return ret;
> +	}
> +
> +	tda7802_dump_regs(tda7802);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops tda7802_dai_ops = {
> +	.startup      = tda7802_dai_startup,
> +	.shutdown     = tda7802_dai_shutdown,
> +	.digital_mute = tda7802_digital_mute,
> +	.set_tdm_slot = tda7802_set_tdm_slot,
> +};
> +
> +static struct snd_soc_dai_driver tda7802_dai_driver = {
> +	.name = "tda7802",
> +	.playback = {
> +		.stream_name  = "Playback",
> +		.channels_min = 4,
> +		.channels_max = 4,
> +		.rates	      = SNDRV_PCM_RATE_48000,
> +		.formats      = SNDRV_PCM_FMTBIT_S32_LE,
> +	},
> +	.ops = &tda7802_dai_ops,
> +};
> +
> +/* read device tree or ACPI properties from device */
> +static int tda7802_read_properties(struct tda7802_priv *tda7802)
> +{
> +	struct device *dev = &tda7802->i2c->dev;
> +	int err = 0;
> +
> +	tda7802->enable_reg = devm_regulator_get(dev, "enable");
> +	if (IS_ERR(tda7802->enable_reg)) {
> +		dev_err(dev, "Failed to get enable regulator\n");
> +		return PTR_ERR(tda7802->enable_reg);
> +	}
> +
> +	err = device_property_read_u8(dev, "st,gain-ch13", &tda7802->gain_ch13);
> +	if (err < 0)
> +		dev_err(dev, "Failed to read gain, channel 1,3 %d\n", err);
> +
> +	err = device_property_read_u8(dev, "st,gain-ch24", &tda7802->gain_ch24);
> +	if (err < 0)
> +		dev_err(dev, "Failed to read gain, channel 2,4 %d\n", err);
> +
> +	err = device_property_read_string(dev, "st,diagnostic-mode-ch13",
> +			&tda7802->diag_mode_ch13);

Why is diagnostic mode in dtb? Looks like it should be configurable on the
run-time, so a module parameter would be a more proper place for it

> +	if (err < 0)
> +		dev_err(dev, "Failed to read diagnostic mode, channel 1,3 %d\n",
> +				err);
> +
> +	err = device_property_read_string(dev, "st,diagnostic-mode-ch24",
> +			&tda7802->diag_mode_ch24);
> +	if (err < 0)
> +		dev_err(dev, "Failed to read diagnostic mode, channel 2,4 %d\n",
> +				err);
> +
> +	return err;
> +}
> +
> +static const struct snd_soc_component_driver tda7802_component_driver;
> +
> +static int tda7802_i2c_probe(struct i2c_client *i2c,
> +			     const struct i2c_device_id *id)
> +{
> +	struct device *dev = &i2c->dev;
> +	struct tda7802_priv *tda7802;
> +	int status, err, err2;
> +
> +	dev_dbg(dev, "%s addr=0x%02hx, id %p\n", __func__, i2c->addr, id);
> +
> +	tda7802 = devm_kmalloc(dev, sizeof(*tda7802), GFP_KERNEL);
> +	if (!tda7802)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, tda7802);
> +	tda7802->i2c = i2c;
> +
> +	err = tda7802_read_properties(tda7802);
> +	if (err < 0)
> +		return err;
> +
> +	tda7802->regmap = devm_regmap_init_i2c(tda7802->i2c,
> +			&tda7802_regmap_config);
> +	if (IS_ERR(tda7802->regmap))
> +		return PTR_ERR(tda7802->regmap);
> +
> +	/* Enable and verify the connection */
> +	err = regulator_enable(tda7802->enable_reg);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to enable (init)\n");
> +		return err;
> +	}
> +	msleep(ENABLE_DELAY_MS);
> +
> +	err = regmap_read(tda7802->regmap, TDA7802_DB1, &status);
> +
> +	/* always disable the regulator, even if the read fails */
> +	err2 = regulator_disable(tda7802->enable_reg);
> +	if (err2 < 0) {
> +		dev_err(dev, "Failed to disable (init)\n");
> +		return err2;
> +	}
> +	/* now check for regmap_read errors */
> +	if (err < 0) {
> +		dev_err(dev, "Could not read from device\n");
> +		return -ENODEV;
> +	}
> +
> +	err = devm_snd_soc_register_component(dev, &tda7802_component_driver,
> +			&tda7802_dai_driver, 1);
> +	if (err < 0)
> +		dev_err(dev, "Failed to register codec: %d\n", err);
> +	return err;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id tda7802_of_match[] = {
> +	{ .compatible = "st,tda7802" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tda7802_of_match);
> +#endif
> +
> +static const struct i2c_device_id tda7802_i2c_id[] = {
> +	{ "tda7802", tda7802_base },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, tda7802_i2c_id);
> +
> +static struct i2c_driver tda7802_i2c_driver = {
> +	.driver = {
> +		.name  = "tda7802-codec",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(tda7802_of_match),
> +	},
> +	.probe	  = tda7802_i2c_probe,
> +	.id_table = tda7802_i2c_id,
> +};
> +module_i2c_driver(tda7802_i2c_driver);
> +
> +MODULE_DESCRIPTION("ASoC ST TDA7802 driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Rob Duncan <rduncan@tesla.com>");
> +MODULE_AUTHOR("Thomas Preston <thomas.preston@codethink.co.uk>");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
