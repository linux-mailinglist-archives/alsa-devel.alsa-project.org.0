Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB68B6C1ED8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:01:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3200A3E8;
	Mon, 20 Mar 2023 19:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3200A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335286;
	bh=9gki55ZiiB5S52FPkA0HXqZ93ejl6EdRce4I22N5Gds=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hdf3KVIGr1diZCznCDj//noqPZMxGgjLpYBDRn3qps+QS6IcvkNLJ3IdRH2zXF2C7
	 URYBpRlskQbfTaNEqDwgPUVx7Z4xO9WmS271Srjz5I4yNgPN87v+zfd+4uXKxTdDN2
	 mxRDPVWw17WD0sp1TCO1ralpT4t+7hokZsrMBerc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A588F80520;
	Mon, 20 Mar 2023 18:58:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F7EF80423; Thu, 16 Mar 2023 00:11:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB956F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 00:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB956F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kSOKXaLA
Received: by mail-pj1-x102a.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso3571495pjb.0
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678921877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kzy0B/VYnSJRvZ8pGtdA2kQJazW5NtKMyoTehvrQmDw=;
        b=kSOKXaLA2XOfIn6OLaCrF7ohz5hyFI9gZZMaZu62+ifKfKT+mpEtUk7LbMNO8nsoda
         zZ4dpu2h1nnINsgPWb6laXAilEFF4M+hvfyO0USrhjhjkol45xsvEzR7qw631mk+Vjt5
         NKRRMTEsF1jZxH90kXSw9eN7SeegJWB/zU3SoTZGfTOA8l8s7tu2A22/rjj/d/ya7BF2
         2s4FTetw1dgkoqGLk1Dux1vanxLFT0mAm0J3lCY+hPmGC0BWhadUDpB0fz+zjNZrgG0p
         /FIqa6uw7NN0ka16S1u1YlHXWNiz+0aEheoFLWxwqXjqTWD30JZ/K+mT6lXXOhtWb/Qy
         2K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678921877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzy0B/VYnSJRvZ8pGtdA2kQJazW5NtKMyoTehvrQmDw=;
        b=L5ewnwjUfRDi7NQVyhudI8AvH6KVqOwBdMTaJyAssZu6ZPaKFlOXKTBiQn5NGdrDfh
         OKeillLe9FwwiFzZUqSKSut18CLQ90Qa+NRruldUqoSP0zkAj9UnGcEpnI7vNlxksoM1
         f34H1ul0bPbW39JAyd/TTuz8/z1bMgOSiP/2OAMAKgJ14dNmyFqD9kYFvU6JwBv7sIGu
         3wvYIZ9MlIKU3nSp23jUyhmuxGUP9hDyRkBRVpSTD4m0unm9UUmiBksxiYJ8SqFwsXGB
         s6+NpCY7bFlUvJyIuhhOYNvvUq7jOxXaVEvp69EEE7geKqrP/kXavK7dNhxFIhNKo48s
         N12w==
X-Gm-Message-State: AO0yUKWqDBFrfCQkrrRrfnR7812Y1+9XUpK90XSMKTn9sQR5O+fUe+tn
	qQ3SlQhYKapkbByk0zM+pKk=
X-Google-Smtp-Source: 
 AK7set9wsbdkZ1LjU01R5iAlOExPzKZm3vwKjuDjqLuZR0UayRfcjyyy0SFPQvHT2QRZ2N2EQDGl1w==
X-Received: by 2002:a05:6a20:8e2a:b0:cb:f76c:e1a8 with SMTP id
 y42-20020a056a208e2a00b000cbf76ce1a8mr1604364pzj.15.1678921877048;
        Wed, 15 Mar 2023 16:11:17 -0700 (PDT)
Received: from localhost.localdomain ([14.139.38.154])
        by smtp.googlemail.com with ESMTPSA id
 m123-20020a632681000000b0050bebfe464dsm212616pgm.53.2023.03.15.16.11.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Mar 2023 16:11:16 -0700 (PDT)
From: Vijaya Anand <sunrockers8@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Date: Thu, 16 Mar 2023 04:40:55 +0530
Message-Id: <20230315231055.3067-1-sunrockers8@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: sunrockers8@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PMOJOMPMFS4QCI4UDW5KACMYAG4RT3Q2
X-Message-ID-Hash: PMOJOMPMFS4QCI4UDW5KACMYAG4RT3Q2
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:58:14 +0000
CC: Vijaya Anand <sunrockers8@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMOJOMPMFS4QCI4UDW5KACMYAG4RT3Q2/>
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

