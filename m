Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A1645CFD0
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:08:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5D317DA;
	Wed, 24 Nov 2021 23:07:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5D317DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791682;
	bh=UJPX5om0NpE0shZXifG9hhxCjt1/wWfpUvTiID01OUM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0fB62D2R8MUeRmUCHpJ7DAdLRbmODjRrWPax/aT7A0WtyumGwXWvZs/rNkgEiXqB
	 g5Ha1Hhg0n05UjrV7Wc8mL9iX6NtQ6EHPifgJ37snUU5wGz/tbrVEaBMAmXYMOrZBy
	 vd393kajKsrEv96qLpHHs64Hya4W2uEq40ItVbPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BB0F804B4;
	Wed, 24 Nov 2021 23:06:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D4AEF804AD; Wed, 24 Nov 2021 23:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 369AFF8013A
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 369AFF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HhIn/DTx"
Received: by mail-lf1-x130.google.com with SMTP id bu18so11106781lfb.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MICB7mqmtHJVlNvBv+SpnWZStTf75CqEHyV3SkIQNcM=;
 b=HhIn/DTxG+D4VfSf2OQYzEE48im3KVlsU7kOnmsyyR9CmnJXYni1HO1NFe5pqJ4PTN
 OGXFX5iISFdbDHGQVbUJbgW4fGwJKApNGMWY5gPBxNJGZQS6JYzJ6x2l6+BuKBtv9qs6
 kpWqN+BWZVOk94Cp31E2S/bI4cENe70RshvOHmyGWCMKT8BKM1g6CUYGRQAzJuzZjCP6
 apIMCILOeJ1p+mReMRFK9M0GxBY2CI4pdDrdErVBmx4HGFUwvNYT8Wg6ECFz/SJU+91T
 QrV6I7hbKK8nHcstU0o86z9ffx8tvcOLhqlMk7aAphpdoExJ3exK+FQwizJyRGk5HCjS
 5EzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MICB7mqmtHJVlNvBv+SpnWZStTf75CqEHyV3SkIQNcM=;
 b=iIvOl2qywIo+Lr1e2HyiIqBISByZp+YDgL7fa8olQsvAYcwH8eWVcyHqghSX30HvXZ
 nz8MM4ep2/M2KMP6gFzrljjgNJ/EEjgDfJSb449BozNQ4lYjTgufEZLE5tDyEWtVcWoH
 dgO/Dxb239HQ6V7EOA50FHap6LlnOsZZ32MZYmoJBO/UWTzXfduN5NwSoJQiIDZ+XuN5
 RZyeFAQH5CjgXsjl5KxxLYVEkFebVJhk54B8LWQi4yIUJfQ2r33tjdwFf37gmq+opA2R
 7fVc09wLH4UqJ9y2JDHhXEAIWPcWM0igDhUuJDMOPC7s7M3bF7t2meITRy3ZCl+wkkng
 CatA==
X-Gm-Message-State: AOAM532aGVUC143NeiPW0WDA7jZwCP+UgIsayePZT8quNIMHVEn4unf0
 dvdCumIMniSPIP3rH5abUOI=
X-Google-Smtp-Source: ABdhPJwRcOg8FSHfX1XMSp6JKcqGsETM9PJXhUfm1mZ0N3DupGcSvfd54SIFkK8zcPH7ShULyXhhSw==
X-Received: by 2002:a05:6512:2341:: with SMTP id
 p1mr18799257lfu.204.1637791591580; 
 Wed, 24 Nov 2021 14:06:31 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date: Thu, 25 Nov 2021 01:00:39 +0300
Message-Id: <20211124220057.15763-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

Convert NVIDIA Tegra20 I2S binding to schema.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
 .../bindings/sound/nvidia,tegra20-i2s.yaml    | 71 +++++++++++++++++++
 2 files changed, 71 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
deleted file mode 100644
index dc30c6bfbe95..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-NVIDIA Tegra 20 I2S controller
-
-Required properties:
-- compatible : "nvidia,tegra20-i2s"
-- reg : Should contain I2S registers location and length
-- interrupts : Should contain I2S interrupt
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - i2s
-- dmas : Must contain an entry for each entry in clock-names.
-  See ../dma/dma.txt for details.
-- dma-names : Must include the following entries:
-  - rx
-  - tx
-- clocks : Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-
-Example:
-
-i2s@70002800 {
-	compatible = "nvidia,tegra20-i2s";
-	reg = <0x70002800 0x200>;
-	interrupts = < 45 >;
-	clocks = <&tegra_car 11>;
-	resets = <&tegra_car 11>;
-	reset-names = "i2s";
-	dmas = <&apbdma 21>, <&apbdma 21>;
-	dma-names = "rx", "tx";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
new file mode 100644
index 000000000000..cd87eb4ef995
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra20-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 I2S Controller
+
+description: |
+  The I2S Controller streams synchronous serial audio data between system
+  memory and an external audio device. The controller supports the I2S Left
+  Justified Mode, Right Justified Mode, and DSP mode formats.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-i2s
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: i2s
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  dmas:
+    minItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2s@70002800 {
+        compatible = "nvidia,tegra20-i2s";
+        reg = <0x70002800 0x200>;
+        interrupts = <45>;
+        clocks = <&tegra_car 11>;
+        resets = <&tegra_car 11>;
+        reset-names = "i2s";
+        dmas = <&apbdma 21>, <&apbdma 21>;
+        dma-names = "rx", "tx";
+    };
+
+...
-- 
2.33.1

