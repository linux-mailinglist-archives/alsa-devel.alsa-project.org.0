Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EAC6D9A21
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1F1ECC;
	Thu,  6 Apr 2023 16:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1F1ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791466;
	bh=GEF42LLH67x2bp1ZQ3vkcSmezXltJ3Uxy+e6SCZXNEo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AF+iqkW3nKEdbcUlVDdO1O0D/dATG9rzBbuLt66WXz/B5bY50RhlOzNS7UCGkx3Fp
	 hG88YueXoQqg+xX4bIg3usKMDQqxRVOlPNZSIRNPs/hVZVwgEH5FsMb+D4hUW4HqZc
	 7nABpBCCk8AcXA2vjnNy0GWykyAtQbvnUmvqcSDU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23A5EF805C2;
	Thu,  6 Apr 2023 16:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6386DF8024C; Wed,  5 Apr 2023 22:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E147F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E147F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hxEM/qI4
Received: by mail-pj1-x1034.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so40766025pjb.4
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 13:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKzNCLVl42oXEDNGT8TsESnDpIsZTaCWPqislM2wAtI=;
        b=hxEM/qI4QHMC2jKXgsn0s21vyMD1Io+s5SE6tOIdKgfNYoPyz2Xkfq8xPJODLi5xt2
         BNErNUaDdxAPZ7zaWCjJV1ct4ph1C3pfHMugBN0dRKDPlkEB0Xh95ToT5RnzkjaTTrfq
         KJnlGl7An0mGYZ6fj7cegMLC4wAJjACoK9tUpi+Vxjaa+l8DzOAepCSJHPCNEK3xNLyl
         JpODtvd79KchlQc160KgNCIB5JZeb/3uylAJnv2W0MMkw9qVM+w4XikbJlFCCJ13DRqI
         zbdCHhU9Wavbqj/AY4e72OMafn0yixx7FKkjTGNiQh59ruILbzzpleVul6faXEyRCxLh
         HjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKzNCLVl42oXEDNGT8TsESnDpIsZTaCWPqislM2wAtI=;
        b=TqdbGwFRU//dgJb4oVHodaRWOxrZLLTTnXGjS9zGXEDlMUal2MBjqYjOB40/EvFMiR
         wJuoGyYoTwdJLafkcP+Zdqun79WNkvfkKGOIkm1FMaViBZ4J4VagefWNQYtu1c0RHCID
         wq/6TxLX4fNQu+MgO5Xx0ZRRDTZNWc8xOQP8QdZvLbFqz+4Q0inhjqseMInq/ICpzC1r
         TPVCYy4Fagj2Jy5IJ1lP15J8f9ZpVK4hzoHqUrKzJ9LI9x9cIbjJIbnC2SigS2R1xiOC
         SYxFoS8RC8fx/XVpXh5fXMIdtSunUd0cwzAVgJugHmFe3LfrrRz0jBkCwjxGopQOZsEf
         ZY2g==
X-Gm-Message-State: AAQBX9dIodiCQ6WDn8+NUYOkuRzbPqAWtay3qxX+bjnOQO0bSRjdQTDj
	glqwok1VWFSs9d33/X3R9GY=
X-Google-Smtp-Source: 
 AKy350ZQjITByRIh6laCMZtN0D4PEu5si/p7iyC3zWOWJmAU0uCqGQIZmlDCQQfFDVIkWo4Gz74rfA==
X-Received: by 2002:a17:902:d1d5:b0:1a3:d5af:9b6f with SMTP id
 g21-20020a170902d1d500b001a3d5af9b6fmr5296025plb.19.1680727833997;
        Wed, 05 Apr 2023 13:50:33 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:616c:b78a:a01f:5113])
        by smtp.gmail.com with ESMTPSA id
 w9-20020a170902a70900b001a260b5319bsm10577676plq.91.2023.04.05.13.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:50:33 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: wm8580: Convert to dtschema
Date: Thu,  6 Apr 2023 02:20:25 +0530
Message-Id: <20230405205025.6448-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5YKNZAJDEXNU7R45SRUXM3FZN7RAUEUE
X-Message-ID-Hash: 5YKNZAJDEXNU7R45SRUXM3FZN7RAUEUE
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:28 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YKNZAJDEXNU7R45SRUXM3FZN7RAUEUE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8580 and WM8581 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8580.yaml | 42 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8580.txt      | 16 -------
 2 files changed, 42 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8580.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8580.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8580.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8580.yaml
new file mode 100644
index 000000000000..2f27852cdc20
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8580.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8580.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8580 and WM8581 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - wlf,wm8580
+      - wlf,wm8581
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
+            compatible = "wlf,wm8580";
+            reg = <0x1a>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8580.txt b/Documentation/devicetree/bindings/sound/wm8580.txt
deleted file mode 100644
index ff3f9f5f2111..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8580.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-WM8580 and WM8581 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "wlf,wm8580", "wlf,wm8581"
-
-  - reg : the I2C address of the device.
-
-Example:
-
-wm8580: codec@1a {
-	compatible = "wlf,wm8580";
-	reg = <0x1a>;
-};
-- 
2.34.1

