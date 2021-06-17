Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1413AEADA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 16:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B56E1672;
	Mon, 21 Jun 2021 16:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B56E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624284711;
	bh=8lLNvAQJFBYHcwyHgNEpUKH4liF//tJL8IXh/++g2VQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DISwAaDRiXses33DMD4tqtJI6d3QssCOV/t1KxBOkq6Q9pMskV3n3aZFLF9v7y2lR
	 iARuO2a0U4M9mn0f3atHotAJirP6gdP4/+jPC4czH4OvKmBXdE1eLbRiOzcbTL5OB5
	 9zdRJCIKYNQs/eNIyDWedYgePOZ6pgF/12gnsFPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14288F804B0;
	Mon, 21 Jun 2021 16:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04E0F8025A; Fri, 18 Jun 2021 00:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BAF2F80148
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 00:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BAF2F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="huvrHHpH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AF9E613C2
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 22:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623968224;
 bh=8lLNvAQJFBYHcwyHgNEpUKH4liF//tJL8IXh/++g2VQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=huvrHHpH2Av8vejTexiFgCIX8gaey/rp/0fjLnRAt1uHvre0POa9FMvPn6CSKF4vP
 c1dyDYSMYo16eAP+y8b7jCtqCSK/GxM08QdxX1G394l3E8JBesdgSfezsVwCObf+XY
 7aWLgTlzsBBO6TKNEHxE7nsZ/+OgD85yLW8ohdjh7wOtV4YkqobaNmS5taze+KHWCO
 fK6lrJ8I7DNEWJB2YicAQ/PLhU6Y66Is1uaJonoeXzDn/9t9wK0lIH/tQqckcXFuET
 u5Swl2hwja6dodRo6iE7Vpv+Vl8JR6ZLXVJxbLuKQjO/HsCiolAUliP6AHbf478B1T
 ZnwiO+IrhijxQ==
Received: by mail-ej1-f49.google.com with SMTP id gb32so4321289ejc.2
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 15:17:03 -0700 (PDT)
X-Gm-Message-State: AOAM5324NoFXOMN/CEJWcIF3F0oc/jqHVnrvSWs4omgIqvBuDifUeFxX
 6irjCXHUBJRcTiq6s/gFy/azeSJWt89hvAsimg==
X-Google-Smtp-Source: ABdhPJxzgkf6C07sPN7yjl1phyvHCv9pAxXmIQ1iuWsb7n6aw/LK46UKCpGaWvweVtQco41YaA9gmDx268LBgSxFl4o=
X-Received: by 2002:a17:907:264b:: with SMTP id
 ar11mr7391845ejc.525.1623968222450; 
 Thu, 17 Jun 2021 15:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
 <bb8c18f6-139d-76be-87e7-0c93e03cc92c@ti.com>
In-Reply-To: <bb8c18f6-139d-76be-87e7-0c93e03cc92c@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 17 Jun 2021 16:16:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+-ggeBMT_507HN+mM1KirM+w2ZnhZNe+Q7tRsFRJxDOw@mail.gmail.com>
Message-ID: <CAL_Jsq+-ggeBMT_507HN+mM1KirM+w2ZnhZNe+Q7tRsFRJxDOw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Jun 2021 16:10:06 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 linux-phy@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, iommu@lists.linux-foundation.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Alessandro Zummo <a.zummo@towertech.it>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wolfgang Grandegger <wg@grandegger.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

On Thu, Jun 17, 2021 at 10:06 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 6/15/21 2:15 PM, Rob Herring wrote:
> > If a property has an 'items' list, then a 'minItems' or 'maxItems' with=
 the
