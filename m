Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7F3C3C94
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jul 2021 14:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98F4C1669;
	Sun, 11 Jul 2021 14:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98F4C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626007861;
	bh=RjI0cz7Bjm8Tvc0qKxh3sFSfmTFsbwwi181LztzVF7M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BsuQEbAqUAHzA6UP5f82bfxEedT2TnuLyFhVbaXcKpSekSscfMARcABYktMzL+P7N
	 2gZpRNwdhVWz+lNh3TvsGdf7uD2shTPNKo1wTZPvxq9BW3dzkrwAxkSJpcnGS+xaUD
	 MRTdmbk6/9JPXgYZ4XBSKekGQxZV8zND2eNkqN1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 060E7F80083;
	Sun, 11 Jul 2021 14:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E052CF80217; Sun, 11 Jul 2021 14:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6779F800AE
 for <alsa-devel@alsa-project.org>; Sun, 11 Jul 2021 14:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6779F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B1hyEQpk"
Received: by mail-pj1-x102d.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so11013928pjl.5
 for <alsa-devel@alsa-project.org>; Sun, 11 Jul 2021 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mIxSmufWuDTKwlxgFXvm/s5Rjq6omybGQ7A5dLknTx4=;
 b=B1hyEQpkq0+TBnqVNyJV0dgFXD20LT36fA/k3KQPRS3hUE/zFKjBiCGUuGL6mzypy3
 hVqvKg6k7Kxh4uLv7XllrVeMs6/ZW9mmVFINbSGM2lAwUCQT7279OIen1pVwVymJvow/
 nuV6+Hah+K5vel9DXkerdfpirZnewPI68CKv7OoMFIb6VOAA7L+t73HvRjbS5I4YHROZ
 /N88JZBxtJG6ZS5CLw9kirsAEj0MGHT8dwucIdCfZtrUqZIAGXzLcXOgJZn/EUZnStEH
 iYrOoOyV2tNrNvmJjb9Y/A8NTCdGZP7elTZr+1y9CYiK32J1NfZA8ZNyMIQz4MRHsTWX
 hLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mIxSmufWuDTKwlxgFXvm/s5Rjq6omybGQ7A5dLknTx4=;
 b=ql2S1/b0wV+LFzRHcP/Y35t0JFEKENuJFmTeTqMRu9yir+znN2JM89WTI7YCMFRdhq
 zE3JlYXVZfDuLlcv7hH7Hr74UDc0z+ZqI1LA/h54C+Ud5BWDqb6Vmy+aAMu8QrLoaz5W
 xQWB8TDa7YZgpnM/x6VHdYLc+nfjV8BkNaDFNTd5dltz1jQaCL6gu2+ZAoP5JQMlGE2O
 EzgaZCIfcRG94aTXmMsVMuw0YEYqX4Wsv6rQIq7dW9hQbJDR/PMc3Xg0DKfmyVi+WZrd
 U5n+8UwwXOqdDZP7/X3FrdUInOwrmsUmMdfzXOhRg1xO2y99keeK9iBNjPnnaYDlOToR
 WZdg==
X-Gm-Message-State: AOAM530p4Y/XwQq+mZtQH8W2fdt6W/okNet+F4i3lm344UbKnPELf5IR
 NKl3Y+MU6oGBY7gCqVjDvw==
X-Google-Smtp-Source: ABdhPJxvFbvViX+F8Vrs22jIs658qzk0Elx92cNANGF4OQD9QFj1l6fZgMamKh9cIhVwhNlshf2Jew==
X-Received: by 2002:a17:902:a50f:b029:11a:cd45:9009 with SMTP id
 s15-20020a170902a50fb029011acd459009mr39227014plq.38.1626007760610; 
 Sun, 11 Jul 2021 05:49:20 -0700 (PDT)
Received: from localhost.localdomain ([113.104.213.237])
 by smtp.gmail.com with ESMTPSA id pj4sm17717343pjb.18.2021.07.11.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 05:49:20 -0700 (PDT)
From: fengzheng923@gmail.com
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: [PATCH v6 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Sun, 11 Jul 2021 08:48:26 -0400
Message-Id: <20210711124826.5376-1-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

From: Ban Tao <fengzheng923@gmail.com>

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v1->v2:
1.Fix some build errors.
---
v2->v3:
1.Fix some build errors.
---
v3->v4:
1.None.
---
v4->v5:
1.Add interrupt.
2.Keep clock and reset index.
---
v5->v6:
1.None.
---
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..0cfc07f369bd
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
2.17.1

