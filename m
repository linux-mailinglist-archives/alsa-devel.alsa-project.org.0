Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205376E606E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4507ADF4;
	Tue, 18 Apr 2023 13:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4507ADF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818813;
	bh=ROh6NxcEQ0fI38PQz2x04P0RV0sGQUDVbxvrP+ZfRBw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fauAqciKIWRQAFtkzMMnetltUmvLvGJuSY9jYOeVEWLczSh0wEGkxdGuBff9rOrrm
	 /+F8oF9ma9/weB9NaFlvIxVu15r55IF+qvq5W3q3ZFMYnzpspxkmYHWGR1pH9lPm1O
	 NBXP4SmAEmuiV6QNZNazxUGEwCLv8VVTUSPZzjM4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C81F80212;
	Tue, 18 Apr 2023 13:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF60F80266; Mon, 17 Apr 2023 22:43:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B11E5F800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 22:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11E5F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Ovsw61+/
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-517baf1bc87so1846068a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764220; x=1684356220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0D8fVQxMh2FytECOWBOGS25wxqSLBJ+NNK2BQrzIi0o=;
        b=Ovsw61+/H1VzeZJwEvaeiN2rtY9+4CGQ97C3CXw57wyz4X3sGBZSw4h/rpIFulq7nn
         HE9XwCw79oVevtF5Ckuw+PvXxdZ6QI1fus7xzyW/+6kfXOqNl8ltuKpZr3h2eHM8ESyF
         NpcC52hW0bk5GrYGbuIX07KdMIsJ/N84j+SzdOyqS6EHjX1OF3QffdlBovpLUI9hpqbT
         OZJppBBbR40xKayueq3IPwdEg3DgDyzCSQXCoJrvR39xueqfrsynhIFlZxrDam4Cv3iz
         +ZsC8D0yhSHT7ETYy9GhWzOPulqpr1T985vZfikHihLdR4XQl2KeDUWF21mhG3c43g2+
         BwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764220; x=1684356220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0D8fVQxMh2FytECOWBOGS25wxqSLBJ+NNK2BQrzIi0o=;
        b=PSPIb0lKlCv9hLIldSvsNdy5aXwMdkDdDWKniGBlDWLnsyGL9pmSD8bHFScmsQsl4e
         0Vy42uTHyxnj0bDfON+F5XPrLwLrJ0JKaSrZGtHxQ8qMIl+xHHX8cH/15a4kDZYvz5J3
         5fmABaEEASTsBXep4aaOohZxx0eIFdbZGK+NnEQ5CZVgnFmdGIOzVeLYd49aAQCYxsEe
         RaLGkqzKUarunUPmhETnQEjiHsqwsB6apqUCZnIGDKeeDDPm65nijmZ5LQaanYMQQLso
         wr6RCuIC3QdnpQxpOoZUlnku+luUXT3CRa3BtfzWJnvbbdJ59iVb7EEagLiYdgG9VrJ2
         UmfQ==
X-Gm-Message-State: AAQBX9es2JFvmdhh9D1m/MLCdFpG14ol/+dSO3bZWYl91oghHA64pv1+
	G3bST7WfAcLYRCQHYQnw6Tk=
X-Google-Smtp-Source: 
 AKy350ZEPlPFvNP14bOLRitENDFtYaBMlc5g7zDZRvZSbWac/MAqQ3aSClp6qBRk07miCaf4k7I38A==
X-Received: by 2002:a05:6a00:890:b0:63a:fae3:9890 with SMTP id
 q16-20020a056a00089000b0063afae39890mr22888001pfj.24.1681764219582;
        Mon, 17 Apr 2023 13:43:39 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:218d:82:ae97:7cb6:b12a:54f5])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78642000000b00632bb373949sm7956126pfo.158.2023.04.17.13.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:43:39 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@gmail.com
Subject: [PATCH] ASoC: dt-bindings: wm8728: Convert to dtschema
Date: Mon, 17 Apr 2023 20:43:23 +0000
Message-Id: <20230417204323.137681-1-danascape@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z45R57OEFMUKDMFUUX6MFFUKDQAA3YXO
X-Message-ID-Hash: Z45R57OEFMUKDMFUUX6MFFUKDQAA3YXO
X-Mailman-Approved-At: Tue, 18 Apr 2023 11:52:27 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z45R57OEFMUKDMFUUX6MFFUKDQAA3YXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8728 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8728.yaml | 40 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8728.txt      | 18 ---------
 2 files changed, 40 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8728.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8728.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8728.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8728.yaml
new file mode 100644
index 000000000000..fc89475a051e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8728.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8728.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8728 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: wlf,wm8728
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
+            compatible = "wlf,wm8728";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8728.txt b/Documentation/devicetree/bindings/sound/wm8728.txt
deleted file mode 100644
index a3608b4c78b9..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8728.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-WM8728 audio CODEC
-
-This device supports both I2C and SPI (configured with pin strapping
-on the board).
-
-Required properties:
-
-  - compatible : "wlf,wm8728"
-
-  - reg : the I2C address of the device for I2C, the chip select
-          number for SPI.
-
-Example:
-
-wm8728: codec@1a {
-	compatible = "wlf,wm8728";
-	reg = <0x1a>;
-};
-- 
2.40.0

