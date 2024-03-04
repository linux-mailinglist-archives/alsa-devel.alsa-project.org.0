Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3F87703E
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:14:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E78B6A;
	Sat,  9 Mar 2024 11:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E78B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979275;
	bh=/Af1OqvaKj+Y/we0Ts7Sbh6sS0efeCNow+1SafjuFO4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MUoB0VJNl6mUy2TV64EgzwczxhAg4MtUim0OP3v7FUmSzwDmhiu/GE3sk326KZZDW
	 5aqyLF8qKAhYOmAgCsBDorcOsyvs9P0yi/wMtHt5FnHyPzzRcayi3i5Cc/s8bJiMzf
	 GdOrtHhckfj4W6vMMVs2hPBT48vO87AMNQIkjCxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D88CF80639; Sat,  9 Mar 2024 11:12:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F4F0F8060C;
	Sat,  9 Mar 2024 11:12:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D690F8024E; Mon,  4 Mar 2024 15:24:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A192EF80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 15:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A192EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gPoJlvd3
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d146737e6so3402381f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Mar 2024 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709562236; x=1710167036;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apaBpVQtA1STXfsjN2l+EhbnfJdRR6DZH9EsOTj0lX4=;
        b=gPoJlvd3rifr6e+tCL2n+Vs4ue3fX/irX1RKwVgf0p/9SMHaaIjoLB9wlpuCJIg3+T
         Hqi/nx0PyYpSzd/zgk7fA6f86l7LTfJfEQpVuo2bovjXqtxgDRF91+mhqJyNqeYGu8mC
         fWdOpnk++pzPuMYOVfCFe5UYsaILMZ9iXhUNZUv56XFPso6UV5y+JCj9ublGGtbksnKT
         4IXDCurMvode8erLsijvIK4ikmGDa1jZJE9HmDFwmWCmMyyLc83gDiH+Q6AybxwZIiXn
         lqFUsnlVchlB8eIw2qSvHUyKYk++eQyecl/bcy97+J8PJEMS4E1ujRDCnsrVuDbAcZEK
         K7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709562236; x=1710167036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apaBpVQtA1STXfsjN2l+EhbnfJdRR6DZH9EsOTj0lX4=;
        b=WCsEo+nY7Cgy8PsbssZ1QwTdzxjKJMOAl+V57uUDT4xqDAiGXNpSNVGAcKOSYWzT9F
         uGx2WCIXrEGcq6yS5CI/KJTkgDGLVkmXBLsJqlLVUMTVh77xqiUzZ4iTMIht4VDV6Z+8
         n9XGBqKJl3IsgoyZWk+nuVTHArQ4Jc96DwImg/qFgrwQr/oM+X25o/VO+PCKhBYNcd6r
         BF3VS0zL7lvQJGg5RO/EupWHeiL+7WOUDWKWnlCVJNjBZnL2+YOLcTmqqv7rKsOGq8xA
         j54eYC1MgTbZg+jQiv9pH7RGq6pugkjQ5h/aJb3PzSH02Zy+2sKQL4+R4XBZDljWctPC
         oIDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK1yzFyFGqkW9PEQF/u5z72N4Cha2GCn0M3NsFpPdMlfblTHLzyNzpI7EY9jx7Ez3SjrSJMfsYMomOkSFETMo6U98/QFN0wFP2aeU=
X-Gm-Message-State: AOJu0YxB5GrL7Wzk0PqpZELrZ3n22mY73gXYWgupyoEBlce1mcI2J9cT
	w/6BohrCsixvYlygp7hTELXqnDtGQq7i9HOekhIlGXS3T8eDLKbJ
X-Google-Smtp-Source: 
 AGHT+IGg2MH7GT1C+UoWFBUBjsuKghbrFQ0VkykOdak4bcjOJxYr/eYANQGF+LIh5pxi2hOHce8Bmw==
X-Received: by 2002:a05:6000:1249:b0:33d:2226:a28b with SMTP id
 j9-20020a056000124900b0033d2226a28bmr6152789wrx.37.1709562236222;
        Mon, 04 Mar 2024 06:23:56 -0800 (PST)
Received: from tuxserver.lan ([79.116.0.170])
        by smtp.googlemail.com with ESMTPSA id
 bs19-20020a056000071300b0033daaef7afcsm12636594wrb.83.2024.03.04.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 06:23:55 -0800 (PST)
From: =?UTF-8?q?Javier=20Garc=C3=ADa?= <javier.gar.tab@gmail.com>
To: 
Cc: javier.gar.tab@gmail.com,
	daniel.baluta@nxp.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Yu <jack.yu@realtek.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: rt1015: Convert to dtschema
Date: Mon,  4 Mar 2024 15:23:07 +0100
Message-ID: <20240304142315.14522-1-javier.gar.tab@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: javier.gar.tab@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 55V4SYJVSLY6Z3LTH67FTNDSMAZW6FNM
X-Message-ID-Hash: 55V4SYJVSLY6Z3LTH67FTNDSMAZW6FNM
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:10:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55V4SYJVSLY6Z3LTH67FTNDSMAZW6FNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the RT1015 Mono Class D Audio Amplifier to DT schema.

Signed-off-by: Javier García <javier.gar.tab@gmail.com>
---
 .../bindings/sound/realtek,rt1015.yaml        | 41 +++++++++++++++++++
 .../devicetree/bindings/sound/rt1015.txt      | 23 -----------
 2 files changed, 41 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt1015.txt

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
new file mode 100644
index 000000000000..880196081a60
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt1015.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RT1015 Mono Class D Audio Amplifier
+
+maintainers:
+  - Jack Yu <jack.yu@realtek.com>
+
+properties:
+  compatible:
+    enum:
+      - realtek,rt1015
+
+  reg:
+    maxItems: 1
+
+  realtek,power-up-delay-ms:
+    description: Set a delay time for flush work to be completed,
+      this vlaue is adjustable depending on platform.
+    maxItems: 1
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@28 {
+            compatible = "realtek,rt1015";
+            reg = <0x28>;
+            realtek,power-up-delay-ms = <50>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/rt1015.txt b/Documentation/devicetree/bindings/sound/rt1015.txt
deleted file mode 100644
index e498966d436f..000000000000
--- a/Documentation/devicetree/bindings/sound/rt1015.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-RT1015 Mono Class D Audio Amplifier
-
-This device supports I2C only.
-
-Required properties:
-
-- compatible : "realtek,rt1015".
-
-- reg : The I2C address of the device.
-
-Optional properties:
-
-- realtek,power-up-delay-ms
-  Set a delay time for flush work to be completed,
-  this value is adjustable depending on platform.
-
-Example:
-
-rt1015: codec@28 {
-	compatible = "realtek,rt1015";
-	reg = <0x28>;
-	realtek,power-up-delay-ms = <50>;
-};
-- 
2.41.0

