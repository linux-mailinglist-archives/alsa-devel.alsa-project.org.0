Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55400607DFE
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 19:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2B35931;
	Fri, 21 Oct 2022 19:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2B35931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666375109;
	bh=GtOwiXHJtXYIaTqg9eeOvXlRJChliQa7s+KM5+93GpM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S0LWTY8lS76j6+BHqI2WmIoBR1wkdMkNITeWCbill844O4ivKBy7bfCa/boTzHR2V
	 +sQoziUaHU/B9ojwZLyqWkbXGIgkZ3PBzp5MxPQrUab1nmUDyX8EZOEiUErUwW5wfJ
	 2ulMPoreppCyweE/wNOux2qaWAuyQ/h7ydSjA7Tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69275F80256;
	Fri, 21 Oct 2022 19:57:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C93AF8021D; Fri, 21 Oct 2022 19:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 509A2F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 19:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 509A2F800B5
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1324e7a1284so4453914fac.10
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 10:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/jQjxq+e47XxVcvPy1+t9R+5G4XPCZM0x41PBT8twbU=;
 b=Un/vhsg6faUqj7wKD4MPn6Z2ND613PfjwXvbN9eige0X513JKKQV7gE7tvKr4f2MfQ
 I4EPsgAY06iErxk+DNUB4kUEl+oQM2PJWDnbqFKlXo1s+bn0es0iIM4AZ8qZyFlBMKmW
 RYUokHjz9a05LiouD5YmNKFRFcR2BYTBAtFdB7tgqJWkKFwbh2WJigTxJbvqINYjFHXS
 QeK4zVzX6NLpXxvNeZgbUzewkEhC2z8SjmqHaRKaaRmnaQue8+BfaprneLu0VEXzxXbv
 zbMWMiQxCU8dfR+qZPP3cp9QXfa/8RqcnDR8mcUCWbp0tHeqXxMLwoRwZX8fOBNucsCX
 8cKw==
X-Gm-Message-State: ACrzQf0nuSBI2mTqK2Xy1jwK4T6qHYRawcrcuUu8R35ZdK2fKjMsUuZc
 I6MbJV+zbuS72IH0RQ/HaQ==
X-Google-Smtp-Source: AMsMyM4tpdOAMkz2XAcwJ5Q0Ti7mViOL5yxCCERanNJ1hDzAAJGgf89B2S7bNswtDxj5skjtOigv5A==
X-Received: by 2002:a05:6870:9a1f:b0:133:599:9555 with SMTP id
 fo31-20020a0568709a1f00b0013305999555mr30129688oab.201.1666375045361; 
 Fri, 21 Oct 2022 10:57:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 db10-20020a0568306b0a00b00661a80d555fsm1389748otb.40.2022.10.21.10.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 10:57:24 -0700 (PDT)
Received: (nullmailer pid 4005712 invoked by uid 1000);
 Fri, 21 Oct 2022 17:57:26 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH] ASoC: dt-bindings: Convert dmic-codec to DT schema
Date: Fri, 21 Oct 2022 12:57:21 -0500
Message-Id: <20221021175721.4005601-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the dmic-codec binding to DT schema format.

The '#sound-dai-cells' and 'sound-name-prefix' properties were not
documented, but are in use, so add them.

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix example include and syntax errors
 - Update Arnaud's email
---
 .../devicetree/bindings/sound/dmic-codec.yaml | 55 +++++++++++++++++++
 .../devicetree/bindings/sound/dmic.txt        | 22 --------
 2 files changed, 55 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/dmic-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/dmic.txt

diff --git a/Documentation/devicetree/bindings/sound/dmic-codec.yaml b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
new file mode 100644
index 000000000000..bba27c985996
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/dmic-codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/dmic-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic PDM Digital microphone (DMIC) codec
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+properties:
+  compatible:
+    const: dmic-codec
+
+  '#sound-dai-cells':
+    const: 0
+
+  dmicen-gpios:
+    description: GPIO specifier for DMIC to control start and stop
+    maxItems: 1
+
+  num-channels:
+    description: Number of microphones on this DAI
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 8
+    default: 8
+
+  modeswitch-delay-ms:
+    description: Delay (in ms) to complete DMIC mode switch
+
+  wakeup-delay-ms:
+    description: Delay (in ms) after enabling the DMIC
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dmic {
+        compatible = "dmic-codec";
+        dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+        num-channels = <1>;
+        wakeup-delay-ms = <50>;
+        modeswitch-delay-ms = <35>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/dmic.txt b/Documentation/devicetree/bindings/sound/dmic.txt
deleted file mode 100644
index 32e871037269..000000000000
--- a/Documentation/devicetree/bindings/sound/dmic.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device-Tree bindings for Digital microphone (DMIC) codec
-
-This device support generic PDM digital microphone.
-
-Required properties:
-	- compatible: should be "dmic-codec".
-
-Optional properties:
-	- dmicen-gpios: GPIO specifier for dmic to control start and stop
-	- num-channels: Number of microphones on this DAI
-	- wakeup-delay-ms: Delay (in ms) after enabling the DMIC
-	- modeswitch-delay-ms: Delay (in ms) to complete DMIC mode switch
-
-Example node:
-
-	dmic_codec: dmic@0 {
-		compatible = "dmic-codec";
-		dmicen-gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
-		num-channels = <1>;
-		wakeup-delay-ms <50>;
-		modeswitch-delay-ms <35>;
-	};
-- 
2.35.1

