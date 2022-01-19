Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16395493AA5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 13:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C9E314A;
	Wed, 19 Jan 2022 13:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C9E314A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642596710;
	bh=ceIjHkUsc282e4Lr8UFjbJfUeQ8LsL9kGGr2RWP7ziY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SlAu9e9H7hWjuec75CVf5m0Q0i7EzEwuudrzzaXb80M/PVAkmqSqfebmWhJAkUb8T
	 24TfpWeP0pdiW/BAL1mZWRQn5JY3daXuEU5PdYu+QFpHArHHkHM3XNLqnm+dx76CGK
	 wEJE2eZZb6AYCtvlGIZar4q2LJduWA4UuvI6sCY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA445F80128;
	Wed, 19 Jan 2022 13:50:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734E4F801F7; Wed, 19 Jan 2022 13:50:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C53F800F8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 13:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C53F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hifiberry-com.20210112.gappssmtp.com
 header.i=@hifiberry-com.20210112.gappssmtp.com header.b="bz4X9qOb"
Received: by mail-wm1-x335.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so5911781wme.0
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 04:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hifiberry-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to; bh=E9peMCmd1zRNfQgkkm6kKROi2dTPu7MXxtsQu+4Xics=;
 b=bz4X9qObEBtiM2nWAcZkMJ1uIEQQrXYMLtYw+4xiDPsxkQBz06yHRcYdlssNWTKQQi
 QaZNcU9MtkCMpmhKaSsLD9t+MKrL4XNS1W9GeWTf551FGUfGMORhQcOkoMigAkZlixzI
 4vjDP5Sqy5t575c2XiTu7SdxsVlu8zsz7dOxJvH/f49YU442gEuRl+4gaJnmR2Kx8DF7
 ldZ8YQ67Nwn+Kba8KeScgGLWuXgwWYbRHfdvUNVw+0Gzs6F/9WbcBN4M08sCq7h7TgPD
 KChduBeGG2oMXPpK4iSur+jwlqJNOYE/sOCtb4bAabR3MZSLngPtQjxikXhmzeW9pjTC
 WLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=E9peMCmd1zRNfQgkkm6kKROi2dTPu7MXxtsQu+4Xics=;
 b=wP+/ZiYDImdUG1RokY8LoqjeWUpBwhXkLHToUkMJ34YG6IkSgdbjLeq3xJOOP04Ugy
 x4fLp0LSXUBb8SnJdgB+OIAePo0gNkhKI6ZKACX1UvKnxEjjXqf/2yuOj2ktuMqf4xqN
 UMxx+nr93mtbUXMjuekwdtnnoXTbZQXN1/Nxa/h7ARDC04CumJvifuIsLaOXmdixz8SC
 z5voqXpvOG3LPOFdwgThtbA+VYS41Zbf0Ve6nVpPF17JKb2mA4NOlil5sN1C+LaEdheJ
 qwGFlHQ8oRlUdXFAb1Ag5iyVS6NB/KyQ7ce9ivHePnglxY5nVHeSaQuRou2PFreL0KnE
 w95w==
X-Gm-Message-State: AOAM533SFTTIXZ/dEDJ+lSxmOn0VeFFeawKT6f2ihQe3M1CuK3wV2kU6
 UVujTpZ0PfoCUM84/irmLx5yzw==
X-Google-Smtp-Source: ABdhPJzb+Rhq/dfJmPN8Klr+baRO20Rzpjfs9+8YM4ZpuSgZeLzPxKWCdAWatW8PyKU/9JHa6q73/w==
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr20525241wri.208.1642596635994; 
 Wed, 19 Jan 2022 04:50:35 -0800 (PST)
Received: from ubuntu ([2a02:810d:1640:10d8:5d27:648f:a5b9:b18a])
 by smtp.gmail.com with ESMTPSA id w7sm18919861wrv.96.2022.01.19.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 04:50:35 -0800 (PST)
Date: Wed, 19 Jan 2022 13:50:33 +0100
From: Joerg Schambacher <joerg@hifiberry.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] sound/soc: adds TAS5754M digital input amplifier
 component driver
Message-ID: <20220119125033.GA2144@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029095414.29131-1-joerg@hifiberry.com>
Cc: joerg@hifiberry.com, kbuild-all@lists.01.org
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

Mark,

Thanks for your useful feedback. I guess my comments on my first reply got lost somewhere on the way ....

I've updated and fixed some other issues meanwhile, too.

Joerg

