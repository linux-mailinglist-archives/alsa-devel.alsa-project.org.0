Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D378A055
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828E1950;
	Sun, 27 Aug 2023 19:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828E1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155807;
	bh=Txv2hLu3aNTzAJTERw9RD8bqeBXNErQSFrwmmEc0au8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CcC9yj9OzDnfeH55Gu5LnBfdV0AJLtQrH1Q5gOWOjeBwAZACimEFvvkNbUfjJt7As
	 m3xZ8e9ID8GHFlohqzp6sOiEoll+kdigig+4zKfGpvvWr4m/Ygc2xCVOH086gVeDFn
	 TMjkH8yhSqzOa1Mshgc2SHgb1mHVqhKUAS79tPfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A64F80527; Sun, 27 Aug 2023 19:01:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FE47F80527;
	Sun, 27 Aug 2023 19:01:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35606F80158; Thu, 24 Aug 2023 16:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 526CBF80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 16:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 526CBF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Kp/1S1ZF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 429A26509A;
	Thu, 24 Aug 2023 14:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C84DC433C8;
	Thu, 24 Aug 2023 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692886118;
	bh=Txv2hLu3aNTzAJTERw9RD8bqeBXNErQSFrwmmEc0au8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kp/1S1ZFiWvvuWExBcwO/OObuBsvLi9vpHONcBnBulHBYsKh6etFwSXLCht3YMPDY
	 q3DtqvUXyK6BuS6p7O0E1EvsuLphrBEvXUuCl4B2cV+DmABIhs09OJ8UWPmhbtzW8T
	 plYop65+oQA6dhe+cH4ywZPp2RO25QXDLDsIYi+xjGEg0zEyfQkT/2ac89u8jeiRsc
	 A8YQPQX0/xIoUfBHcIK6l6YATFhR34HKsIw/R/5jvau4fSX0FRplzzUqgJ0uuIuEZR
	 0L5r3b0+iLneCymF/gr/VEJTqFQnTrOkt3gkgNBludZ4GuF3IyCco/vzA3UUROOlv8
	 iL0wOedoKYCTQ==
Received: (nullmailer pid 715627 invoked by uid 1000);
	Thu, 24 Aug 2023 14:08:33 -0000
Date: Thu, 24 Aug 2023 09:08:33 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, James Clark <james.clark@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 openipmi-developer@lists.sourceforge.net, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Corey Minyard <minyard@acm.org>, Chen-Yu Tsai <wens@csie.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Leo Yan <leo.yan@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-i3c@lists.infradead.org, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mips@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-scsi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linux-i2c@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-hwmon@vger.kernel.org,
 linux-mmc@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Andy Shevchenko <andy@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 M ark Brown <broonie@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, coresight@lists.linaro.org,
 Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <169288610889.715445.11107086315099689865.robh@kernel.org>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-MailFrom: SRS0=Q3Mp=EJ=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BEAJITXMS7SEKHB7U6WQCXTSNXGUI3QA
X-Message-ID-Hash: BEAJITXMS7SEKHB7U6WQCXTSNXGUI3QA
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEAJITXMS7SEKHB7U6WQCXTSNXGUI3QA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 23 Aug 2023 13:28:47 -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/arm,embedded-trace-extension.yaml   |  4 ++--
>  .../bindings/arm/arm,trace-buffer-extension.yaml     |  7 ++++---
>  .../devicetree/bindings/arm/arm,vexpress-juno.yaml   |  2 +-
>  .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml   |  4 ++--
>  .../arm/firmware/tlm,trusted-foundations.yaml        |  4 ++--
>  .../bindings/arm/mstar/mstar,l3bridge.yaml           |  4 ++--
>  .../devicetree/bindings/arm/mstar/mstar,smpctrl.yaml |  4 ++--
>  .../devicetree/bindings/arm/stm32/st,mlahb.yaml      |  4 ++--
>  .../bindings/arm/stm32/st,stm32-syscon.yaml          |  4 ++--
>  .../devicetree/bindings/connector/usb-connector.yaml |  4 ++--
>  Documentation/devicetree/bindings/eeprom/at24.yaml   |  4 ++--
>  Documentation/devicetree/bindings/eeprom/at25.yaml   |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  4 ++--
>  .../bindings/gpio/x-powers,axp209-gpio.yaml          |  4 ++--
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml      |  4 ++--
>  .../devicetree/bindings/gpio/xylon,logicvc-gpio.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml         |  4 ++--
>  .../bindings/hwmon/starfive,jh71x0-temp.yaml         |  8 ++++----
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml        |  4 ++--
>  .../devicetree/bindings/iio/accel/fsl,mma7455.yaml   |  4 ++--
>  .../bindings/iio/adc/atmel,sama9260-adc.yaml         |  4 ++--
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml        |  8 ++++----
>  .../devicetree/bindings/ipmi/ipmi-ipmb.yaml          |  2 +-
>  .../devicetree/bindings/ipmi/ipmi-smic.yaml          |  2 +-
>  .../bindings/media/qcom,msm8916-venus.yaml           |  4 ++--
>  .../bindings/mips/loongson/ls2k-reset.yaml           |  4 ++--
>  .../bindings/mips/loongson/rs780e-acpi.yaml          |  4 ++--
>  .../misc/intel,ixp4xx-ahb-queue-manager.yaml         |  4 ++--
>  .../devicetree/bindings/mmc/marvell,xenon-sdhci.yaml |  4 ++--
>  .../bindings/mtd/microchip,mchp48l640.yaml           |  4 ++--
>  .../devicetree/bindings/soc/aspeed/uart-routing.yaml |  4 ++--
>  .../bindings/soc/intel/intel,hps-copy-engine.yaml    |  4 ++--
>  .../bindings/soc/litex/litex,soc-controller.yaml     |  4 ++--
>  .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml     |  4 ++--
>  .../devicetree/bindings/soc/ti/k3-ringacc.yaml       |  4 ++--
>  .../devicetree/bindings/sound/dialog,da7219.yaml     |  4 ++--
>  .../bindings/sound/nvidia,tegra-audio-max9808x.yaml  | 12 ++++++------
>  .../bindings/sound/nvidia,tegra-audio-rt5631.yaml    |  8 ++++----
>  .../devicetree/bindings/ufs/ufs-common.yaml          |  2 +-
>  .../bindings/watchdog/toshiba,visconti-wdt.yaml      |  4 ++--
>  40 files changed, 88 insertions(+), 87 deletions(-)
> 

Applied, thanks!

