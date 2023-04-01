Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3766D3622
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Apr 2023 10:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D4CAEA;
	Sun,  2 Apr 2023 10:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D4CAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680423267;
	bh=bE+dNR7hAwM2i8a8vDUtPNMM0SJCpb/XZgiA8sGgch0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RaNFc16stMVRH37JuaKLmceDdz6itRNPrna104d6qgc1zX/Bkom5rUulikbg7Tf53
	 ABngRPZqdY217i+QIZwD81zYtsfBZmlCX8IxTh0RBBUthHkWujsH/A3wdHvI/o3jUP
	 8W5lmusNA8yQqVQvkyCarP4kO97BtDIejs28PCpc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3171F8057B;
	Sun,  2 Apr 2023 10:11:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D441F80272; Sat,  1 Apr 2023 20:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 307A5F80114
	for <alsa-devel@alsa-project.org>; Sat,  1 Apr 2023 20:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 307A5F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TWTywiVB
Received: by mail-oo1-xc32.google.com with SMTP id
 i4-20020a056820138400b0053e3ccf739cso3123910oow.10
        for <alsa-devel@alsa-project.org>;
 Sat, 01 Apr 2023 11:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680373205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fITr2HwYgqLUUk1Kke5I+QMgFMyvuPMKr1ZR1hYIU3I=;
        b=TWTywiVBMaANiqanN77gtisbmbm/wLVaWH+qyvtSiG7Ip59YMo9aZDcndAj+mKA+np
         pmRQ/MRD3zciKrhFt0RuZvZz2+h78fnTzX/LcAXMYKtlKZxIYQAoAP4r4EremUZ3sz0b
         qkxGHWGCNrdO76vAQ9tDN0qdcTRQQlaidz9AixfK1WPfKQHehUmHtsft+IME2e+dtrn+
         19VBxkzkYCibQxoy7a1ESloaQXtfmxLJ3EhA8uCs0lomI+AfOuw00QACf/hwYVUCwKKU
         3oeE4S6hC+9ht1tFV7Nti8PwpFUsmbeyI9oqrOcY2RqMGsSjyUcsTXnL2A5iKKaz4EDY
         DGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680373205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fITr2HwYgqLUUk1Kke5I+QMgFMyvuPMKr1ZR1hYIU3I=;
        b=yWYgzrRBe3rW8yuxQyPaxp+UHvUMP4IM34Sb5hCZ4b+1CpEVSK5ZAPOAbRmEpl9bd0
         Cr7y7KwvIRNj0Au3B11ifAAqjxO9SX8GOxp8RO8wmU3joncq33o1Dojm8qPq3Bdwn+Ek
         OenaYqBZP3qT+AkWTWLYyO1PinUKfi+EXjixqpJkLrASWzp2aXccId89HdLhZ7R+xF2Q
         MHOImxp98M2Lw1DslZR9w/cejdHSQAWQIZCQeUjnLO9dOfnNXYpb12cdpF317NXJAB9H
         0P41oF71zCghO2A2gOjuD4pjwAmP9qR6Earsf91PoRe8hu5cFLTaAmnCAubjpVuUaRpn
         nafg==
X-Gm-Message-State: AAQBX9dXn9IGd5DeZJH+rMNZulYyl7LmUZtgILEgH5BNGd1EAJNKHw0+
	hFAp3OgeDGbtPRgUlZqpyLI=
X-Google-Smtp-Source: 
 AKy350ZGi7A5EVHermG2a+d2Y1EJ0swdZU4PDDJgxPBdTR3MqzeWevqrtPAxWogwUpGjkvCHzT782A==
X-Received: by 2002:a4a:bd8c:0:b0:53c:5f89:eb85 with SMTP id
 k12-20020a4abd8c000000b0053c5f89eb85mr6913034oop.2.1680373205132;
        Sat, 01 Apr 2023 11:20:05 -0700 (PDT)
Received: from heimdal.localdomain ([2804:431:cfec:79f0:85a3:2af2:a6f4:1842])
        by smtp.gmail.com with ESMTPSA id
 e193-20020a4a55ca000000b005255e556399sm2159485oob.43.2023.04.01.11.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:20:04 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	anish kumar <yesanishhere@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: dt-bindings: maxim,max98371: Convert to DT schema
Date: Sat,  1 Apr 2023 15:19:29 -0300
Message-Id: <20230401181930.533067-1-andremorishita@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: andremorishita@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JB3BCGNZO5AP2J7VDYNI3VADM3CUGWDE
X-Message-ID-Hash: JB3BCGNZO5AP2J7VDYNI3VADM3CUGWDE
X-Mailman-Approved-At: Sun, 02 Apr 2023 08:08:35 +0000
CC: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 daniel.baluta@nxp.com,
 =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JB3BCGNZO5AP2J7VDYNI3VADM3CUGWDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.

Signed-off-by: André Morishita <andremorishita@gmail.com>
---
Changes in v3:
  - Make commit message and subject as v1 with ASoC subject prefix

Changes in v2:
   - Generic node names - codec (Krzysztof)
   - Drop label max98371 (Krzysztof)
   - Add sound-dai-cells in example (Krzysztof)

 .../devicetree/bindings/sound/max98371.txt    | 17 --------
 .../bindings/sound/maxim,max98371.yaml        | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/max98371.txt
 create mode 100644 Documentation/devicetree/bindings/sound/maxim,max98371.yaml

diff --git a/Documentation/devicetree/bindings/sound/max98371.txt b/Documentation/devicetree/bindings/sound/max98371.txt
deleted file mode 100644
index 8b2b2704b574..000000000000
--- a/Documentation/devicetree/bindings/sound/max98371.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-max98371 codec
-
-This device supports I2C mode only.
-
-Required properties:
-
-- compatible : "maxim,max98371"
-- reg : The chip select number on the I2C bus
-
-Example:
-
-&i2c {
-	max98371: max98371@31 {
-		compatible = "maxim,max98371";
-		reg = <0x31>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max98371.yaml b/Documentation/devicetree/bindings/sound/maxim,max98371.yaml
new file mode 100644
index 000000000000..14fba34ef81a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98371.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/maxim,max98371.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX98371 audio codec
+
+maintainers:
+  - anish kumar <yesanishhere@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: maxim,max98371
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
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
+        codec@31 {
+            compatible = "maxim,max98371";
+            reg = <0x31>;
+            #sound-dai-cells = <0>;
+        };
+    };
-- 
2.40.0

