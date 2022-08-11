Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258158FE99
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 16:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B475882C;
	Thu, 11 Aug 2022 16:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B475882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660229633;
	bh=6+tfyiBSd4p9SyvBBaz2JdfsBu/J8OaZVi51nsbc1AA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XEK+kv+xTfbcXRJGZBa7p4qvdEW+i6F/xet9Z6yWZYobRRa9BlxE7mT9fTbvPqSAn
	 o3hsUu+H5kpRvrCDeTobf4Apr6qbMcZavc2ItuiNzGmv77qE7om9ve0eDs/s9ucVfm
	 hpQgWhPVHr+g0temcSwSmErJgkjTSNMOPEwqa5CQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEDEF800FB;
	Thu, 11 Aug 2022 16:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B801F80246; Thu, 11 Aug 2022 16:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45AAF8012A
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 16:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45AAF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jgKPpn3D"
Received: by mail-pl1-x633.google.com with SMTP id x10so17129128plb.3
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=DguZisXeggmcnodf9rWUz8dzLtbapr3DGYXX0AfN5WM=;
 b=jgKPpn3DQhYyGQu4S8TmtKiJN6q16/RsGdTOp4TGGsmd2qWDcpc1T276lrRPpcIamm
 RKtiksUIsGP0mpiFkcKWhJbCjPjOhc3CU5QfSVf5eK1Qudnl800D8zhyMkflY/fusYJb
 qopMypW/QSXnGNuX4jAOspKijWpTApfZftWhr6rok60/jy9/QYpAVc0RCIQpWKCW+RTz
 GadcjtRvdRqEQcYbajfM2RZIscqGOfgH/3mm4WzqPOn1JuB9iVdPc3cslBrO51tzY83O
 cGETDK964/JSTKqquiHFN9Zk7mYIfhOEhjfboBYQth9L5K30grhOpRDSBRb+5MZhcy2f
 9vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DguZisXeggmcnodf9rWUz8dzLtbapr3DGYXX0AfN5WM=;
 b=PrUndLsITQxrkMmkzmgJkJnMIug0xtbBTO9vKoNl6+//dIrt3TqU6jTOXicKagKiC7
 NexDBSoFbb+s4ZXIvDafu/XWXHa1mnM3m0J9+/xbHIvpH3oss0a/nh7dp8Ez1dDATwOf
 jTjdPsKS4kBhREbxRw8D9j3/nKeUUVQoteVJuT2brOT7ZzahS5DB7rttxau90x6wyHx5
 8mYlRIAwfxKQNV3dVNU0pmWHMRA0lkk98pR6tHl6yf9i9wRoF68xF/SQ4YPWESiwg9LN
 r0LxTj0ZJkqe1IoYLmoIkpUcoF8ME1u4FCnqzmR6mk/94a+yP2+p/JIEfI8rX6r3Oppv
 Qctw==
X-Gm-Message-State: ACgBeo0oYHlfE5WPNX9Ug+v2uKKMu6CdWK0t5rKq23XbHNKcEPQrUTZB
 q94wESwC1QcHlJNQnRp8hA==
X-Google-Smtp-Source: AA6agR4bItMMhS9eAFSfaBaDda5yHPWfGM6CGxHDWRY14bkP/YSdATf6aRaBayvvf8Xeb+0BXucshg==
X-Received: by 2002:a17:90b:4b04:b0:1f5:2da0:b2f6 with SMTP id
 lx4-20020a17090b4b0400b001f52da0b2f6mr8940766pjb.195.1660229563750; 
 Thu, 11 Aug 2022 07:52:43 -0700 (PDT)
Received: from localhost.localdomain ([116.30.110.209])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a63e148000000b0041c30def5e8sm11597757pgk.33.2022.08.11.07.52.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Aug 2022 07:52:43 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, alsa-devel@alsa-project.org
Subject: [PATCH v8 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Thu, 11 Aug 2022 07:51:31 -0700
Message-Id: <1660229491-15068-1-git-send-email-fengzheng923@gmail.com>
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
---
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 0000000..0cfc07f
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
-- 
2.7.4

