Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2089AF32
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C5E2C2F;
	Sun,  7 Apr 2024 09:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C5E2C2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474785;
	bh=CxGFv9jvNTqeIa8ZarV7ZY4hs+L+mjnOC11K92E+Z7M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Tj30kq8fPjzGxD/zXMsTWy4R6xu6znZtUsXegii0eOc3suMTm3LkPECzRo6sEAw3H
	 BVqLk62eCwpTyB6hoGw8K1wNxQRNan4WY7nE6v/3QYyVdV1XuBdL8qJLfqIP0a7IL3
	 MOdXwDK2Atu/uw2nuUJLZzGu0ki6LvQ0SndllW50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBAF8F8982A; Sun,  7 Apr 2024 09:18:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4182F89830;
	Sun,  7 Apr 2024 09:18:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B438F8020D; Sat,  6 Apr 2024 16:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4301F80114
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 16:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4301F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GGlgg/3E
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1e0f0398553so28727395ad.3
        for <alsa-devel@alsa-project.org>;
 Sat, 06 Apr 2024 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712412912; x=1713017712;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5t85f7blTuWv3UGrktfZJ6b2Gu2J4GPIU/N0JQkbL0k=;
        b=GGlgg/3EfNiESqqxYtG767wMxnJ+vjlSyc7QNKH3KW7gKT84157j3+TEcXJGJmVgsN
         ELOGodgYzj5SsS40BCZ+b6HzMpyBl1279cNRNagxLkTLdnuSWZo27vGg/qXWArR90taZ
         B6fHRRS/PJDvtut85Kmq1uTf/oec2t+ZsJDLmb6mIBBwf2PWqJcueoMVb7XCNlT5h92b
         m7D89uq+N9d7gli8J/MGAaTukn0MlH+xFMf/jRqW+IBagIp9Y5yLc+WW9Zn27AmcyFrq
         V93tP2VpXjMcQzKDh1X+xCUBLON8I5DpClo87yE8SqWQSi77JQ+AD4U7EDlHnNMAPlGa
         UQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712412912; x=1713017712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5t85f7blTuWv3UGrktfZJ6b2Gu2J4GPIU/N0JQkbL0k=;
        b=c6GPPtJFhCPP0OVkFv0tI1wpKidKM39i/i2DTxRk6feVkcLOSLWNkz7Tjlw69ghA85
         0udstZMGM+edu5wVrwMEtxD+RTKI0AUPHw/Ne7EEibrGcGnlQWSfb7S8mC0a70eOEUZH
         1yAoMfX+/zZzlFoAlbb2s+DjV4yG+GNVANkxnAKVtrL9D+FgaavVjXYA8W05WJYdOOiG
         4QxALCBHkDnti9RYY8DdOZSyRGTCRFQ2tM+xW4jnBBDd37YISdevEM89Ps8INxH1zhSp
         7jOFWzz2KGRup1z1fZmuO7RYc3YD1d0vkaKSgrsUBF7okFxH3bqn+LhaPsvVdnPl5dnT
         Q7eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJKuto57XJin5Ed5pXj5UPKTsLll3pfSo0sbe9Jt+m+jHNVmKaVQePk6MIBli8qNOR3EWCwTeRR160m+HJQ12s3aBbqmvf+AXYGYM=
X-Gm-Message-State: AOJu0YxlYE8a23OY4WioG/AEx2/g19kp+qIijCDnOK2ooQwSPJe7y/hm
	1ieL8ZpusB7ywuGTY5wnyszxHocbuZ5SDWTC620SESa/vBRKViYK
X-Google-Smtp-Source: 
 AGHT+IFgs4/FEoib8hU/ok1TVSzmB1fbWFiM+uZk4kceufpUhC2Ch79+Ar8YHPBhpWONVDqSnLf5Ew==
X-Received: by 2002:a17:902:e9c6:b0:1e2:b137:4f88 with SMTP id
 6-20020a170902e9c600b001e2b1374f88mr4603566plk.30.1712412912298;
        Sat, 06 Apr 2024 07:15:12 -0700 (PDT)
Received: from fedora.. ([2409:40f4:3d:d63:253:b5f6:7724:8cee])
        by smtp.gmail.com with ESMTPSA id
 jc2-20020a17090325c200b001e28d18bd52sm3437400plb.232.2024.04.06.07.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 07:15:12 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: ti,pcm1681: Convert to dtschema
Date: Sat,  6 Apr 2024 19:44:49 +0530
Message-ID: <20240406141454.45529-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: animeshagarwal28@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HKT2NH4MH3ZDN65BQJYAUME4C3NFTZWA
X-Message-ID-Hash: HKT2NH4MH3ZDN65BQJYAUME4C3NFTZWA
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:16:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the Texas Instruments PCM1681 bindings to DT schema.
Make bindings complete by adding #sound-dai-cells.

Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>

---
Changes in v2:
- Added existing maintainers to the list of maintainers.
- Added  #sound-dai-cells, $ref to dai-common and unevaluatedProperties: false.
- Added "audio-codec" in example.
---
 .../devicetree/bindings/sound/ti,pcm1681.txt  | 15 -------
 .../devicetree/bindings/sound/ti,pcm1681.yaml | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 15 deletions(-)
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
index 000000000000..5aa00617291c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm1681.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM1681 8-channel PWM Processor
+
+maintainers:
+  - Shenghao Ding <shenghao-ding@ti.com>
+  - Kevin Lu <kevin-lu@ti.com>
+  - Baojun Xu <baojun.xu@ti.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: ti,pcm1681
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
+
+        pcm1681: audio-codec@4c {
+            compatible = "ti,pcm1681";
+            reg = <0x4c>;
+        };
+    };
-- 
2.44.0

