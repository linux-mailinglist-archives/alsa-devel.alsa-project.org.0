Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F5466814
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E27712878;
	Thu,  2 Dec 2021 17:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E27712878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462407;
	bh=RzPeJXAvaayQo8loV5hTCcvAJWmlB0hdyejnoOK0Sn8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnGZUNCMNqCC/42XkQuhhmKsr4QuLO87bHtjhvHtS857KM5GaFOoEN0AbbzFcUyto
	 L2h4Ioa1XS75V68Xq6Fo1zkg+KfKdiBXyvKANICVgUs7UqkZlWuL5+IFxGhRneD2wf
	 XcnG4A4Ld/80g01e/tA3AgV5qJJYiBTLo/yAsHBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E4D0F80290;
	Thu,  2 Dec 2021 17:25:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C535F804EB; Thu,  2 Dec 2021 17:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46069F80290
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46069F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZsHfNm2e"
Received: by mail-lj1-x22c.google.com with SMTP id d11so709278ljg.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=ZsHfNm2eziKXdlcYeMkKVQW9UerPtxFIVDlvToYifngdlP1woCI80BMNCQUeC6hVY9
 V9leCLPa1M1y5lyrfxg00COAo8GmEY+WralF/qN+TlCWScfNaGmY1CQN+DeAi0mT/Ab3
 iFmFPiA1waoDVT8jUCkA3MTM8xuIK3kEjYXv5bGZbOJy/lv8iytjOIv+7nEx67T/8N56
 QYMhXPzzzPBxXth0EExBmnRExcJUqWWGxvCg1aC9Acu8+54TCv8p7PyYHU6oWSnAPfr4
 dz02Xb/BZLsUPYz2SYyjgUkZOVA4iGU0M0JUrea3p3XHWqnoNxfml03NaKIq8OLlrneX
 Ej6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=WQt9hRvL/TlIVZRmXFjV5fHd6bCCMr7jkVNrvzvYkH2Gs0en8xLWtbW1RAtM1Uf7aB
 bOLhAAqZvOCfNj8f1T8dnBnmzdB3NMplKQtxV6yOWrOYU7YDLO5cw+66XhTIRQ0Hvy+H
 rbkvH3/KOqSs1atcSWBYRAGwKpDznoMftIoluAAuCNmdP/zmFUGsa9EmXz098wO1u2Cm
 QH1bSTOdS8uUM9OATW14n45RYNeqIbzI3PGG3hU+1YGFlQ6F990vtunTRsvSdy0nacv6
 QEy0wAbhEmCdeCda80GGfFIWMKTltrMwryn9/GsL/qMLjIWR7h7jc54DkFxahO7C8E2F
 tItA==
X-Gm-Message-State: AOAM533Gzz52UsjPPNBSiETBf83JwgpkzxmnXOUtCP9wh7b2HOTwiNy4
 P/7da/Zd6LXJ/NkHzRUvbDg=
X-Google-Smtp-Source: ABdhPJxjdeBBS4sFNL1pD6ub7cBQRrVaRXq2eSeIC5rlJ60PdQOVhO51JA7D4CnqBxl5gITOf6hkUA==
X-Received: by 2002:a05:651c:1546:: with SMTP id
 y6mr12305886ljp.76.1638462316891; 
 Thu, 02 Dec 2021 08:25:16 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Thu,  2 Dec 2021 19:23:22 +0300
Message-Id: <20211202162341.1791-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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

Add device-tree binding for Tegra20 S/PDIF controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..60a368a132b8
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
+  resets:
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
+  - resets
+  - interrupts
+  - clocks
+  - clock-names
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

