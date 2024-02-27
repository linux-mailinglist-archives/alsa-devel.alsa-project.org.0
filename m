Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AE86B16C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EED882B;
	Wed, 28 Feb 2024 15:14:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EED882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129679;
	bh=3Bc4JcS7h3uh1nH/uBs22YCORPrgVtcxn5c73BZBvQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JFQ/n4fF+6IH/Xgnrxqx3oTLke0GuiSDZNekOtC6zjbAbSueq5bX9H7AXdBwpMoyI
	 Ks6YMSCwX19XYJhoCeKHETZRfZVGIMkRS3ygvr++EQqONI7GhGf04V3lxR6Rd8JLM/
	 1jGQqM4pT7irgo3FK+YRnm7xbQxEVrzexw4PCJpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C27EEF805EA; Wed, 28 Feb 2024 15:13:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2986F805CB;
	Wed, 28 Feb 2024 15:13:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3E0CF801C0; Tue, 27 Feb 2024 18:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F59FF80104
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 18:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F59FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=udima.es header.i=@udima.es header.a=rsa-sha256
 header.s=google header.b=CWOjuOcs
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-412a588c8b4so15963325e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 09:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=udima.es; s=google; t=1709053466; x=1709658266;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95wAwQRxYUW01FCwrYdkBVJ1oY3jiTOrAj5JhsuFKJA=;
        b=CWOjuOcsAWHIng9j+yGOgOSQbS0IXXifcUwCGkmxC2bCi4/cc5UiGgEvT+1uWcEPDe
         C3x3lYwMP9wneJBHkeHj8Oajs9j85tKgEL/JNybGkeTywMXzLGEQKgbWDN+XopN1gn9V
         9qeAmDxo5BNtyxk8KOxZVsEoeoNeZZrRJX4Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709053466; x=1709658266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95wAwQRxYUW01FCwrYdkBVJ1oY3jiTOrAj5JhsuFKJA=;
        b=WpoJY4jsOEjBKnLALLsavLzPmFgcpmb0m/aGjSYG92IOUv91KYzWYUYaF8+mIOrDi5
         T6lDkiENnePbs6xsFNYZ/s08xOIltUN0wuBXhbVoFVlkGf1eN98UrugmktQdhfCXqJb2
         eUffp7F8/qxSC8+GNA6DiKDkyzG63DFGNURGGfcrUBNYcCcj8xIeq8S4vhKvZgkcCRDA
         uQfY4mS55axdUjO0suKmcYxMZEojOvSklp+x7NGbvTB0yFTMRmyvii6ri6OKuYvxDi2/
         FsMdHrnoIiAoS5rtppLXB7BOOI9MWEVSLtFppUu8krFrlH1K1vnjs3fve3KfUTYeIFp7
         4wOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXHL1iZZiLQmQvDp0fI/fLER07f0kHVjAMP/dQlUGh1kic+/U/BMJam4LIEz/PWvK7+E2wMb1KoVodXdpWKWruxIXN/pZ05aoCgNU=
X-Gm-Message-State: AOJu0Yyspf2f/fJUF5NLx/pUHBFkTFSOvCBkASybVA4V2MBFyOuOI2rV
	Y5/JyICwvQqrtJx05RUYs5G/dUQNbBIWA+yR6Ea9Lvae1VZ1qElKlIieeg2hl0I=
X-Google-Smtp-Source: 
 AGHT+IGB1KvOAfDXWLVJwto/yIheyZ7CkEm/iZR711gDYwaMLA+8/p2ysr7MGqvci2mwbSoHCmzwMA==
X-Received: by 2002:a05:600c:3508:b0:412:b0ed:f18f with SMTP id
 h8-20020a05600c350800b00412b0edf18fmr640238wmq.21.1709053466496;
        Tue, 27 Feb 2024 09:04:26 -0800 (PST)
Received: from portatil76.udima ([79.116.0.170])
        by smtp.googlemail.com with ESMTPSA id
 j12-20020a05600c190c00b00412a5a24745sm6316878wmq.27.2024.02.27.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:04:26 -0800 (PST)
