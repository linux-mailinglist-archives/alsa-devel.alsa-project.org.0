Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340E1681EC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 16:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A233216CE;
	Fri, 21 Feb 2020 16:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A233216CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582299525;
	bh=VC5U4yQWHmrhC1M2VClflGsBB5OqN3bIsn5IxRjGnIc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DvAppVWG5FERFdHgbQ92bwdMlc9UQk3UkSwMXC9C1yruc/7c8+1fEge3mI2s5V06b
	 Lw4BjhdZeszz9Khz7zeN66MsoGlW3mqzHHnZxCcJwtyegIik+Y706A2D99ov8jO758
	 aZk4juvoQrIiG+uWjIiMOD15pCq6hSfs+dUG3Wc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C13EF80278;
	Fri, 21 Feb 2020 16:36:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ED16F8027C; Fri, 21 Feb 2020 16:36:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB5BDF800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 16:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB5BDF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="0T5/Ac8p"
Received: by mail-wr1-x444.google.com with SMTP id c9so2528812wrw.8
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 07:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=0T5/Ac8pG7SCsz1cnqyRMc5cIe8ygGAkotY1PXusnbjm2tsypcs42va2MNYIt+jzo9
 fFCnrYMJUF63MuM3G0CSFskZDpMHle3oiotewtYHh4W5k3vtQcz2iqRcO1aHRoFISH5Y
 UnjzTndrHEMh0uxLwF/XWDyIaQaracyyLucz4qj7vFEcRTZoRB85sgec+5ZQtcK8Tiwv
 GYnbwnpsrUxGRlhbqVQnq8y6zNPsMrULb4Lhh4hI6/ASo2Lc8w7inycVZHkrH6RH9y+t
 A7L6O49B8hCYUkdcvlh9t/0nx1Qbxmw1teBjfu0X0QRJzGBg4UBAMbtltS3hW3VFysWd
 IKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tqEQ5jIvmw/mgMvZjaDSuL/3Rd6IGcOEgjWBEmD6jMI=;
 b=FD12AfLxx6VwzREi9zi98THMKIyQxOiI3fPtmzqNDWjbM514CKtizi5I0oex77l4ia
 mDWL+wRRa892f5ooWtQZe44XWCWV1hkgdsPqExqABh2KcxIBk/ciwJE3LaxI7SEO0tlK
 15C9G+aoriMwDWYEbaWHJTTNaP/dKH86rLEUHjhixab27JNl+KJHSkYtTrXeQBhfTOVK
 OrksRANectC+E5E2BIOEsl1hRbhsssd/4J489IhXpdXMnTvQd1Vi0gu1QnP4lV4XX/Kv
 jD10PLr9YmbegugI+lKqCcYKiHCblvHJi/NdI4yN5tU6Sr5h1uTjD6+LOuwFXQlqqwhg
 3G2Q==
X-Gm-Message-State: APjAAAUZ9C91GPnvTVoEeZG3f1lWS8CyKtNJe0aaR23qQ657f4ZthtWt
 /1YRjC7abM4GHQye9fnz7kOO3BGS33g=
X-Google-Smtp-Source: APXvYqw1G4TbUaW+Wcge3OpS17t14liivURN0gi87EFAbocCrA/IOohQfIWFsXyFdpZDZilJgBztOA==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr47970495wrp.236.1582299375762; 
 Fri, 21 Feb 2020 07:36:15 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id z25sm4198782wmf.14.2020.02.21.07.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:36:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/3] ASoC: meson: g12a: add toacodec dt-binding
 documentation
Date: Fri, 21 Feb 2020 16:36:05 +0100
Message-Id: <20200221153607.1585499-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221153607.1585499-1-jbrunet@baylibre.com>
References: <20200221153607.1585499-1-jbrunet@baylibre.com>
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

