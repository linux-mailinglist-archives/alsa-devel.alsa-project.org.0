Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32536B676C
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Mar 2023 16:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C549F1390;
	Sun, 12 Mar 2023 16:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C549F1390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678633998;
	bh=rp0sBjbVSPP/oXeEFgiRZtFdXP6mccGDb3TJCoJlQFk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DBjEpGQzdVuQCiVTfWp35DVQIjdMpIuoqiwleOKM+IeSwHCra1Te7TRHFlseL07wA
	 jDGtK2VQ3gvsfBkJFwr/nfvgVOsQwJcfBWrXe4LL7lWGePLp7/C9nEa/4X2CiJtpyv
	 hx/FFAzJWMd6tOBrt+goyvjv+4VAOaKatPQIN93M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1908EF8032D;
	Sun, 12 Mar 2023 16:12:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EECDF8042F; Sat, 11 Mar 2023 21:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 350ACF800DF
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 21:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 350ACF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NyLgIqHF
Received: by mail-pj1-x102b.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso13234048pjb.2
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Mar 2023 12:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678565014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tn6uanZ75/AtO/6uD8tRhIGr3tlvAld8WET0HuG22qg=;
        b=NyLgIqHF0KgRhHyBW2b5aIoxWf34dCTp9KdqnU2+NiZaod/2dLsG90LERd9bUfKa7q
         pO27w98ompOHqzXAbzrbdho5DoJQi2429JNNLIgqC3d7bMxp/vckTp4AQtgaZf7xLT/d
         egVPApFRevYJrtlTUWSXZp+dF5FG61LgbGQ8PKyL3IcmlW9lDMygIp5efDMTrK7bi0J1
         JS8IByg428W8ROmO2OK52dhTY1qnvfPcDcw8bLXCwVGK5Guydonynq9O2BY4zBvWZ2A/
         73nMxjGfaw+ihvbMu0JxczIX1PI6nazeWuLWBGTnyl5g5d2yDJT6NPE5ak2HKeDkv0C6
         4I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678565014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tn6uanZ75/AtO/6uD8tRhIGr3tlvAld8WET0HuG22qg=;
        b=vEvwfsuf5OcTFsMeiKWFkjorTp7fweNsXVTuAy5Bpy8XyPe3PtiiW5lswsdcfhwkuZ
         +EtrVHcciU6nhPMDppWeqrBYvEetSuz6J9SNanuobySfcQKKO7e21jS4MjQ0S8GaGsWc
         KekJ8ocSa3WeVOqW7VZIBLLFgtpg0P0hWFHHJraROFYYdcUySf0Y7vCIL2tcog3jv8al
         j5jDlHDn/HBDWOg23Vv1Vo5Wr2vODH41uTsOsA4C84DlCJjt+vQsFa5lFOrlG2UlZ3e0
         myfmMSdoxcY34RQ4c/9Yp2DMnz5G1xMuAGwxefL19SBPT72U9ZP7hJh2X/c2rM3egWSd
         AzlQ==
X-Gm-Message-State: AO0yUKVxvdn6wMm6U2mHJseaIpEZX//Xp7EME9dJyJaE1tfK+OOvGo96
	f+O7YP6YapH58ReXvbKqsqw=
X-Google-Smtp-Source: 
 AK7set8lSKverypePwj+U3/vR/Fs/55zW0LXDGO+Xec2AdRSTGZx79cHgSY2He2AMzAHzV66Y5+JNA==
X-Received: by 2002:a17:90b:3ec9:b0:237:ae7c:15b9 with SMTP id
 rm9-20020a17090b3ec900b00237ae7c15b9mr30737682pjb.36.1678565013918;
        Sat, 11 Mar 2023 12:03:33 -0800 (PST)
Received: from localhost.localdomain ([49.43.248.22])
        by smtp.googlemail.com with ESMTPSA id
 n13-20020a17090a928d00b002341c0ff245sm1879787pjo.19.2023.03.11.12.03.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Mar 2023 12:03:33 -0800 (PST)
From: Vijaya Anand <sunrockers8@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Date: Sun, 12 Mar 2023 01:33:05 +0530
Message-Id: <20230311200305.82087-1-sunrockers8@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: sunrockers8@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JCDIGQCSVTU75S6CVFXXWLJWIZDJHV2A
X-Message-ID-Hash: JCDIGQCSVTU75S6CVFXXWLJWIZDJHV2A
X-Mailman-Approved-At: Sun, 12 Mar 2023 15:12:23 +0000
CC: Vijaya Anand <sunrockers8@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCDIGQCSVTU75S6CVFXXWLJWIZDJHV2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the binding document for adi,adau17x1 from txt to yaml
so one could validate dt-entries correctly and any future additions
can go into yaml format. Add address and size cells to example to
prevent errors regarding reg format.

Signed-off-by: Vijaya Anand <sunrockers8@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../bindings/sound/adi,adau17x1.txt           | 32 ------------
 .../bindings/sound/adi,adau17x1.yaml          | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,adau17x1.txt b/Documentation/devicetree/bindings/sound/adi,adau17x1.txt
deleted file mode 100644
index 1447dec28125..000000000000
--- a/Documentation/devicetree/bindings/sound/adi,adau17x1.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Analog Devices ADAU1361/ADAU1461/ADAU1761/ADAU1961/ADAU1381/ADAU1781
-
-Required properties:
-
- - compatible:		Should contain one of the following:
-			"adi,adau1361"
-			"adi,adau1461"
-			"adi,adau1761"
-			"adi,adau1961"
-			"adi,adau1381"
-			"adi,adau1781"
-
- - reg:			The i2c address. Value depends on the state of ADDR0
-			and ADDR1, as wired in hardware.
-
-Optional properties:
- - clock-names:		If provided must be "mclk".
- - clocks:		phandle + clock-specifiers for the clock that provides
-			the audio master clock for the device.
-
-Examples:
-#include <dt-bindings/sound/adau17x1.h>
-
-	i2c_bus {
-		adau1361@38 {
-			compatible = "adi,adau1761";
-			reg = <0x38>;
-
-			clock-names = "mclk";
-			clocks = <&audio_clock>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
new file mode 100644
index 000000000000..9c1dbf2b4e70
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,adau17x1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADAU1361/ADAU1461/ADAU1761/ADAU1961/ADAU1381/ADAU1781
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+
+properties:
+  compatible:
+    enum:
+      - adi,adau1361
+      - adi,adau1461
+      - adi,adau1761
+      - adi,adau1961
+      - adi,adau1381
+      - adi,adau1781
+
+  reg:
+    maxItems: 1
+    description: The i2c address. Value depends on the state of ADDR0 and ADDR1, as wired in hardware.
+
+  clock-names:
+    const: mclk
+
+  clocks:
+    maxItems: 1
+    description:
+      phandle + clock-specifiers for the clock that provides the audio master
+      clock for the device.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c_bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      adau1361@38 {
+        compatible = "adi,adau1761";
+        reg = <0x38>;
+        clock-names = "mclk";
+        clocks = <&audio_clock>;
+      };
+    };
-- 
2.37.1 (Apple Git-137.1)

