Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A646A7B9B7C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C417E7D;
	Thu,  5 Oct 2023 09:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C417E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492117;
	bh=m61rqQD+SbYDUjELWJEBHIrwqoqCuIaExo/taP4DzJE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b/fzSBnknfOc8/qMTe9smL8RjfmlyVwLOX02aiV33QxEhvsGVsqHfJZqxhuWTG5Qy
	 DIfodQM5ULEWlqlGWfWiAzZoPJWqym+8+YyPr9Lxto1J/tZL1DU3oDF6hKDXjDA3fd
	 5VWwSu7DmAGCVtqmrGQTVrXSvzfiTb2t2Y7Id2cs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8CB6F8057F; Thu,  5 Oct 2023 09:46:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17FF5F80579;
	Thu,  5 Oct 2023 09:46:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7603BF801D5; Sat, 30 Sep 2023 18:51:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12FB6F800AE
	for <alsa-devel@alsa-project.org>; Sat, 30 Sep 2023 18:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12FB6F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bsGaK/om
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1e113555a47so1547144fac.2
        for <alsa-devel@alsa-project.org>;
 Sat, 30 Sep 2023 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696092659; x=1696697459;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BD+dNoaQ5Ko9mEneN4hRLVbcmg6MeMpXyWLNg0tAORY=;
        b=bsGaK/om8efYOmC0CAGSnmv8gmaWErqPuOSwVFatYtVF2kVjQgRdsI2RvKHsS+KHTP
         TxyRuLFMbLRMVo8IVPBZFyV+kaK5BZEKzNaEtM27XQXQbR1gtCYSqzLGS8Svi8ivlxPs
         IKxBtNJQIow9E8HJ4bYo3DZf4dcwgp0w6w+EQbIOQtFhZmZidSS0Y4JK3h5okpIzcUyu
         K6vcuW1bwxjMkfxO2qjfGNKasCQSyEQjXJ8tb/yuV0psWw3nnAs/eIvZd5sp6Y8MkUws
         7hWDKSUGnE/pUjKt3P5drsKfPZntyLLwFgBFpgJEeMjf2h2NFgdSK2Vdza90ZW1xk7lJ
         UegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696092659; x=1696697459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BD+dNoaQ5Ko9mEneN4hRLVbcmg6MeMpXyWLNg0tAORY=;
        b=Fe3fz9+6+nbOcyV2H6stdJpWxVm641NkOPa+tAzYKhwSF2P7KjIwsnGgzZPSnNluom
         9ErpkHwPt2iLdQdXNL1YHd1tChULw8pbkPN5xut2DeDGlYN8wvcFU7TaC0osJ2/83IWm
         DgxyPhNcxTKoQ1QxpGW8ZXUHVabXUWK0br47Cp6/XOw6CHvmr3g+eH1b59cFivngOZDu
         N19XCWNSQEsoW3PJoWG1haN39AQDVf4eM+1zmn4kxtFvLYbIdpsXzrcQsTfBGZ+xWQVn
         WatA4IfzlCp+wGZR0Xn7PKqZaBS0B3jDdv+JHmF37blpO7S2diikfg70V7MG6ZipWiVU
         XV0Q==
X-Gm-Message-State: AOJu0Yxaf3o0+chh+2yH4XzJar+aTqxK+gQd4h9onwsrGThz2k6xFmYI
	TvPqoddUCSc7DsTDVKh+XB4=
X-Google-Smtp-Source: 
 AGHT+IFFpZXmqz2lsFQCuPTwDpRXOkoC6NFk3863nEWuEFjRiK/iEe8dVToBwEgKuWVFEMN/pCTBOg==
X-Received: by 2002:a05:6870:c08e:b0:1d5:6161:76f3 with SMTP id
 c14-20020a056870c08e00b001d5616176f3mr8349420oad.3.1696092658868;
        Sat, 30 Sep 2023 09:50:58 -0700 (PDT)
Received: from brag-vm.localdomain ([157.51.87.154])
        by smtp.gmail.com with ESMTPSA id
 f15-20020aa78b0f000000b0068fe7c4148fsm16583055pfd.57.2023.09.30.09.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 09:50:58 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: rt5616: Convert to dtschema
Date: Sat, 30 Sep 2023 22:20:50 +0530
Message-Id: <20230930165050.7793-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bragathemanick0908@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QU4FRDIGEOTZSFNYD5P53TSK6RKBTSGI
X-Message-ID-Hash: QU4FRDIGEOTZSFNYD5P53TSK6RKBTSGI
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QU4FRDIGEOTZSFNYD5P53TSK6RKBTSGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the rt5616 audio CODEC bindings to DT schema

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
V1 -> V2: Changes codec to audio-codec and added spacing above

 .../bindings/sound/realtek,rt5616.yaml        | 49 +++++++++++++++++++
 .../devicetree/bindings/sound/rt5616.txt      | 32 ------------
 2 files changed, 49 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
new file mode 100644
index 000000000000..a387f802afd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek rt5616 ALSA SoC audio codec driver
+
+description: |
+  Pins on the device (for linking into audio routes) for RT5616:
+
+      * IN1P
+      * IN2P
+      * IN2N
+      * LOUTL
+      * LOUTR
+      * HPOL
+      * HPOR
+
+maintainers:
+  - Bard Liao <bardliao@realtek.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: realtek,rt5616
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
+        audio-codec@1b {
+            compatible = "realtek,rt5616";
+            reg = <0x1b>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/rt5616.txt b/Documentation/devicetree/bindings/sound/rt5616.txt
deleted file mode 100644
index 540a4bf252e4..000000000000
--- a/Documentation/devicetree/bindings/sound/rt5616.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-RT5616 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-- compatible : "realtek,rt5616".
-
-- reg : The I2C address of the device.
-
-Optional properties:
-
-- clocks: The phandle of the master clock to the CODEC.
-
-- clock-names: Should be "mclk".
-
-Pins on the device (for linking into audio routes) for RT5616:
-
-  * IN1P
-  * IN2P
-  * IN2N
-  * LOUTL
-  * LOUTR
-  * HPOL
-  * HPOR
-
-Example:
-
-rt5616: codec@1b {
-	compatible = "realtek,rt5616";
-	reg = <0x1b>;
-};
-- 
2.34.1

