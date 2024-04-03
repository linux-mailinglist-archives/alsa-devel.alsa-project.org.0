Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27489AF20
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8B492BAA;
	Sun,  7 Apr 2024 09:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8B492BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474550;
	bh=z3FscXihxwpOV4ROqTZ5m0E+vHpG1jkSs+uhYwvMfYI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FptLSPFxfpE5ixdz/h/MfcJMm5oItsFXZVoKgwK2xE3tMo5BEBKobUPTnvv3avCfC
	 yZLLoSRRy4aVwJRWu9qaxxgaQBxry0rFUzF2hCSUcDocRax+FVSOx7c0IpJH72XWrQ
	 9Jn/R+YKd4hTmE78b3CFagYmIQ6HOBcIhDwS/ZTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 292EEF89619; Sun,  7 Apr 2024 09:18:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61410F89625;
	Sun,  7 Apr 2024 09:18:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 264F0F8020D; Wed,  3 Apr 2024 19:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05669F80114
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 19:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05669F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j458D/SQ
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6eafbcc5392so471b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Apr 2024 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712163613; x=1712768413;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iqVZ5gA1EsiAAqdiE1q1pz002POsB1V3jfn1PcyLTU=;
        b=j458D/SQxk3/ha+MPBsZp7271D+4o0QRmJ/dURjWKBJfdrLErrr563492nOls02bgA
         yqgRgN3saKxwgXUGkTiaf1gu40TNEaSHepy49bQ55aciXGf9/JF5w5A3QI7JEYWgEhcU
         cTwXjG5d0smFwidsbJUgtvzEHBbkpViQ521+sssNCyARnWo+eNzDa/U3EFgyH7QGRp0h
         Me5Yq2s9p3l7rROCGdQjtJMqqY8PAPa5nFxklbdsirpTw4ld4zrRsOaZofhQj1vbuHZt
         KhQBvODjGbERlRU+3/p+YalyEUHVxzIViiCSQ3YJ2PhtmMuYI5uYeeWLfLuTp6zRMZvY
         fOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712163613; x=1712768413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iqVZ5gA1EsiAAqdiE1q1pz002POsB1V3jfn1PcyLTU=;
        b=mFzAuckv7ipSoLaMg755gz2SxtD53e9qdD6CrC3++nulaHlP3xVhWcCsWjZIUQ/sNV
         vvm6f3+qPhEzXRtEtFaHeKFqlTuLaqWHb1KVfpK9vCSX0aEPJvNutVKOrcZ3zWMlUQ3p
         7pG1bT4f13fp1YDmk83HfC8VZ+bKcUi0vPL5WTCuKJ4WtoTyNJ/F3k3uKRTI4AqaBbV3
         N5l/fvgioHjyK5JTYdJeM0hMCROcN3U6CXMliOPgBXbVLXmSK8IR6qlvK6/PrK4pvGk+
         pEd56xJQiPzTDo1ZTQezqPN9gN4RUb+ptoAztXwzvSPe/Dt6L8XQvgGCOsOazZ6ttlxr
         rXXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLPgtq2XbML83ZJqSHKLU8Zmve6e+gcpLrkMIf3wo4k/dmEmb/4Gmshu0e/AQjDglw655CbRwPpC+P5tRS6Uyz0oa966uAsgtN0MQ=
X-Gm-Message-State: AOJu0YwtmnqKlvjb3RgCnvK91CjCn0fa5t3QEfJggFKncIDBb6/hnsbs
	EqgQGw1l90a7Qq4xlhVqVGZPmjG87ScoO6J1TX6SGXAg3TQVjXKK
X-Google-Smtp-Source: 
 AGHT+IEGnCuTqwRJlWkcslahpnxgW2v/avadB030lgfgF5175R9lm9IIeIXhMbMokkf1DfF6h9e5WA==
X-Received: by 2002:a05:6a00:21cc:b0:6ea:e31e:dc75 with SMTP id
 t12-20020a056a0021cc00b006eae31edc75mr121993pfj.5.1712163612561;
        Wed, 03 Apr 2024 10:00:12 -0700 (PDT)
Received: from localhost.localdomain ([203.188.229.101])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a056a000ac200b006eaf3057352sm8891925pfl.85.2024.04.03.10.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 10:00:12 -0700 (PDT)
From: Mighty <bavishimithil@gmail.com>
To: 
Cc: bavishimithil@gmail.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: omap-mcpdm: Convert to DT schema
Date: Wed,  3 Apr 2024 22:29:50 +0530
Message-Id: <20240403165950.75-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y2FLJKNPYIOJE5YHP7BYUDI4363ZSBU6
X-Message-ID-Hash: Y2FLJKNPYIOJE5YHP7BYUDI4363ZSBU6
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2FLJKNPYIOJE5YHP7BYUDI4363ZSBU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the OMAP4+ McPDM bindings to DT schema.

Signed-off-by: Mighty <bavishimithil@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcpdm.txt  | 30 ----------
 .../devicetree/bindings/sound/omap-mcpdm.yaml | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt b/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
deleted file mode 100644
index ff98a0cb5..000000000
--- a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Texas Instruments OMAP4+ McPDM
-
-Required properties:
-- compatible: "ti,omap4-mcpdm"
-- reg: Register location and size as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- interrupts: Interrupt number for McPDM
-- ti,hwmods: Name of the hwmod associated to the McPDM
-- clocks:  phandle for the pdmclk provider, likely <&twl6040>
-- clock-names: Must be "pdmclk"
-
-Example:
-
-mcpdm: mcpdm@40132000 {
-	compatible = "ti,omap4-mcpdm";
-	reg = <0x40132000 0x7f>, /* MPU private access */
-	      <0x49032000 0x7f>; /* L3 Interconnect */
-	interrupts = <0 112 0x4>;
-	interrupt-parent = <&gic>;
-	ti,hwmods = "mcpdm";
-};
-
-In board DTS file the pdmclk needs to be added:
-
-&mcpdm {
-	clocks = <&twl6040>;
-	clock-names = "pdmclk";
-	status = "okay";
-};
diff --git a/Documentation/devicetree/bindings/sound/omap-mcpdm.yaml b/Documentation/devicetree/bindings/sound/omap-mcpdm.yaml
new file mode 100644
index 000000000..8c9ff9d90
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/omap-mcpdm.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/omap-mcpdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP McPDM
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  OMAP ALSA SoC DAI driver using McPDM port used by TWL6040
+
+properties:
+  compatible:
+    const: ti,omap4-mcpdm
+
+  reg:
+    description: 'Register location and size as an array:
+       <MPU access base address, size>,
+       <L3 interconnect address, size>;'
+
+  interrupts:
+    description: Interrupt number for McPDM
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the McPDM
+
+  clocks:
+    description: phandle for the pdmclk provider, likely <&twl6040>
+
+  clock-names:
+    description: Must be "pdmclk"
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ti,hwmods
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mcpdm: mcpdm@40132000 {
+      compatible = "ti,omap4-mcpdm";
+      reg = <0x40132000 0x7f>, /* MPU private access */
+            <0x49032000 0x7f>; /* L3 Interconnect */
+      interrupts = <0 112 0x4>;
+      interrupt-parent = <&gic>;
+      ti,hwmods = "mcpdm";
+      clocks = <&twl6040>;
+      clock-names = "pdmclk";
+    };
-- 
2.34.1