> > same size as the list is redundant and can be dropped. Note that is DT
> > schema specific behavior and not standard json-schema behavior. The too=
ling
> > will fixup the final schema adding any unspecified minItems/maxItems.
> >
> > This condition is partially checked with the meta-schema already, but
> > only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> > An improved meta-schema is pending.
> >
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Jassi Brar <jassisinghbrar@gmail.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Wolfgang Grandegger <wg@grandegger.com>
> > Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Vivien Didelot <vivien.didelot@gmail.com>
> > Cc: Vladimir Oltean <olteanv@gmail.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Ohad Ben-Cohen <ohad@wizery.com>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Zhang Rui <rui.zhang@intel.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/ata/nvidia,tegra-ahci.yaml          | 1 -
> >  .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml  | 2 --
> >  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 1 -
> >  Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml | 2 --
> >  .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml          | 2 --
> >  .../devicetree/bindings/clock/sprd,sc9863a-clk.yaml         | 1 -
> >  .../devicetree/bindings/crypto/allwinner,sun8i-ce.yaml      | 2 --
> >  Documentation/devicetree/bindings/crypto/fsl-dcp.yaml       | 1 -
> >  .../display/allwinner,sun4i-a10-display-backend.yaml        | 6 ------
> >  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml      | 1 -
> >  .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml      | 4 ----
> >  .../bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml     | 2 --
> >  .../bindings/display/allwinner,sun8i-r40-tcon-top.yaml      | 2 --
> >  .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 2 --
> >  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 2 --
> >  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 2 --
> >  .../devicetree/bindings/display/st,stm32-ltdc.yaml          | 1 -
> >  .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml | 4 ----
> >  .../devicetree/bindings/dma/renesas,rcar-dmac.yaml          | 1 -
> >  .../devicetree/bindings/edac/amazon,al-mc-edac.yaml         | 2 --
> >  Documentation/devicetree/bindings/eeprom/at24.yaml          | 1 -
> >  Documentation/devicetree/bindings/example-schema.yaml       | 2 --
> >  Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml     | 1 -
> >  Documentation/devicetree/bindings/gpu/vivante,gc.yaml       | 1 -
> >  Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml | 1 -
> >  .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml        | 2 --
> >  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml         | 1 -
> >  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml   | 1 -
> >  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml     | 2 --
> >  .../bindings/interrupt-controller/fsl,irqsteer.yaml         | 1 -
> >  .../bindings/interrupt-controller/loongson,liointc.yaml     | 1 -
> >  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml    | 1 -
> >  .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml       | 1 -
> >  .../devicetree/bindings/mailbox/st,stm32-ipcc.yaml          | 2 --
> >  .../devicetree/bindings/media/amlogic,gx-vdec.yaml          | 1 -
> >  Documentation/devicetree/bindings/media/i2c/adv7604.yaml    | 1 -
> >  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml        | 1 -
> >  .../devicetree/bindings/media/qcom,sc7180-venus.yaml        | 1 -
> >  .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml     | 1 -
> >  .../devicetree/bindings/media/qcom,sm8250-venus.yaml        | 1 -
> >  Documentation/devicetree/bindings/media/renesas,drif.yaml   | 1 -
> >  .../bindings/memory-controllers/mediatek,smi-common.yaml    | 6 ++----
> >  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 1 -
> >  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml    | 2 --
> >  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml    | 1 -
> >  Documentation/devicetree/bindings/mmc/mtk-sd.yaml           | 2 --
> >  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml     | 2 --
> >  Documentation/devicetree/bindings/mmc/sdhci-am654.yaml      | 1 -
> >  Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml        | 1 -
> >  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml        | 2 --
> >  .../devicetree/bindings/net/brcm,bcm4908-enet.yaml          | 2 --
> >  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml  | 2 --
> >  Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml     | 2 --
> >  Documentation/devicetree/bindings/net/snps,dwmac.yaml       | 2 --
> >  Documentation/devicetree/bindings/net/stm32-dwmac.yaml      | 1 -
> >  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml    | 2 --
> >  Documentation/devicetree/bindings/pci/loongson.yaml         | 1 -
> >  .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml         | 1 -
> >  .../devicetree/bindings/pci/microchip,pcie-host.yaml        | 2 --
> >  Documentation/devicetree/bindings/perf/arm,cmn.yaml         | 1 -
> >  .../devicetree/bindings/phy/brcm,bcm63xx-usbh-phy.yaml      | 1 -
> >  .../devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml       | 3 ---
> >  Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml    | 1 -
> >  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml    | 2 --
> >  .../devicetree/bindings/phy/phy-cadence-sierra.yaml         | 2 --
> >  .../devicetree/bindings/phy/phy-cadence-torrent.yaml        | 4 ----
> >  .../devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml    | 1 -
> >  .../devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml    | 1 -
> >  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml     | 1 -
> >  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml   | 2 --
> >  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 --
> >  Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml | 1 -
> >  .../devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml   | 1 -
> >  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml    | 1 -
> >  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml    | 1 -
> >  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml      | 2 --
> >  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml     | 1 -
> >  .../devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml  | 1 -
> >  Documentation/devicetree/bindings/reset/fsl,imx-src.yaml    | 1 -
> >  .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 1 -
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml    | 1 -
> >  Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml        | 1 -
> >  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml    | 2 --
> >  Documentation/devicetree/bindings/serial/samsung_uart.yaml  | 1 -
> >  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml          | 1 -
> >  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml      | 2 --
> >  .../bindings/sound/nvidia,tegra-audio-graph-card.yaml       | 1 -
> >  .../devicetree/bindings/sound/nvidia,tegra210-i2s.yaml      | 2 --
> >  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml   | 3 ---
> >  .../devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml     | 1 -
> >  .../devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml          | 2 --
> >  .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml          | 2 --
> >  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml   | 1 -
> >  .../bindings/timer/allwinner,sun5i-a13-hstimer.yaml         | 1 -
> >  Documentation/devicetree/bindings/timer/arm,arch_timer.yaml | 1 -
> >  .../devicetree/bindings/timer/arm,arch_timer_mmio.yaml      | 2 --
> >  .../devicetree/bindings/timer/intel,ixp4xx-timer.yaml       | 1 -
> >  .../devicetree/bindings/usb/maxim,max3420-udc.yaml          | 2 --
> >  .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml          | 4 ----
> >  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml    | 3 ---
> >  .../devicetree/bindings/watchdog/st,stm32-iwdg.yaml         | 1 -
> >  101 files changed, 2 insertions(+), 163 deletions(-)
> >
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rpr=
oc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> > index 6070456a7b67..f399743b631b 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> > @@ -57,7 +57,6 @@ properties:
> >
> >    memory-region:
> >      minItems: 2
> > -    maxItems: 8
> >      description: |
> >        phandle to the reserved memory nodes to be associated with the r=
emoteproc
> >        device. There should be at least two reserved memory nodes defin=
ed. The
>
> Does this enforce the maxItems to be 2 only now? Or should this be droppi=
ng the
> minItems here which matches the length of items instead of maxItems?
>
> I have originally listed the individual item list only for the mandatory =
items
> and rest are scalable. I provided this through "additionalItems: true" un=
der
> this property.

Good catch. This should be dropped. The meta-schema doesn't enforce
this if "additionalItems: true" which is rarely used.

> Also, have the exact same usage in
> Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml as well=
 which
> is not included in this patch.

Yeah, I just missed this one. I've double checked and there aren't any more=
.

Rob
