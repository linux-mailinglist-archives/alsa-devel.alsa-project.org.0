Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986115C563
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:55:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D70B316BB;
	Thu, 13 Feb 2020 16:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D70B316BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609335;
	bh=8PR123SDXsMaKVvsloWsKsBhldqYQ09H/T4DYtLBR04=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KSRCi+XqwG582XvzVAXx1RvppJRkGJeaERz6cCrnluo6GsuAPnuK1mrCENLcPRA6R
	 e8fINsAqAEctFNUAM3gieFfYJxrVJh18WV/TiYpEt8ukFS9z7XkMXVKxZlXn46IMyD
	 MdyzQN4SnDeYov46NwGqnMqpVac8N40nveLyCWbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D9EF8028B;
	Thu, 13 Feb 2020 16:52:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B8F1F8013E; Thu, 13 Feb 2020 16:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E44C1F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E44C1F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="uzfpKBfe"
Received: by mail-wm1-x341.google.com with SMTP id b17so7334507wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YhrzCi95LftKcnPaWRcj71zpUelsdIguZJo9dP4H/c=;
 b=uzfpKBfeVATiA0cT3Ut5HPxkUFwA0xjWgzJwbGxwYRDN9d0N+xqCxAxu89JjjH5DBT
 IKu0xoyRGJukUN42Hs9dlZnVBIZaYGAlpOmZ9zd5Px6GgaO91upfgt4Uy7G6twTjhI24
 juXlEwBd7EMPCxQLo5Lf8Pv5bd7M9movwRvKvjk83is1zuQRk6fw3AwAPYd2m31HJfKu
 MMGlqEDW7YKKtr5jscWL4RtriaiX2qd/RcuanWacmFYHme66JcSRplBuirOOA0vdPJBL
 ke416sMATXnSlbfMpffFfAesdFmLcEkw6BWOivyeEgxef7eZ4FVvePUnYOtqAHrxNTNa
 dJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YhrzCi95LftKcnPaWRcj71zpUelsdIguZJo9dP4H/c=;
 b=QAKcxuaxx8mYDDw6od5v0CLfhLFdv0UZIclX7NeMuKk7JPpuP8KtaXZk+HMSig9woC
 WHwOv10KJyqyYVCbyBuXQGAWlSUsaGnMZ/8/vzWejDyqvxNdq/dHZNli+blicL4UdNf3
 stg4MWCaFNduqLMbv+8yYAzUMi4e4XaoUajGsJ2jrUiLHEmNkqkvmOjMnjscjijDMrVX
 gHfOEks5Rep2FpxxCClg00rDJysQ8jFsMp5GEsklfvsifJTWaOPVCRLyEVr6ofrpymRQ
 UeMOXflZj+OkdScoAFcANcEXGPb6+Os5AgvDq1+t/PNVZa9uLJxvrxVINrnXykEnkrfQ
 iaeQ==
X-Gm-Message-State: APjAAAWSKCIWbwjoM8Fbr6TCmOcObFf3ejCYUE7UUHMD9ZhXOBNuClwN
 blzXrggJPYb98EUsTMOdGc03pw==
X-Google-Smtp-Source: APXvYqz/3hR6MBoFcwP1f0vbSeUJb+sFQI9maPj9mek2Phcd0eRR4aVLSkGyFWfQ2VyWqCd0zHCu5Q==
X-Received: by 2002:a1c:ac46:: with SMTP id v67mr6274807wme.153.1581609130878; 
 Thu, 13 Feb 2020 07:52:10 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:53 +0100
Message-Id: <20200213155159.3235792-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 3/9] ASoC: meson: aiu: add audio output
	dt-bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add the dt-bindings and documentation of the AIU audio controller.
This component provides most of the audio outputs found on the Amlogic
Gx SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,aiu.yaml           | 111 ++++++++++++++++++
 include/dt-bindings/sound/meson-aiu.h         |  18 +++
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
 create mode 100644 include/dt-bindings/sound/meson-aiu.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
new file mode 100644
index 000000000000..3ef7632dcb59
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic AIU audio output controller
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 2
+
+  compatible:
+    items:
+      - enum:
+        - amlogic,aiu-gxbb
+        - amlogic,aiu-gxl
+      - const:
+          amlogic,aiu
+
+  clocks:
+    items:
+      - description: AIU peripheral clock
+      - description: I2S peripheral clock
+      - description: I2S output clock
+      - description: I2S master clock
+      - description: I2S mixer clock
+      - description: SPDIF peripheral clock
+      - description: SPDIF output clock
+      - description: SPDIF master clock
+      - description: SPDIF master clock multiplexer
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: i2s_pclk
+      - const: i2s_aoclk
+      - const: i2s_mclk
+      - const: i2s_mixer
+      - const: spdif_pclk
+      - const: spdif_aoclk
+      - const: spdif_mclk
+      - const: spdif_mclk_sel
+
+  interrupts:
+    items:
+      - description: I2S interrupt line
+      - description: SPDIF interrupt line
+
+  interrupt-names:
+    items:
+      - const: i2s
+      - const: spdif
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/gxbb-clkc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+    aiu: audio-controller@5400 {
+        compatible = "amlogic,aiu-gxl", "amlogic,aiu";
+        #sound-dai-cells = <2>;
+        reg = <0x0 0x5400 0x0 0x2ac>;
+        interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "i2s", "spdif";
+        clocks = <&clkc CLKID_AIU_GLUE>,
+                 <&clkc CLKID_I2S_OUT>,
+                 <&clkc CLKID_AOCLK_GATE>,
+                 <&clkc CLKID_CTS_AMCLK>,
+                 <&clkc CLKID_MIXER_IFACE>,
+                 <&clkc CLKID_IEC958>,
+                 <&clkc CLKID_IEC958_GATE>,
+                 <&clkc CLKID_CTS_MCLK_I958>,
+                 <&clkc CLKID_CTS_I958>;
+        clock-names = "pclk",
+                      "i2s_pclk",
+                      "i2s_aoclk",
+                      "i2s_mclk",
+                      "i2s_mixer",
+                      "spdif_pclk",
+                      "spdif_aoclk",
+                      "spdif_mclk",
+                      "spdif_mclk_sel";
+        resets = <&reset RESET_AIU>;
+    };
+
diff --git a/include/dt-bindings/sound/meson-aiu.h b/include/dt-bindings/sound/meson-aiu.h
new file mode 100644
index 000000000000..1051b8af298b
--- /dev/null
+++ b/include/dt-bindings/sound/meson-aiu.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_AIU_H
+#define __DT_MESON_AIU_H
+
+#define AIU_CPU			0
+#define AIU_HDMI		1
+#define AIU_ACODEC		2
+
+#define CPU_I2S_FIFO		0
+#define CPU_SPDIF_FIFO		1
+#define CPU_I2S_ENCODER		2
+#define CPU_SPDIF_ENCODER	3
+
+#define CTRL_I2S		0
+#define CTRL_PCM		1
+#define CTRL_OUT		2
+
+#endif /* __DT_MESON_AIU_H */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
