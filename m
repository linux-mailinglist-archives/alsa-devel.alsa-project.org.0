Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C96D7FAB
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 16:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE0791E7;
	Wed,  5 Apr 2023 16:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE0791E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680705423;
	bh=nZsZvgABMoA5GoArYeP8GGFxmyORBjVHnk5twzeLhpk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DhQG+kaw247U1Pl6Ku8/vyf5+N1XGpIZl51rUwrY3Z7tNXMPKLcwHC+0s4z63ayHG
	 KflUqQoQyLpV4s0fU1jNZpfjF3hfdqqoiQ630oo2tcqHBGoatHgqYzdb60qb1tiiE6
	 1iH7b8cyTFaXdh1rWufWueSqmQBkQK2tPVStTfEY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E5BF80075;
	Wed,  5 Apr 2023 16:36:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5696EF8024C; Wed,  5 Apr 2023 13:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEDC0F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 13:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEDC0F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BBxYrUNN
Received: by mail-pj1-x102b.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso3833423pjf.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 04:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680693373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6OXfkDuf3MCgikRaPSbB/O12A7AoKBBWB7PbjMP2MY=;
        b=BBxYrUNNDMwp7+Tqeh1bO3vHzynEz0eJ2RXoNzmmg3eCVXIsCV2koZKaVJlb0ZUxyU
         W+zimIXyQ8DMibtueC8dVquK0OfEfjc5BsTUgacp2ZH10gtZyKFPAqKlE+xXaHGMk/2D
         Dr5frSOdrwTuaD6UtKlR+uHhqQcWHNWqsLNWz+fh9tNXLT2FZWGu97t1LqTSnjw7xAEs
         6/ccGh/xEYnxn3xnLSoY6ncqOhRrTLX/p0gzqxo0jIPJwn406x8mvTC4kvp9x/3B64gN
         eDPiGll1tt195UBvZu8/5qG7W7xlLj4O3pXWci2QbSE0HNiLETQnnomISHYZh/N4Mj5N
         mqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6OXfkDuf3MCgikRaPSbB/O12A7AoKBBWB7PbjMP2MY=;
        b=LGDBHJfz7VeqcaSfwXBMY94JnpUvSF2xm7Hhu6MU+Y2t9J99r4El1PXBUjSt0euwMm
         xGlm8i6TIrJ3hezUGdWmSO5Yi5nhZkerDPmJof3JKobOJ9/pvFzwz54p5IWNC4kJtPmB
         92sucbznp1BZweiG9+OKxrd14yJTUK6AVSsLnmorbhDFbBh9ONDb22PQA0avKRlOUgfj
         023k1eCHlOkqP//d47qbC4clkTy/GX6IzymODLpGfgZTaF3MI8BwVUKnQlNLNjCcjJ1i
         rKbcvAIUHvww8d90tP4GuuAC84wK/EkGyzBJ9RmHLADt547hdqFtjmrAUeQrlIcihsb9
         smWA==
X-Gm-Message-State: AAQBX9cEMh0kF8jXb3IRw+hTo9HXumU3TrIWWvldqVmEbLKY/H8hexUk
	0M4CIWoV97GbFduj4j6tFLyv8vN35r34Jvxw
X-Google-Smtp-Source: 
 AKy350YYBD6yGza/LzBE2u0U8/bo6+93p5WXzhhL3ABjKqpdFYKYX6wXfdST+neNSVrpJjOlP2hRqw==
X-Received: by 2002:a17:902:d491:b0:1a1:d70f:712d with SMTP id
 c17-20020a170902d49100b001a1d70f712dmr7139789plg.31.1680693372699;
        Wed, 05 Apr 2023 04:16:12 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:89c2:2f77:b4c8:3f7c])
        by smtp.gmail.com with ESMTPSA id
 ix12-20020a170902f80c00b001960706141fsm9931144plb.149.2023.04.05.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:16:12 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH v3] ASoC: dt-bindings: wm8510: Convert to dtschema
Date: Wed,  5 Apr 2023 16:46:05 +0530
Message-Id: <20230405111605.5250-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OYDL5IJJG2KGWZRP2SUQUK7MBYGGR42E
X-Message-ID-Hash: OYDL5IJJG2KGWZRP2SUQUK7MBYGGR42E
X-Mailman-Approved-At: Wed, 05 Apr 2023 14:36:08 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYDL5IJJG2KGWZRP2SUQUK7MBYGGR42E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8510 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
Changes from V2 -> V3:
    > Drop unneeded SPI example

Changes from V1 -> V2:
    > Added cirrus opensource as the maintainer
    > Added missing $ref to dai-common.yaml
    > Dropped I2C and SPI description
    > Added sound-dai-cells property
    > Added 'compatible' as the required property
    > additionalProperties: false -> unevaluatedProperties: false after adding $ref
    > Added SPI example

 .../devicetree/bindings/sound/wlf,wm8510.yaml | 41 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8510.txt      | 18 --------
 2 files changed, 41 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8510.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
new file mode 100644
index 000000000000..6d12b0ac37e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8510.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8510 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: wlf,wm8510
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        codec@1a {
+            compatible = "wlf,wm8510";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8510.txt b/Documentation/devicetree/bindings/sound/wm8510.txt
deleted file mode 100644
index e6b6cc041f89..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8510.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-WM8510 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8510"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8510: codec@1a {
-	compatible = "wlf,wm8510";
-	reg = <0x1a>;
-};
-- 
2.34.1

