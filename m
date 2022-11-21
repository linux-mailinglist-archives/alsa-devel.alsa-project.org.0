Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B131D63388B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:32:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476E21678;
	Tue, 22 Nov 2022 10:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476E21678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109574;
	bh=03XHa5APn9xcrhe2Jm8RHaMfmQhpKkU+HIomlyYM+XU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uB73bN2hJg1ASOE7IO7l81x2j2DAUNZUKdQHzDrmnqGh7hQJy9g8Rjl2zf1FbuqG+
	 fdX1f83/PukTd91LsI2s9+OtlVkZMUCFK46gPmoCMDhhSDFz7UJyZS3ydnWj9rQ3YC
	 wWwh38T3P8peBzpi9ix9wxky08jm7GOtzWCAJtVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A50AF805D3;
	Tue, 22 Nov 2022 10:27:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BAC1F804B1; Mon, 21 Nov 2022 12:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1341EF80149
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 12:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1341EF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OFuE9/4k"
Received: by mail-lf1-x12a.google.com with SMTP id c1so18276300lfi.7
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9G5glcqTTNsFXoqERQyI4nK43OsyCP6dvDkzTWOAug=;
 b=OFuE9/4kdVsIn6qlc00yVtvHA0GKVtlaitlxeGN0HFfGJciEczP9AL+wjsWnzfDhqd
 Nz6NBPtQho23iI0ddF/B8CEe/bpBMksdyauDp6PISQB0mpPvGGYywKu+mXKWb6Q/jCRp
 KOF6cdI1l3fbo5NfTALy9tepKPB4+LE4aFPWMRtemgh1ymmv8u5CLtjZEUtEhFWmYgaG
 gAvyDBINsOxx9dUs1qu3ZyyvC2bzxOYou/VTxBGUqHC+2Jacz+73YihChRkwpwobneby
 79R2HW3OyEadYioaN/xwWsapdkTXmo1zeyZL8ljl24lEU6Y4/3pQVPc5/P4IpdRCJys2
 /HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9G5glcqTTNsFXoqERQyI4nK43OsyCP6dvDkzTWOAug=;
 b=eNbhWI2/4HpdlTgbKSJcQZwmMf0Z8G0NoOFEQ7W4/AsY5LlxHQ5pGx44Aqkx5+MB0b
 0SXlVmwQfdG30J3APq8wAH5wzzHbg0GLFerVGE5ewTfasZvvN8iFLnrwLE4zA3wNugZg
 I2U6AJGrR8lBZwCPzvNlm+x384KA1c0PP2prK0tb0OXatL7wPi80qVn3RwUsFSp5gmAJ
 pLJkbt6fSmtXIZkcsGB1cLD2HRNlwceUx6gKY/ikTcOGYbiT5bFANd/sQUXKmkSrO3nk
 UAGcF61ctNBLQdk4bsQaPmC6jcSi78sNQ3rkGRQS1AbUczNF5L+MmhjIYA1HBd4Odzfs
 xyTw==
X-Gm-Message-State: ANoB5pk6mrrK4ZOt3ZHhr7PqL2fRwOwFVczIDxc3dFVS0XzKbmbxmMD1
 FRYKzZ2HIJY0lo8fRoQIYkzy0Q==
X-Google-Smtp-Source: AA0mqf7/F1ua4aZQ+Td9IIhcrn7EFoeWJkLW7jdqkTK/poRoJKeWOiT10blX4mGbRkDfSyUP83WvhA==
X-Received: by 2002:a05:6512:104b:b0:4b4:cf91:3419 with SMTP id
 c11-20020a056512104b00b004b4cf913419mr1519807lfb.161.1669028791203; 
 Mon, 21 Nov 2022 03:06:31 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05651203e100b0049313f77755sm1991521lfq.213.2022.11.21.03.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:06:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Viresh Kumar <vireshk@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 5/9] dt-bindings: drop redundant part of title (end,
 part two)
Date: Mon, 21 Nov 2022 12:06:11 +0100
Message-Id: <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

The Devicetree bindings document does not have to say in the title that
it is a "binding", but instead just describe the hardware.

Drop trailing "Node|Tree|Generic bindings" in various forms (also with
trailling full stop):

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -not -name 'trivial-devices.yaml' \
    -exec sed -i -e 's/^title: \(.*\) [nN]ode [bB]indings\?\.\?$/title: \1/' {} \;

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -not -name 'trivial-devices.yaml' \
    -exec sed -i -e 's/^title: \(.*\) [tT]ree [bB]indings\?\.\?$/title: \1/' {} \;

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -not -name 'trivial-devices.yaml' \
    -exec sed -i -e 's/^title: \(.*\) [gG]eneric [bB]indings\?\.\?$/title: \1/' {} \;

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -not -name 'trivial-devices.yaml' \
    -exec sed -i -e 's/^title: \(.*\) [bB]indings\? description\.\?$/title: \1/' {} \;

  find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
    -not -name 'trivial-devices.yaml' \
    -exec sed -i -e 's/^title: \(.*\) [bB]indings\? document\.\?$/title: \1/' {} \;

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/devicetree/bindings/clock/ti,sci-clk.yaml         | 2 +-
 Documentation/devicetree/bindings/cpu/idle-states.yaml          | 2 +-
 .../devicetree/bindings/net/dsa/microchip,lan937x.yaml          | 2 +-
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml         | 2 +-
 Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml   | 2 +-
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 2 +-
 Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml    | 2 +-
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml      | 2 +-
 Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml      | 2 +-
 Documentation/devicetree/bindings/power/domain-idle-state.yaml  | 2 +-
 .../devicetree/bindings/reserved-memory/shared-dma-pool.yaml    | 2 +-
 Documentation/devicetree/bindings/reset/ti,sci-reset.yaml       | 2 +-
 Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml   | 2 +-
 Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml     | 2 +-
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml   | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
index 0e370289a053..63d976341696 100644
--- a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/ti,sci-clk.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI-SCI clock controller node bindings
+title: TI-SCI clock controller
 
 maintainers:
   - Nishanth Menon <nm@ti.com>
