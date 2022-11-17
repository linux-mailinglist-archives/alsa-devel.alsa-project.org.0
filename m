Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB78630D76
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:46:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3795816E9;
	Sat, 19 Nov 2022 09:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3795816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847594;
	bh=ap3Yepnmz1ej9lRU7fXGZI5Vw44VE2yp4UB7EQjKtA4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRt3joj71oO1zZZoIMO1M+L9Osjukw/vTgGE4AcxLC5wjR6OVCcVZUJ47F+1GnVIp
	 OP6MxzUL2Dgj6aWL/3a8dvC3IfHAVBc5OKmUWMudmX7ri5aaJFGNoi0dG1ExaARWVt
	 gKZXMWfxA78S0yBNKN7nwF9B+5TyeL3Ro79IL9iU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF070F805D9;
	Sat, 19 Nov 2022 09:40:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62168F8025A; Thu, 17 Nov 2022 16:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4F28F80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 16:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4F28F80087
Received: from frapeml500004.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NCk3g38XBz688Z4;
 Thu, 17 Nov 2022 23:14:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml500004.china.huawei.com (7.182.85.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 16:17:05 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 17 Nov
 2022 15:17:04 +0000
Date: Thu, 17 Nov 2022 15:17:03 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <20221117151703.00006bf8@Huawei.com>
In-Reply-To: <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:31 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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

On Thu, 17 Nov 2022 13:38:42 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for IIO.

Looked briefly at the rest and only found the issue Andrew Lunn pointed out.
Otherwise all seem fine to me.

Jonathan


> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/dma-common.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml     | 4 ++--
>  Documentation/devicetree/bindings/dma/dma-router.yaml         | 4 ++--
>  Documentation/devicetree/bindings/iio/adc/adc.yaml            | 2 +-
>  .../devicetree/bindings/media/video-interface-devices.yaml    | 2 +-
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml    | 2 +-
>  .../bindings/net/bluetooth/bluetooth-controller.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/can/can-controller.yaml | 2 +-
>  .../devicetree/bindings/net/ethernet-controller.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml       | 2 +-
>  Documentation/devicetree/bindings/net/mdio.yaml               | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml        | 2 +-
>  .../devicetree/bindings/power/reset/restart-handler.yaml      | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc.yaml                | 2 +-
>  .../devicetree/bindings/soundwire/soundwire-controller.yaml   | 2 +-
>  Documentation/devicetree/bindings/spi/spi-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml      | 2 +-
>  21 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 1ab416c83c8d..d2de3d128b73 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Global Clock & Reset Controller Common Bindings
> +title: Qualcomm Global Clock & Reset Controller common parts
>  
>  maintainers:
>    - Stephen Boyd <sboyd@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
> index ad06d36af208..9b7b94fdbb0b 100644
> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/dma/dma-common.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Engine Generic Binding
> +title: DMA Engine common properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-controller.yaml b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> index 6d3727267fa8..225a141c7b5c 100644
> --- a/Documentation/devicetree/bindings/dma/dma-controller.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> @@ -4,13 +4,13 @@
>  $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Controller Generic Binding
> +title: DMA Controller common properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  allOf:
> -  - $ref: "dma-common.yaml#"
> +  - $ref: dma-common.yaml#
>  
>  # Everything else is described in the common file
>  properties:
> diff --git a/Documentation/devicetree/bindings/dma/dma-router.yaml b/Documentation/devicetree/bindings/dma/dma-router.yaml
> index 4b817f5dc30e..0ebd7bc6232b 100644
> --- a/Documentation/devicetree/bindings/dma/dma-router.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-router.yaml
> @@ -4,13 +4,13 @@
>  $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Router Generic Binding
> +title: DMA Router common properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  allOf:
> -  - $ref: "dma-common.yaml#"
> +  - $ref: dma-common.yaml#
>  
>  description:
>    DMA routers are transparent IP blocks used to route DMA request
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> index db348fcbb52c..bd0f5fae256e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/adc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic IIO bindings for ADC channels
> +title: IIO common properties for ADC channels
>  
>  maintainers:
>    - Jonathan Cameron <jic23@kernel.org>
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index 4527f56a5a6e..bd719cb1813e 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/video-interface-devices.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common bindings for video receiver and transmitter devices
> +title: Common properties for video receiver and transmitter devices
>  
>  maintainers:
>    - Jacopo Mondi <jacopo@jmondi.org>
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 68c3b9871cf3..e8cf73794772 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/video-interfaces.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common bindings for video receiver and transmitter interface endpoints
> +title: Common properties for video receiver and transmitter interface endpoints
>  
>  maintainers:
>    - Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 802e3ca8be4d..a17f49738abd 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mmc/mmc-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MMC Controller Generic Binding
> +title: MMC Controller common properties
>  
>  maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> index 97ac3a3fbb52..20b195ef9b70 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NAND Chip and NAND Controller Generic Binding
> +title: NAND Chip and NAND Controller common properties
>  
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 359a015d4e5a..a004efc42842 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NAND Chip and NAND Controller Generic Binding
> +title: NAND Chip and NAND Controller common properties
>  
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml b/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> index 9309dc40f54f..8715adff5eaf 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/bluetooth/bluetooth-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Bluetooth Controller Generic Binding
> +title: Bluetooth Controller common properties
>  
>  maintainers:
>    - Marcel Holtmann <marcel@holtmann.org>
> diff --git a/Documentation/devicetree/bindings/net/can/can-controller.yaml b/Documentation/devicetree/bindings/net/can/can-controller.yaml
> index 1f0e98051074..3747b46cf9b6 100644
> --- a/Documentation/devicetree/bindings/net/can/can-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/can/can-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/can/can-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: CAN Controller Generic Binding
> +title: CAN Controller common properties
>  
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 3aef506fa158..26502c0f2aff 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet Controller Generic Binding
> +title: Ethernet Controller common properties
>  
>  maintainers:
>    - David S. Miller <davem@davemloft.net>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index ad808e9ce5b9..0aa1b60e78cc 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet PHY Generic Binding
> +title: Ethernet PHY common properties
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> index b5706d4e7e38..b184689dd6b2 100644
> --- a/Documentation/devicetree/bindings/net/mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/mdio.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MDIO Bus Generic Binding
> +title: MDIO Bus common properties
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> index cf9c2f7bddc2..20ac432dc683 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic OPP (Operating Performance Points) Common Binding
> +title: Generic OPP (Operating Performance Points) common parts
>  
>  maintainers:
>    - Viresh Kumar <viresh.kumar@linaro.org>
> diff --git a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> index 1f9a2aac53c0..8b52fd156d4c 100644
> --- a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/reset/restart-handler.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Restart and shutdown handler generic binding
> +title: Restart and shutdown handler common properties
>  
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index 0ec3551f12dd..00848a5a409e 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/rtc/rtc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: RTC Generic Binding
> +title: Real Time Clock common properties
>  
>  maintainers:
>    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> index 4aad121eff3f..2176033850dc 100644
> --- a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SoundWire Controller Generic Binding
> +title: SoundWire Controller common properties
>  
>  maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 01042a7f382e..6bbe073f894b 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/spi/spi-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SPI Controller Generic Binding
> +title: SPI Controller common properties
>  
>  maintainers:
>    - Mark Brown <broonie@kernel.org>
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> index e3dfb02f0ca5..6875cf1c3159 100644
> --- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/watchdog/watchdog.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Watchdog Generic Bindings
> +title: Watchdog common properties
>  
>  maintainers:
>    - Guenter Roeck <linux@roeck-us.net>

