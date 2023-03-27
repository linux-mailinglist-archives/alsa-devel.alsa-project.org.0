Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0176CEF1F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262AC7F1;
	Wed, 29 Mar 2023 18:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262AC7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106760;
	bh=TiDZf70jeQfr36qj/e41nmgZiBXRk41rQikD65Jxb54=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O6jRO+owMq0eYubp759sZZp3rVqly1MxEAYV/LzBmSPn/C4RyO50Scw6VYT/hSRwH
	 KdKNvv8gm61psy1g3Om8WI4+Dx1n+2kEVGgAd4m7WGCI9nCloOW4sT168qxVnpPP4m
	 S8BkzExu7jAmHLJh8vhsHUwM2LxGX4SPQD72sfog=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B45F80529;
	Wed, 29 Mar 2023 18:14:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FDADF80272; Mon, 27 Mar 2023 23:29:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 979D7F800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 23:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979D7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CNgY+0Hv
Received: by mail-pg1-x52c.google.com with SMTP id h14so6012689pgj.7
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679952533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NxdwX2D0akAAHFQeGjtNuXXTLf+CXBqbpNejn6s2rPQ=;
        b=CNgY+0HvxXretnJUh6TwLmwHNJBQ5Dteqa/KPd8Vgf1JafDdnHGtXeuM7AqZ1hRk4P
         UX+gK7l02pcmmhMcjf7/GKp6SORxoTh1I+R9OR+46k6JM+OUrsiAag+bkOSLAr/cVbVg
         UC/oXxXgZ2ZOJz+mVBoZ5Q86Ts+Ga1aShfEVT+VHNp7atEgtKb38T8pczJgt5OqXQJvc
         tp9BdxRDtYIGKCpzj7nLbHn1gPThVYSjD6qGot69RoW+mW8G7iD8bL1ha0Ntoq6YGt6d
         2pUrnEp9QIZXJ1mu1TLPDBzuhs9PuNgN7Sgcj/u/6HhU/GiSUWN7XmO+nlORV5N2Lzl0
         R+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxdwX2D0akAAHFQeGjtNuXXTLf+CXBqbpNejn6s2rPQ=;
        b=X0r8GabqJeXcChu+S06T2DMD5MZB2FpyNmOvQTvnf0SEfSatcDgd8J40pdfwoNuui+
         Od/ljnL7cE8ZbXmNy5EKMTjBis7hlJv+rRSXimMxcwgiFiJDqPdo1u9V12NB+V4GPy7C
         VEuI+GNuDOPNb9UryapEIyODEAYkHRv55TPumivI0EpbQ6+B6+x7RI0mASlqI/Acd8uW
         vwdihyJs2LpnTr6s4EostUvp8mc+0QeVhsJr0afAkSo2evjfpAh75+mn4xXFPEyuzPoK
         aeTUIKKcnEIqB10VIRmLcv5vZBYFlc56D2UOnwCvCS5uJCT2Q2JPUnjb8+bR4b9xBHXP
         /2WQ==
X-Gm-Message-State: AAQBX9cvZvbP8BJh9bZZnWpOU0yIszi46ye5Bbaz91z3+KpTcjlUyVAG
	HwB1x3xW+vOKk4daYp4CvXY=
X-Google-Smtp-Source: 
 AKy350b0G5xWtgH2YUl068CugJHSnX4vrh0PXrGTf1h20eLEFC6MuwtOTq7nIu/wqDcF1yos9dq4Tw==
X-Received: by 2002:a62:5b04:0:b0:623:6131:66ca with SMTP id
 p4-20020a625b04000000b00623613166camr11299362pfb.32.1679952532866;
        Mon, 27 Mar 2023 14:28:52 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 i26-20020aa7909a000000b0062d85a1df56sm2333616pfa.178.2023.03.27.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:28:52 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	broonie@kernel.org,
	daniel.baluta@nxp.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	shengjiu.wang@nxp.com
Subject: [PATCH v2] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Tue, 28 Mar 2023 02:58:46 +0530
Message-Id: <20230327212846.28928-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RS3SBWACNNSHPAQTQQAR63EIZWSMVLBH
X-Message-ID-Hash: RS3SBWACNNSHPAQTQQAR63EIZWSMVLBH
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:49 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RS3SBWACNNSHPAQTQQAR63EIZWSMVLBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the AK4458 audio DAC bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
Changes:
V1 -> V2: Use the correct way for dsd-path property
          Drop ak4458 label form example

 .../devicetree/bindings/sound/ak4458.txt      | 28 --------
 .../bindings/sound/asahi-kasei,ak4458.yaml    | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4458.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4458.txt b/Documentation/devicetree/bindings/sound/ak4458.txt
deleted file mode 100644
index 0416c14895d6..000000000000
--- a/Documentation/devicetree/bindings/sound/ak4458.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-AK4458 audio DAC
-
-This device supports I2C mode.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak4458" or "asahi-kasei,ak4497"
-- reg : The I2C address of the device for I2C
-
-Optional properties:
-- reset-gpios: A GPIO specifier for the power down & reset pin
-- mute-gpios: A GPIO specifier for the soft mute pin
-- AVDD-supply: Analog power supply
-- DVDD-supply: Digital power supply
-- dsd-path: Select DSD input pins for ak4497
-            0: select #16, #17, #19 pins
-            1: select #3, #4, #5 pins
-
-Example:
-
-&i2c {
-	ak4458: dac@10 {
-		compatible = "asahi-kasei,ak4458";
-		reg = <0x10>;
-		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>
-		mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
new file mode 100644
index 000000000000..a3cd29517a17
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK4458 audio DAC
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - asahi-kasei,ak4458
+      - asahi-kasei,ak4497
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply
+
+  dvdd-supply:
+    description: Digital power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  mute-gpios:
+    maxItems: 1
+    description:
+      GPIO used to mute all the outputs
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              asahi-kasei,ak4458
+
+    then:
+      properties:
+        dsd-path: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@10 {
+            compatible = "asahi-kasei,ak4458";
+            reg = <0x10>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.34.1

