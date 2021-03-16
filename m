Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B53401BB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:17:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB03516CA;
	Thu, 18 Mar 2021 10:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB03516CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059075;
	bh=6Ntr41joKdzYd2oTL43b6ZjFdg2KhZZ54n5JrbsME6g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tefcu+ytpalGZ4VqYVreQ197M1srhoVSGkAY8Sfc0CNYrDKtDVIyZ0AY2NF9nIGUw
	 vz9TWnD0tehJC6Qzz0jqi3v6coTd0GE6XGK4hYLvlJmdeFe+Q3YLDFxOSMC5yHNAwt
	 f6FjqQ5HMiLRveTOtomnYC5hj9YKgsBJOjDvrhwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7FCF8027D;
	Thu, 18 Mar 2021 10:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C9C6F80163; Tue, 16 Mar 2021 20:49:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43959F80137
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 20:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43959F80137
Received: by mail-io1-f52.google.com with SMTP id z13so38519991iox.8
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 12:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nYYbB/MvNICmbzKUBm6FshvqUohLol3/xqrqx7tCQX4=;
 b=b4rN0L6JFy5VE/1+nCDBiuYG63UlMvvmAoxqqoZSV6MbbC0hSdla8E5Bi9DcQ2SR0K
 aF3QJ4uu1k3Vdf71V+U6PIuN9PpOTiOG+WrsRmT17f3EXYkj4sYachBS3B9vkS5jKBYj
 b3H5hVpT5war0qJ39SPy5nsSTyNXIlRX1UcEqmK3PjEeG8MTvUl5c4Zb6S695hPzWETn
 FqD7KY8owLzilrgy8rV2XcalZUvN4sCH91eJSfROM3P36BfDaSiYwpPFfsrF6ldYSvWI
 geNUq8D3qwaGQzMG4JzEYBbnnkAP5L7xH9Wzv6VHUAt26dr5zd/X4b7h7AEJDgjth4I2
 owGg==
X-Gm-Message-State: AOAM530pF1p6bVV9i3OUkElno4A1t+wABcrEPOQ654bbfl3EvIwga38F
 eyFNONjt1rSsGATE/KEdjA==
X-Google-Smtp-Source: ABdhPJyfKHN75oX9DqIWGa8mzjKjBfLAAbD9JS24/mUfiYq5VYpbqhkIBDBomlyjMHHH7SbUSGgDxg==
X-Received: by 2002:a05:6602:2287:: with SMTP id
 d7mr4699829iod.42.1615924143956; 
 Tue, 16 Mar 2021 12:49:03 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id x24sm8965888iob.28.2021.03.16.12.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 12:49:02 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Drop type references on common properties
Date: Tue, 16 Mar 2021 13:48:58 -0600
Message-Id: <20210316194858.3527845-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Suman Anna <s-anna@ti.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Odelu Kukatla <okukatla@codeaurora.org>,
 linux-pm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Benson Leung <bleung@chromium.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 netdev@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

Users of common properties shouldn't have a type definition as the
common schemas already have one. Drop all the unnecessary type
references in the tree.

A meta-schema update to catch these is pending.

Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <wahrenst@gmx.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Odelu Kukatla <okukatla@codeaurora.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-can@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml       | 5 +----
 Documentation/devicetree/bindings/arm/cpus.yaml              | 2 --
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml           | 1 -
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 3 +--
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 1 -
 .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
 .../bindings/memory-controllers/nvidia,tegra210-emc.yaml     | 2 +-
 Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml   | 1 -
 Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
 Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 --
 .../devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml   | 2 +-
 Documentation/devicetree/bindings/sound/ak4642.yaml          | 2 --
 .../devicetree/bindings/sound/google,cros-ec-codec.yaml      | 2 +-
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml    | 1 -
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml       | 1 -
 Documentation/devicetree/bindings/usb/usb.yaml               | 1 -
 16 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index a2c63c8b1d10..c6144c8421fa 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -26,10 +26,7 @@ properties:
       - const: simple-mfd
 
   mboxes:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Phandle to the firmware device's Mailbox.
-      (See: ../mailbox/mailbox.txt for more information)
+    maxItems: 1
 
   clocks:
     type: object
diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 26b886b20b27..6be4a8852ee5 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -256,13 +256,11 @@ properties:
       where voltage is in V, frequency is in MHz.
 
   power-domains:
-    $ref: '/schemas/types.yaml#/definitions/phandle-array'
     description:
       List of phandles and PM domain specifiers, as defined by bindings of the
       PM domain provider (see also ../power_domain.txt).
 
   power-domain-names:
