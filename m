Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C1186B16A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:14:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCAB9B60;
	Wed, 28 Feb 2024 15:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCAB9B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129660;
	bh=ynCwNGBCpdLuOAMyA2li1eRc4k2Kg54U/5iHg9f2QIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=um4gbdUfu6rNDo6EKmD0Gq/6W1kf6caceS/ewdO5pVAM2Ym2X64gAVn/3iQzmIb3m
	 7+uCCPNixR1wUURP/oFuBq6UoyKX4Wb5S8aRlF3Sg9E0iiPqgEfHl7J16VWisJlRhr
	 6YEsF6dtNu3fvdn1kwKaxlC8g54VqT0oYJpc+BDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B17CF805A9; Wed, 28 Feb 2024 15:13:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D10F805A0;
	Wed, 28 Feb 2024 15:13:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE3D7F801C0; Tue, 27 Feb 2024 17:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA265F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 17:13:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA265F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=udima.es header.i=@udima.es header.a=rsa-sha256
 header.s=google header.b=gh308ymo
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412af664954so4603635e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 08:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=udima.es; s=google; t=1709050429; x=1709655229;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIjsoxnq6AgqQD4mfxCKabO/R3fvGqki3BITIbxy4c0=;
        b=gh308ymoPZ20WqDyRjFAQoZ0lAiiOPBOtarLEmK0BmiyIPrRvP3vwR+cBBbAZhBDYM
         ZvpmduuQvzEUgHpcBkyi3LiQ5wGT/R/Zoz/c8XhKp+uPHQiuUmXcgozUJPt0CIFVPQm2
         vm0gBMbJoW3RM7lY0bRk7SEkSgsQumJkapWbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709050429; x=1709655229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIjsoxnq6AgqQD4mfxCKabO/R3fvGqki3BITIbxy4c0=;
        b=QKtcdlEZeTYgvSQ5r0BVEnTgFRvKXW0La94x9B+YN25N5pnYRivMjExAx2yMz05V1y
         kIyvKWjQTFODVbOaCLw8bpqr+wsl4080IEdDHqmYXtpFmwZS/aQyRYlaMF+OhTREBi74
         CQW0m8CgULaDJZIfnU+B/mQkBfkHHOobIgpjmOU9LNzxcFP/xdCwYeHxBC2KgNvD1PrW
         HPoTTU5PTOM6bb7GqpQBuY55ZBa3Irundh5eC1MskQOi4s+AmjEsrs7LBxa4bDREUjsc
         lT+ur3zq+RBECB7scVZA2zmnJC/A5NHCmxdGhjHQJtvmWr+I6Sud6ZWPHCxLJQeh8WLw
         2S3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+VTwxhWieuSc3dzPLkG4nmXpZtFkRJqAq0WwjBRBvlUlBhxzS3c0skRc8WnU3GRMGo27QiZp8v776X+fer2wdaJuZqtpzuULJxas=
X-Gm-Message-State: AOJu0YxGyYUMtI+ir/gBMbqBKW0oFi7PGNJ7Sf6tAjlmPPlH0fBVS6g1
	MpV7dZl2N6MfxfyA39W0MG726hGyTnZRtGLgwwFNglZ7N3NVvLfKkbZ/cxGe2ms=
X-Google-Smtp-Source: 
 AGHT+IG06PGVQEU3WAnZ+8bEx0FEcvUA92bULNNkoRNL4eczSC9AUEzpmKjluS0KPvrpX9I8Z/LbZA==
X-Received: by 2002:a05:600c:1989:b0:412:9dfc:f67a with SMTP id
 t9-20020a05600c198900b004129dfcf67amr7819985wmq.12.1709050429339;
        Tue, 27 Feb 2024 08:13:49 -0800 (PST)
Received: from portatil76.udima ([79.116.0.170])
        by smtp.googlemail.com with ESMTPSA id
 9-20020a05600c020900b004104bc8d841sm15225371wmi.13.2024.02.27.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 08:13:49 -0800 (PST)
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
Subject: [PATCH v2] ASoC: dt-bindings: img,spdif-in: Convert to dtschema
Date: Tue, 27 Feb 2024 17:09:47 +0100
Message-ID: <20240227160952.615291-1-javier.garcia.ta@udima.es>
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
Message-ID-Hash: 4DPJBV2CFMMMKCJWZDEILKAJJMOHTJJB
X-Message-ID-Hash: 4DPJBV2CFMMMKCJWZDEILKAJJMOHTJJB
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:13:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DPJBV2CFMMMKCJWZDEILKAJJMOHTJJB/>
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
 .../bindings/sound/img,spdif-in.txt           | 41 ----------
 .../bindings/sound/img,spdif-in.yaml          | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 41 deletions(-)
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
index 000000000000..1d2e318b349f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/img,spdif-in.yaml
@@ -0,0 +1,78 @@
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
+    spdif_in: spdif@18100e00 {
+        compatible = "img,spdif-in";
+        reg = <0x18100e00 0x100>;
+        interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&mdc 15 0xffffffff 0>;
+        dma-names = "rx";
+        clocks = <&cr_periph SYS_CLK_SPDIF_IN>;
+        clock-names = "sys";
+
+        #sound-dai-cells = <0>;
+    };
-- 
2.43.0

