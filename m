Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA295B550A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BBEB16B2;
	Mon, 12 Sep 2022 09:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BBEB16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662966483;
	bh=jU/20pwKxW0gZuIiXnq32OB1sNC3n2cVQhg1hVKF83o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WKREgaeqWtxpOCjz9q5DPnLQyB8P+VQnRwIKhE1S/uJ+7Twhc53U3lT0MkBWHmIXR
	 z7L72+s/GWeWal+lbBeumRW69zl7r5UeEkuioxqC9KuYQEBFld20I4u9C6CMToVzkL
	 nJC+UHwterkLOEd+lQCHFdMSI7VIhMkH1O49amfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB005F8030F;
	Mon, 12 Sep 2022 09:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F874F8027B; Mon, 12 Sep 2022 09:07:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A330F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A330F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Az0bMM9e"
Received: by mail-pg1-x529.google.com with SMTP id g4so7461577pgc.0
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 00:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VPkcWUP8a7bxjZ+WnoIZDgbqJYUoZq4umIQXPyi4AwU=;
 b=Az0bMM9e4dFt4KHB2/pRHFbq9bHidUOx4uwY+g5vmKGfujje6higRXjTPrQv9h09zc
 OJ+zoqvKJGygUBoY7C0K8uRCvNqviM45Rh54aQTAVjs7nBfUXFIoJVcbw3Qk3IKolU3r
 Qc8zWrVkUUv4acgeKlNwqErbMzQNQq+AG01AjbxMCuNqwUo0U+whAuYtz+bWorSSQ+7H
 /BHBa3p+QM7qrtxihgqoKy/jDht3kPBPr595gWZ/fOfeqORMCKdM1ICkgduzRqawJjLq
 ntTLtjM1+FY4HxEJGqonauBnnwIjlYThL859HZoochqRJJCVIZPPlgfxFt/u9CaxjMTx
 Nf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VPkcWUP8a7bxjZ+WnoIZDgbqJYUoZq4umIQXPyi4AwU=;
 b=0CPFkqUdGRZxzd++CRiJSOOx21Qqwdli+st2leqLRyFMk0eK6HTiWQkr1ni0hcZHoT
 G8KtzKm6scDhX736GpRFwPPVVGZUmY9TaAmIMvYBF2hU/5EtXO5Kmi+Xox83guf0yTjl
 SQEh/0mWi78cZ0EEfTZdDPPrX+5Sgpoo49Fcddg6lMBZI2IYgoPZQAguoeLQTa06kOxy
 GEYFJNd5fdBoPFWWFjzZc1G5m1Huif1cNnUfH+QP3a/jU2XJr8+1G4x73p8XmGTdi+c2
 zGGbGGWwo5Y6QSe4yg5/FGvuBahWkZS271jSjh0lyd8las62kNnxrKYoaLbuVNB2toEt
 v1Lg==
X-Gm-Message-State: ACgBeo2JwgPSWGnME86RvUmpAPmUI9lnkziJ03ga8G4b3cl5DbHZFcGa
 1RQITKrUlDvB38spNLHc2Q==
X-Google-Smtp-Source: AA6agR5sOzgwjECD1D0nDs7nRdEwTgd64nguOrzqvuMeMOIlt4aTkfSLaD6/5aTj/YYygs27FibgfA==
X-Received: by 2002:a05:6a00:114c:b0:528:2c7a:630e with SMTP id
 b12-20020a056a00114c00b005282c7a630emr26125991pfm.86.1662966412655; 
 Mon, 12 Sep 2022 00:06:52 -0700 (PDT)
Received: from localhost.localdomain ([113.110.235.160])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170902e80e00b0017685f53537sm5123557plg.186.2022.09.12.00.06.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Sep 2022 00:06:52 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, alsa-devel@alsa-project.org
Subject: [PATCH v10 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Mon, 12 Sep 2022 00:05:33 -0700
Message-Id: <1662966333-18000-1-git-send-email-fengzheng923@gmail.com>
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

v7->v8:
1.Fix some build errors.

v8->v9:
1.None.

v9->v10:
1.Put compatible first in the list of properties.
---
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 0000000..2f12cab
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 DMIC
+
+maintainers:
+  - Ban Tao <fengzheng923@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun50i-h6-dmic
+
+  "#sound-dai-cells":
+    const: 0
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
-- 
2.7.4

