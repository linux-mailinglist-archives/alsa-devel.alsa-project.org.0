Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D216D361E
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Apr 2023 10:14:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7771784D;
	Sun,  2 Apr 2023 10:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7771784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680423249;
	bh=WleuByxv1AX3spoqtOpVYh2+V9Uk+1jSAy8lOEuTbMk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GhxT5gTURS8dxCsZGXkA0ut3Exioy7ASjgZi872iwyww2QYu2Tv6Pv6pcwr666/Ay
	 PO914QqEeMuJ+InuqQldcgJYmXdTlDZExW20txob2CEzQ3Z4KMERZlOTT5ynA5pTHG
	 OZXgzWhRXcmjCcWL6aOc2LIzxCiSib9f0I+zIObg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F91FF80571;
	Sun,  2 Apr 2023 10:11:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26546F80272; Sat,  1 Apr 2023 08:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 988C0F800C9
	for <alsa-devel@alsa-project.org>; Sat,  1 Apr 2023 08:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988C0F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H82+/U+c
Received: by mail-il1-x130.google.com with SMTP id j2so5629343ila.8
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680328905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2U2XsDHoLzpn+9gItu80aF7GJfiGDWT6BnwKoZhBKk=;
        b=H82+/U+cxD8rA7sivKJHkng97K6qlD0wM1N23xotl4HB6h7PegQVRHpGavi0tyguTZ
         GIzrNua0ixv/PqJx4jzu5w6TOYt3/rhntWOl6DPZWihQiu5YnBcfTFES0IufTWl4Ra77
         dPlTt2k636aW5FfjOsp7BTKHIaoox5TOohankzkhuxica+yUsfewBQIoV4+gbOpIfe0L
         2H+dQYkvpbH+01cbQbvYIGvghRPb/+RqoHphrIrGvr98Qmgd1sqTt0TbVvHjS/YIuXOD
         waHNqLQAP4T+O0sjDSAU9XqFF7Fca3G+EqWQ/3/e70+p0/zbHTdbbHiWnUkTvGphGp7d
         +AQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680328905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2U2XsDHoLzpn+9gItu80aF7GJfiGDWT6BnwKoZhBKk=;
        b=Vr5bZSKY0PyZob1FpD8we2iR6WCJk0MwnajdCfArHKy9/GpjZkOFguJwU/BXcfMYnw
         CKRI9hTi2tGSMRL2TKKCl+8xKnVyWbYciPaT8oAkUJlsa2lQoI5391BV34Kd+N4qhU5a
         oEtZcniposjv2DAXN6g2h1EOTe7OCRE4Sg6wILXtnzPy1lANOChWW77wpfBVtXcaenem
         EpL8dkxoUhpOJR5hw3EqVe0yGpzs1Vfjnd/DlIPHHYsJGhZ9XMne6HTdH1GuuPYKoUq7
         kICIUy5qf/5GbOWjdc2FmFdqRWEIUgaBKQCZPgcDzsR/sFh2uq+rekgWrdKW/JT176dR
         SxuQ==
X-Gm-Message-State: AAQBX9dGqQmVX7WiRfRkwqUi+lVQU7+LpkbDMfNcsThzMQP6IOX0CufY
	cJhd7HT+FAlpX+oMXDDibFPJTOR6jkmWDUsc
X-Google-Smtp-Source: 
 AKy350YkXdYUmmYhpswBXz+/2z7ssiOIinB0jx2wQCZKq5zKmY7eC7HkeqBQ+BIXkp8JA6MXqUPuYQ==
X-Received: by 2002:a05:6870:560c:b0:17a:d2ab:aeb8 with SMTP id
 m12-20020a056870560c00b0017ad2abaeb8mr17985248oao.33.1680321531834;
        Fri, 31 Mar 2023 20:58:51 -0700 (PDT)
Received: from heimdal.localdomain ([2804:431:cfec:79f0:85a3:2af2:a6f4:1842])
        by smtp.gmail.com with ESMTPSA id
 ug13-20020a0568714d0d00b001727c3bf124sm1593845oab.31.2023.03.31.20.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 20:58:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	anish kumar <yesanishhere@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: maxim,max98371: DT schema improvement
Date: Sat,  1 Apr 2023 00:57:54 -0300
Message-Id: <20230401035756.856752-1-andremorishita@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331020527.482991-1-andremorishita@gmail.com>
References: <20230331020527.482991-1-andremorishita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: andremorishita@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 33YMAF4HADK5C5B5LFRMDBJQTKUH4W35
X-Message-ID-Hash: 33YMAF4HADK5C5B5LFRMDBJQTKUH4W35
X-Mailman-Approved-At: Sun, 02 Apr 2023 08:08:35 +0000
CC: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 daniel.baluta@nxp.com,
 =?UTF-8?q?Andr=C3=A9=20Morishita?= <andremorishita@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33YMAF4HADK5C5B5LFRMDBJQTKUH4W35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve Maxim Integrated MAX98371 audio codec bindings DT schema conversion

Signed-off-by: André Morishita <andremorishita@gmail.com>
---
Changes in v2
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

