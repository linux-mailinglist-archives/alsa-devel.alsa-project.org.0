Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CD1AD9A4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712B21614;
	Fri, 17 Apr 2020 11:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712B21614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115198;
	bh=TJaHW+6o56AgW2zkADAxk+nGy4W+OhjnPF3CbXtJdGg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnr8SFYvhTk9Z9vHQlF1Pv9VxKwf6sUUTszTAb/qX4EYeY/mh5y7QOjqKodODnfCK
	 zwNsKKqkW2qOeQ6qMj55Rx4z/7XZD72MZbXAoHGCBhMAZk+BWtFRoOlyq6byMmF/K6
	 +TbBNJ80m4Js9K9pBfGUdEZ739uhbLBPBAuYoax0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E171F80292;
	Fri, 17 Apr 2020 11:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4A3BF8014E; Thu, 16 Apr 2020 09:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D0B1F800AB
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0B1F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fWro629A"
Received: by mail-wm1-x343.google.com with SMTP id h2so3402090wmb.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PfcEIjHVOwJJoI3IG1yq+hLuJEPuCeMcpBtriOzJSVE=;
 b=fWro629AKCHe7c1PY8qWNnc/MO1FUAtCQOwruVmdsj4Kyvr1SDGr9Xgc/VGuT4Ao08
 aszgwv1hJNkmDxBtLtWK7K2S9mv6z5/c8TCmg4n+kwj4eAnnvC2Dt4pvdKuMnlfnbcGf
 puxMyauwUmvCn/LNyQLnyjFrS1Kzkios1/MsF6m/I4GPnRVdRC2+tstnjmmO650ZwQzj
 4aWRTSNgkZKvvDPkpZ/B7oqv4O1vvl2M0bRRRPUNQCjnZDrbzcP/JjjuClCaNvbDFuVJ
 cZP/dedvaVFsRZKmIeGsiWSNvkLi9aAZR4c6U1deMU+GHzWLDixE4IBaBhe7BLuqYxXC
 CRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PfcEIjHVOwJJoI3IG1yq+hLuJEPuCeMcpBtriOzJSVE=;
 b=SJS9W9Tc/Nsct7QX59GySv9D3ZV0JjD7UvAyA/ycehRjQF69NHeu0CDH1MbsM/VCBU
 BkUso8z1zu0071xrsOTcpKfNBp3XAllN8ZQl156+y8f8Titt0sEc6GXAwj83rgtNd7nP
 CDywX0dw0EuBTmMFYx/+FaDtlmMfUtLyQb3BBYTwm0p8ThR51L40LZ7PZ7UO/q+YodnY
 0uivsHO6Bp1SpRJ0WH94JF0qxMkNGHEMx6uyQaVsPmPzgpf1ut21ETK78u8LYuSRgrOz
 JL8h1/O8ibcQOzurwyUl7qVkB900JhMMdTYfaG+CZpVJHNfEASrtGqDTrE8r/G8hXwP1
 Id0A==
X-Gm-Message-State: AGi0PuZqximtrj4MrSeIcyWCPTu5X8Yg/ml3TOJvkTQ9KMrIiHZmadpS
 /BRekYavpvrTAfZOKrtRh5uuPg==
X-Google-Smtp-Source: APiQypKxoroogYo0WPMcKERsdRMrzAoaU5nNn92qAMbIpRzZIzICMY0kveTYaemzAUSe6fR6V9LLBA==
X-Received: by 2002:a1c:990d:: with SMTP id b13mr3217540wme.179.1587021691888; 
 Thu, 16 Apr 2020 00:21:31 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id h188sm2608116wme.8.2020.04.16.00.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:21:31 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:22:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416072231.GT2167633@dell>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
X-Mailman-Approved-At: Fri, 17 Apr 2020 11:15:50 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
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

On Wed, 15 Apr 2020, Rob Herring wrote:

> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
> 
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/cpus.yaml         |  81 +++---
>  .../devicetree/bindings/arm/l2c2x0.yaml       |  87 +++---
>  .../devicetree/bindings/arm/psci.yaml         |  15 +-
>  .../bindings/arm/samsung/exynos-chipid.yaml   |   5 +-
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   5 +-
>  .../bindings/clock/fixed-factor-clock.yaml    |   5 +-
>  .../bindings/connector/usb-connector.yaml     |  28 +-
>  .../bindings/crypto/st,stm32-hash.yaml        |   9 +-
>  .../allwinner,sun4i-a10-display-engine.yaml   |   7 +-
>  .../display/allwinner,sun4i-a10-tcon.yaml     |   5 +-
>  .../bindings/display/panel/panel-common.yaml  |   5 +-
>  .../devicetree/bindings/dma/dma-common.yaml   |   3 +-
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  18 +-
>  .../devicetree/bindings/eeprom/at24.yaml      |  11 +-
>  .../devicetree/bindings/example-schema.yaml   |  17 +-
>  .../bindings/hwmon/adi,ltc2947.yaml           |  32 +--
>  .../devicetree/bindings/hwmon/ti,tmp513.yaml  |  21 +-
>  .../devicetree/bindings/i2c/st,stm32-i2c.yaml |   9 +-
>  .../bindings/iio/adc/adi,ad7124.yaml          |   5 +-
>  .../bindings/iio/adc/lltc,ltc2496.yaml        |   3 +-
>  .../bindings/iio/adc/microchip,mcp3911.yaml   |   7 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |  31 +-
>  .../bindings/iio/light/tsl2772.yaml           |  13 +-
>  .../bindings/iio/temperature/adi,ltc2983.yaml |  56 ++--
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml |   5 +-
>  .../devicetree/bindings/input/input.yaml      |   9 +-
>  .../interrupt-controller/arm,gic-v3.yaml      |  39 ++-
>  .../devicetree/bindings/iommu/arm,smmu.yaml   |   3 +-
>  .../devicetree/bindings/leds/common.yaml      |  13 +-
>  .../devicetree/bindings/leds/leds-gpio.yaml   |   3 +-
>  .../bindings/leds/rohm,bd71828-leds.yaml      |  10 +-
>  .../bindings/mailbox/st,stm32-ipcc.yaml       |   5 +-
>  .../bindings/media/amlogic,gx-vdec.yaml       |   6 +-
>  .../media/amlogic,meson-gx-ao-cec.yaml        |   3 +-
>  .../devicetree/bindings/media/rc.yaml         | 265 +++++++++---------
>  .../bindings/media/renesas,vin.yaml           |   7 +-
>  .../memory-controllers/exynos-srom.yaml       |  14 +-
>  .../nvidia,tegra124-emc.yaml                  |   9 +-
>  .../nvidia,tegra124-mc.yaml                   |   3 +-
>  .../nvidia,tegra30-emc.yaml                   |   9 +-
>  .../memory-controllers/nvidia,tegra30-mc.yaml |   3 +-

>  .../bindings/mfd/allwinner,sun4i-a10-ts.yaml  |  20 +-
>  .../bindings/mfd/st,stm32-timers.yaml         |  33 ++-
>  .../devicetree/bindings/mfd/st,stpmic1.yaml   |   9 +-
>  .../devicetree/bindings/mfd/syscon.yaml       |   5 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml |   4 +-
>  .../devicetree/bindings/mmc/cdns,sdhci.yaml   |  77 +++--
>  .../bindings/mmc/mmc-controller.yaml          |  37 ++-
>  .../bindings/mmc/rockchip-dw-mshc.yaml        |   6 +-
>  .../bindings/mmc/synopsys-dw-mshc-common.yaml |  14 +-
>  .../mtd/allwinner,sun4i-a10-nand.yaml         |  13 +-
>  .../bindings/mtd/nand-controller.yaml         |  27 +-
>  .../bindings/net/can/bosch,m_can.yaml         |  59 ++--
>  .../bindings/net/ethernet-controller.yaml     |  34 +--
>  .../devicetree/bindings/net/qca,ar803x.yaml   |  17 +-
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  22 +-
>  .../bindings/net/ti,cpsw-switch.yaml          |   3 +-
>  .../bindings/net/ti,davinci-mdio.yaml         |   7 +-
>  .../bindings/pci/intel-gw-pcie.yaml           |   7 +-
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  12 +-
>  .../pinctrl/aspeed,ast2400-pinctrl.yaml       |  37 ++-
>  .../pinctrl/aspeed,ast2500-pinctrl.yaml       |  45 ++-
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 108 ++++---
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml  |  31 +-
>  .../bindings/pinctrl/intel,lgm-io.yaml        |   4 +-
>  .../bindings/pinctrl/pinmux-node.yaml         |   3 +-
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    |  56 ++--
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml |   3 +-
>  .../devicetree/bindings/pwm/pwm-samsung.yaml  |  11 +-
>  .../bindings/regulator/gpio-regulator.yaml    |  35 ++-
>  .../bindings/regulator/mps,mpq7920.yaml       |  31 +-
>  .../bindings/regulator/regulator.yaml         |   5 +-
>  .../regulator/rohm,bd71828-regulator.yaml     |  34 +--
>  .../bindings/regulator/st,stm32-booster.yaml  |   3 +-
>  .../regulator/st,stm32mp1-pwr-reg.yaml        |   3 +-
>  .../bindings/remoteproc/st,stm32-rproc.yaml   |   9 +-
>  .../bindings/reset/intel,rcu-gw.yaml          |   3 +-
>  .../devicetree/bindings/riscv/cpus.yaml       |  20 +-
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml |   9 +-
>  .../devicetree/bindings/serial/pl011.yaml     |  10 +-
>  .../devicetree/bindings/serial/rs485.yaml     |  26 +-
>  .../bindings/serial/samsung_uart.yaml         |   5 +-
>  .../bindings/sound/adi,adau7118.yaml          |  20 +-
>  .../sound/allwinner,sun4i-a10-codec.yaml      |  41 ++-
>  .../bindings/sound/qcom,wcd934x.yaml          |   3 +-
>  .../bindings/spi/renesas,sh-msiof.yaml        |  42 ++-
>  .../bindings/spi/spi-controller.yaml          |  14 +-
>  .../devicetree/bindings/spi/spi-pl022.yaml    |  55 ++--
>  .../devicetree/bindings/spi/spi-sifive.yaml   |  14 +-
>  .../bindings/thermal/qcom-tsens.yaml          |   7 +-
>  .../bindings/timer/arm,arch_timer_mmio.yaml   |   7 +-
>  91 files changed, 881 insertions(+), 1103 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
