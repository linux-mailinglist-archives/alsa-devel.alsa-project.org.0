Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1655213C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:37:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFA928EB;
	Mon, 20 Jun 2022 17:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFA928EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739446;
	bh=VvmeoniMTH8Z1GHuiuvLejdFjhkB5ENa0zfc7naWXAc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWCa5uqJv7dLFr/AY6hI3/1/19fyf4um6lSDi+eSoUze1f4Ds5QnxuHiawyaVYSMT
	 ROcKYgDXrTSPEEVBmWf+c+3km69wn4ELXrAdjBDt/Lkyk5CGwPGu6ec2x2W4kn9PXh
	 i3odyxHcJTiTf/PLqJMcd63ju2ZonRDTz8kTSnaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 736B9F8961E;
	Mon, 20 Jun 2022 17:08:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 848A8F80535; Sat, 18 Jun 2022 14:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9331DF8024C
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9331DF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="YKP/o6CN"
Received: by mail-wr1-x429.google.com with SMTP id o16so8802910wra.4
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n9g/PqG7lJoC3tmWnVa7QkZ4DkjcrfTJ4GH+uywTgjo=;
 b=YKP/o6CNE+lQ/JvutgsR0jZOXfHfDWCY/dQhqMKd5OzvitLi7mgxOOlC22neXUi3t3
 BN9TvFhMfSVyIRalfKp0Va337xJ573OA/jlHmNvKMC9gL9WCqqIk9PYa0TsCVpUjtR8B
 tbSkAAYjMwonv2CjEuI0NKpP3MKNtmcrz4U2Kau04jp49doWSVikIYXLNtIJ0CbxpRRk
 ACyFnBPLFEDO8mQ9dOPY47H5osv138u3PU28fgbHfr0fyUMw+29W9vwD1hyvLo5Y4+V/
 UZtdS0DFsqY5lgkZ/53LD/FQ/OdBPmTBXN7bsmN9ILMpN1rxcP2HcJnRbBzUtni7FWjs
 qlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9g/PqG7lJoC3tmWnVa7QkZ4DkjcrfTJ4GH+uywTgjo=;
 b=bBoIDLdQFLixoQzGop5AOuJxQ8BZoJotrZFWnyGeE2dem5akT6A5205+aO81ue3fJ0
 6AJS+CaPGEiO5OIiD7fDgCaxaLXnU/eYsqo7fCpj+fMvQNQLx/Zxo+MmYijCPDw7u+jl
 fJ0EtmHHFId6pCPGnATQAoKUAGnc/JIRy1gbDINZJDu36+t1939HDLT3J/05u3uinKks
 iz8MQ2y/VELsPN7uSMp4l0T7OabT+yEzpUTzlb+Ys6pTHWXnm8ASgrlAYXes9P1PCdJy
 gmr0Nw4ltaqoHnwihtLYrKj8fWkggy0v0Ey3hz+48GhvVVBkz19j9YI4hxv52tkANuwV
 pd6Q==
X-Gm-Message-State: AJIora9ffocgsNnZwg8QSTDQxlm6RK7wwWwGMKAHrGmnz/lFTGfmpY4H
 iPkoWoyRUxGz/piDanoH8TYgYw==
X-Google-Smtp-Source: AGRyM1uLcJx1fdLcx/uXs4UMpQTYdcZbfApX1+t2jE32dzxYMzfs1UyeNBdv+e0Fp23i7qfwRgxtPQ==
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id
 s17-20020a5d4251000000b0021b885b2fccmr1452539wrr.52.1655555526382; 
 Sat, 18 Jun 2022 05:32:06 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:05 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Date: Sat, 18 Jun 2022 13:30:26 +0100
Message-Id: <20220618123035.563070-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:46 +0200
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
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

The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
controller, but according to the documentation & devicetree it has 6
interrupts rather than the standard one. Add a custom compatible that
supports the 6 interrupt configuration which falls back to the standard
binding which is currently the one in use in the devicetree entry.

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..bc85598151ef 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -18,9 +18,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - snps,axi-dma-1.01a
-      - intel,kmb-axi-dma
+    oneOf:
+      - items:
+          - const: canaan,k210-axi-dma
+          - const: snps,axi-dma-1.01a
+      - enum:
+          - snps,axi-dma-1.01a
+          - intel,kmb-axi-dma
 
   reg:
     minItems: 1
@@ -33,9 +37,6 @@ properties:
       - const: axidma_ctrl_regs
       - const: axidma_apb_regs
 
-  interrupts:
-    maxItems: 1
-
   clocks:
     items:
       - description: Bus Clock
@@ -92,6 +93,22 @@ properties:
     minimum: 1
     maximum: 256
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: canaan,k210-axi-dma
+
+then:
+  properties:
+    interrupts:
+      maxItems: 6
+
+else:
+  properties:
+    interrupts:
+      maxItems: 1
+
 required:
   - compatible
   - reg
@@ -105,7 +122,7 @@ required:
   - snps,priority
   - snps,block-size
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -113,12 +130,12 @@ examples:
      #include <dt-bindings/interrupt-controller/irq.h>
      /* example with snps,dw-axi-dmac */
      dmac: dma-controller@80000 {
-         compatible = "snps,axi-dma-1.01a";
+         compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
          reg = <0x80000 0x400>;
          clocks = <&core_clk>, <&cfgr_clk>;
          clock-names = "core-clk", "cfgr-clk";
          interrupt-parent = <&intc>;
-         interrupts = <27>;
+         interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
          #dma-cells = <1>;
          dma-channels = <4>;
          snps,dma-masters = <2>;
-- 
2.36.1

