Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87986E3003
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F261FDEF;
	Sat, 15 Apr 2023 11:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F261FDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681550016;
	bh=zbhTJ4LHDE6v6SbmQIEmQHpyuRwMYd8o/29e/XestB4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PLmgMiTsrRzEkVJgjnKptvrbj8QtF7X6IhqqpVsohEe94ku5/7RKjVOi0lilf+PDr
	 wEMpkTTPWVh/YAumeyKKSFqqiO5/qwVb9TFdp7C+FysRLqcstN0ley/HdVYeHq1JEf
	 IJl3Bz3l6JNonlTFl6NNQvkZRlSE8sE6/8OEyrOE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B41DFF80589;
	Sat, 15 Apr 2023 11:09:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2735BF8032B; Sat, 15 Apr 2023 00:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3264F80100
	for <alsa-devel@alsa-project.org>; Sat, 15 Apr 2023 00:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3264F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=UD6PxTID
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b5465fb99so499108b3a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 15:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681511897; x=1684103897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rd3c9+mE7jlWzBM428gtRxGvixpDmdNW0Kf4A0MjSMA=;
        b=UD6PxTIDCsE4J+rPmy8GMiFLpPCTQ1CQrkYgVjV06BcaKT43qjbC5n5gJx61EtyNeA
         upOp6yo07/MGB5NM/tPJzODZ4XhxxNQhuAzaUMsj8GzDOXjuGMzz+QXi8Z7EkPKNkyY9
         d03rndiEB/L/iCvqVZtlpdHyYkZD/i4JVlAKyPFKlcY/7ADVyft2KEfFHl1Kc48xiwsZ
         PAZfyY0PSBBqgyCXHYYdHrhgSz6V9aL+m+cMIcg/62kfZV8bOhqns3r8LoEvysWoYTmC
         IdWZXgnHo41uFI+k+OqGLr9NODetSYnIvUthbLcISBcGd802rit7avfxrjomgqLsyae7
         Jfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681511897; x=1684103897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rd3c9+mE7jlWzBM428gtRxGvixpDmdNW0Kf4A0MjSMA=;
        b=XlPK7hLqgR5yEdBR62KkhQ2IO3Dz0OI0Sa4AraoKLio+j7eCrk4vNNQ9gCF/XGzwag
         nn01dFzFABwE1olg0Cc+VXdFpp+dPBPOlVydsZL0+Ym2WHbjMP+0K+E/sGBMIaKlvnzT
         fgYzIEIIFSeausPUDlf04+g8fx/ZLf3oNR5bDJZlWNRytBGa2Ekf1rQsmmL8qAiwuQZZ
         iQaU0TDET1gTICEr2VJ0fMh8HFyBN0plXYQsF8q1IDG7hxxVIQL90hn+vG+CZAbz37U0
         qFQ+eY0fyIOoztHRwiQtT2HS580pZcJHrQ2Ol4P0rrGEQ+A7XcHjx9F1W/DB6t9Y+x8U
         GWpQ==
X-Gm-Message-State: AAQBX9czzPA3GKjWfdS7WqU7v3SN0UeS0iJb8oT1wQCxUis92KicN32O
	xVdAwdRFq3MpJPPzVzyIJtM=
X-Google-Smtp-Source: 
 AKy350apIIoDRR+eXBw9W9c5rt3yXzw2WlFDTi4QTZvEVK8Chf3FqVrZrXgZCZFz+pq6B4PSfLQ46w==
X-Received: by 2002:aa7:8891:0:b0:632:e512:1025 with SMTP id
 z17-20020aa78891000000b00632e5121025mr10789705pfe.33.1681511897077;
        Fri, 14 Apr 2023 15:38:17 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:218d:82:ae97:7cb6:b12a:54f5])
        by smtp.gmail.com with ESMTPSA id
 v26-20020aa7851a000000b00637b0c719c5sm3478084pfn.201.2023.04.14.15.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 15:38:16 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Date: Fri, 14 Apr 2023 22:38:01 +0000
Message-Id: <20230414223801.1106550-1-danascape@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G4JXVOSFI7P2MEXES7PBBHPUHKSH42FP
X-Message-ID-Hash: G4JXVOSFI7P2MEXES7PBBHPUHKSH42FP
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:09:07 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4JXVOSFI7P2MEXES7PBBHPUHKSH42FP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8753 audio codec bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8753.yaml | 62 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8753.txt      | 40 ------------
 2 files changed, 62 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8753.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8753.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8753.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8753.yaml
new file mode 100644
index 000000000000..9eebe7d7f0b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8753.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8753.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8753 audio CODEC
+
+description: |
+  Pins on the device (for linking into audio routes):
+      * LOUT1
+      * LOUT2
+      * ROUT1
+      * ROUT2
+      * MONO1
+      * MONO2
+      * OUT3
+      * OUT4
+      * LINE1
+      * LINE2
+      * RXP
+      * RXN
+      * ACIN
+      * ACOP
+      * MIC1N
+      * MIC1
+      * MIC2N
+      * MIC2
+      * Mic Bias
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: wlf,wm8753
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
+        codec@1a {
+            compatible = "wlf,wm8753";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8753.txt b/Documentation/devicetree/bindings/sound/wm8753.txt
deleted file mode 100644
index eca9e5a825a9..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8753.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-WM8753 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8753"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Pins on the device (for linking into audio routes):
-
-  * LOUT1
-  * LOUT2
-  * ROUT1
-  * ROUT2
-  * MONO1
-  * MONO2
-  * OUT3
-  * OUT4
-  * LINE1
-  * LINE2
-  * RXP
-  * RXN
-  * ACIN
-  * ACOP
-  * MIC1N
-  * MIC1
-  * MIC2N
-  * MIC2
-  * Mic Bias
-
-Example:
-
-wm8753: codec@1a {
-	compatible = "wlf,wm8753";
-	reg = <0x1a>;
-};
-- 
2.40.0

