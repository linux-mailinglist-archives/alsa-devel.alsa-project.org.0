Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7345CFE9
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9C51838;
	Wed, 24 Nov 2021 23:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9C51838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637792096;
	bh=xS8ddv4zKX2JunJZdPjwJglEBs8rVDsumpZkEpy607I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIgLxx0gtPr7/HFKyM8vaw6ON4X4N4yMaCNW2iFSizaYVD/rR3ZMc/RXR5ApFQPqc
	 inAWetB2SnDYYNfoG+gZGtb3mu7IYze4V0dLCTZXIrxl1iVMdOV1NSg+a1CYGu9mpx
	 XAHTRgCBDvDrYSrvYMro6XuTYJEAX3NaI7/QrfxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3786CF8059F;
	Wed, 24 Nov 2021 23:07:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C914F801F7; Wed, 24 Nov 2021 23:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC689F80245
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC689F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qfW/HGnp"
Received: by mail-lf1-x130.google.com with SMTP id c32so10997453lfv.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uuzWPY9rvjqfLr6fV1cmdNXd06jrQuuKD96OjbdPNQ=;
 b=qfW/HGnpwCJ+dlE2szaDZeKhas1KXNCAysUabq12Y4F5YGkDbHpghxFVOofzIK/kTC
 gElro/xsp2BmqhbbG3ukENdsXrM9TwUCWplBi6kH+whRJB8SDMaLZFjTvHm/8V03CJ++
 RLRTk+bu7Y3J9gdjMza+jSJyJjieaKdSMxy+eD8wOGX3WLkHpww8wtwwMBsFJLUhrAH/
 P4l/0QOWxp7sTeiB5tf21QhBm7/gvsft2MS/cFZlxQX+b45CW4ykPXboy/+9UXz7gz1W
 B5RpB040Vl27+liyU/91pUGKM5/H4jly777rmEfqoluq7zNJgdIPhoMtAPKruSeaH/P0
 6MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uuzWPY9rvjqfLr6fV1cmdNXd06jrQuuKD96OjbdPNQ=;
 b=EBeBPb2W3T+dDetG70KQOnH5nWrMF1klkXSWUH9BzsfNZtuDw9l15B5zrL0p5CFzeV
 qw174eNIv/x9kbv/HtKsTNPl6+3yAzpTcOltLNaYF/7ZNv3TFfmEH49/VFGRFcAX+Wwz
 fmtOiLbLibV+fSNrrgWLd0F2XLapr8VoiDsHfUvdPPYbK4w0bH8ZIzHBlQnyfdqY0LSz
 Gfyf8j3qU8+3eGuTk+unOkUDxzOI1viwxrR0+ioIVMQVbXGNAwPHbKZjRAyYi9JJccBx
 1K1gdCvmS+eXzu80J82Zs+N2D/kHaQD2qFQIMNvBi9JmIXEnrv++JN4v6P2SUJYPZxuw
 vGdA==
X-Gm-Message-State: AOAM532mcYFB/XfrhtgDakL8llOYaXGQ7CY+Ft3r/5l9rTnw/hm7fzhA
 jDAGArZoHKNiveYFesgzawE=
X-Google-Smtp-Source: ABdhPJzQ5wmPsf7MT2kOseSoWuXZrjMS2l8zY/SyQMJGCvCCrfyBLGpbOCXFy5OZHCgrTdnaiZanxQ==
X-Received: by 2002:a05:6512:249:: with SMTP id
 b9mr19394202lfo.496.1637791590799; 
 Wed, 24 Nov 2021 14:06:30 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:30 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Thu, 25 Nov 2021 01:00:38 +0300
Message-Id: <20211124220057.15763-2-digetx@gmail.com>
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

Add device-tree binding for Tegra20 S/PDIF controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..4a2747d64772
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
@@ -0,0 +1,88 @@
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
+      - const: spdif_out
+      - const: spdif_in
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
+  assigned-clocks: true
+  assigned-clock-parents: true
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
+        clocks = <&tegra_car99>, <&tegra_car 98>;
+        clock-names = "spdif_out", "spdif_in";
+        resets = <&tegra_car 10>;
+        dmas = <&apbdma 3>, <&apbdma 3>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.33.1

