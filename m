Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520F894C05
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2F32C4D;
	Tue,  2 Apr 2024 09:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2F32C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041242;
	bh=WxIUwzIRX245RWvPJ1HE1kAUL98+daIiJa1ylRa9i2w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YxMuJG7T7+BRYKOeIsTw7WjzFjuyRGqtrXaOvxTtPwwVYvDDnj9viW7QA549a0ueo
	 bW5VTs8bF+ADPF6FvKe0vvMNh8ilwpGhsCZq6KJx9RprJ2JJL6YBkBGmr58dJfS1+t
	 H/4tF6nqJ6QW9oW57Tm49JITc8EnYDeGOmi8wC5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69D3DF805B2; Tue,  2 Apr 2024 08:52:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF02F80897;
	Tue,  2 Apr 2024 08:52:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15EBBF8025F; Thu, 28 Mar 2024 02:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FA96F80093
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 02:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA96F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W4c3Kd6g
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3c3d7e7402dso365124b6e.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Mar 2024 18:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711590059; x=1712194859;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQew5YYLgTvT6DTiJ19Nkd1adlHoEpKqIs98rlN2rko=;
        b=W4c3Kd6gUB7UgCouqjUEck9s+CShLwM3IYyNTAmgXedwZ94nD+r44EUAEpOp7sTpZQ
         /IM5WMSWx5fbQ0yi64BxlNUP0psg+f5w59u6I5Eb1+hNI6b5kZT56/r7nA+KyGC4Vu7t
         NFSsSQEaGNUuNIblq/8dXQo+jFvoGvySHpSOU7eQ+nAihN394DLEOLJ8WTlwcTxqZqlZ
         k29ldsuVtpYCZ1xobWsr3lmI0UyxGNxrWqr0xYzc9Q2llmFyWMHh8Gcx1FHmH7t/9EuU
         80iIHqRkD/5Re5JWlbw8Kc4dsE3JSAM06x47Xgg51QYtU8HEQzmmKHGwtGhRcvBDyEw+
         XDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711590059; x=1712194859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQew5YYLgTvT6DTiJ19Nkd1adlHoEpKqIs98rlN2rko=;
        b=KpWO0sk5vomtDngH0bjNi0CSL1UCfNpqCMFOsAorpsbPW48mMrYBaaVHJGugUieZHJ
         JphXdId/+We1F77eLMhIYDxKjO+2po+wsJoIIg02SXTPqhvRMuJjqbaGJgD+4NQexzc5
         MXVIfhsoHgU3gorSMyeobA6X44Cj9VT6jBP+PVi+YdZU42Kmo7cH4NBVUgOvXTP28VqZ
         EfKOIxBCBgvjFddtKX7HKv54Y8nMB0pc2CvTkh50ctlQ3Q/ljcrgV10UW4nU/p0rAjYX
         WHvwh0YERFe04fwVRpMUhOV+znOTlsTvKFCgB38vi3R/j/sR+3fcwjOnQWXAmGZhnla/
         Z5bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVEaaQrhKw3iDW4PuSSoANNNKkWdDCFUFI4sS3eq1BTy9IogF/vNLpZAHJEBpKEKhySR77k4dQP24SfJuM4oksHyx55qecscDNxjo=
X-Gm-Message-State: AOJu0Yx3+1pBAh/+8oDErQq568Kvw0SNPK63POzq5+2ktHzu0/lrIH0S
	3qAb1f6mChUds9nnkFg+ytENf4u433rmBC7EDhgnqwpbriuUwc/y
X-Google-Smtp-Source: 
 AGHT+IGcSrsak0kpRYq7vxFaL/0IQ4DAeYAFSWyaYVF7T1dV3iRr67NiFP1pVnKmxrcjunLsF/cv+A==
X-Received: by 2002:a05:6808:23d2:b0:3c3:d66f:239e with SMTP id
 bq18-20020a05680823d200b003c3d66f239emr1737695oib.54.1711590059033;
        Wed, 27 Mar 2024 18:40:59 -0700 (PDT)
Received: from localhost.localdomain ([122.187.117.179])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a62ea04000000b006e6bda407b6sm188831pfh.202.2024.03.27.18.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 18:40:58 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: animeshagarwal28@gmail.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ti,pcm1681: Convert to dtschema
Date: Thu, 28 Mar 2024 07:10:24 +0530
Message-ID: <20240328014029.9710-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: animeshagarwal28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VES43ONLCHEUS4TGPZ7QA6QKNWSBM6HM
X-Message-ID-Hash: VES43ONLCHEUS4TGPZ7QA6QKNWSBM6HM
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:50:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VES43ONLCHEUS4TGPZ7QA6QKNWSBM6HM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Texas Instruments PCM1681 bindings to DT schema.

Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
 .../devicetree/bindings/sound/ti,pcm1681.txt  | 15 --------
 .../devicetree/bindings/sound/ti,pcm1681.yaml | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm1681.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.txt b/Documentation/devicetree/bindings/sound/ti,pcm1681.txt
deleted file mode 100644
index 4df17185ab80..000000000000
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Texas Instruments PCM1681 8-channel PWM Processor
-
-Required properties:
-
- - compatible:		Should contain "ti,pcm1681".
- - reg:			The i2c address. Should contain <0x4c>.
-
-Examples:
-
-	i2c_bus {
-		pcm1681@4c {
-			compatible = "ti,pcm1681";
-			reg = <0x4c>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
new file mode 100644
index 000000000000..4093d0ff654d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm1681.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM1681 8-channel PWM Processor
+
+maintainers:
+  - Animesh Agarwal <animeshagarwal28@gmail.com>
+
+properties:
+  compatible:
+    const: ti,pcm1681
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pcm1681@4c {
+            compatible = "ti,pcm1681";
+            reg = <0x4c>;
+        };
+    };
-- 
2.44.0