-    $ref: '/schemas/types.yaml#/definitions/string-array'
     description:
       A list of power domain name strings sorted in the same order as the
       power-domains property.
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index c13faf3e6581..3a7d5d731712 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -73,7 +73,6 @@ properties:
   clock-output-names:
     description:
       Name of the LCD pixel clock created.
-    $ref: /schemas/types.yaml#/definitions/string-array
     maxItems: 1
 
   dmas:
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index 1a54db04f29d..bcafa494ed7a 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -43,8 +43,7 @@ properties:
 
   gpio-ranges: true
 
-  gpio-ranges-group-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
+  gpio-ranges-group-names: true
 
   socionext,interrupt-ranges:
     description: |
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 6f2398cdc82d..1e7894e524f9 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -102,7 +102,6 @@ patternProperties:
 
       st,adc-channel-names:
         description: List of single-ended channel names.
-        $ref: /schemas/types.yaml#/definitions/string-array
 
       st,filter-order:
         description: |
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index 799e73cdb90b..13da7b29c707 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -82,7 +82,6 @@ properties:
       this interconnect to send RPMh commands.
 
   qcom,bcm-voter-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description: |
       Names for each of the qcom,bcm-voters specified.
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
index 49ab09252e52..bc8477e7ab19 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -34,7 +34,7 @@ properties:
       - description: EMC general interrupt
 
   memory-region:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
       phandle to a reserved memory region describing the table of EMC
       frequencies trained by the firmware
diff --git a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
index fe6a949a2eab..55bff1586b6f 100644
--- a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
+++ b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
@@ -57,7 +57,6 @@ properties:
       - const: per
 
   clock-frequency:
-    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       The oscillator frequency driving the flexcan device, filled in by the
       boot loader. This property should only be used the used operating system
diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 8f86084bf12e..4e8dee4aa90d 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -100,7 +100,6 @@ properties:
       - description: Whether the IPA clock is enabled (if valid)
 
   qcom,smem-state-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description: The names of the state bits used for SMP2P output
     items:
       - const: ipa-clock-enabled-valid
diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
index d5d7f113bade..828e4a1ece41 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
@@ -23,12 +23,10 @@ properties:
       List of phandle to the nvmem data cells.
 
   nvmem-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description:
       Names for the each nvmem provider.
 
   nvmem-cell-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description:
       Names for each nvmem-cells specified.
 
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
index 1a1159097a2a..73400bc6e91d 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
@@ -93,7 +93,7 @@ properties:
 # The following are the optional properties:
 
   memory-region:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description: |
       phandle to the reserved memory node to be associated
       with the remoteproc device. The reserved memory node
diff --git a/Documentation/devicetree/bindings/sound/ak4642.yaml b/Documentation/devicetree/bindings/sound/ak4642.yaml
index 6cd213be2266..1e2caa29790e 100644
--- a/Documentation/devicetree/bindings/sound/ak4642.yaml
+++ b/Documentation/devicetree/bindings/sound/ak4642.yaml
@@ -29,11 +29,9 @@ properties:
 
   clock-frequency:
     description: common clock binding; frequency of MCKO
-    $ref: /schemas/types.yaml#/definitions/uint32
 
   clock-output-names:
     description: common clock name
-    $ref: /schemas/types.yaml#/definitions/string
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
index acfb9db021dc..77adbebed824 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
@@ -32,7 +32,7 @@ properties:
           The last one integer is the length of the shared memory.
 
   memory-region:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    maxItems: 1
     description: |
       Shared memory region to EC.  A "shared-dma-pool".
       See ../reserved-memory/reserved-memory.txt for details.
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 2e1046513603..e494a0416748 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -78,7 +78,6 @@ properties:
 
   clock-frequency:
     description: for audio_clkout0/1/2/3
-    $ref: /schemas/types.yaml#/definitions/uint32-array
 
   clkout-lr-asynchronous:
     description: audio_clkoutn is asynchronizes with lr-clock.
diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
index 95a728f4d333..3ea8c0c1f45f 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
@@ -59,7 +59,6 @@ patternProperties:
 
     properties:
       reg:
-        $ref: /schemas/types.yaml#/definitions/uint32
         description: Specify the sensor channel. There are 8 channels in PMIC5's ADC TM
         minimum: 0
         maximum: 7
diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
index 78491e66ed24..939f217b8c7b 100644
--- a/Documentation/devicetree/bindings/usb/usb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -16,7 +16,6 @@ properties:
     pattern: "^usb(@.*)?"
 
   phys:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
       List of all the USB PHYs on this HCD
 
-- 
2.27.0

