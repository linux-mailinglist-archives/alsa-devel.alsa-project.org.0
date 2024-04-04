Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB889AF24
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:23:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB7CE2BD7;
	Sun,  7 Apr 2024 09:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB7CE2BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474595;
	bh=YsR66LWGItmKjfFG/4thl5QkI/T85/VwbY4I36tSedw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jAcDBPB7LUHNaA8I9fhrnlZ+9R2emajKWsHZRetW4iHJWC9HgiA2EUc4nr9wGpKhu
	 RPZtxHM1178kz+p3pbyejGkc7AHf8RtAJaoevkIIpbT1qC6gty/45VBGVyo4bPGNsm
	 edI44TnsURZqo4HNDoG5VehbaWHg2e51KbAGrwUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 836A9F8970F; Sun,  7 Apr 2024 09:18:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A3FAF89716;
	Sun,  7 Apr 2024 09:18:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66224F8020D; Thu,  4 Apr 2024 18:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CE58F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 18:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE58F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OoelHQ9y
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2a20a9df742so836632a91.1
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Apr 2024 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712246824; x=1712851624;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwkMEGu4bH84VlMdGnCK4KPRxbhmbdEM0Bw2IunWXXM=;
        b=OoelHQ9y0wNYOQVfOa4wyI9YfsAEbDdPkrBF7G04fe4kaVhPN3TM1NdOrs2BmsT+TJ
         KgdwsnNHgFQVmtG2nKq7avePdlfo6KP2hQhVB1hLKGP65Qnnd2Ur7F7hlzOqdABMGOJP
         7Xrytiic+H47ej0PfpaFuQiitbgzbAIaU3+rsNig66YpGXYS2Jo4Vh7Ui0LYUaF5Wo9A
         84nm+DkAvsgnrKnJxfV6pu4PCUjmxDhs0K1yS8EBcsoFOxrZYit000Chri1kgCqsUkEb
         94cxc+GgSW7PTmmvuakdFZndiJem4ISDm1LFPgvE0nvGltlmEgqJa80wE7G3uE0Vzc6u
         V13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712246824; x=1712851624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwkMEGu4bH84VlMdGnCK4KPRxbhmbdEM0Bw2IunWXXM=;
        b=jfHQblZ2YSBqEDTsWnRO2EeXl4Nry8KIOCZu4dQvkFznz6lS/qgePll3GUYEYUXDuT
         sZQrTw6ql3j/8R5qvD0oCffTS6K3er46tmPD6MGeu6F3YdeEQdKXSRV3S6oYgOsFwMLW
         FlpX9azOgJniyvgQMEZy5mIkS/qd9UE/Ugu37Un5aYePlfey4WXl4h0vOO9OoMZErL0j
         3xYZ8rTmGCsU+9Cys870Aq8pZTINx4BCVkR9vQ9qW9hbPTeS6mXOlupMuIl6nIWhUZEX
         2oKhXmJNScTcUOT/wL9uFh75nXfecToYvMmZn38XO3UAbJi0eI6sS0w9sqjCx0K/19ik
         No7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN/Q9rJJT8rkjCbM0hEsbroIEV22gunoW6okhXb/iv54hERcvvHkNuOK466uVFCvkDnz0uZ4FfYtdFqxHp/P1tJRKaHQbZ7h1+8yk=
X-Gm-Message-State: AOJu0YzzaSP+UJjJ8Z7xgiOL2cvGwEh8nICXGudyCyw6I9b907HGMcmt
	9Jom8mGmLPDZ9fH1gBezHW3T7wYu+58Id7kh8i/XqPaXeCQolmgq
X-Google-Smtp-Source: 
 AGHT+IHibPG0W6H55vie7dFKnWlXEFmJq9c7f5VRpXhqgGA+gL558fvkCHxdOte330lCDtfdPWWS2w==
X-Received: by 2002:a17:90a:b10f:b0:29b:b3fa:b7a5 with SMTP id
 z15-20020a17090ab10f00b0029bb3fab7a5mr2556863pjq.7.1712246822352;
        Thu, 04 Apr 2024 09:07:02 -0700 (PDT)
Received: from localhost.localdomain ([203.188.229.101])
        by smtp.gmail.com with ESMTPSA id
 g14-20020a17090ace8e00b002a2979a8651sm1685928pju.54.2024.04.04.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 09:07:01 -0700 (PDT)
From: Mighty <bavishimithil@gmail.com>
To: 
Cc: Mithil Bavishi <bavishimithil@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
Date: Thu,  4 Apr 2024 21:36:49 +0530
Message-Id: <20240404160649.967-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z5O5H2VLFGDFTQ5DPRVFJHGWWJQIOJBD
X-Message-ID-Hash: Z5O5H2VLFGDFTQ5DPRVFJHGWWJQIOJBD
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5O5H2VLFGDFTQ5DPRVFJHGWWJQIOJBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mithil Bavishi <bavishimithil@gmail.com>

Convert the OMAP4+ McPDM bindings to DT schema.

Signed-off-by: Mighty <bavishimithil@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcpdm.txt  | 30 ----------
 .../bindings/sound/ti,omap-mcpdm.yaml         | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml

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
diff --git a/Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml b/Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml
new file mode 100644
index 000000000..4d5d37e98
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap-mcpdm.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap-mcpdm.yaml#
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
+    description:
+      Register location and size as an array
+      <MPU access base address, size>,
+      <L3 interconnect address, size>;
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    maxItems: 1
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
+    mcpdm@0 {
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

