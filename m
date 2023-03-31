Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A467A6D3614
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Apr 2023 10:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AFB204;
	Sun,  2 Apr 2023 10:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AFB204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680423141;
	bh=wDHVLY6ZJhIUXBKY7H8j6bZr4maZPwThUzeve7aEUCc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JgZNTBSyAfivk5eL3DxpY47UeqNVzkbUugZdGGa/dUybXqWsETAqIsTO2YnmpCiSL
	 /RD96Rj8+10V+pWkt1DYr6YVvcheQXMCcBQ7m3go9V3E7ncYI4GInGyV8DPCo3X19S
	 DzwvSHC84JBk0VAs5SN3NDDhrFc+5U0zNj1xwJ+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA9C4F8028B;
	Sun,  2 Apr 2023 10:11:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2773AF80272; Fri, 31 Mar 2023 04:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20770F800C9
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 04:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20770F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OUha1buX
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17e140619fdso21778776fac.11
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 19:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680228410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvM334uaDN62u5CXBwDPRhi1Ml5Rc/k9LOkZNPsfO9U=;
        b=OUha1buX9Iya3CjbsVobPGHSOMWmpDrZzKS4TD3RmS+O87YOx/sthAzdlI6Mpq6c2x
         uSD9IFLRH4VFtCWCAxURoqL0IG4NSpM4EueoLgGiZTipQjByWnk4Qo/h02rFOlYOzGsM
         HSviKdKTOdMu8KOcJV4AD4hZJS4OPmpsBKvppGrEIYPVUu0b3QX5IoLc4OzGLkHSwBx5
         rT2xr3XB3hifVhNdNG0LwszasFVR9vR7eO/1p+cHFUJwYkK7XNnRsDcsn/WFhbO959yU
         O5C8Uf+LWjM4gkF1CM4NBLcbFgJPAWMudClmTTablSrajbt1Bc3O7TLUL7Z9qyEmrDTy
         fyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680228410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvM334uaDN62u5CXBwDPRhi1Ml5Rc/k9LOkZNPsfO9U=;
        b=d3mSGDMHp/tVfR4lSRAt3rliGsk+BBcaAkkNqXLWw5qD7cgANfDp8ojVN3vCpN6MqP
         8oUsa9t1yppVhZut3OQFPhP7wIK570uyrfVVequTa3UjJ1pQZGiGivsNmz8t7dhUEarQ
         0FL50tgoeXDUhZroZZqyM++Iq2y130nw24dHykv7Opkx5xI/WcvTaPrs2y7NztvAFBGH
         AffBSw3+h1efrRRzOLGi8qxMpXLc4Tb40zgs5MFjoyRsFBRDod5Rkd7HSyKCh/NDwlOS
         bsIJlh5Gd0MmyjK2505Iy/6pBzBQYO6zb1vyRlQKd5+epbjQzqPVvIh0mTU9RjhPjiuu
         i1og==
X-Gm-Message-State: AO0yUKWWt5B/cE9mNDR+LhSO0/oMjI7oCBBYW2rg0fc2m8/Wjey/QDb2
	XpfRWjFcD6jbZ033h/bmdrI=
X-Google-Smtp-Source: 
 AK7set9SVdoBv4Z6z/5U2LbxssB3wFAqZk8t0GCibw/+1rXEmQsRBHijgZAq1yj9AKxTzVChxWYNVA==
X-Received: by 2002:a05:6870:3396:b0:177:c4c1:db8a with SMTP id
 w22-20020a056870339600b00177c4c1db8amr15470422oae.0.1680228409807;
        Thu, 30 Mar 2023 19:06:49 -0700 (PDT)
Received: from heimdal.localdomain ([2804:431:cfec:20b3:d050:3c82:2c34:f704])
        by smtp.gmail.com with ESMTPSA id
 yv2-20020a05687c228200b0016e8726f0d4sm548177oab.3.2023.03.30.19.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 19:06:49 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	anish kumar <yesanishhere@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: maxim,max98371: Convert to DT schema
Date: Thu, 30 Mar 2023 23:05:25 -0300
Message-Id: <20230331020527.482991-1-andremorishita@gmail.com>
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
Message-ID-Hash: 6TLSGH6XLVIIOPREMGWPDSUGZCF554WK
X-Message-ID-Hash: 6TLSGH6XLVIIOPREMGWPDSUGZCF554WK
X-Mailman-Approved-At: Sun, 02 Apr 2023 08:07:44 +0000
CC: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 daniel.baluta@nxp.com,
 =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TLSGH6XLVIIOPREMGWPDSUGZCF554WK/>
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
 .../devicetree/bindings/sound/max98371.txt    | 17 --------
 .../bindings/sound/maxim,max98371.yaml        | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 17 deletions(-)
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
index 000000000000..df0262473399
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max98371.yaml
@@ -0,0 +1,41 @@
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
+        max98371: max98371@31 {
+            compatible = "maxim,max98371";
+            reg = <0x31>;
+        };
+    };
-- 
2.40.0