diff --git a/Documentation/devicetree/bindings/cpu/idle-states.yaml b/Documentation/devicetree/bindings/cpu/idle-states.yaml
index fa4d4142ac93..b8cc826c9501 100644
--- a/Documentation/devicetree/bindings/cpu/idle-states.yaml
+++ b/Documentation/devicetree/bindings/cpu/idle-states.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Idle states binding description
+title: Idle states
 
 maintainers:
   - Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 630bf0f8294b..b34de303966b 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/net/dsa/microchip,lan937x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LAN937x Ethernet Switch Series Tree Bindings
+title: LAN937x Ethernet Switch Series
 
 maintainers:
   - UNGLinuxDriver@microchip.com
diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 70e328589cfb..f0c78f994491 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -6,7 +6,7 @@
 $id: http://devicetree.org/schemas/net/wireless/mediatek,mt76.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek mt76 wireless devices Generic Binding
+title: MediaTek mt76 wireless devices
 
 maintainers:
   - Felix Fietkau <nbd@nbd.name>
diff --git a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
index 7029cb1f38ff..0e5412cff2bc 100644
--- a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/net/wireless/qca,ath9k.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Atheros ath9k wireless devices Generic Binding
+title: Qualcomm Atheros ath9k wireless devices
 
 maintainers:
   - Toke Høiland-Jørgensen <toke@toke.dk>
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index f7cf135aa37f..556eb523606a 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -6,7 +6,7 @@
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies ath11k wireless devices Generic Binding
+title: Qualcomm Technologies ath11k wireless devices
 
 maintainers:
   - Kalle Valo <kvalo@kernel.org>
diff --git a/Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml
index 70eb48b391c9..527010702f5e 100644
--- a/Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,ns2-pcie-phy.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/phy/brcm,ns2-pcie-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Broadcom NS2 PCIe PHY binding document
+title: Broadcom NS2 PCIe PHY
 
 maintainers:
   - Ray Jui <ray.jui@broadcom.com>
diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index 0655e485b260..aa97478dd016 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/phy/qcom,usb-hs-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm's USB HS PHY binding description
+title: Qualcomm's USB HS PHY
 
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
diff --git a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
index 3a6d686383cf..6d46f57fa1b4 100644
--- a/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml
@@ -5,7 +5,7 @@
 $id: "http://devicetree.org/schemas/phy/ti,phy-gmii-sel.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: CPSW Port's Interface Mode Selection PHY Tree Bindings
+title: CPSW Port's Interface Mode Selection PHY
 
 maintainers:
   - Kishon Vijay Abraham I <kishon@ti.com>
diff --git a/Documentation/devicetree/bindings/power/domain-idle-state.yaml b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
index 4ee920a1de69..ec1f6f669e50 100644
--- a/Documentation/devicetree/bindings/power/domain-idle-state.yaml
+++ b/Documentation/devicetree/bindings/power/domain-idle-state.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: PM Domain Idle States binding description
+title: PM Domain Idle States
 
 maintainers:
   - Ulf Hansson <ulf.hansson@linaro.org>
diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
index 618105f079be..47696073b665 100644
--- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: /reserved-memory DMA pool node bindings
+title: /reserved-memory DMA pool
 
 maintainers:
   - devicetree-spec@vger.kernel.org
diff --git a/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml b/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
index 4639d2cec557..dcf9206e12be 100644
--- a/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reset/ti,sci-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI-SCI reset controller node bindings
+title: TI-SCI reset controller
 
 maintainers:
   - Nishanth Menon <nm@ti.com>
diff --git a/Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml b/Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml
index afc835eda0ef..f436f2cf1df7 100644
--- a/Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/ti,tps380x-reset.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/reset/ti,tps380x-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI TPS380x reset controller node bindings
+title: TI TPS380x reset controller
 
 maintainers:
   - Marco Felsch <kernel@pengutronix.de>
diff --git a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
index 9e6cb4ee9755..5df7688a1e1c 100644
--- a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/soc/ti/sci-pm-domain.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI-SCI generic power domain node bindings
+title: TI-SCI generic power domain
 
 maintainers:
   - Nishanth Menon <nm@ti.com>
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 64654ceef208..f5b8b6d13077 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/audio-graph-port.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Audio Graph Card 'port' Node Bindings
+title: Audio Graph Card 'port'
 
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
-- 
2.34.1

