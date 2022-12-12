Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D400164A4FC
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 17:38:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53F7E2423;
	Mon, 12 Dec 2022 17:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53F7E2423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670863108;
	bh=pAKxK37YXhqrsUkc+3DMZ5ZEleN2hTTXdA9Gs5kqlbU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZAZV181wDfhmVmEuWzH+6TOfnxQW8aFuptmRoZJZD2xvzFqx50WRWRr33YcslFq6m
	 7O41nzlNeYbJTpkLmWoFih158YxeI0I17GTUwUvWFyzMVV8NbTEJ+VKgotk2HGGurw
	 T+oaw7Oa3GXD5UHDK+5LXUzXFus3fvqaBrSmEdhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4C7FF80519;
	Mon, 12 Dec 2022 17:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B8F6F804FF; Mon, 12 Dec 2022 17:36:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8188F802E0
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 17:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8188F802E0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=BPUDlXKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670863007; x=1702399007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pAKxK37YXhqrsUkc+3DMZ5ZEleN2hTTXdA9Gs5kqlbU=;
 b=BPUDlXKWsO1zlmfZ6c/25xJ8za8/wwB1EB7AGNs4WszDhQmcX4/NfoVm
 y27N0cF3ca+/6sBbvaDF19rjCCgLrCu9zfZO86rzXB9lpKHETEFMzakIf
 s558zbp+oD1NdhFkLz7fBKm6zIm3QDxPQ2I/SbNC5Mm8a4f/uBbZ7Mebd
 p1bXS/MX7JMxYXJ2G+VEvjKLERkOeQQ/E91u4bv6yKG+b0yzS/aduMm97
 Oue804JCn067EH+aWIwikqhypizNvUpdc8GIXRCir9GLt/B9U5F0+WtDl
 rSshXm1UFRzfJjQG2CsxUFAxUnlsL1RFJELPFCI3YZ2Szys5/jVM1tke8 Q==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="127727121"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2022 09:36:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 09:36:36 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 09:36:34 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/4] ASoC: dt-bindings: microchip: use proper naming syntax
Date: Mon, 12 Dec 2022 18:41:50 +0200
Message-ID: <20221212164153.78677-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221212164153.78677-1-claudiu.beznea@microchip.com>
References: <20221212164153.78677-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use the following syntax for Microchip ASoC YAML files:
vendor,device.yaml

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 .../bindings/sound/mchp,i2s-mcc.yaml          | 108 ------------------
 ...,pdmc.yaml => microchip,sama7g5-pdmc.yaml} |   0
 ...rx.yaml => microchip,sama7g5-spdifrx.yaml} |   0
 ...tx.yaml => microchip,sama7g5-spdiftx.yaml} |   0
 4 files changed, 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
 rename Documentation/devicetree/bindings/sound/{microchip,pdmc.yaml => microchip,sama7g5-pdmc.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdifrx.yaml => microchip,sama7g5-spdifrx.yaml} (100%)
 rename Documentation/devicetree/bindings/sound/{mchp,spdiftx.yaml => microchip,sama7g5-spdiftx.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml b/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
deleted file mode 100644
index 0481315cb5f2..000000000000
--- a/Documentation/devicetree/bindings/sound/mchp,i2s-mcc.yaml
+++ /dev/null
@@ -1,108 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/mchp,i2s-mcc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Microchip I2S Multi-Channel Controller
-
-maintainers:
-  - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
-
-description:
-  The I2SMCC complies with the Inter-IC Sound (I2S) bus specification and
-  supports a Time Division Multiplexed (TDM) interface with external
-  multi-channel audio codecs. It consists of a receiver, a transmitter and a
-  common clock generator that can be enabled separately to provide Adapter,
-  Client or Controller modes with receiver and/or transmitter active.
-  On later I2SMCC versions (starting with Microchip's SAMA7G5) I2S
-  multi-channel is supported by using multiple data pins, output and
-  input, without TDM.
-
-properties:
-  "#sound-dai-cells":
-    const: 0
-
-  compatible:
-    enum:
-      - microchip,sam9x60-i2smcc
-      - microchip,sama7g5-i2smcc
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: Peripheral Bus Clock
-      - description: Generic Clock (Optional). Should be set mostly when Master
-          Mode is required.
-    minItems: 1
-
-  clock-names:
-    items:
-      - const: pclk
-      - const: gclk
-    minItems: 1
-
-  dmas:
-    items:
-      - description: TX DMA Channel
-      - description: RX DMA Channel
-
-  dma-names:
-    items:
-      - const: tx
-      - const: rx
-
-  microchip,tdm-data-pair:
-    description:
-      Represents the DIN/DOUT pair pins that are used to receive/send
-      TDM data. It is optional and it is only needed if the controller
-      uses the TDM mode.
-    $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [0, 1, 2, 3]
-    default: 0
-
-if:
-  properties:
-    compatible:
-      const: microchip,sam9x60-i2smcc
-then:
-  properties:
-    microchip,tdm-data-pair: false
-
-required:
-  - "#sound-dai-cells"
-  - compatible
-  - reg
-  - interrupts
-  - clocks
-  - clock-names
-  - dmas
-  - dma-names
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/dma/at91.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    i2s@f001c000 {
-        #sound-dai-cells = <0>;
-        compatible = "microchip,sam9x60-i2smcc";
-        reg = <0xf001c000 0x100>;
-        interrupts = <34 IRQ_TYPE_LEVEL_HIGH 7>;
-        dmas = <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
-                       AT91_XDMAC_DT_PERID(36))>,
-               <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
-                       AT91_XDMAC_DT_PERID(37))>;
-        dma-names = "tx", "rx";
-        clocks = <&i2s_clk>, <&i2s_gclk>;
-        clock-names = "pclk", "gclk";
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_i2s_default>;
-    };
diff --git a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/sound/mchp,spdifrx.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml
diff --git a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
rename to Documentation/devicetree/bindings/sound/microchip,sama7g5-spdiftx.yaml
-- 
2.34.1

