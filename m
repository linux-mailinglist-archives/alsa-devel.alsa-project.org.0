Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C66E6073
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 761F0E90;
	Tue, 18 Apr 2023 13:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 761F0E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818846;
	bh=zlI2VeZ+p2Odl+BpvwnCeth1jvPQpJZ+eKlepSeQMKY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T/HPiEOAwHYbpkGB3TGUcDZlovVmdnBAUaqnGTtm6O+REkcfMyK3kKkh4vQg08ia4
	 +50vO2ayqzKR24oxi3XDThaX1CRPlwx+b/eXS0Vpn+aGvt/xS97n8XpbovOwMdS7wP
	 8qopDvov7ULnWE+u1WJdilx2/L837+YOlu3Vc6ss=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B3BF80548;
	Tue, 18 Apr 2023 13:52:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F0B8F80266; Mon, 17 Apr 2023 23:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AEEBF800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 23:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEEBF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Fk/0X/Ci
Received: by mail-pl1-x633.google.com with SMTP id i8so18492257plt.10
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 14:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681766656; x=1684358656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tS2EUAIxndFqnf5A6Ki9yaF0traiHvKhRYcLbNaTGjs=;
        b=Fk/0X/CitoM7OVxl8nn7ggP0Ren4uObavNY91hwd44HvH2NrKmoM0h23GPordmdQk1
         dMIvDKGQZ6vocVh9NEtr6riaR0BFi433NmwiWQ0WiXHqdukhUtYGmEgCqkW55JPnMAir
         sXmGk7XXIEgJXib45NbZVgiNjjWKkJ5PO/hwvP+ksBeNyyWFoFBn3toRELFepx9U7g1+
         6kB3tF+cLh6pQD0Ob3kjFPOKztpgGXsxYGuCKDWF4yc0x7+h0Yw0pCN9bVGOPkTO8KU9
         XmzpZ6DgO4zXHDL/DKfqaF/SMcS6+NATLNM1veooGQeS94J92n0oWmyBqz2WEXdukkpA
         yjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681766656; x=1684358656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tS2EUAIxndFqnf5A6Ki9yaF0traiHvKhRYcLbNaTGjs=;
        b=IknJxwY47bOUecxD05geYKbEQp+M6TLxDsR8sKpjyfuLM5RthtoWn4fzIB1Is8DjfY
         4AXCHQw5GtI88/jGM7Zr4R0Tl+ytD5t6o954HWr9u6xuJWQKktlUnVyHNq1AsIU0MVHg
         krvUEy8W9lN/KcfQdbZBmdw9EqzPKviOCvoudHFEr6JeMD2X+enkVWnMtmpUTaFBiCJi
         Jx8oumGFNakr0cvEntiaTLtNR5JA4X6wHqcFoVM1aH8iMFEb+bZcaN9QoHBicz2yz9ST
         WNxVuPiJCbasRU0T1pFAw6J4XwWEl/WuHxgmf1sAZuyy+aoyYk7hy66Yuk7M7V1zrv3D
         BSyg==
X-Gm-Message-State: AAQBX9dqPprgVNuwD7Pcf6GZUhjkJmE5fynEOm1Ib9YnTyRxgm1spHhF
	KbAij/eyHUgg9Hnld7dedcs=
X-Google-Smtp-Source: 
 AKy350aujkebVnw/oK8vmydVyXqYA3HoOBCMvisiFO1fI6aF4eFv8ANUXJNBd8VwXfiyiWREOkU7bA==
X-Received: by 2002:a05:6a21:7893:b0:f0:93d9:9c03 with SMTP id
 bf19-20020a056a21789300b000f093d99c03mr265012pzc.15.1681766655822;
        Mon, 17 Apr 2023 14:24:15 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:218d:82:ae97:7cb6:b12a:54f5])
        by smtp.gmail.com with ESMTPSA id
 k4-20020aa790c4000000b0063d2dae6247sm1177507pfk.77.2023.04.17.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 14:24:14 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@gmail.com
Subject: [PATCH] ASoC: dt-bindings: wm8737: Convert to dtschema
Date: Mon, 17 Apr 2023 21:24:00 +0000
Message-Id: <20230417212400.161796-1-danascape@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DZX35X2APKQUVLHK4RPDLBDJ3S2UU7XQ
X-Message-ID-Hash: DZX35X2APKQUVLHK4RPDLBDJ3S2UU7XQ
X-Mailman-Approved-At: Tue, 18 Apr 2023 11:52:28 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZX35X2APKQUVLHK4RPDLBDJ3S2UU7XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8737 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8737.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8737.txt      | 18 ---------
 2 files changed, 40 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8737.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8737.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8737.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8737.yaml
new file mode 100644
index 000000000000..12d8765726d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8737.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8737.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8737 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: wlf,wm8737
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
+            compatible = "wlf,wm8737";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8737.txt b/Documentation/devicetree/bindings/sound/wm8737.txt
deleted file mode 100644
index eda1ec6a7563..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8737.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-WM8737 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8737"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8737: codec@1a {
-	compatible = "wlf,wm8737";
-	reg = <0x1a>;
-};
-- 
2.40.0

