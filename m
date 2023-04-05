Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E278C6D9A3A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01852ED1;
	Thu,  6 Apr 2023 16:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01852ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791477;
	bh=2nvqTWzmWYA/TLITEWMZutZC8OVeyu20yyjKXsn7lCk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I/0tl/gaUEz6XIczPv468Ls2Q0DNtCCVocm9ifrU1peVCLUjS2GpanpU+lN2KJUSe
	 OnLA6vVp3Ighwtg1Da9n3MgGaWE/vapFNz6iMAxHgElLjnnIl/FpOCGMgwlI3cqQCB
	 uJzJR+XLqrNvZrmaA7gDVBBw2fasPiEhsjUxdJO8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2FEFF805C7;
	Thu,  6 Apr 2023 16:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67ADBF8024C; Wed,  5 Apr 2023 22:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E129CF801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E129CF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ox2POTwE
Received: by mail-pj1-x102e.google.com with SMTP id ml21so13323060pjb.4
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680728306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KJ3KXGfgJ4sZPfoaU/5WSm7YH1plpzja1cFXFVy8AQ=;
        b=Ox2POTwE6E8YfRjtE83SQvzsttCEDutLPrnoq/iyXi40fkEB8rLTPmhThCDh3+XY5L
         3vDYVbAU623ZwlR7qt+veiwxSfk1IXV01x7NTWk/se66jKmAh/ule0YUfUBUalWhakNY
         FUEyznRnuPts/VUim3SVVk7uAndY3x8k8I02x0LSnFY3g2iAwkVslP9m2NSjsGrCXAUP
         wA2kKFDvA6WIaKiTJgYN0uoYi9L3tELolNrghfGvloC9F0+AH7DvynJk9T2st1SVGFGO
         U0DJcd1nW3PFivJ509LzSVfJ+jPPVY41HzN4jzKWNxIgsf1nBUzJONyHNhJme8hWc9VD
         Ijvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680728306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KJ3KXGfgJ4sZPfoaU/5WSm7YH1plpzja1cFXFVy8AQ=;
        b=Kyoq0cJdjuihJUjd6tlCa8lnGARll7Z949GUtfZKUBDjrw1ifxvCknuaQcMP3KIEWx
         KY7aqkwuIKzKMdHKIGxI2S2udsUkromEOsLMjGwzRrbHPd0E8mBRSUET9CKTjZsW+mFK
         ywTed7cneTI4H866isly5C+vwa1bROzz3NC3rEGNSidGsR9PnaSSZn2OTJ8hF8gc2AYe
         9o0mcRkWFxEmGlR9UtcDt642ak0GcDlScUTDDff3s+lnd+5ZZyXhGfwSLpMhqzpCUOVJ
         bsxuyRwbkhXaI/u4wMlg5D1/BS5Xpy5GJ/Ka5LfKLIW64ieo2dOMXcHS0suV6jCMb99O
         FmDA==
X-Gm-Message-State: AAQBX9dtDqXrVPNzSmrXQtHTDpP6XeM1Dr/EHyn12LP28ekvpGq5hTZZ
	Uay4UySZGaNjRC5x8u/EySg=
X-Google-Smtp-Source: 
 AKy350aFUDEYE/VwNdXenQbCHuZrtNSCabv8bc99zIl5dBsqrPyqPEiiTzSv5hPYdSGT3mhKIJVmPg==
X-Received: by 2002:a17:90b:1c83:b0:240:3dc7:4939 with SMTP id
 oo3-20020a17090b1c8300b002403dc74939mr8839876pjb.27.1680728306098;
        Wed, 05 Apr 2023 13:58:26 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:616c:b78a:a01f:5113])
        by smtp.gmail.com with ESMTPSA id
 b3-20020a655783000000b0050b026c444fsm9490025pgr.62.2023.04.05.13.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:58:25 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: wm8711: Convert to dtschema
Date: Thu,  6 Apr 2023 02:28:20 +0530
Message-Id: <20230405205820.6836-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TYSFTRI3Q5FTEASYV3LWGIXBH6DIGGOJ
X-Message-ID-Hash: TYSFTRI3Q5FTEASYV3LWGIXBH6DIGGOJ
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:29 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYSFTRI3Q5FTEASYV3LWGIXBH6DIGGOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8711 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8711.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8711.txt      | 18 ---------
 2 files changed, 40 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8711.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8711.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8711.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8711.yaml
new file mode 100644
index 000000000000..ecaac2818b44
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8711.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8711.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8711 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: wlf,wm8711
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
+            compatible = "wlf,wm8711";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8711.txt b/Documentation/devicetree/bindings/sound/wm8711.txt
deleted file mode 100644
index c30a1387c4bf..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8711.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-WM8711 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8711"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8711: codec@1a {
-	compatible = "wlf,wm8711";
-	reg = <0x1a>;
-};
-- 
2.34.1

