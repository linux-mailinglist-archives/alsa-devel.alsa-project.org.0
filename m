Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CBA6CEEAA
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EB4204;
	Wed, 29 Mar 2023 18:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EB4204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680105989;
	bh=KIS8/hfK3+0CPKRyehKBUeBe0Dx+miYFkUR+34rbOTE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NpoGrhpuiEt1tOIxCIwVnas0ayiTW+YxVNGyR0/E6Zlz5sTCvOfdw2zk2fmD7L3Oq
	 WVf4xRbFhyJv3q9x7VynIAfQu5pskUAm1klzl/1MPyFMCqTq1GwzBZ95e5EXclPyJG
	 7nGsly3MZfTVh6rzdpTCQhdg58LMYTMluOzcUGYg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E698F80114;
	Wed, 29 Mar 2023 18:05:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7856AF8027B; Thu, 23 Mar 2023 14:05:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FD0CF800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:05:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD0CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EvIAw5uY
Received: by mail-pj1-x102b.google.com with SMTP id j13so21411056pjd.1
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679576718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWCXPXA01MTxciO2O9Gpy0spNBsM2s0w3oGvveagMoo=;
        b=EvIAw5uYNDJCs83AkTe8PKJ5PTxaFvQrrndavIdnGESuO3Uval6+/8U5VTh2BJBgV8
         pgpLTIEc64554ew8zGYznC3JjP0rlDsTQurPqqSJ7jRB35auHPVBnn8ZFfBhGLGNo53a
         wBF9MtM8hIAzN57m9kDxcLWIS2xCQf73oyc/njFgodOTWg/eDyE+R47WdheRwUJaDEAx
         QTj3J8jlE5eB1w+D6dsrmxO5QeeMccRnV4aSvajvhP4SfRnzq2pQHYhy+PGrK5iqLyPK
         0LNJc15sUyVZoD85cAhyY8Z+8KP0NIKcFzN9sePx0pQ1ayKzZe/uwdAbNclUafEzOwSU
         uZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679576718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWCXPXA01MTxciO2O9Gpy0spNBsM2s0w3oGvveagMoo=;
        b=7lmqj4qg8lgRpWB/PQm1CJyFAxavY8YYrxUG1fdu7ke8gc9rhyEfojPn46RP9O9XR7
         8FqzdRCUxb5UkYLc2oSHybtHnvYg9OrbkJpFpOzQQkWhS9+lV8NXpRUm0gn8c2+Fbwo0
         5tKPzE6W/5r3Dm/bEQhXOjncgl1S/uhWKaibwJVTFgON5/yCxUYmxm2fKxaEnXs0S/j/
         5b3cOVLV0Kty41SQoVt6eEoMxs7tH2NA2MrBVMtUn5qdJ7xnWyb5VTpjR3r4z1vkQfjR
         eet8Cv1TFp5rDkWeU8IKDE6gK5PIZHUDNBqAqrlqxzG7/S3R5XFZxWuYTKdMH2eCbTk5
         aPgA==
X-Gm-Message-State: AO0yUKVSmtiLqp6/IRylbrwVPYCGdr2dFRHhHHIK5RynHRsHmCcsTZW0
	1LCwvaSV3nWGuEAQjruZOOw=
X-Google-Smtp-Source: 
 AK7set8S+0kJoTpHKtB6cXVVZlN4fSFDi/M+zMk/Fq8rKQE2qE0kdzqchatkBUco0c3oAb20eqdpRA==
X-Received: by 2002:a05:6a20:b214:b0:d9:84d2:7aae with SMTP id
 eh20-20020a056a20b21400b000d984d27aaemr3111303pzb.22.1679576718295;
        Thu, 23 Mar 2023 06:05:18 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:96dd:65b4:8354:3919])
        by smtp.gmail.com with ESMTPSA id
 d16-20020aa78150000000b005825b8e0540sm11880245pfn.204.2023.03.23.06.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:05:17 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Thu, 23 Mar 2023 18:35:11 +0530
Message-Id: <20230323130511.16367-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UD4APJG67NPEFCUHCCTAHQ5HLWL66PP2
X-Message-ID-Hash: UD4APJG67NPEFCUHCCTAHQ5HLWL66PP2
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:21 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UD4APJG67NPEFCUHCCTAHQ5HLWL66PP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the ALC5632 audio codec bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/alc5632.txt     | 43 -------------
 .../bindings/sound/realtek,alc5632.yaml       | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/alc5632.txt
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,alc5632.yaml

diff --git a/Documentation/devicetree/bindings/sound/alc5632.txt b/Documentation/devicetree/bindings/sound/alc5632.txt
deleted file mode 100644
index ffd886d110bd..000000000000
--- a/Documentation/devicetree/bindings/sound/alc5632.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-ALC5632 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "realtek,alc5632"
-
-  - reg : the I2C address of the device.
-
-  - gpio-controller : Indicates this device is a GPIO controller.
-
-  - #gpio-cells : Should be two. The first cell is the pin number and the
-    second cell is used to specify optional parameters (currently unused).
-
-Pins on the device (for linking into audio routes):
-
-  * SPK_OUTP
-  * SPK_OUTN
-  * HP_OUT_L
-  * HP_OUT_R
-  * AUX_OUT_P
-  * AUX_OUT_N
-  * LINE_IN_L
-  * LINE_IN_R
-  * PHONE_P
-  * PHONE_N
-  * MIC1_P
-  * MIC1_N
-  * MIC2_P
-  * MIC2_N
-  * MICBIAS1
-  * DMICDAT
-
-Example:
-
-alc5632: alc5632@1e {
-	compatible = "realtek,alc5632";
-	reg = <0x1a>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
new file mode 100644
index 000000000000..7c2de067fb27
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,alc5632.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ALC5632 audio CODEC
+
+description: |
+  Pins on the device (for linking into audio routes):
+      * SPK_OUTP
+      * SPK_OUTN
+      * HP_OUT_L
+      * HP_OUT_R
+      * AUX_OUT_P
+      * AUX_OUT_N
+      * LINE_IN_L
+      * LINE_IN_R
+      * PHONE_P
+      * PHONE_N
+      * MIC1_P
+      * MIC1_N
+      * MIC2_P
+      * MIC2_N
+      * MICBIAS1
+      * DMICDAT
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+properties:
+  compatible:
+    const: realtek,alc5632
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - '#gpio-cells'
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        alc5632: alc5632@1a {
+            compatible = "realtek,alc5632";
+            reg = <0x1a>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
-- 
2.34.1

