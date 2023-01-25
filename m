Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E467C56D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:03:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC29E96;
	Thu, 26 Jan 2023 09:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC29E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720232;
	bh=v+B+KDBEA50AHtVt9lQ1BTuMYwoPUgbIgH8/Amio1lE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N3dxznonw+1UjWi2nUzaXVecajFnYsAzv5XFTaecPs9R1GhV2gaxgaXu97f9u0ool
	 Exu0BoZalyBSp93M3hEFw8BalQATCQ54hXe0I7GkNsc29Uc8kjS6GtfTz618K8sAUg
	 cpSKOwuzxfrH6sbNcn4v6XaWcfLOTdxJ84+Ddkdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 003FFF80603;
	Thu, 26 Jan 2023 08:55:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24AE5F80424; Wed, 25 Jan 2023 16:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3670F800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 16:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3670F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hSoessef
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B706DB819F3;
 Wed, 25 Jan 2023 15:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC81C433EF;
 Wed, 25 Jan 2023 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674659344;
 bh=v+B+KDBEA50AHtVt9lQ1BTuMYwoPUgbIgH8/Amio1lE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hSoessefOv16Xt7Qbj98AdgmJicOcikMVtEdI8hVuvfe5IRYVPezihO/irb3buQZt
 3ZFdNvsViDwPHeE3Jm/XuN6iGzIm1ESIZsv0lbDa1vk4s6rEEf6cKYM+bN/iuQe9VW
 P/Svjep8k+fSgfN9zyFG7lQqfCHheo29BxDr+K+4T3lE67taLSodJ3E7d4EG4RrRqe
 73RJMrkg3YqzKBZH4GY2t14YGyMJND9cOXmrIKdYBcHjYwCgCzhERtbbPGPR5fu5EG
 NLAP3xoucfO28ZdQF16a1/t4V81l7sTg4luWlxs+aH+wX1wDHuET+t7+76hhEK6te3
 8HtxOatriltJw==
Date: Wed, 25 Jan 2023 15:08:54 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <Y9FGBqFKMxL3XraK@google.com>
References: <20230124230228.372305-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:02 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>, openbmc@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 24 Jan 2023, Rob Herring wrote:

> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
> 
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Bartosz Golaszewski <brgl@bgdev.pl>
> To: Jean Delvare <jdelvare@suse.com>
> To: Guenter Roeck <linux@roeck-us.net>
> To: Thomas Gleixner <tglx@linutronix.de>
> To: Marc Zyngier <maz@kernel.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Lee Jones <lee@kernel.org>
> To: Ulf Hansson <ulf.hansson@linaro.org>
> To: Richard Weinberger <richard@nod.at>
> To: Vignesh Raghavendra <vigneshr@ti.com>
> To: Sebastian Reichel <sre@kernel.org>
> To: Mark Brown <broonie@kernel.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@linaro.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
>  .../devicetree/bindings/arm/arm,vexpress-juno.yaml     |  1 +
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml |  5 +++--
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml         |  4 ++++
>  .../bindings/bus/allwinner,sun50i-a64-de2.yaml         |  1 +
>  .../bindings/bus/allwinner,sun8i-a23-rsb.yaml          |  1 +
>  .../bus/intel,ixp4xx-expansion-bus-controller.yaml     |  6 ++++++
>  Documentation/devicetree/bindings/bus/palmbus.yaml     |  1 +
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml     |  5 +++++
>  Documentation/devicetree/bindings/example-schema.yaml  |  2 ++
>  .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +
>  .../devicetree/bindings/hwmon/adi,ltc2992.yaml         |  1 +
>  .../bindings/interrupt-controller/arm,gic-v3.yaml      |  2 ++
>  .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml      |  1 +
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml   |  7 +++++++
>  .../bindings/memory-controllers/arm,pl35x-smc.yaml     |  1 +
>  .../bindings/memory-controllers/exynos-srom.yaml       |  1 +
>  .../memory-controllers/nvidia,tegra124-emc.yaml        |  1 +
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml |  1 +
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml       |  2 ++
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml          |  1 +
>  Documentation/devicetree/bindings/mtd/mtd.yaml         |  1 +
>  .../devicetree/bindings/power/supply/ti,lp8727.yaml    |  1 +
>  .../devicetree/bindings/soc/imx/fsl,imx93-src.yaml     |  3 ++-
>  .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml   |  1 +
>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml |  1 +
>  .../devicetree/bindings/sound/marvell,mmp-sspa.yaml    |  1 +
>  .../devicetree/bindings/sound/qcom,wcd934x.yaml        |  1 +
>  .../devicetree/bindings/sound/samsung,odroid.yaml      |  2 ++
>  .../devicetree/bindings/soundwire/qcom,soundwire.yaml  |  1 +
>  .../bindings/spi/allwinner,sun4i-a10-spi.yaml          |  1 +
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml          |  1 +
>  .../devicetree/bindings/spi/spi-controller.yaml        |  1 +
>  .../sram/allwinner,sun4i-a10-system-control.yaml       | 10 +++++-----
>  Documentation/devicetree/bindings/sram/qcom,ocmem.yaml |  1 +
>  .../devicetree/bindings/thermal/thermal-zones.yaml     |  1 +
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml   |  1 +
>  36 files changed, 65 insertions(+), 8 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
