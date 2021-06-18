Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D93AC31C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 08:07:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8B331704;
	Fri, 18 Jun 2021 08:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8B331704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623996475;
	bh=VEaMg7vVydqedAaSUjcYzG5BguIALNzEV1rwJva63Is=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tXLBxQbRZwhydE3VYehWSDjdW9KfjxVjuLE8iwODHArkPdX5922WE+40blQyPYijx
	 jBbKdijuS6uY9qeGlsp8126lH8EkLGEG+0am+u4tg4jtNE8skcjMWMOGxPBKjgBkDK
	 aNOIvcUm1iIoTa9E5m79ByJw2wFMrK8dOzsrt4As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43585F80084;
	Fri, 18 Jun 2021 08:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E685F80424; Fri, 18 Jun 2021 08:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_26,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ED97F800E1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 08:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ED97F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TFUr3dRc"
Received: by mail-pl1-x62b.google.com with SMTP id h12so4136238plf.4
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 23:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hfOEVHeqp/F96H8QwGZO/5tf7mEcB8EA6gsOtfXfaM=;
 b=TFUr3dRc/3aZWb+Uxh1AmlwZHsequWgjNcy04MyvFn9uFODpQSc88GQ4NbXI8iLZmX
 Tu5HHxielGH7Bsy2ZC8N6moC9jvmHg5jiI57fvH3UD50LLXkzl7mGsYB9kiiCUd7DYx9
 fTrB1gaQk8IpTXBeqvtzpVzUdweSMAvFgf0hfwWL4TDW5H7iGwh3CKu8owFUQ6ybK5TK
 azFdyV92GTJRpEqztceeVWq3xrCPvmtt+1ru4C7APYgrQFN2YA1WfVnkP1luZC7AGwiP
 9P9jeKrDQbmoVtF7kQkVshfP+OgBj2BqYWDXSHO7+0+3SFwtKQsCcW8RMmSXmtxpo7Yf
 cw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hfOEVHeqp/F96H8QwGZO/5tf7mEcB8EA6gsOtfXfaM=;
 b=B+szZL9INz/dRv0e7IY3a6ghpop/SyfXqmeuVxSt7vu/5sjdsKKMiAnJkx5C5s5AKe
 ta6B14sONjw0WH1OqUmJ4Tdt4c/qr/mKkYMF7SRZwTsSeRoMLcGFdI+DEtP6G6m6QiH/
 GIuyUMohZlyk+aG1oe7SXPKK+14hoG33BkrKP4y3Q/mLcO4jEAsUZSLCrRMVat1LV0UC
 VjTIWqoPatWUV5poQXOVPRJhq29hrgC2Xw7p9C0jXY4l+4z6XbL9SYP6YKEMjjvd2g9n
 QXZmJ8QDy+7VxH9M07uXRRM0megi075eub2RNyG7Ng0pAwbo3qb6UfNxpidn1EvXvjwv
 lg3A==
X-Gm-Message-State: AOAM5316NnYhaO5fQgfsPuxMJpupauT7eFRsS0+azWoEashr2z2BL27U
 HklhzyQ6KEmirNRySholSw==
X-Google-Smtp-Source: ABdhPJxo2Rn9xs4aEtaHUWG7j/ziHyoqCT2P1sDRe2eiMH7wVHihb3upu70yewa+CiB10lnog1D02g==
X-Received: by 2002:a17:90b:4f81:: with SMTP id
 qe1mr9355789pjb.9.1623996411207; 
 Thu, 17 Jun 2021 23:06:51 -0700 (PDT)
Received: from INTERNET-129.allwinnertech.com ([223.197.233.48])
 by smtp.gmail.com with ESMTPSA id l201sm6975082pfd.183.2021.06.17.23.06.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 23:06:50 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com
Subject: [PATCH v3 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Date: Fri, 18 Jun 2021 14:06:44 +0800
Message-Id: <20210618060644.2830-1-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>

---
v1->v2:
1.Fix some build errors.
---
v2->v3:
1.Fix some build errors.
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
2.29.0

