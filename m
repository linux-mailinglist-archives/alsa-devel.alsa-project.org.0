Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FAE6D4C12
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:38:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7EA31FB;
	Mon,  3 Apr 2023 17:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7EA31FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536299;
	bh=sn6J7S+uj3+as1epK8ns51c2oXmkDIJmgwLPLbM4CmI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s/t9yNDQZ7NQBldfCjCS8CGGiQNr4526lqbAhlXLNQfJ1chWpjquM6k2M6LaUo/27
	 RX/GJR1nEmAM7+kJbOnHojqMQRW2ktSxDYXUDfwCbmKlxTqRgdAh0aTnrGKIXj1xwq
	 zfln1ookw+FCeXgFmmfEBffbPql1okOG9L3mavmk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBF2F80558;
	Mon,  3 Apr 2023 17:36:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECC0CF8028B; Mon,  3 Apr 2023 12:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 250E8F80482
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 12:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250E8F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N46ym3Km
Received: by mail-pj1-x1031.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so30084964pjz.1
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680519174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjHdMf5pmc+VnOq5rbReP1B7/Pwn++54UQQr+szUSWc=;
        b=N46ym3KmbP15CNVB1tEhbGBxxsceIvYRTyde8BixGqsGzruAP3aNxDHpoebiQH9wad
         zbbk6rYfZCrq0gT9XW+rF36oZYcz07BZyWfoeSyj1kkyb23vd0jBOOlSE773L4q5doKx
         Y4lFsrfp5G3UzOn9ByEhp5CaIcyrQEkOZsX9XwOaxKUBiVmruOy3VLesauDtXo62bDNu
         0U5xd1Ocp7FJmrkJvZynoydQCmRV9XFtDJhl/+xmjCEiZG1MY1vASnlRtbk5SRgxtFQe
         Y1zHmaCK4p1Fmwui2dLoTSrq9FWyoNRzfzFqjdaQTYOZYvqnf9ooY9h0R1Nnqpqf6kvu
         o2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680519174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjHdMf5pmc+VnOq5rbReP1B7/Pwn++54UQQr+szUSWc=;
        b=e/+f3SQAPnAagn4NiiLGBmGiVpQghNADa4SUIO7WFRbcQ3Q0sm8ZznPv/wYvJ6yDvj
         KOrYV3ISKxZ+C3ggWcP3n12uozLij5AHkrFzfr6SP8sdbjVHiVliw58x5L1eRkvj9j+J
         XrTkFZ1EBVf+r7OwPZM6BOUIPkD9tMhvZ4xNP82cYR6RHknCyD+P5F+2l2XwdGsyyLiM
         0Ykim20v1mmMrtYEGEAMJ08dQkkoH/jTdfz4/JxoSEQ/l5WX1MyJaAPey0n7FyhD+FkD
         OgQ5EgGN/k6/QpYc5xQBE6weznuBbn70db1DOT/IkYRXdZOebLkqjM9dQ2+9EOhmesqO
         Mokw==
X-Gm-Message-State: AAQBX9esx4iDsRQHF5XqlHdYNEbOP2c/qs5YafsXwZddt7HyPUwjr6VI
	CuadCrZAclXt8Jg322qgusg=
X-Google-Smtp-Source: 
 AKy350YvdEdEdbgS7UVH6gaz7BWar8qebb1CN+RG5zbgI0OjvDNbVafRz8qmSEdwk+P5kNiWRpdu9Q==
X-Received: by 2002:a17:90b:4c8b:b0:240:c25:210 with SMTP id
 my11-20020a17090b4c8b00b002400c250210mr39814675pjb.44.1680519173681;
        Mon, 03 Apr 2023 03:52:53 -0700 (PDT)
Received: from pavilion.. ([2409:40f2:100f:dc7:7de5:f2e3:4932:541])
        by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001a27e5ee634sm6325182plb.33.2023.04.03.03.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 03:52:53 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH v2] ASoC: dt-bindings: wm8510: Convert to dtschema
Date: Mon,  3 Apr 2023 16:22:37 +0530
Message-Id: <20230403105237.3854-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FYBBEFL33FWWI7BGBYCXXRM7U4LWDCKE
X-Message-ID-Hash: FYBBEFL33FWWI7BGBYCXXRM7U4LWDCKE
X-Mailman-Approved-At: Mon, 03 Apr 2023 15:36:14 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYBBEFL33FWWI7BGBYCXXRM7U4LWDCKE/>
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
Changes:
V1 - V2: Fixup issues mentioned by Krzysztof
         Add SPI and I2C examples

 .../devicetree/bindings/sound/wlf,wm8510.yaml | 52 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8510.txt      | 18 -------
 2 files changed, 52 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8510.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
new file mode 100644
index 000000000000..418a82f65531
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
@@ -0,0 +1,52 @@
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
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        
+        codec@0 {
+            compatible = "wlf,wm8510";
+            reg = <0>;
+        };
+    };
+
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

