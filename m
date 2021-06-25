Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DAA3B4012
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 11:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A223D166F;
	Fri, 25 Jun 2021 11:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A223D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624612180;
	bh=KHxBV/94lPvN0RYe2ajPONJirTkDjsM/e+Q6mJt5wPM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EzCvJiY1yWQhsMPKaOsBARcItMyAmxv/fNvD4veCJ34+yiHJEc3HOHXulqQZ1NaQf
	 c6dTJjpZTA6pXKBuoGAbAyNA35xHaAYwggCk5FmUQVuw33K1iDUDC1/KEpRSV9G0B9
	 7a6fbr4en3ZZnOvHK1OEC8DiSjDzPw627vTCLazI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D633F800E1;
	Fri, 25 Jun 2021 11:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C2AF801D5; Fri, 25 Jun 2021 11:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01056F80137
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 11:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01056F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gUKyO9dV"
Received: by mail-pf1-x42a.google.com with SMTP id a127so7512754pfa.10
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DgY/uA2fSmwxzscKqJL9b58zNu3n2nv6yZ9uNShIrNs=;
 b=gUKyO9dV8cptaXVWZlyd0CU3fRLnVW+pv0gJgJTU79nzWpC8B1BZLpwxryEwKqcuGu
 nP4vXT9rNO0wQAZYK7rCQlHMh/IDIhkl1qXpxWbWJrjSAoDHkyTu2W+/Z4Vwq/EHIEaq
 Z/sN9hmHln4OotyxLYgMpqgqKacEuKtXMAX2W0G1nkuHnilw1vTCh7Z6JaFYX2JMYse0
 lSlzFP6H6jUb9dmhygX9+UBL68YK6DDCZ+l5oz8dOIrEI2ToR6hr0jl8VgBwyJ4+FiVt
 iPzHYawZNyyUm/X1AocoCUhvX0PfBHXezBMs7reZtKQEJBR92O4YR/hvUtnrjSISCrk9
 5Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DgY/uA2fSmwxzscKqJL9b58zNu3n2nv6yZ9uNShIrNs=;
 b=XLn+gKQguSPWXYtdP8X2986M460WZ8EDKSulEGQhotAMqIDD5zGPmfshfA5vlCQcff
 xTBYRoBcS1fLseim87/hlCuSY5035nAawc59GJ7LBND75e6P5hqf9yxPNfn2/gJd9bwI
 9bLpC30WN0QwBZngNweEpDM8HOHT1qz+k5+gInj7dB2ibVXAuQrPJS+ehY1Rev5dGG3H
 KlW/YWmEgLp9eGXGDOqUdp/kJQGZqaX2FZFwQpqZEnbhqRYEVG8njZOrenpQw/rZMYlm
 yu+MvpwEhgo2DuT8RAI8mSz5de36D/sKrU/5M6wBdInNIiWmcQJXJrqBT3oHrovkwXS4
 rPcw==
X-Gm-Message-State: AOAM530Sk6B/SfGA5lygVyjw1zYwzujYWSWBbPBE2Fm0T2SaRr7pYnpr
 RM0ZvIUjlyJwoe/KEd3c8g==
X-Google-Smtp-Source: ABdhPJxYeAIkRsA7qJaQpgBPopWQ6ZDT4WqnjdXVrD19KKTC7j3DhKE1WfmeaZp+sLUSj1CPkDsXEw==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr8705624pgj.239.1624612079925; 
 Fri, 25 Jun 2021 02:07:59 -0700 (PDT)
Received: from localhost.localdomain ([61.144.175.119])
 by smtp.gmail.com with ESMTPSA id m4sm10279142pjv.41.2021.06.25.02.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:07:59 -0700 (PDT)
From: fengzheng923@gmail.com
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: [PATCH v4 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Fri, 25 Jun 2021 05:07:21 -0400
Message-Id: <20210625090721.6183-1-fengzheng923@gmail.com>
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
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..d9107685b78d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,68 @@
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
+    dmic: dmic@5095000 {
+      #sound-dai-cells = <0>;
+      compatible = "allwinner,sun50i-h6-dmic";
+      reg = <0x05095000 0x400>;
+      clocks = <&ccu 101>, <&ccu 100>;
+      clock-names = "bus", "mod";
+      dmas = <&dma 7>;
+      dma-names = "rx";
+      resets = <&ccu 42>;
+    };
+
+...
-- 
2.17.1

