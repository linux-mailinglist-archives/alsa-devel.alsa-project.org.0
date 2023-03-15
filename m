Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891356C1EBE
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 18:59:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D04BD1F4;
	Mon, 20 Mar 2023 18:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D04BD1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335158;
	bh=9gki55ZiiB5S52FPkA0HXqZ93ejl6EdRce4I22N5Gds=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D+Anp5Cu4KaLrW6GJa9NurGsHyltD1BBlIi4/NLDaljnA5Mwz4GXxyAdQgLB4P6vA
	 gzv+KMYPtXhpbmA6yhr4fEjrBd2Cz/UlQ4XDTxLw082VhgB8aYn83zbyXiZdhFBMpi
	 MMxePFDPW+X7cF0pfi4OY0hsGixC+AcHPvXr26DE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B4FF8055C;
	Mon, 20 Mar 2023 18:57:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA75F80423; Wed, 15 Mar 2023 01:09:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70068F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 01:09:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70068F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nKOf8FBf
Received: by mail-pj1-x102b.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso150919pjs.3
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Mar 2023 17:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678838975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzy0B/VYnSJRvZ8pGtdA2kQJazW5NtKMyoTehvrQmDw=;
        b=nKOf8FBfQ9KPvrSmoworRlZ9jZ+EREKalj7RmCUGg+12gvO+Kz8OmKTqPxKDCEhRK4
         GlHqyJOzZXf3XHHWBNFvDKuQPO2ZL6ltay52IIctGgpB8PbiQcryGNPjij+UJ6Q0LZlc
         V6TKnxmfIGPQd4zs5TSEs99VjZhOgep/lyARwv3k5vuiYOtcC415KSCwnEzjWEteuGav
         4Z+ohFCXB+0NR5NttQbQrcYFRTu7nmIDeE4jVNkB7PxQVGGCKHmH5mIE7dPHiRzWFoZ8
         Dvb7DPR7sucMV8QhGjTJ4JTln6J838YrJPaWtgicGKGLbxfyJjUbHXoj0bO07hYmmxuB
         rhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678838975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzy0B/VYnSJRvZ8pGtdA2kQJazW5NtKMyoTehvrQmDw=;
        b=uSQLSIffEcdniM/l+77wImgbm28h0xCuSfOcqJPVAlvrdt1nxuYUIwblLYN8NP/XhO
         /2RSKyiMnq2RYSCg8hshXh5BQQW6O/Pqz02qSO9oHi/c0+U+ue7CWS6o5v+by8kGsFkn
         9TOsRTH2QCjSTOTKEgF00+Jxaf/cCHHzvg2zzAnd8Tc+PYBE4zLN1i32DL23Ap4IkJDf
         OItX7XExN+O6AYBYszR2k9SEf5eCzLmHK+4QAr5tfhVDuRvw2rAm7rzEnqwM8t4n4Y6a
         hmDVFx9pMzMXW4kEB2Wp+ddk+MnKhC6mDcVXVBEEghP9CC9g61ZmzFdZDFIrT8911i7v
         AydA==
X-Gm-Message-State: AO0yUKW+Shxe2HsG83Wm7t4fM9p4sRPJqr9765hgKI9A1p1OohLtaoX1
	CVGBfOag5a8wFFV2byKog5A=
X-Google-Smtp-Source: 
 AK7set8TUYkpg5z/wkWn9Qm4PGh31BVMHTj0nRUVT2NCG7126FC8rPOANB99aIRkUDre4XDFPNTU8Q==
X-Received: by 2002:a05:6a20:9146:b0:9d:efbe:52ae with SMTP id
 x6-20020a056a20914600b0009defbe52aemr38231916pzc.30.1678838974492;
        Tue, 14 Mar 2023 17:09:34 -0700 (PDT)
Received: from localhost.localdomain ([14.139.38.154])
        by smtp.googlemail.com with ESMTPSA id
 z19-20020a634c13000000b00502f017657dsm2080157pga.83.2023.03.14.17.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Mar 2023 17:09:33 -0700 (PDT)
From: Vijaya Anand <sunrockers8@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Date: Wed, 15 Mar 2023 05:39:14 +0530
Message-Id: <20230315000914.99083-1-sunrockers8@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: sunrockers8@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GRSJ6ZOWZQDMENF4ZNYA2DJBNAVOKG47
X-Message-ID-Hash: GRSJ6ZOWZQDMENF4ZNYA2DJBNAVOKG47
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:57:30 +0000
CC: Vijaya Anand <sunrockers8@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRSJ6ZOWZQDMENF4ZNYA2DJBNAVOKG47/>
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
Changes since v1:
- added 'Codec' in title to clarify type of devices
- put compatible devices in lexographic order
- changed description of clocks
- changed 'unevaluatedProperties' to 'additionalProperties'
- changed node names to be generic

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
index 000000000000..8ef1e7f6ec91
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,adau17x1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:
+ Analog Devices ADAU1361/ADAU1461/ADAU1761/ADAU1961/ADAU1381/ADAU1781 Codec
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+
+properties:
+  compatible:
+    enum:
+      - adi,adau1361
+      - adi,adau1381
+      - adi,adau1461
+      - adi,adau1761
+      - adi,adau1781
+      - adi,adau1961
+
+  reg:
+    maxItems: 1
+    description:
+      The i2c address. Value depends on the state of ADDR0 and ADDR1,
+      as wired in hardware.
+
+  clock-names:
+    const: mclk
+
+  clocks:
+    items:
+      - description: provides the audio master clock for the device.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      audio-codec@38 {
+        compatible = "adi,adau1761";
+        reg = <0x38>;
+        clock-names = "mclk";
+        clocks = <&audio_clock>;
+      };
+    };
-- 
2.37.1 (Apple Git-137.1)