On Wed, Nov 17, 2021 at 03:13:47PM +0000, Mark Brown wrote:
> On Fri, Oct 29, 2021 at 11:57:30AM +0200, Joerg Schambacher wrote:
> 
> > Adds a minimum component driver to run the amplifier in I2S master
> > mode only from standard audio clocks. Therefore, it only allows
> > 44.1, 88.2, 176.4, 48, 96 and 192ksps with 16, 20, 24 and 32 bits
> > sample size. Digital volume control and the -6dB switch are supported.
> 
> This looks pretty clean, there's a bunch of minor stylistic bits below
> but other than one major thing this looks good.  The major thing is the
> use of a had coded init sequence to configure the device rather than
> implemenenting the relevant APIs to do so, that's going to make the
> driver unsuitable for use on boards other than the specific one you
> happen to be looking at at the minute.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> 
> > @@ -0,0 +1,547 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for the TAS5754M Audio Amplifier in Master mode (only)
> > + * supports only standard audio frequencies 44.1 to 192 ksps
> 
> Please make the entire comment a C++ one so things look more
> intentional.
> 
> > +EXPORT_SYMBOL_GPL(tas5754m_regmap);
> 
yes, remainder from some experiments - fixed

> There's only one file in the driver, why is this exported?
> 
> > +	mclk = clk_get_rate(tas5754m->sclk);
> > +	bclk = sample_len * 2 * params_rate(params);
> 
> snd_soc_params_to_bclk().
snd_soc_params_to_bclk() does not always gives the necessary value

> 
> > +	// set SCLK divider
> > +	ret |= regmap_write(tas5754m->regmap, TAS5754M_MASTER_CLKDIV_1,
> > +								bclk_div - 1);
> > +
> > +	// set LRCLK divider
> > +	ret |= regmap_write(tas5754m->regmap, TAS5754M_MASTER_CLKDIV_2,
> > +								lrclk_div - 1);
> 
Fixed

