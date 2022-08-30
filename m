Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E95A66FD
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 17:11:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01524169F;
	Tue, 30 Aug 2022 17:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01524169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661872264;
	bh=sixjWcH9B6eCMdx/YjcXcFglNV1bWuV3Pe/AsHoLX0s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GmycDM7JRZgE/1cG0sbZ7ePfxCUqpN1LaTx4RMb4S+Pp67ZBSIK7/goY3u8pdykZs
	 SQUXL8DyVVaojh7PtW1x3hchKigzuOYQZ7JIA61lphc4/TRBvo94+xogO8LYDUCBME
	 CWmeIHDEOqYPTTI4ytPEmLx2uF49ZKS6dm842y2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 518E4F8032B;
	Tue, 30 Aug 2022 17:10:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C16BF8023A; Tue, 30 Aug 2022 17:10:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B47EF800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 17:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B47EF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QGg80NnG"
Received: by mail-pf1-x429.google.com with SMTP id p185so11613309pfb.13
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=bhFPbBH1HWG+CvWDsxibGSv/KPEHci/JQzJBudsEayE=;
 b=QGg80NnGeBhVPnHboz7i1txHnXiJDru0SsdoFYy5VFP3kIP+JI1pUvlKwAG9PSUvSq
 QCzabiZFYg3USdQx9/BV9kxpxNNx9Ft2eOlgWvZdSwOYTZZDOymXwmLfoMvYgYGR07WE
 ffA+C/2GU2fiLfX+tlPM3PQVIgwE/cNBuCmq2RlhHfkW9SQGWlvDhnuZIIK47zvJOiVn
 3hhNkvA7krBVw2bF0NuJg5FBRl39DDywgSVVfmplpYIwG1/EIJgjseBD/HNnc8gzDJEE
 tB7dLNAZuYrWS48/2bx3EyxizaJYMzLyp2ByasWMpOkEGoFYRdZ6oWyGwj+TvGe7z+n1
 EACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bhFPbBH1HWG+CvWDsxibGSv/KPEHci/JQzJBudsEayE=;
 b=ZIrnV54VCoPnzSD5x2tlmATaaZ0QN4/NUNHIR3fKENDW+BAVnfEmp5ejYEJznOsB7Y
 cdQq7OK5WHl4kG1Oh3oqHhqkyPTO56DqsaKBXoaHlQQcm8NNx0/yixp6kAujVWdEijfw
 qGkEHrLnohV3ggdL0CpAUH+jDtgM/69JcEoMis0IV6wGb+1xj6lQVWrT5qbPk4SnoE4D
 LRjgRY85LlgzSTnTw7WAlaACC6X0Sxbo3F5A43PRfYFA245mB2vbLt7B4V0H9dmzcdvl
 fp/Gdq4fN4otbcIDiclp602sNcAbGhGRccC7fmp3WifEKy4V1H/5IesIYU+k7I+NJcBN
 tk7A==
X-Gm-Message-State: ACgBeo2AtWUuCKuXfOCvX/AR9j1/vaG4JaCybi8C+li4FFJElic+8fup
 n/HPFIn0UPjIJD861oL1zA==
X-Google-Smtp-Source: AA6agR6G5wrT02zhPRWkd66J1541yZke46MrQ+RAEnYcSITk+77l1M0g+9mUTUo4Sx1SgXD/zhcg0Q==
X-Received: by 2002:a05:6a00:a04:b0:534:d8a6:40ce with SMTP id
 p4-20020a056a000a0400b00534d8a640cemr22063954pfh.15.1661872193784; 
 Tue, 30 Aug 2022 08:09:53 -0700 (PDT)
Received: from localhost.localdomain ([116.30.109.180])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709027ec900b00172c7d6badcsm9717778plb.251.2022.08.30.08.09.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Aug 2022 08:09:53 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, alsa-devel@alsa-project.org
Subject: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Tue, 30 Aug 2022 08:07:19 -0700
Message-Id: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
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

