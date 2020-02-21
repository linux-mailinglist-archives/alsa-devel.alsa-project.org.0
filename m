Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1D167D70
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 13:25:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964B116D3;
	Fri, 21 Feb 2020 13:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964B116D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582287920;
	bh=VC5U4yQWHmrhC1M2VClflGsBB5OqN3bIsn5IxRjGnIc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNdZdsd75qcO8dRTqbmzOMIWyp+I7iflDFa6Kfk0DKJEUGSZldSUF1A6Cga992Vzj
	 aMfLo7hI4nLlUZvXc7UFfS0Nvc4MWdTVDyHCRhSkMbHqyzsbZTjrcwjXzfaZgTzCJ2
	 oxz0HPpnY2D+BTzYD0ZTOoa3Gto1UiQtp6a89Q0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7652AF80240;
	Fri, 21 Feb 2020 13:22:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43CD9F80276; Fri, 21 Feb 2020 13:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD8A2F8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 13:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8A2F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="PLua7VeZ"
Received: by mail-wm1-x343.google.com with SMTP id b17so1599184wmb.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 04:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=PLua7VeZzwIcVj+hwSLftKcsvF1Az9k4Ybcwyye6rFiPkd7V2kwZ2LlM9IKZQhsrcY
 lwYXqpdC5p36lJSnLd6SOnMvqf2G5mVtvcoRvCNxZ6FOwnffUb6GWd1lt1SpU4RiAKVB
 Zeui1EzKUaGoGIfjXdrE/vrBlk23BcChYfCaNoRsZAMzi8UxMw6nxXXL3yiiJXLHE10b
 cIC7lVXkXe1coFDD0SnJ7ALecL3azNVCfR6MFh4z0KUvzxmO3FNG3hS8GEvfieUfL3jw
 Sbw7H6LCzKahIZC0x4flfGCGOjrmxVITR9PGduGTCm/Odfp0jo8Yi23/dVkt7rF3oEpP
 yjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=Fhl6wsQGhzf1r6iVbiWLeVIlJ6z19RHDGqcHK+EEMDNHc3ySXVx6jLWhIkyuyU2L8/
 i4KL0i/s5f5CE/RsK08ihn5bhG6aY4lqPq5TwFwNnN1mURc7aZ4306ypydlZOklOH3Ja
 QvOSMWTyvPznSgGqPFkfTCBld7SMnhQ03b0nTQCCeAlhq1vQStzWVTpy830Xg/PI9Zc7
 dtRsCdWyGRJrJCBy4JPIJPFIXC1NMd28NL55oB0jrlUwgCpzUC7dx1i6nsGxUsH5bba6
 MjHPsNVfP9U10USGVopCHW1kC4sdAnfSUHKM0WRcVncs6CeTvwFe9yi2bsFBzlKrGNpo
 nSYA==
X-Gm-Message-State: APjAAAV8MOLHUny+PkdYmmdeg8CAeCYPJZJIqtugATDd2W0P659XEx2N
 QBw2lPAnMBV4sT7Z4N/+zYDyDg==
X-Google-Smtp-Source: APXvYqzOPdCf7kHIVEmbaZYquZ7dKDOguVj3XvMjZhAdZ4A1XLpWmDHIv64vXwu7v/J8V8d8c4HS7Q==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr3477355wmb.81.1582287769710;
 Fri, 21 Feb 2020 04:22:49 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p26sm3454653wmc.24.2020.02.21.04.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:22:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/3] ASoC: meson: g12a: add toacodec dt-binding documentation
Date: Fri, 21 Feb 2020 13:22:40 +0100
Message-Id: <20200221122242.1500093-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221122242.1500093-1-jbrunet@baylibre.com>
References: <20200221122242.1500093-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

Add the DT bindings and documentation of the internal audio DAC glue found
on Amlogic g12a and sm1 SoC families

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,g12a-toacodec.yaml | 51 +++++++++++++++++++
 .../dt-bindings/sound/meson-g12a-toacodec.h   | 10 ++++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
 create mode 100644 include/dt-bindings/sound/meson-g12a-toacodec.h

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
new file mode 100644
index 000000000000..f778d3371fde
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,g12a-toacodec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12a Internal DAC Control Glue
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  "#sound-dai-cells":
+    const: 1
+
+  compatible:
+    oneOf:
+      - items:
+        - const:
+            amlogic,g12a-toacodec
+      - items:
+        - enum:
+          - amlogic,sm1-toacodec
+        - const:
+            amlogic,g12a-toacodec
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
+  - reg
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    toacodec: audio-controller@740 {
+        compatible = "amlogic,g12a-toacodec";
+        reg = <0x0 0x740 0x0 0x4>;
+        #sound-dai-cells = <1>;
+        resets = <&clkc_audio AUD_RESET_TOACODEC>;
+    };
diff --git a/include/dt-bindings/sound/meson-g12a-toacodec.h b/include/dt-bindings/sound/meson-g12a-toacodec.h
new file mode 100644
index 000000000000..69d7a75592a2
--- /dev/null
+++ b/include/dt-bindings/sound/meson-g12a-toacodec.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_MESON_G12A_TOACODEC_H
+#define __DT_MESON_G12A_TOACODEC_H
+
+#define TOACODEC_IN_A	0
+#define TOACODEC_IN_B	1
+#define TOACODEC_IN_C	2
+#define TOACODEC_OUT	3
+
+#endif /* __DT_MESON_G12A_TOACODEC_H */
-- 
2.24.1

