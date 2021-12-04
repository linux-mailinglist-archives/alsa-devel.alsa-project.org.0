Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A2C4685AE
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EEF32346;
	Sat,  4 Dec 2021 15:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EEF32346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628869;
	bh=RzPeJXAvaayQo8loV5hTCcvAJWmlB0hdyejnoOK0Sn8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=La+vWyERs8OVgZvvcwaOKDYkSYKUc48f6QVBQDTU357FbEl8pBDvtMpQXO2+fZolX
	 PYhls76HQYQN7DhfJYGmTHniUY8TvBXQJs6RkI6lApJfj540430ejskxsUovKPJ7zQ
	 /GbhpEAGRaaKnThhLEwnUCx4QVT4H0xLAiF1RUu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D31F804AA;
	Sat,  4 Dec 2021 15:37:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6449EF804FC; Sat,  4 Dec 2021 15:37:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9400F8023B
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9400F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hmo2bp0X"
Received: by mail-lj1-x22d.google.com with SMTP id 13so11857531ljj.11
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=Hmo2bp0XD7MwfOW5ZCLk2GISHdr/yTvLIohTI7RHWuHGbeHlDJozx/LsdhpQe4yoH8
 A0PJJufbpQT4J4x549rDU6ERWTBWVUy73fRKupA2q9m+vVJnQKVTlHLeQsj2vwG+e2wJ
 YJ5PQvT9yS3tiaRak55w5VFSYMzfh37EbTpqs0XqQvdL8nv/ww6pxCYkv9UOVE+PR0I3
 aqIpYmAw4ZAbbmFphtECxow41rQMlYrds5ECDNmQDY6B5ypKDw30gze6Zm8/AziQAhgU
 1/Oiq9L2G9GM2qOkn/zeMBWjxkuoy84PVTgD+c4beyfgl/LWOn3CKFOUScHNfBdOcYNu
 HgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=kyw0VgJhSC9JcNkuNZwyMtBiA/W1CbJIZn9w8Awvx3q0ZSMZ5GIMuOT1588wmtg20j
 Mi0TGtR9/70xvbY+dDf6GXMYcdKlwhPKYIzcvLMNUKZVaS0lOmBYZhew0WLbPLKWqNae
 8iTJTsluiCeqCOBf8IBgQVUur4Y+bnb20XmP2jKaldIJLHHeh3R8uc7xXCIk2bUmJ4Wo
 IZyXZrzHlpl7gUi3Wa3jDPQG3UYoGRl7bKXqRrg9AK0YkFt8Cst+FSeiiaNLQcZNzh47
 XKBc7W5JDMFLdUZYU/zu6dDAREJ7Csyp+oQoTWXIXVxlTaAM8qF7J7BNVslYtRcvPKn3
 Ghgg==
X-Gm-Message-State: AOAM530ld2ff78/5VdhDzjUg7gsQSfXC8RWCH3138wKBPxtteYIi0bYX
 8sn6pA4TPIykKz1UFGdPgVw=
X-Google-Smtp-Source: ABdhPJwcdgRw44pXn41+KUa5AP/jULS0ohcmHnZPCR7EdYs/LEdBhNkorjhYbQ3H4RJ980OeL+c3Fg==
X-Received: by 2002:a2e:9bc9:: with SMTP id w9mr24035834ljj.27.1638628652007; 
 Sat, 04 Dec 2021 06:37:32 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 01/22] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Sat,  4 Dec 2021 17:37:04 +0300
Message-Id: <20211204143725.31646-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

