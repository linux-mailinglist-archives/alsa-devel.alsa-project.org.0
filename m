Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96986585EF7
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jul 2022 14:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3343714C;
	Sun, 31 Jul 2022 14:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3343714C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659272083;
	bh=nISQzHNWJ1fyDVJTuvcghEVC3a8CWH4ziNUMz5WUSwQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R+jFXj4MpqnoT9l3lxpw+tW+6lJIEvcQ6sCFyvIorp1qBh6gO/RdAZJmK6yzocgn8
	 9InqV444jxJkChtqgZe9A7RSFnPY9pH8//VzF/J102yVOIKlhszKU7gJNL07ixAMHn
	 tGN1GrJKXyW5NkSkAP/dggcEq2sQslw4gi131AKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 826F0F80240;
	Sun, 31 Jul 2022 14:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3670F801F5; Sun, 31 Jul 2022 14:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NO_DNS_FOR_FROM,
 PRX_BODY_26,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99185F80152
 for <alsa-devel@alsa-project.org>; Sun, 31 Jul 2022 14:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99185F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jgxy6pTT"
Received: by mail-pl1-x62b.google.com with SMTP id x7so8217862pll.7
 for <alsa-devel@alsa-project.org>; Sun, 31 Jul 2022 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=DzHtnkRBwr/rsgQJS9iswk379iAxgE7fvqZVo9n6FYg=;
 b=jgxy6pTTAixT/+kQZe+3dEJ+zjdXTWuKRz7BUhZ4TSC9T6MBVRU/pPgjHCq60jT8sT
 lH9Oaj90hKq7G5x/pSXBfCswSA+89A2vyC7tyfalNKYaLJSdmGns9qz1gK35RI1GSsDj
 272fV8u7tprRDbKyH2np+NT6KB1Eh87xdT0Bzgbo2EASpEDRdYfxgO5Tj8JN+J7Ji6tF
 aarKmpT8v8IXoEn0goLzUEUf9CC4We82QoiYklXObpzYItN/TDiQrYjb7IEtWcQ9BRkG
 xoFZUXUI4qR8Zzkn00JnUubJxeMNUtq3lWgpPtiiIs28bHrIRASjnHIGCYj8Ye7Gk0EA
 aD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DzHtnkRBwr/rsgQJS9iswk379iAxgE7fvqZVo9n6FYg=;
 b=k2ntldAaegODZoebzwWZLFguWCjpH4eqg97tlf3YpQhKzCvjv4VZai11ZASUb6sawC
 RctGJR/Vb1EoFIrRxTbfNHczSXAx08b1Uu/laFqLeC9WpDbCGFuuICltUk1GwwRiTGNC
 DRgwf4m7HPBsRldhhkOKzTzZocP/DqOTJRgZkUCw8vU+h1AnwuLqhDx8YNYaUL8rLk2V
 vQVZAmAmCb4GgyKKGyxn893plrUmMkeNZWXAAeZYIE2WldE+G24IgTnvRC1fUUbvWY+C
 3RFpCC/1xeugKbxxTVrRzZwJEH1E5KLO4GJ5HpWzdV/HHP6+KntaN2QtQgkFTxs+jbgB
 4S/w==
X-Gm-Message-State: ACgBeo14fDdUcwIhB2QyHIdzTfYPecPyMTZjAy1xN5U8+eVCvY0Wnghs
 EHWyb8YUuoFy5Bl5y3qHDg==
X-Google-Smtp-Source: AA6agR4QGkSx9ttNE71bEI1a8SsSn4uwmlWQ6l8tyVtPsC+7hgjVAX7l4rLsJ1cOgrpc9LjYka5wrQ==
X-Received: by 2002:a17:902:d546:b0:16e:c70c:fdf5 with SMTP id
 z6-20020a170902d54600b0016ec70cfdf5mr8711788plf.100.1659272013371; 
 Sun, 31 Jul 2022 05:53:33 -0700 (PDT)
Received: from localhost.localdomain ([116.30.110.208])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a690100b001f4cc17b451sm3485818pjj.5.2022.07.31.05.53.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 Jul 2022 05:53:32 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, alsa-devel@alsa-project.org
Subject: [PATCH v7 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Sun, 31 Jul 2022 05:51:01 -0700
Message-Id: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
---
v1->v2:
1.Fix some build errors.

v2->v3:
1.Fix some build errors.

v3->v4:
1.None.

v4->v5:
1.Add interrupt.
2.Keep clock and reset index.

v5->v6:
1.None.

v6->v7:
1.None.
---
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 0000000..185d3e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 DMIC Device Tree Bindings
+
+maintainers:
+  - Ban Tao <fengzheng923@gmail.com>
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun50i-h6-dmic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    #include <dt-bindings/clock/sun50i-h6-ccu.h>
+    #include <dt-bindings/reset/sun50i-h6-ccu.h>
+
+    dmic: dmic@5095000 {
+      #sound-dai-cells = <0>;
+      compatible = "allwinner,sun50i-h6-dmic";
+      reg = <0x05095000 0x400>;
+      interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
+      clock-names = "bus", "mod";
+      dmas = <&dma 7>;
+      dma-names = "rx";
+      resets = <&ccu RST_BUS_DMIC>;
+    };
+
+...
\ No newline at end of file
-- 
2.7.4

