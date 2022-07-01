Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE9565384
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7315E1716;
	Mon,  4 Jul 2022 13:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7315E1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656934285;
	bh=PaUGtcrodBz7cVrUAdibJxD+PRt1hlUM+hA+PXjxU8U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=paRuRgAknRNjCDCOQ8vW0t25kGV9qEKw+2XII5XlG0xgDJgwYq2H98eo/U4Ar33lu
	 XQwn9Dgzu73JM2HFTefA22Pze52fW07z9+QTVdc5vg6oz8KRSO6eUN5oAbbyyP5/S0
	 +CdrybkL1wxezHJkMBhW4JXO3RYu41QzKzYNBPPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B89F805F6;
	Mon,  4 Jul 2022 13:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 660A9F80155; Fri,  1 Jul 2022 21:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80378F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 21:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80378F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Je8h/uG7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10BE761F66;
 Fri,  1 Jul 2022 19:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517FFC341CE;
 Fri,  1 Jul 2022 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656703433;
 bh=PaUGtcrodBz7cVrUAdibJxD+PRt1hlUM+hA+PXjxU8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Je8h/uG7xfWrk9MLPW2Xnpf37EarLuFl14M28FPgEPIJczfy1L/IzO9y0dLdg4Jqz
 14b8/4D5h1zVGpBTS0DU2jaW0TUXZFJC+B0A0d3uNoFXhw3iiISl0h7MQn1YNY3bCy
 TkRQtPSmYIMuB9KM6Foa5xNlbHe+NltkTeDJtHiel3wCUwWaC+3J7l8DE/1oYrA/R1
 H7BtEzuCJqoVoZS8zOTUHWMR4HgfQ1z25E3GhKYrlaLSQc/AtK48svzo5+6whxXbfA
 dhEhHVMTyLGUwiL8MMAG3Td7vbuZx/MtZ/weEDzZxNTqJOMrrmL8O5ZUs8y1Wpx3mQ
 0aUYPDIEq/Zbw==
From: Conor Dooley <conor@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 03/14] ASoC: dt-bindings: convert designware-i2s to
 dt-schema
Date: Fri,  1 Jul 2022 20:22:49 +0100
Message-Id: <20220701192300.2293643-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701192300.2293643-1-conor@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:03 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
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

From: Conor Dooley <conor.dooley@microchip.com>

Convert the Synopsys DesignWare I2S controller binding to dt-schema.
There was no listed maintainer but Jose Abreu was the last editor of the
txt binding so add him as maintainer.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/sound/designware-i2s.txt         | 35 -------
 .../bindings/sound/snps,designware-i2s.yaml   | 94 +++++++++++++++++++
 2 files changed, 94 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/designware-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/designware-i2s.txt b/Documentation/devicetree/bindings/sound/designware-i2s.txt
deleted file mode 100644
index 6a536d570e29..000000000000
--- a/Documentation/devicetree/bindings/sound/designware-i2s.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-DesignWare I2S controller
-
-Required properties:
- - compatible : Must be "snps,designware-i2s"
- - reg : Must contain the I2S core's registers location and length
- - clocks : Pairs of phandle and specifier referencing the controller's
-   clocks. The controller expects one clock: the clock used as the sampling
-   rate reference clock sample.
- - clock-names : "i2sclk" for the sample rate reference clock.
- - dmas: Pairs of phandle and specifier for the DMA channels that are used by
-   the core. The core expects one or two dma channels: one for transmit and
-   one for receive.
- - dma-names : "tx" for the transmit channel, "rx" for the receive channel.
-
-Optional properties:
- - interrupts: The interrupt line number for the I2S controller. Add this
-   parameter if the I2S controller that you are using does not support DMA.
-
-For more details on the 'dma', 'dma-names', 'clock' and 'clock-names'
-properties please check:
-	* resource-names.txt
-	* clock/clock-bindings.txt
-	* dma/dma.txt
-
-Example:
-
-	soc_i2s: i2s@7ff90000 {
-		compatible = "snps,designware-i2s";
-		reg = <0x0 0x7ff90000 0x0 0x1000>;
-		clocks = <&scpi_i2sclk 0>;
-		clock-names = "i2sclk";
-		#sound-dai-cells = <0>;
-		dmas = <&dma0 5>;
-		dma-names = "tx";
-	};
diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
new file mode 100644
index 000000000000..4b0795819064
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DesignWare I2S controller
+
+maintainers:
+  - Jose Abreu <joabreu@synopsys.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: canaan,k210-i2s
+          - const: snps,designware-i2s
+      - enum:
+          - snps,designware-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: |
+      The interrupt line number for the I2S controller. Add this
+      parameter if the I2S controller that you are using does not
+      support DMA.
+    maxItems: 1
+
+  clocks:
+    description: Sampling rate reference clock
+    maxItems: 1
+
+  clock-names:
+    const: i2sclk
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+    minItems: 1
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+    minItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: canaan,k210-i2s
+
+then:
+  properties:
+    "#sound-dai-cells":
+      const: 1
+
+else:
+  properties:
+    "#sound-dai-cells":
+      const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+oneOf:
+  - required:
+      - dmas
+      - dma-names
+  - required:
+      - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc_i2s: i2s@7ff90000 {
+      compatible = "snps,designware-i2s";
+      reg = <0x7ff90000 0x1000>;
+      clocks = <&scpi_i2sclk 0>;
+      clock-names = "i2sclk";
+      #sound-dai-cells = <0>;
+      dmas = <&dma0 5>;
+      dma-names = "tx";
+    };
-- 
2.37.0

