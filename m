Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8247936F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:01:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4066283C;
	Fri, 17 Dec 2021 19:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4066283C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764083;
	bh=YTRxQaHPC7lTAydNxR6j66vYJ/1owmYsMiJO62pXc38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHT40LOFTGKMNSWgStDKehm8dU6qu79J1nV52no3x0VHhr8G5uAlNCafC+g1Eqp3P
	 w+9t41cp542ulHO6Aa7cbS48iRGigzgV6ZuqyMJpVoislPpxtn7BUaxtlDI0QfgOZm
	 wdp4J0jqLoGtpokhPc8dkhyW3HI9XCWSug9Hb8uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9DD1F80526;
	Fri, 17 Dec 2021 18:58:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B9CF80163; Fri, 17 Dec 2021 18:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57B64F8027C
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B64F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z9Pva736"
Received: by mail-lf1-x132.google.com with SMTP id cf39so6239490lfb.8
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B10/DVlO3DNsnWTrb5zfh6CpHUm8NxkT51bMpGLaM+c=;
 b=Z9Pva736dbKy/rOtsePTw7Xth8b3Lg3wqHgEYOO2gg0DYuezuwlJtF51rIxsJ7Fbnw
 LGB3DV4NVssVDFZCiFxxKfB1tiE0JWGyLsXngQCqnqz/IPEG99n/bKTNbcOYtLfpyjIY
 LGp8l/ZOrW+gFktdcMPq3Rj6l1Dr56MR72X3atHoridzffcqFYMLUVjMFGdIkq3MBxuu
 g3js8GcgDvBnvr8QofIZKicUZBsjRCZU5mPqSh6NjIelJB+8Wx1rOQzibEMUxz/NeY2t
 Qrs20DzJk8DgSrt/jLK6UakPCgHl9gA7p6P7pPLZ+zMf8YUlQYUXC2h4hyiF1PbxTW5J
 q1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B10/DVlO3DNsnWTrb5zfh6CpHUm8NxkT51bMpGLaM+c=;
 b=WFXObndMm8nWO4L9N4Fp3bLKOmSiPmnBekM74C0oL2IIh1kkImYeEF4HOMdPdYzYMZ
 hd4/+YSoSFcZjxDFcCSBTN/aFZvV7+DK/QlEIn+c7BzhUrWu4LCKV4L4qhRcndq5j1nN
 QQtH8MqF19eb9prFzjt4VCKmBTepWIVcpXlNUa1DSrE0mHGiXP3wJmyQClyXRZL2nqeL
 JtWY5FeUwnYN0AFWHSICHtt5YBukNE/aewlwSJJnZAkaGiPXe6YW5+V7yM+a4mSjybbe
 sIIJ4ShOwkMUWRS2BepsqrZIWYB4le7n+Im1k1GNd7SjexIReyUSOuwoTf0K0+3MGhRx
 csEg==
X-Gm-Message-State: AOAM533UYR5QhnKH1tJ8BWEgmXFaaVWJ/nZvsplWrnl6BwRToAIGXNvF
 VRFG3gUiaiXzrwzjJ0QcnEw=
X-Google-Smtp-Source: ABdhPJzIDoIHo8AsB3EFB9eSksV0BQgYDEVpLjZQEglYFnulSrS5VzlTtEYKH8rFNpDfkaj/f+ZS8A==
X-Received: by 2002:a05:6512:1047:: with SMTP id
 c7mr1147851lfb.2.1639763885445; 
 Fri, 17 Dec 2021 09:58:05 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 02/11] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date: Fri, 17 Dec 2021 20:55:57 +0300
Message-Id: <20211217175606.22645-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217175606.22645-1-digetx@gmail.com>
References: <20211217175606.22645-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
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
index 000000000000..4c00fd0943c3
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
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: i2s
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
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
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