> Check the return statuses individually or just don't bother, if you or
> them together then you could end up with a nonsensical error code which
> could cause confusion down the line.
> 
> > +	if (mute) {
> > +		snd_soc_component_write(component, TAS5754M_MUTE, 0x11);
> > +	} else {
> > +		usleep_range(1000, 2000);
> > +		snd_soc_component_write(component, TAS5754M_MUTE, 0x00);
> 
> Why the sleep here?
Wait for settling of the clocks before unmute

> 
> > +	ret = regmap_multi_reg_write(regmap, tas5754m_init_sequence,
> > +					ARRAY_SIZE(tas5754m_init_sequence));
> 
> This init sequence looks an awful lot like it's doing board specific
> configuration - it's enabling the PLL, configuring GPIOs and clock
> dividers among other things.  These should all be done through board
> specific configuration or based on the currently configured audio path,
> what's suitable for one board may not be suitable for another board.
> Doing a reset of the chip is good but the rest of it really looks like
> it doesn't belong.
Ok, completely re-organized in the next trial

> 
> > +	ret = snd_soc_register_component(dev,
> > +			&tas5754m_soc_component, &tas5754m_dai, 1);
> 
> devm_snd_soc_register_component()
> 
fixed

> > +static const struct i2c_device_id tas5754m_i2c_id[] = {
> > +	{ "tas5754m", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, tas5754m_i2c_id);
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id tas5754m_of_match[] = {
> > +	{ .compatible = "ti,tas5754m", },
> > +	{ .compatible = "ti,tas5756m", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, tas5754m_of_match);
> > +#endif
> 
> Why not list both I2C IDs as well?
Fixed

> 
> > @@ -0,0 +1,259 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Driver for the TAS5754M DAC+amplifier combo devices
> > + *
> > + * Author:	(copied from pcm512x.h)
> > + *		Mark Brown <broonie@kernel.org>
> > + *		Copyright 2014 Linaro Ltd
> > + */
> 
> If the register map can be copied can't the two drivers be combined?
The TI apps team recommended to write a separate driver as there are some differences. I have also aligned some names to the TAS575xM spec in the next patch

> 
> > +#define TAS5754M_VIRT_BASE 0x000
> > +#define TAS5754M_PAGE_LEN  0x80
> > +#define TAS5754M_PAGE_BASE(n)  (TAS5754M_VIRT_BASE + (TAS5754M_PAGE_LEN * n))
> > +
> > +#define TAS5754M_PAGE              0
> 
> There's no mention of paging in the regmap description for the driver
> which feels like it's asking for problems.
I think, it's defined in the correct way. Where/when exactly do you see a problem?

> 
> > +
> > +#define TAS5754M_RESET             (TAS5754M_PAGE_BASE(0) +   1)
> > +#define TAS5754M_POWER             (TAS5754M_PAGE_BASE(0) +   2)
> > +#define TAS5754M_MUTE              (TAS5754M_PAGE_BASE(0) +   3)
> > +#define TAS5754M_PLL_EN            (TAS5754M_PAGE_BASE(0) +   4)
> > +#define TAS5754M_SPI_MISO_FUNCTION (TAS5754M_PAGE_BASE(0) +   6)
> > +#define TAS5754M_DSP               (TAS5754M_PAGE_BASE(0) +   7)
> > +#define TAS5754M_GPIO_EN           (TAS5754M_PAGE_BASE(0) +   8)
> > +#define TAS5754M_BCLK_LRCLK_CFG    (TAS5754M_PAGE_BASE(0) +   9)
> > +#define TAS5754M_DSP_GPIO_INPUT    (TAS5754M_PAGE_BASE(0) +  10)
> > +#define TAS5754M_MASTER_MODE       (TAS5754M_PAGE_BASE(0) +  12)
> > +#define TAS5754M_PLL_REF           (TAS5754M_PAGE_BASE(0) +  13)
> > +#define TAS5754M_DAC_REF           (TAS5754M_PAGE_BASE(0) +  14)
> > +#define TAS5754M_GPIO_DACIN        (TAS5754M_PAGE_BASE(0) +  16)
> > +#define TAS5754M_GPIO_PLLIN        (TAS5754M_PAGE_BASE(0) +  18)
> > +#define TAS5754M_SYNCHRONIZE       (TAS5754M_PAGE_BASE(0) +  19)
> > +#define TAS5754M_PLL_COEFF_0       (TAS5754M_PAGE_BASE(0) +  20)
> > +#define TAS5754M_PLL_COEFF_1       (TAS5754M_PAGE_BASE(0) +  21)
> > +#define TAS5754M_PLL_COEFF_2       (TAS5754M_PAGE_BASE(0) +  22)
> > +#define TAS5754M_PLL_COEFF_3       (TAS5754M_PAGE_BASE(0) +  23)
> > +#define TAS5754M_PLL_COEFF_4       (TAS5754M_PAGE_BASE(0) +  24)
> > +#define TAS5754M_DSP_CLKDIV        (TAS5754M_PAGE_BASE(0) +  27)
> > +#define TAS5754M_DAC_CLKDIV        (TAS5754M_PAGE_BASE(0) +  28)
> > +#define TAS5754M_NCP_CLKDIV        (TAS5754M_PAGE_BASE(0) +  29)
> > +#define TAS5754M_OSR_CLKDIV        (TAS5754M_PAGE_BASE(0) +  30)
> > +#define TAS5754M_MASTER_CLKDIV_1   (TAS5754M_PAGE_BASE(0) +  32)
> > +#define TAS5754M_MASTER_CLKDIV_2   (TAS5754M_PAGE_BASE(0) +  33)
> > +#define TAS5754M_FS_SPEED_MODE     (TAS5754M_PAGE_BASE(0) +  34)
> > +#define TAS5754M_IDAC_1            (TAS5754M_PAGE_BASE(0) +  35)
> > +#define TAS5754M_IDAC_2            (TAS5754M_PAGE_BASE(0) +  36)
> > +#define TAS5754M_ERROR_DETECT      (TAS5754M_PAGE_BASE(0) +  37)
> > +#define TAS5754M_I2S_1             (TAS5754M_PAGE_BASE(0) +  40)
> > +#define TAS5754M_I2S_2             (TAS5754M_PAGE_BASE(0) +  41)
> > +#define TAS5754M_DAC_ROUTING       (TAS5754M_PAGE_BASE(0) +  42)
> > +#define TAS5754M_DSP_PROGRAM       (TAS5754M_PAGE_BASE(0) +  43)
> > +#define TAS5754M_CLKDET            (TAS5754M_PAGE_BASE(0) +  44)
> > +#define TAS5754M_AUTO_MUTE         (TAS5754M_PAGE_BASE(0) +  59)
> > +#define TAS5754M_DIGITAL_VOLUME_1  (TAS5754M_PAGE_BASE(0) +  60)
> > +#define TAS5754M_DIGITAL_VOLUME_2  (TAS5754M_PAGE_BASE(0) +  61)
> > +#define TAS5754M_DIGITAL_VOLUME_3  (TAS5754M_PAGE_BASE(0) +  62)
> > +#define TAS5754M_DIGITAL_MUTE_1    (TAS5754M_PAGE_BASE(0) +  63)
> > +#define TAS5754M_DIGITAL_MUTE_2    (TAS5754M_PAGE_BASE(0) +  64)
> > +#define TAS5754M_DIGITAL_MUTE_3    (TAS5754M_PAGE_BASE(0) +  65)
> > +#define TAS5754M_GPIO_OUTPUT_1     (TAS5754M_PAGE_BASE(0) +  80)
> > +#define TAS5754M_GPIO_OUTPUT_2     (TAS5754M_PAGE_BASE(0) +  81)
> > +#define TAS5754M_GPIO_OUTPUT_3     (TAS5754M_PAGE_BASE(0) +  82)
> > +#define TAS5754M_GPIO_OUTPUT_4     (TAS5754M_PAGE_BASE(0) +  83)
> > +#define TAS5754M_GPIO_OUTPUT_5     (TAS5754M_PAGE_BASE(0) +  84)
> > +#define TAS5754M_GPIO_OUTPUT_6     (TAS5754M_PAGE_BASE(0) +  85)
> > +#define TAS5754M_GPIO_CONTROL_1    (TAS5754M_PAGE_BASE(0) +  86)
> > +#define TAS5754M_GPIO_CONTROL_2    (TAS5754M_PAGE_BASE(0) +  87)
> > +#define TAS5754M_OVERFLOW          (TAS5754M_PAGE_BASE(0) +  90)
> > +#define TAS5754M_RATE_DET_1        (TAS5754M_PAGE_BASE(0) +  91)
> > +#define TAS5754M_RATE_DET_2        (TAS5754M_PAGE_BASE(0) +  92)
> > +#define TAS5754M_RATE_DET_3        (TAS5754M_PAGE_BASE(0) +  93)
> > +#define TAS5754M_RATE_DET_4        (TAS5754M_PAGE_BASE(0) +  94)
> > +#define TAS5754M_CLOCK_STATUS      (TAS5754M_PAGE_BASE(0) +  95)
> > +#define TAS5754M_ANALOG_MUTE_DET   (TAS5754M_PAGE_BASE(0) + 108)
> > +#define TAS5754M_GPIN              (TAS5754M_PAGE_BASE(0) + 119)
> > +#define TAS5754M_DIGITAL_MUTE_DET  (TAS5754M_PAGE_BASE(0) + 120)
> > +
> > +#define TAS5754M_OUTPUT_AMPLITUDE  (TAS5754M_PAGE_BASE(1) +   1)
> > +#define TAS5754M_ANALOG_GAIN_CTRL  (TAS5754M_PAGE_BASE(1) +   2)
> > +#define TAS5754M_UNDERVOLTAGE_PROT (TAS5754M_PAGE_BASE(1) +   5)
> > +#define TAS5754M_ANALOG_MUTE_CTRL  (TAS5754M_PAGE_BASE(1) +   6)
> > +#define TAS5754M_ANALOG_GAIN_BOOST (TAS5754M_PAGE_BASE(1) +   7)
> > +#define TAS5754M_VCOM_CTRL_1       (TAS5754M_PAGE_BASE(1) +   8)
> > +#define TAS5754M_VCOM_CTRL_2       (TAS5754M_PAGE_BASE(1) +   9)
> > +
> > +#define TAS5754M_CRAM_CTRL         (TAS5754M_PAGE_BASE(44) +  1)
> > +
> > +#define TAS5754M_FLEX_A            (TAS5754M_PAGE_BASE(253) + 63)
> > +#define TAS5754M_FLEX_B            (TAS5754M_PAGE_BASE(253) + 64)
> > +
> > +#define TAS5754M_MAX_REGISTER      (TAS5754M_PAGE_BASE(253) + 64)
> > +
> > +/* Page 0, Register 1 - reset */
> > +#define TAS5754M_RSTR (1 << 0)
> > +#define TAS5754M_RSTM (1 << 4)
> > +
> > +/* Page 0, Register 2 - power */
> > +#define TAS5754M_RQPD       (1 << 0)
> > +#define TAS5754M_RQPD_SHIFT 0
> > +#define TAS5754M_RQST       (1 << 4)
> > +#define TAS5754M_RQST_SHIFT 4
> > +
> > +/* Page 0, Register 3 - mute */
> > +#define TAS5754M_RQMR (1 << 0)
> > +#define TAS5754M_RQMR_SHIFT 0
> > +#define TAS5754M_RQML (1 << 4)
> > +#define TAS5754M_RQML_SHIFT 4
> > +
> > +/* Page 0, Register 4 - PLL */
> > +#define TAS5754M_PLLE       (1 << 0)
> > +#define TAS5754M_PLLE_SHIFT 0
> > +#define TAS5754M_PLCK       (1 << 4)
> > +#define TAS5754M_PLCK_SHIFT 4
> > +
> > +/* Page 0, Register 7 - DSP */
> > +#define TAS5754M_SDSL       (1 << 0)
> > +#define TAS5754M_SDSL_SHIFT 0
> > +#define TAS5754M_DEMP       (1 << 4)
> > +#define TAS5754M_DEMP_SHIFT 4
> > +
> > +/* Page 0, Register 8 - GPIO output enable */
> > +#define TAS5754M_G1OE       (1 << 0)
> > +#define TAS5754M_G2OE       (1 << 1)
> > +#define TAS5754M_G3OE       (1 << 2)
> > +#define TAS5754M_G4OE       (1 << 3)
> > +#define TAS5754M_G5OE       (1 << 4)
> > +#define TAS5754M_G6OE       (1 << 5)
> > +
> > +/* Page 0, Register 9 - BCK, LRCLK configuration */
> > +#define TAS5754M_LRKO       (1 << 0)
> > +#define TAS5754M_LRKO_SHIFT 0
> > +#define TAS5754M_BCKO       (1 << 4)
> > +#define TAS5754M_BCKO_SHIFT 4
> > +#define TAS5754M_BCKP       (1 << 5)
> > +#define TAS5754M_BCKP_SHIFT 5
> > +
> > +/* Page 0, Register 12 - Master mode BCK, LRCLK reset */
> > +#define TAS5754M_RLRK       (1 << 0)
> > +#define TAS5754M_RLRK_SHIFT 0
> > +#define TAS5754M_RBCK       (1 << 1)
> > +#define TAS5754M_RBCK_SHIFT 1
> > +
> > +/* Page 0, Register 13 - PLL reference */
> > +#define TAS5754M_SREF        (7 << 4)
> > +#define TAS5754M_SREF_SHIFT  4
> > +#define TAS5754M_SREF_SCK    (0 << 4)
> > +#define TAS5754M_SREF_BCK    (1 << 4)
> > +#define TAS5754M_SREF_GPIO   (3 << 4)
> > +
> > +/* Page 0, Register 14 - DAC reference */
> > +#define TAS5754M_SDAC        (7 << 4)
> > +#define TAS5754M_SDAC_SHIFT  4
> > +#define TAS5754M_SDAC_MCK    (0 << 4)
> > +#define TAS5754M_SDAC_PLL    (1 << 4)
> > +#define TAS5754M_SDAC_SCK    (3 << 4)
> > +#define TAS5754M_SDAC_BCK    (4 << 4)
> > +#define TAS5754M_SDAC_GPIO   (5 << 4)
> > +
> > +/* Page 0, Register 16, 18 - GPIO source for DAC, PLL */
> > +#define TAS5754M_GREF        (7 << 0)
> > +#define TAS5754M_GREF_SHIFT  0
> > +#define TAS5754M_GREF_GPIO1  (0 << 0)
> > +#define TAS5754M_GREF_GPIO2  (1 << 0)
> > +#define TAS5754M_GREF_GPIO3  (2 << 0)
> > +#define TAS5754M_GREF_GPIO4  (3 << 0)
> > +#define TAS5754M_GREF_GPIO5  (4 << 0)
> > +#define TAS5754M_GREF_GPIO6  (5 << 0)
> > +
> > +/* Page 0, Register 19 - synchronize */
> > +#define TAS5754M_RQSY        (1 << 0)
> > +#define TAS5754M_RQSY_RESUME (0 << 0)
> > +#define TAS5754M_RQSY_HALT   (1 << 0)
> > +
> > +/* Page 0, Register 34 - fs speed mode */
> > +#define TAS5754M_FSSP        (3 << 0)
> > +#define TAS5754M_FSSP_SHIFT  0
> > +#define TAS5754M_FSSP_48KHZ  (0 << 0)
> > +#define TAS5754M_FSSP_96KHZ  (1 << 0)
> > +#define TAS5754M_FSSP_192KHZ (2 << 0)
> > +#define TAS5754M_FSSP_384KHZ (3 << 0)
> > +
> > +/* Page 0, Register 37 - Error detection */
> > +#define TAS5754M_IPLK (1 << 0)
> > +#define TAS5754M_DCAS (1 << 1)
> > +#define TAS5754M_IDCM (1 << 2)
> > +#define TAS5754M_IDCH (1 << 3)
> > +#define TAS5754M_IDSK (1 << 4)
> > +#define TAS5754M_IDBK (1 << 5)
> > +#define TAS5754M_IDFS (1 << 6)
> > +
> > +/* Page 0, Register 40 - I2S configuration */
> > +#define TAS5754M_ALEN       (3 << 0)
> > +#define TAS5754M_ALEN_SHIFT 0
> > +#define TAS5754M_ALEN_16    (0 << 0)
> > +#define TAS5754M_ALEN_20    (1 << 0)
> > +#define TAS5754M_ALEN_24    (2 << 0)
> > +#define TAS5754M_ALEN_32    (3 << 0)
> > +#define TAS5754M_AFMT       (3 << 4)
> > +#define TAS5754M_AFMT_SHIFT 4
> > +#define TAS5754M_AFMT_I2S   (0 << 4)
> > +#define TAS5754M_AFMT_DSP   (1 << 4)
> > +#define TAS5754M_AFMT_RTJ   (2 << 4)
> > +#define TAS5754M_AFMT_LTJ   (3 << 4)
> > +
> > +/* Page 0, Register 42 - DAC routing */
> > +#define TAS5754M_AUPR_SHIFT 0
> > +#define TAS5754M_AUPL_SHIFT 4
> > +
> > +/* Page 0, Register 59 - auto mute */
> > +#define TAS5754M_ATMR_SHIFT 0
> > +#define TAS5754M_ATML_SHIFT 4
> > +
> > +/* Page 0, Register 63 - ramp rates */
> > +#define TAS5754M_VNDF_SHIFT 6
> > +#define TAS5754M_VNDS_SHIFT 4
> > +#define TAS5754M_VNUF_SHIFT 2
> > +#define TAS5754M_VNUS_SHIFT 0
> > +
> > +/* Page 0, Register 64 - emergency ramp rates */
> > +#define TAS5754M_VEDF_SHIFT 6
> > +#define TAS5754M_VEDS_SHIFT 4
> > +
> > +/* Page 0, Register 65 - Digital mute enables */
> > +#define TAS5754M_ACTL_SHIFT 2
> > +#define TAS5754M_AMLE_SHIFT 1
> > +#define TAS5754M_AMRE_SHIFT 0
> > +
> > +/* Page 0, Register 80-85, GPIO output selection */
> > +#define TAS5754M_GxSL       (31 << 0)
> > +#define TAS5754M_GxSL_SHIFT 0
> > +#define TAS5754M_GxSL_OFF   (0 << 0)
> > +#define TAS5754M_GxSL_DSP   (1 << 0)
> > +#define TAS5754M_GxSL_REG   (2 << 0)
> > +#define TAS5754M_GxSL_AMUTB (3 << 0)
> > +#define TAS5754M_GxSL_AMUTL (4 << 0)
> > +#define TAS5754M_GxSL_AMUTR (5 << 0)
> > +#define TAS5754M_GxSL_CLKI  (6 << 0)
> > +#define TAS5754M_GxSL_SDOUT (7 << 0)
> > +#define TAS5754M_GxSL_ANMUL (8 << 0)
> > +#define TAS5754M_GxSL_ANMUR (9 << 0)
> > +#define TAS5754M_GxSL_PLLLK (10 << 0)
> > +#define TAS5754M_GxSL_CPCLK (11 << 0)
> > +#define TAS5754M_GxSL_UV0_7 (14 << 0)
> > +#define TAS5754M_GxSL_UV0_3 (15 << 0)
> > +#define TAS5754M_GxSL_PLLCK (16 << 0)
> > +
> > +/* Page 1, Register 2 - analog volume control */
> > +#define TAS5754M_RAGN_SHIFT 0
> > +#define TAS5754M_LAGN_SHIFT 4
> > +
> > +/* Page 1, Register 7 - analog boost control */
> > +#define TAS5754M_AGBR_SHIFT 0
> > +#define TAS5754M_AGBL_SHIFT 4
> > +
> > +#endif
> > 
> > base-commit: f6274b06e326d8471cdfb52595f989a90f5e888f
> > -- 
> > 2.17.1
> > 


