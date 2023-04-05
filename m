Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B06D99E4
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:30:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A735EA0;
	Thu,  6 Apr 2023 16:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A735EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791449;
	bh=+MAgGvfu/h+7P347IF6b78RXhyp++yREoQ4RZfMRP0k=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ooPg6c5x6rigDFMbQ5n9fG3CuvbhGBaL8by5IwLTdMDFLTXduQygramqLvLmuWC8F
	 HNr6rA5PNk9fvwkenOkLezm6GSkI3tLmXBDwKgv9I6ksz9+J/ShmKkKYOefvMKenC0
	 l8tlX3MWttHVXYFwTtY+nksSfIxMvjQHsFH5gpv0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84612F805BE;
	Thu,  6 Apr 2023 16:26:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7220CF8024C; Wed,  5 Apr 2023 22:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 890DCF80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 890DCF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=elPcmQmD
Received: by mail-pl1-x62c.google.com with SMTP id kq3so35507451plb.13
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 13:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680726867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mBL1QQnDIB+z3BztabybEP4t58oo66sKusUL7l71Y8=;
        b=elPcmQmDFHSPWnjoT9RNRUFGZ/sLF7ZJrBubJS73mov6OMm0GsE1UVhCuly7fsIVm8
         tRBnetr1WyeXNIO48vO0lqssIoZO4KBY1QWM7kUtju3kuvI41M0ajNLUdO+nvZaVa13h
         58+fKsDHQwOAMyECkfLZuju9GxmHYkNyAmWNMGvUn2dOW+ERke85+NEgOtZL0D/H1YQ3
         bivEuONqfOpNzY58iJQDAijlL/7s14pLFS9gz/SXXFWGV78Wiq9zyyYBJae8EvUog+Zs
         LcJvLQAfFl790WqHH6ZMkZq/OvhpkDtO1w8I/+5frxZcAsjeHtRFGKVSw3XJhNPIuV0h
         NsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mBL1QQnDIB+z3BztabybEP4t58oo66sKusUL7l71Y8=;
        b=5Ki/yvhNVtp6AeLoreg03Qz96+KjcVdgHFqi0tFAT8Ppl/tELVsKK2xSuLJ0PzxzPp
         1v3xZvvT8MWhF2PuUGYm+5woihLPTit2aJwTmhrVI4Powp79PdT9oDe3IePaQuoFCWiS
         M/eEivXyxFBEOBwP99c3DC0QF8aw1M7NrDKhqEPFm0OKCEzMyt+3I4WCeC75dqoq12W1
         lMZc3VVyLCGZg7AEo4pLE3u9p+pB/Woo2yk6Okp9oNUODz6k5eTqno0WQzdjANQUPBMb
         B9SLHf1tVTdL6WliyPq94DAk25Qh5fh/o9VETvKBP3O2GrovMIfbEZPQKcurzC2jbQEC
         2lWQ==
X-Gm-Message-State: AAQBX9exnw39lepdfd81L2O/T8YWqeOy54yBVVSQDY10SB9FiyBW+mxT
	MZyC5uX9whIcMx8FPZU+pjg=
X-Google-Smtp-Source: 
 AKy350bv/hdrI3VH3BZ76HsUrGFyINmMANwgoAFIha+oi0e7kf0Gs26sQEsMYyx1+5svRIP8E9LUWQ==
X-Received: by 2002:a17:90b:4c0b:b0:234:1a60:a6b0 with SMTP id
 na11-20020a17090b4c0b00b002341a60a6b0mr7935298pjb.34.1680726866522;
        Wed, 05 Apr 2023 13:34:26 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:616c:b78a:a01f:5113])
        by smtp.gmail.com with ESMTPSA id
 c12-20020a17090ab28c00b002340d317f3esm1769231pjr.52.2023.04.05.13.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:34:26 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: wm8523: Convert to dtschema
Date: Thu,  6 Apr 2023 02:04:19 +0530
Message-Id: <20230405203419.5621-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TSOET72KQGGPQPTTP3GUTELMPOPPPPCR
X-Message-ID-Hash: TSOET72KQGGPQPTTP3GUTELMPOPPPPCR
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:28 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSOET72KQGGPQPTTP3GUTELMPOPPPPCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8523 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8523.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8523.txt      | 16 --------
 2 files changed, 40 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8523.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8523.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8523.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8523.yaml
new file mode 100644
index 000000000000..decc395bb873
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8523.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8523.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8523 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: wlf,wm8523
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
+            compatible = "wlf,wm8523";
+            reg = <0x1a>;
+        };
+    };        
diff --git a/Documentation/devicetree/bindings/sound/wm8523.txt b/Documentation/devicetree/bindings/sound/wm8523.txt
deleted file mode 100644
index f3a6485f4b8a..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8523.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-WM8523 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "wlf,wm8523"
-
-  - reg : the I2C address of the device.
-
-Example:
-
-wm8523: codec@1a {
-	compatible = "wlf,wm8523";
-	reg = <0x1a>;
-};
-- 
2.34.1

