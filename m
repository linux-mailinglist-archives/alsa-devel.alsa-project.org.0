Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172D23BAC75
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jul 2021 11:26:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDDE16BB;
	Sun,  4 Jul 2021 11:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDDE16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625390759;
	bh=Qek381h5GaJuE+IOixlVyD5/gvzxd3hj17E+TLgxaDE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rvnq/DsYCiaPvRgC2BCZxR7OhoTNbBsHnCAxLyvT1YnZ7uX50+pn2rmNy43LLrWb8
	 5TH80CTiGMuugqRuJcKmp+WKzyLRUVZL8MenMMU+FUGXloFal8HVIGs2IbXBeIUyRQ
	 BOdEWvKCOOvPrcPw8573ShTtOlNXL6zHX3Du+BZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C6EF80134;
	Sun,  4 Jul 2021 11:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 569D3F80249; Sun,  4 Jul 2021 11:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F020CF8014E
 for <alsa-devel@alsa-project.org>; Sun,  4 Jul 2021 11:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F020CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rFQn17qi"
Received: by mail-pg1-x52f.google.com with SMTP id t9so15071823pgn.4
 for <alsa-devel@alsa-project.org>; Sun, 04 Jul 2021 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ctPbpBSME4Wk2MPaV81CnmhuA+m0hProI1IntXJRC/o=;
 b=rFQn17qifWzHT2JAc5EbNAAM5gUKEO3zkypk6Ikt1di5LdTGaBOaYPKPvPYQKHCKvh
 y56kp4phrKzHPrRjNOFchg6oDbSLuucuLGnThcnPOBwnQLfmv5SxBbIdW+AOKPGHUKuS
 S4onIsh8ADY8K++Nutiq9F0MKhrqgtlkemT/9ZUBFprckKPxcrA4bHt6ooZ8qEgaDlf5
 2UcjMPB01bS74VVM4h/96TJLCBc9QyKAoAXziLm5PzWAX0AUtSx4GaKCboXToMcUu5Wh
 r8eKWkoUJt5NrPF+ndwy6gIOdtd/bF0gfwWCmSRfSus8Z4AcFv5KJlXF0mOcjQvdqavb
 19xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ctPbpBSME4Wk2MPaV81CnmhuA+m0hProI1IntXJRC/o=;
 b=sGVFplvlpTMFQliZY/CFA3t88KGgiu7tB3l8bJicAIXwHvfcKIbNgyp+wuKl70kcqX
 faOnA9F7IwBqSQJaj/l1TwehE0Cr43OOm4ztWg51fwexnh/5sHprbIZk+PnuFZ8Wbf0I
 7AJHlDd7EavZelIDIg+vtg/Hn/4UpQw0eU24aIkbor/2m9Uv12tkjmwFN2cQFWSme96+
 tqU5j6f8ssBgaLEazoJl4Pa6KnLTv0/Ki9YMwQkt9FxUsbHgwcJoWcRPWBPcl+2PzXc8
 ED2Vk1RwjMj8kGgbyK0eJsngLEhvfjBBV4C2NFZGvl1Ii7ygxHDnSipg/A6Nsc6STQKh
 w8Rw==
X-Gm-Message-State: AOAM530L+93KoalgBTCySFAdBxqk1Gzy/cXodk0Wr6YyGEmMZbsKM8/K
 SHybdaBcGnGVn2bZOGE2ZQ==
X-Google-Smtp-Source: ABdhPJw95OVUnYnd1Oz/CSbTSFEictKjldcOyF0a5XSptSRDTQuHsji/68y46TdnR9WhtN5yeiDMMA==
X-Received: by 2002:a65:6a01:: with SMTP id m1mr9640133pgu.201.1625390660296; 
 Sun, 04 Jul 2021 02:24:20 -0700 (PDT)
Received: from localhost.localdomain ([121.35.181.130])
 by smtp.gmail.com with ESMTPSA id v13sm18136526pja.44.2021.07.04.02.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:24:20 -0700 (PDT)
From: fengzheng923@gmail.com
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: [PATCH v5 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Sun,  4 Jul 2021 05:22:51 -0400
Message-Id: <20210704092251.40734-1-fengzheng923@gmail.com>
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

