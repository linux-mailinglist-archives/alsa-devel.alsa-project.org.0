Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE5A45F1B8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:21:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D1B193C;
	Fri, 26 Nov 2021 17:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D1B193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943667;
	bh=FLrKch/eqhfmgzFiobhXVEUwGyzbrglWHnYYBbHB9ew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOCq4q0jQW3Soizu3HSOG+6w8kTQrSDjFKfFnvSZk/p4kqaK8ucSZ4VBBeJxlQhOJ
	 ZIANTq9l0ChD+F5mYTj0etd5H6AmJ69A5Dv6LEhc98jceHTp4ld1Mfw6ekB2desgoL
	 J6M4CYfnF/PXsYeVnp10mCl+EiSbNxGWs5JQzHW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42224F80302;
	Fri, 26 Nov 2021 17:19:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99F03F80302; Fri, 26 Nov 2021 17:19:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B073DF80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B073DF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gf9VIf7I"
Received: by mail-lf1-x12a.google.com with SMTP id b40so25471882lfv.10
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AhGRJaoVn1IrWGJ+5EHhVIJuQTwIW4TlUfHNDbUYl0=;
 b=gf9VIf7ILO+koaNF6veBCGsOnIjFAHjV9jZKRTPqVVFyH6j8CESRZEpANBWMaZG2TR
 xpjJL7NtJrqw1ZjlYAmAnUFl8ek+P2efkdt1B/Or7kcu3iJ8NWuJgMl91GgcQhjknouk
 XIjVLx5HoE1uWBKucb5mSE9EX7D1E7Fci4NahzhvyuxIbY4ldY5SPjjKmVSof3zwLRs2
 er7kihMp7qqh5ZndfenJSGIkc3p2SRq5sV1h6JMTfR50hrEs9XT0YJASKFQ+YtbwpWxK
 jp3+NY0VAiHPNHZ9Bi1XrkgF8+o1XA6u2l4+pH2/q5vTshzi2FO/CDxQ4UvhfkR9UHZ1
 Z+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AhGRJaoVn1IrWGJ+5EHhVIJuQTwIW4TlUfHNDbUYl0=;
 b=QHdvuKIbCRJFfxFiazShC//R0D5ocha5jZjZXzocg1zbfcdbgBJL2kaGrFu923BJ9M
 Z9gd31ZDSZrM/E8HyT30M6hylipW3V4mv4imR1WkLYKdEUHq6z4HqfmiZTBrwbj9O7Ak
 YnVwgYf5EO2ifnyBkecm7cbehI+UeHCeAeA1xY8p+Ti0WqZWaXC/t76l7eQyT2JBJrnN
 XT879CQ2u65i8CwduthL2hJ+KNpi58aKp0BHSOn7y1pH8bxAvR7E3NPxEm6dMRnJ36LM
 NVWTJlT+rh8N7vruRMZR5y+57KAojYMt+hkbyVIeS3EeIWw7mYYEQevbSMIrZZV0Vvzs
 iVow==
X-Gm-Message-State: AOAM5338c/CdYSjpVyi9qXrJgIPfMJo9ikMSf31Vrub0IFjEFX6jiBt8
 ifQXROElpBVE1evH/eCW41I=
X-Google-Smtp-Source: ABdhPJxaUvItDXQX2K+4aMi2wXJ6fVnLZSJi/ilFd4JYO1HwMEBAxC35yJ3/i3javAwM6xF3n5Y60A==
X-Received: by 2002:a05:6512:1051:: with SMTP id
 c17mr31584295lfb.35.1637943580427; 
 Fri, 26 Nov 2021 08:19:40 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 02/20] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date: Fri, 26 Nov 2021 19:17:49 +0300
Message-Id: <20211126161807.15776-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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
 .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 30 deletions(-)
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
index 000000000000..ad43b237d9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -0,0 +1,70 @@
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

