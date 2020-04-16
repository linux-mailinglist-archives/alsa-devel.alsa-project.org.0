Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080241AD99C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5261676;
	Fri, 17 Apr 2020 11:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5261676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115154;
	bh=4ZCVK/ucVmPEcOFmQ7mzFqcyE/vkAxhn7z0M62TqGoY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjC0MvfdLuCOJN+wijMYT2Aw4ARqMZshu23pio6Lj6E8B8hLFLHU8yQkwIOB/TP4f
	 LDUZrZ3PHaX2R0MXxjYDLEqQlSkunEmGY4nUZxLBrUDDBktZ0SuFugH00GD29s4uq2
	 UDAaIdt6WR8vrfi3GQnwr/yzmq+wQwU30kjsHmxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54EBCF80291;
	Fri, 17 Apr 2020 11:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F55F8014E; Thu, 16 Apr 2020 09:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8545F8012E
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 09:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8545F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x+7x1SRD"
Received: by mail-wr1-x444.google.com with SMTP id k11so3560454wrp.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3AEaWn5XeJ7hcX74F4NzwZbogUqZr77xLF5d73BlBfw=;
 b=x+7x1SRD1y/LTZJxHdO7NBoPBhyXEErUVgwIai9Txb2aqME7MbBYVN8PkA7MmFMlG/
 +PTNeDQuJeOieuyql513BpDrE+TR0fX/mGtYOkCA4N6z7VRTvWgnydlKHHjdN1pHbDi6
 FcrLT7q9Xm6W6XF2DKy+sVxRvrx2e8zXuCLbQfQ8d2nPd/iJ34SsziQVe8hgIZhAVDz1
 X39oeCEgZoTyWJybNtbP4u4Ik4a22WiM6sS1Gf+7ektT/jxfmy4EaiaU+raISKCA976c
 DL5uziLMISTg53DG/aGMYXA9DS9lwHatzi8LUvPjSHKrnZk+uf82Nr0GKjoaC8YAX62l
 Ovyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3AEaWn5XeJ7hcX74F4NzwZbogUqZr77xLF5d73BlBfw=;
 b=Bnc26LcHyElFzasLA5aDC7AOSzu9YVuqI18t4WdaHoWk20CEt5ji+zRqtxp5hnDuTn
 e/dRb/d9tL8eHMkkQIJDZSD1Kd7Z9EA+6F64GmWETYvHYD8al8AtyAg7YfQsmsrohBQB
 Cq+iFmLxPoXVbAw76CM140pxq7Y1qaQHzKuaemghc4I/Mt8VaRT3qrySciAv6IWhlL3O
 vmBwu6nxGKQlX3JOu3/nSeNJebJ3xsmpZe2Y98BFBf0gqnpcklH8zQr/zqmbQOnVWeDO
 l354kpUZLYZMxJeqlmtqUg7rYyjkSPQV1438jAlKndpu1UtmtkxYQkZd9DVFgINXt6tD
 mX5A==
X-Gm-Message-State: AGi0PubJDs2fVVcj9ye0MxNZFScRAAC9WZmYY0LJxD1JK0rA7CteYEKo
 cWDm2Hvr3Dx+KpAehcKGJGYMsQ==
X-Google-Smtp-Source: APiQypLCNVZBL4RMlNf7UZFX5oU2xDT6SF7MjxuD7BsWZie9pUbnFA9tcL+f+7W6lePE+UdiJ1fBjg==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr8967305wrm.106.1587021558557; 
 Thu, 16 Apr 2020 00:19:18 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id p16sm19943946wro.21.2020.04.16.00.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:19:17 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:20:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416072018.GS2167633@dell>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
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

> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/altera.yaml       |  6 +-
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   |  2 +-
>  .../devicetree/bindings/arm/bitmain.yaml      |  2 +-
>  .../devicetree/bindings/arm/nxp/lpc32xx.yaml  |  9 ++-
>  .../bindings/arm/socionext/uniphier.yaml      | 26 ++++----
>  .../bindings/arm/stm32/st,mlahb.yaml          |  2 +-
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   |  6 +-
>  .../bindings/ata/faraday,ftide010.yaml        |  4 +-
>  .../bindings/bus/allwinner,sun8i-a23-rsb.yaml |  4 +-
>  .../clock/allwinner,sun4i-a10-gates-clk.yaml  |  8 +--
>  .../devicetree/bindings/clock/fsl,plldig.yaml | 17 +++--
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 16 ++---
>  .../bindings/connector/usb-connector.yaml     |  6 +-
>  .../crypto/allwinner,sun4i-a10-crypto.yaml    | 14 ++--
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 16 ++---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   |  2 +-
>  .../display/allwinner,sun4i-a10-hdmi.yaml     | 40 ++++++------
>  .../display/allwinner,sun4i-a10-tcon.yaml     | 58 ++++++++---------
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 28 ++++----
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 10 +--
>  .../bindings/display/bridge/lvds-codec.yaml   | 18 +++---
>  .../display/panel/sony,acx424akp.yaml         |  2 +-
>  .../display/panel/xinpeng,xpp055c272.yaml     |  4 +-
>  .../bindings/display/renesas,cmm.yaml         | 16 ++---
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  8 +--
>  .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    |  2 +-
>  .../bindings/gpu/arm,mali-midgard.yaml        | 18 +++---
>  .../devicetree/bindings/gpu/vivante,gc.yaml   |  2 +-
>  .../devicetree/bindings/i2c/i2c-rk3x.yaml     | 10 +--
>  .../bindings/iio/adc/adi,ad7124.yaml          |  4 +-
>  .../bindings/iio/adc/lltc,ltc2496.yaml        |  6 +-
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml |  4 +-
>  .../bindings/input/touchscreen/goodix.yaml    |  2 +-
>  .../bindings/interconnect/qcom,msm8916.yaml   |  4 +-
>  .../bindings/interconnect/qcom,msm8974.yaml   |  4 +-
>  .../bindings/interconnect/qcom,qcs404.yaml    |  4 +-
>  .../allwinner,sun7i-a20-sc-nmi.yaml           | 12 ++--
>  .../intel,ixp4xx-interrupt.yaml               |  8 +--
>  .../interrupt-controller/st,stm32-exti.yaml   | 12 ++--
>  .../bindings/iommu/samsung,sysmmu.yaml        | 10 +--
>  .../bindings/mailbox/st,stm32-ipcc.yaml       |  2 +-
>  .../media/allwinner,sun4i-a10-csi.yaml        | 28 ++++----
>  .../bindings/media/amlogic,gx-vdec.yaml       | 14 ++--
>  .../bindings/media/renesas,ceu.yaml           | 28 ++++----
>  .../bindings/media/renesas,vin.yaml           |  8 +--
>  .../devicetree/bindings/media/ti,vpe.yaml     |  2 +-
>  .../memory-controllers/fsl/imx8m-ddrc.yaml    |  6 +-

>  .../bindings/mfd/st,stm32-lptimer.yaml        |  4 +-
>  .../bindings/mfd/st,stm32-timers.yaml         |  4 +-
>  .../devicetree/bindings/mfd/syscon.yaml       | 12 ++--

Acked-by: Lee Jones <lee.jones@linaro.org>

>  .../devicetree/bindings/mmc/cdns,sdhci.yaml   |  2 +-
>  .../bindings/mmc/rockchip-dw-mshc.yaml        | 16 ++---
>  .../bindings/mmc/socionext,uniphier-sd.yaml   | 14 ++--
>  .../devicetree/bindings/mtd/denali,nand.yaml  |  4 +-
>  .../net/allwinner,sun8i-a83t-emac.yaml        |  4 +-
>  .../bindings/net/can/bosch,m_can.yaml         | 52 +++++++--------
>  .../bindings/net/renesas,ether.yaml           |  4 +-
>  .../bindings/net/ti,cpsw-switch.yaml          | 12 ++--
>  .../bindings/net/ti,davinci-mdio.yaml         | 27 ++++----
>  .../bindings/phy/intel,lgm-emmc-phy.yaml      |  2 +-
>  .../devicetree/bindings/pwm/pwm-samsung.yaml  | 16 ++---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  2 +-
>  .../reset/brcm,bcm7216-pcie-sata-rescal.yaml  |  4 +-
>  .../devicetree/bindings/rtc/st,stm32-rtc.yaml | 38 +++++------
>  .../bindings/serial/amlogic,meson-uart.yaml   | 16 ++---
>  .../devicetree/bindings/serial/rs485.yaml     | 17 ++---
>  .../bindings/soc/amlogic/amlogic,canvas.yaml  | 10 +--
>  .../bindings/sound/renesas,fsi.yaml           | 16 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      | 10 +--
>  .../devicetree/bindings/spi/renesas,hspi.yaml |  4 +-
>  .../devicetree/bindings/spi/spi-pl022.yaml    |  2 +-
>  .../bindings/spi/st,stm32-qspi.yaml           |  4 +-
>  .../allwinner,sun4i-a10-system-control.yaml   | 64 +++++++++----------
>  .../bindings/thermal/amlogic,thermal.yaml     | 10 +--
>  .../bindings/timer/arm,arch_timer.yaml        |  4 +-
>  .../bindings/timer/arm,arch_timer_mmio.yaml   |  4 +-
>  .../devicetree/bindings/usb/dwc2.yaml         |  8 +--
>  77 files changed, 450 insertions(+), 450 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
