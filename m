Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5147936A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:00:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D17F285C;
	Fri, 17 Dec 2021 18:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D17F285C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639764044;
	bh=mOQ2eHw2UAJ//F0AMmxVBH++DECSj33r4EBlB3u0ixY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUqf3XVsXU3ZWMpBhgDXaZU/O1XKX2RCkzafyFsXKJBCFaCLoY+hDkrBz2oobsurK
	 Orr+mBbBNlzOT2xdRIp4DZpKMkTCjX4LAKSc64cTKq2M4qkDMyp0B8CjS4w0mHx5wG
	 x625fMXq0sOl3Qmq6JThK2ZavJd7vC6Cc667fvHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E725F804FA;
	Fri, 17 Dec 2021 18:58:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47975F804EB; Fri, 17 Dec 2021 18:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19B28F8016D
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 18:58:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B28F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DTTzqDWs"
Received: by mail-lj1-x22a.google.com with SMTP id z8so4566552ljz.9
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 09:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FB8NrCq6c0f8jOXV4dsj1D+bh3p8PUaX1SHo3nADxp4=;
 b=DTTzqDWsrj8mQnQqF5bFz1nJoz4ryQ+TBjJ62UPxuqmU1c6lfqA3zhDCj1aI/J8Yqs
 u4gpHSQ6WBL0e3X2bV4yz+uI+C+cGQ2tJp14M5lESuw6+Z7rfVgI3VBVB52dUxtP3TrB
 ycu4MtjczH4KO5DLTU3GZCi2sqDRm6qlWUmhyDljTVdpxNNxVrtzG9G6Kr57lYOrljZd
 ElKFgEBwiQalsAuX1UslJcbh/5/cy91pl83mFMkqKhXvvbwzf6fyDCkxPIR4gTeo3VY7
 YSdMIVQ5vGG0fRJvKVjCe7wEnOO28+SvkBQhWLrjsb8iO0qKdgxU5OB+YHlQcu1oBgwf
 S8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FB8NrCq6c0f8jOXV4dsj1D+bh3p8PUaX1SHo3nADxp4=;
 b=MLYwsH2gYlq0WUzM49q8bi6lKkfV7yV9sXH67Yhxg0DFJvz6uIzBLyqhtaLkdaTa5V
 Cp27HRMkJ8PzzQMK6X69mBlsZhFvsWCmnjp/4qQ+FGTBkDKaKfz0PbV2swmbWXWx79ip
 O8YwbTsIDMJNrseuMXS5nmwfiANRfuaKNas6imF740we3zLUT83dZoMFh+hA57ztL44p
 u3Tfz8FDigyjp5mYFWRxbUQfXE11klMukUQzNgnUENN4Jx6prBTI5AbVD4bjckP1s+/T
 3pRcQmZo1cm4pfp42gKOhWVCGZlNKnvRjZkD0N01/mN47pr9ni4WdF+CQQuFPhTO9taj
 RkWA==
X-Gm-Message-State: AOAM530hEjROUfrfpbqqZnuhVwNG10N0lGIFX7elWfDU5xxhJEW/YZzt
 kgo3HehN7GiguOV0zNwOSp0=
X-Google-Smtp-Source: ABdhPJw5GliGY6dDen834MJOvCLphrGd/gm1fsIvCdMW/uW2lbBnsZTOwSnfyo+8Q8xQqR2DeFRK5A==
X-Received: by 2002:a2e:8691:: with SMTP id l17mr3559188lji.119.1639763884754; 
 Fri, 17 Dec 2021 09:58:04 -0800 (PST)
Received: from localhost.localdomain (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.gmail.com with ESMTPSA id w23sm1479244lfa.191.2021.12.17.09.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 09:58:04 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v5 01/11] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Fri, 17 Dec 2021 20:55:56 +0300
Message-Id: <20211217175606.22645-2-digetx@gmail.com>
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

Add device-tree binding for Tegra20 S/PDIF controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..296248eed0ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra20-spdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 S/PDIF Controller
+
+description: |
+  The S/PDIF controller supports both input and output in serial audio
+  digital interface format. The input controller can digitally recover
+  a clock from the received stream. The S/PDIF controller is also used
+  to generate the embedded audio for HDMI output channel.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-spdif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: out
+      - const: in
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    spdif@70002400 {
+        compatible = "nvidia,tegra20-spdif";
+        reg = <0x70002400 0x200>;
+        interrupts = <77>;
+        clocks = <&clk 99>, <&clk 98>;
+        clock-names = "out", "in";
+        resets = <&rst 10>;
+        dmas = <&apbdma 3>, <&apbdma 3>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.33.1