From: =?UTF-8?q?Javier=20Garc=C3=ADa?= <javier.garcia.ta@udima.es>
To: 
Cc: daniel.baluta@nxp.com,
	javier.garcia.ta@udima.es,
	daniel.baluta@gmail.com,
	broonie@kernel.org,
	krzysztof.kozlowski@linaro.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: dt-bindings: img,spdif-in: Convert to dtschema
Date: Tue, 27 Feb 2024 18:03:56 +0100
Message-ID: <20240227170400.705862-1-javier.garcia.ta@udima.es>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227123602.258190-1-javier.garcia.ta@udima.es>
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: javier.garcia.ta@udima.es
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4L4QIR6NJ6FLACLUN32G6AD3ZE7KHZTW
X-Message-ID-Hash: 4L4QIR6NJ6FLACLUN32G6AD3ZE7KHZTW
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:13:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4L4QIR6NJ6FLACLUN32G6AD3ZE7KHZTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Imagination Technologies SPDIF Input Controllerto DT schema.

Signed-off-by: Javier García <javier.garcia.ta@udima.es>
---
Changes since v1 and v2:
  - re-written the subject inline to include relevant prefix

  - Node name changed to spdif@18100e00 to be more generic

  - Added maintainers from Documentation/devicetree/bindings/sound/ who
    should be added to the maintainers list?

  - Drop reg description

  - Drop resets description

  - Added $ref for dai-common.yaml

  - Removed unused dt-bindigs/gpio/gpio.h include

  - Added reset and reset-names in the example

  - changed example hex to be lowercase

 .../bindings/sound/img,spdif-in.txt           | 41 ----------
 .../bindings/sound/img,spdif-in.yaml          | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/img,spdif-in.txt
 create mode 100644 Documentation/devicetree/bindings/sound/img,spdif-in.yaml

diff --git a/Documentation/devicetree/bindings/sound/img,spdif-in.txt b/Documentation/devicetree/bindings/sound/img,spdif-in.txt
deleted file mode 100644
index f7ea8c87bf34..000000000000
--- a/Documentation/devicetree/bindings/sound/img,spdif-in.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Imagination Technologies SPDIF Input Controller
-
-Required Properties:
-
-  - compatible : Compatible list, must contain "img,spdif-in"
-
-  - #sound-dai-cells : Must be equal to 0
-
-  - reg : Offset and length of the register set for the device
-
-  - dmas: Contains an entry for each entry in dma-names.
-
-  - dma-names: Must include the following entry:
-	"rx"
-
-  - clocks : Contains an entry for each entry in clock-names
-
-  - clock-names : Includes the following entries:
-	"sys"	The system clock
-
-Optional Properties:
-
-  - resets: Should contain a phandle to the spdif in reset signal, if any
-
-  - reset-names: Should contain the reset signal name "rst", if a
-	reset phandle is given
-
-  - interrupts : Contains the spdif in interrupt, if present
-
-Example:
-
-spdif_in: spdif-in@18100e00 {
-	compatible = "img,spdif-in";
-	reg = <0x18100E00 0x100>;
-	interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
-	dmas = <&mdc 15 0xffffffff 0>;
-	dma-names = "rx";
-	clocks = <&cr_periph SYS_CLK_SPDIF_IN>;
-	clock-names = "sys";
-	#sound-dai-cells = <0>;
-};
diff --git a/Documentation/devicetree/bindings/sound/img,spdif-in.yaml b/Documentation/devicetree/bindings/sound/img,spdif-in.yaml
new file mode 100644
index 000000000000..ab8f96cc37cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/img,spdif-in.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/img,spdif-in.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies SPDIF Input Controller
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+  - Mark Brown <broonie@kernel.org>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - img,spdif-in
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rx
+
+  clocks:
+    items:
+      - description: The system clock
+
+  clock-names:
+    items:
+      - const: sys
+
+  '#sound-dai-cells':
+    const: 0
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: rst
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/pistachio-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/pistachio-resets.h>
+    spdif_in: spdif@18100e00 {
+        compatible = "img,spdif-in";
+        reg = <0x18100e00 0x100>;
+        interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&mdc 15 0xffffffff 0>;
+        dma-names = "rx";
+        clocks = <&cr_periph SYS_CLK_SPDIF_IN>;
+        clock-names = "sys";
+        resets = <&pistachio_reset PISTACHIO_RESET_SPDIF_IN>;
+        reset-names = "rst";
+
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0

