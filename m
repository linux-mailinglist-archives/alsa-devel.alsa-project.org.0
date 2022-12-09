Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271FA648822
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 19:00:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4275224E;
	Fri,  9 Dec 2022 19:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4275224E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670608858;
	bh=N//3K4IVVgK8/bxVTESEehJUlsH5mUs3s5Olry99BdE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QoebaUAikCk3bo7tNEkGJGiYzV3meSNGVRGo2PKoOJqsK8pVI9EYOHjBCUbLLPaJp
	 BeSd/XlChw5paRc3KW5Oy/EPOIvj87VPgvdQ+C1kXdi19p0J2Odfyo1dt86iOYCfUh
	 1H+1EjEQknnE3b0NiMRzT7Y4LbCAfCuD21e332U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D26F80007;
	Fri,  9 Dec 2022 19:00:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B8DF8022D; Fri,  9 Dec 2022 19:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B48FF80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 18:59:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B48FF80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KREhYnoe
Received: by mail-lf1-x12c.google.com with SMTP id b13so8220679lfo.3
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f22vZCjXybDI16EXekXa2UBySgDksyt2VSWTc/dPnDU=;
 b=KREhYnoePYN4orZ39eONxq3E8mSCU/zQFges9mjBszy9iwCGX1ZXqFGaYTfjE8KNWq
 GnbMWK91HSsX8IalnxIx41GuyCpVATG0U7oSMxXCkMyyZW16KTTKrb9oeWt9ZnJPv+EQ
 hLokxIzo1JKTf35rrcGPwktCrRNhLfhIKpr9tkZw+c673FPBnyLAeisPiDPRuYN6Z2SJ
 Ovy+t5FmhGhX0fXh+2xF3huOxUtjIe5oTGehlXTtoVUvL4FGryF62bDjfSJCKKEb63Fe
 NGqV9r87jpMEvQXfkhtL9eLr5iO3HBF6ipMIg/gYK9I8US20Jie75eUEbbhMpz7guj32
 7WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f22vZCjXybDI16EXekXa2UBySgDksyt2VSWTc/dPnDU=;
 b=cznrgvaPa8KBEVGXj/HNKa417rsJ5ffDs97jtd8reKoCMoOPANLaj5647MbHZ3i1XB
 SNzEFuplA8Y/RcIGRuZ+JnYSZmKRY1WquhANGhq8/p2fW4YPTpn97XEMeiuMXmJVFj/n
 fk7JxrwDUtYkwa0KQO2X5kffpFbp4ILrIwo4fRqS1qmQ0EXwhgqhaWxqKRcJxluWsHJL
 FErBT6Wy0GK4yVEz7yop12hzbjXMWcejO2gx9rTzND80Q58H6Pz1m6jcVTl8LidBVzqT
 AzFH2rJ7qI9nGGPfZM+9oJgHxOAEBocFP/L86Qn+gqNU6bcqTEIK2uPCdrVNhpmKxPeE
 pUeg==
X-Gm-Message-State: ANoB5pk+gFUiEDrV1U0XW8ztA7JSdpFok4++F1PvLqRP56+u44BnQQIJ
 3aWCrSAYqmqUCeNVk3bh41ISEvFS43O47Up/SVM=
X-Google-Smtp-Source: AA0mqf706m4/EPthaGELVyDiMAmsOzNdN2ihBoRYFH9rN1tRPkIS/dT9wEdG+K0RroRv6jFflRAp0g==
X-Received: by 2002:a05:6512:90c:b0:4b5:2cf4:cc1d with SMTP id
 e12-20020a056512090c00b004b52cf4cc1dmr1585358lft.68.1670608794982; 
 Fri, 09 Dec 2022 09:59:54 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a0565123d9000b004b577877286sm350380lfv.50.2022.12.09.09.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 09:59:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: adi,adau7002: Convert to DT schema
Date: Fri,  9 Dec 2022 18:59:46 +0100
Message-Id: <20221209175947.335319-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert the Analog Devices ADAU7002 Stereo PDM-to-I2S/TDM Converter
bindings to DT schema.  During the conversion, add properties already
used by DTS (sc7180-trogdor-coachz.dts) and Linux driver:
1. wakeup-delay-ms,
2. sound-dai-cells (via referencing dai-common.yaml).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/adi,adau7002.txt           | 19 ---------
 .../bindings/sound/adi,adau7002.yaml          | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau7002.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,adau7002.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,adau7002.txt b/Documentation/devicetree/bindings/sound/adi,adau7002.txt
deleted file mode 100644
index f144ee1abf85..000000000000
--- a/Documentation/devicetree/bindings/sound/adi,adau7002.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Analog Devices ADAU7002 Stereo PDM-to-I2S/TDM Converter
-
-Required properties:
-
- - compatible: Must be "adi,adau7002"
-
-Optional properties:
-
- - IOVDD-supply: Phandle and specifier for the power supply providing the IOVDD
-	supply as covered in Documentation/devicetree/bindings/regulator/regulator.txt
-
-	If this property is not present it is assumed that the supply pin is
-	hardwired to always on.
-
-Example:
-	adau7002: pdm-to-i2s {
-		compatible = "adi,adau7002";
-		IOVDD-supply = <&supply>;
-	};
diff --git a/Documentation/devicetree/bindings/sound/adi,adau7002.yaml b/Documentation/devicetree/bindings/sound/adi,adau7002.yaml
new file mode 100644
index 000000000000..fcca0fde7d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,adau7002.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,adau7002.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADAU7002 Stereo PDM-to-I2S/TDM Converter
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: adi,adau7002
+
+  IOVDD-supply:
+    description:
+      IOVDD power supply, if skipped then it is assumed that the supply pin is
+      hardwired to always on.
+
+  wakeup-delay-ms:
+    description:
+      Delay after power up needed for device to settle.
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-codec {
+        compatible = "adi,adau7002";
+        IOVDD-supply = <&pp1800_l15a>;
+        #sound-dai-cells = <0>;
+        wakeup-delay-ms = <80>;
+    };
-- 
2.34.1

