Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD145F1BE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC3AB1AA1;
	Fri, 26 Nov 2021 17:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC3AB1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637943741;
	bh=4QPGnBBhCX5kfrEiA9GcVlLtmgkaxKcT5t7rLu+rzsY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G82BDvPJHoZiyEVHvBlEjiJ8eOA7jP2x63e8BlWiL8Left3vUQqLVQ+JR+0Bc8/YM
	 BqZYrXmG1ZbAGwlWRFzyZzj4ZJBS0HJ7vTO57xUXiR/ZpyiHXxSeb64BUsvudcS/iD
	 bxerblH57SMvs1YhoifNCcGcMwAC27CaURjETa/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16ED0F80510;
	Fri, 26 Nov 2021 17:20:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92755F80245; Fri, 26 Nov 2021 17:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A705F801F7
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A705F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pmn0vtIl"
Received: by mail-lj1-x235.google.com with SMTP id j18so6525747ljc.12
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qK0ts7tSPXqbn+UV99/el3TluqWl3fnnOWodFc+vpkg=;
 b=Pmn0vtIlqSKEdyEV/mRDjpdG0O/iIE7rX0GbGsZ326iW9MdkgI+N5JaHDiQcV0ZmS9
 s4mpBHjz/7079fkGZPCvb2Vo0bI3spK0A3LWqDQ+dpdFVGntM/eWN9OoWOuyRTH+64B3
 IaHtf/9xA6SzLzmJjcZL++iKWiBokestwrBvJiNUVh4Yk9aYXyl6lPVkacuxZGZ/Bx/N
 bIoV6e8Le0wnz6SsRhMauxy7ArLSQrzlpxcv2FF4mP++cZ2c2pd0I+d3K7wMxTvetWbP
 U87t+R2UCkC04NPB0LqGKnYfFl9jL2UWUYLDxdyTg3RGEaqSxNumKFEA9qakcaeJmDae
 npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qK0ts7tSPXqbn+UV99/el3TluqWl3fnnOWodFc+vpkg=;
 b=Nf6dbWsJANpdfmfEIU6kHaJlODbcs2xtVyRzapjbKeDw56GtZ26PwRE7U+HxeiSqVa
 xiHVSbXP05p9QFxnz+LV9yYtwzbQRyk1KTFro0qJ9Psruu0UWPt6Lfzv5iBgQf+wBxdD
 rI220GCivKxA09v7nuepVICvaomibV/Q7vabnew5G2tdNfsBPlkiixqla9VWph80gIR0
 mhgKyT9pEjVt7TIBQXE2dLskLIIFgFBud/NJn+ga+MnS1isDeMh9wk+jkcpoMacbGdVa
 csg98fcMDehTF04y4/vb3CIG9fCJaogTBJ6A7Bd1HupSn/OhceiNDkGG8rebhhuNEc2x
 FF+Q==
X-Gm-Message-State: AOAM532FTY0WkdUfVaBXtz3OjVB0w4z8NxA84AtxMQ9N1AFJlYiXR37Y
 S5XpQ4kTDCUisfrUG9vJnsM=
X-Google-Smtp-Source: ABdhPJxTJmcAap80hyd09S2lN6AlqNMLYeO32b48+fRf5WDQzP8DiYELFZORQcZMSD+wC0g73ko2fQ==
X-Received: by 2002:a2e:2a41:: with SMTP id q62mr30884162ljq.515.1637943579438; 
 Fri, 26 Nov 2021 08:19:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Fri, 26 Nov 2021 19:17:48 +0300
Message-Id: <20211126161807.15776-2-digetx@gmail.com>
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

Add device-tree binding for Tegra20 S/PDIF controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..00240205817d
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

