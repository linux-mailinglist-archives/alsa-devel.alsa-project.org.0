Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955A86B163
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:13:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A9E836;
	Wed, 28 Feb 2024 15:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A9E836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129592;
	bh=IglaxdcZLU76jtprsOmWHg7k//GQ0hgdjNnuOUMEAVE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U81g+2YzytZtOqwikaPdoLc10rpnwcSrdlnzJTs2Ny5RYqmMov7xA6qmRdfRt2Tbq
	 lbyANvl8VP22YxWJlfyWaTO2lTahx3qoB0fH80QVU8sYRwZ6FxE28UFDwXPHvfqja2
	 3Pb5VYYDEmZxkzJoeWoNtmhQ+WaHP7eN21+rE8zE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D61FFF805F2; Wed, 28 Feb 2024 15:12:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C6DF805C3;
	Wed, 28 Feb 2024 15:12:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3B2F801C0; Tue, 27 Feb 2024 13:39:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA943F80104
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA943F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=udima.es header.i=@udima.es header.a=rsa-sha256
 header.s=google header.b=BmjrsJet
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33dc3fe739aso1617472f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=udima.es; s=google; t=1709037564; x=1709642364;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulSh+zGZ8+dyF926zcKrRhp4LS8bqP+HSdasdk27iBg=;
        b=BmjrsJetCRTSONkzcc1XwxTdIilDZoGwOgZyWZpIuNXlOgs/obwrD5HxXsUlhg1kgA
         ziIFFgKry9gPcswAE7Xxp4jYI5pTJU+IsgUK2bzn2QNJdiZd2+8GA1hMG5GqGjaNePkW
         tJjOfJgT11XnttOt9hUJwfeNcYtB2PLpCu0tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709037564; x=1709642364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulSh+zGZ8+dyF926zcKrRhp4LS8bqP+HSdasdk27iBg=;
        b=F73Sq2MB9L4zaNtvSGRrp5WnF3D4WmH/I4JoxxyWdWdx24HdBtCVzenOpl/7B9wDpj
         LXEKDTG4Zd+HDZNzrGiaqRDfobts9qD3J6KwRAAdG3E7qeUH/E5KdvHNYdQPeq0H4zVI
         VW9vWORw+de6vhgrRPJN/wxfBz8SIPv3bUqFHE4EJTPn1P6uUG8UOCSx80dzWstnV3gs
         ZOWyT4s4ABaSPm9GCLMPCrbkOTTqTbbix3bLU3pBCtqrCOPq4oaKNi6UV3PYr7tqYpiR
         MInpFttocdgX9EIFCXxk9qqrtGu0lNCKKMPEgqjt1ioUnSegdRpEoB6oQ4K+EVmHhM6V
         zcpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkkUTpjjOb6ErfFhMfhGaNTqDI95Glb9sgnDnxvxYtnTG0bjTnGC1rgpEnPSLWxhFv9oXiHrRa6YbGh11P/imnzKgdyVPhuiKUc/U=
X-Gm-Message-State: AOJu0YwuI/4yZzHxD9m8eBP9/mfHuTR6kWzRwqNjX1Lr2rvxiT822kE3
	kCHk1/oxwYQrDkwPSz0F/zq3Cjcqv7N5ya2Cc2sFzO/Zvfb3Eq+QxKgvprPVfkA=
X-Google-Smtp-Source: 
 AGHT+IEmHNL+YaOOg3Qorj9DIRtr3BjF7dDzlkl0TJwo1yMeS3zmaiUNv0d+QEC07JdkBi5KsJphoQ==
X-Received: by 2002:adf:d1c3:0:b0:33d:7ec9:f5d0 with SMTP id
 b3-20020adfd1c3000000b0033d7ec9f5d0mr9918938wrd.2.1709037563746;
        Tue, 27 Feb 2024 04:39:23 -0800 (PST)
Received: from portatil76.udima ([79.116.0.170])
        by smtp.googlemail.com with ESMTPSA id
 bw1-20020a0560001f8100b0033af3a43e91sm11444061wrb.46.2024.02.27.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 04:39:23 -0800 (PST)
From: =?UTF-8?q?Javier=20Garc=C3=ADa?= <javier.garcia.ta@udima.es>
To: 
Cc: daniel.baluta@nxp.com,
	javier.garcia.ta@udima.es,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Convert the Imagination Technologies SPDIF Input Controllerto
 DT schema.
Date: Tue, 27 Feb 2024 13:35:55 +0100
Message-ID: <20240227123602.258190-1-javier.garcia.ta@udima.es>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: javier.garcia.ta@udima.es
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6WBVNFZBRI4NZO4JPY5DPREIIF5A53XK
X-Message-ID-Hash: 6WBVNFZBRI4NZO4JPY5DPREIIF5A53XK
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:12:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WBVNFZBRI4NZO4JPY5DPREIIF5A53XK/>
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
 .../bindings/sound/img,spdif-in.yaml          | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 41 deletions(-)
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
index 000000000000..d201293d63c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/img,spdif-in.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/img,spdif-in.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies SPDIF Input Controller
+
+maintainers:
+  - Rob Herring <robh+dt@kernel.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - img,spdif-in
+
+  reg:
+    description:
+      Offset and length of the register set for the device.
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
+    items:
+      - description: Should contain a phandle to the spdif in reset signal, if any
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/reset/pistachio-resets.h>
+    spdif_in: spdif-in@18100e00 {
+        compatible = "img,spdif-in";
+        reg = <0x18100E00 0x100>;
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

