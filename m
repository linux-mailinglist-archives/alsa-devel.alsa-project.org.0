Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ABF6CEF16
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:17:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66706E86;
	Wed, 29 Mar 2023 18:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66706E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106663;
	bh=V+TIfa5Vzzaid4YGs8kSVZ4Zyfhl9yOtDdZjRhpqgdk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FEWkVdZQ5VPCXMXlAogLr+3skmmBmMCH2Q6tpqSZxIoFX4JQmmzdt8D3AwxbMbgGB
	 MlgqABe/NPIn1ay7yd50cEM2U1t5E8KonTapYmTF4L7NjExeg3ptYqY0R4rW5iNCff
	 Hn8Ux9KuUoJgxIYrfTiIuhLQIzIDf9f51/hDR27s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B22F80549;
	Wed, 29 Mar 2023 18:14:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D566F80272; Tue, 28 Mar 2023 10:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A8E9F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 10:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A8E9F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j/cEpRRM
Received: by mail-pf1-x42e.google.com with SMTP id i15so7446039pfo.8
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679993279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNI6lV401OYe10HsNLcwnXIFZPlsfUPtF81FXRtAZ3E=;
        b=j/cEpRRM19UVVeWZS9niuGCxErtarIdoC5kbPGQwNCHySTyUcwjwkGkeQ5z+J6kfzR
         pYKJm8Dg19Q6o+B3Eo1N1xNf/tfLq46xtFWvSAoMA/yWP+VPQ5IIZPzyg/LPvDHIODtv
         uFsBwVQpryiNlQuSQksTImQOAvcdT1DhL/WeWgUtCt5GlhKY6bmqB+uO5yD0P7VDZgwG
         KtJieIxpzUlm3dNPc3a1P6FMu2OdWXIVEMTBGdg6bzMRqfIijzNUOVLOS/VOm5j7jQsr
         gVwwuLLr/M52JlOmbLFwAqHVVeSlt9PTBkEtjUH3WyrDkomBFsFqqOoCxQ/eFCkQydUp
         9Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679993279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNI6lV401OYe10HsNLcwnXIFZPlsfUPtF81FXRtAZ3E=;
        b=cahoIWAANuIHUx4avtxARCmQBYl3MJWUFGCOVoRWl9OJ+dqMYHU0+mPWW3NwVVrrAS
         qoo+nfXYEO52P5stqb48PmtEgUHYPscwX1xoEuwzFFbLD7+julfqG4T+UrtKeVGFaNrY
         /kdZ9xIbqFgUcGTrWyLjxLR4rzf+hDAoODMy5almae/s66UBCyht+ORLFJKbC+HG2o0/
         nPQQYvnCRkiF4HCM2Pow8aKQL9Npc94bf5ck4sSAuPfIUOGsIOwaAF+ZWnSFXhdC/j/W
         C8vD5jda0lhvWt4lXq0yJaQsVzSrWnp/WVah/wfS1tIM7jizbdA75L2En8KRjuUh5cdN
         DEog==
X-Gm-Message-State: AAQBX9cHDbvD3u4gDLkW/vmATY/Y/u2YoKVjmXmI4g9NzRvch4CvXvSq
	njwKcfN8h6fSSTHuP19zCvs=
X-Google-Smtp-Source: 
 AKy350Y270PTe8vasybxuEgWv07q7aaaBzY21O1foTzqSD2vg28QsUxiKBuKth5huZcm4YiEF70L5w==
X-Received: by 2002:a62:8496:0:b0:627:f659:a771 with SMTP id
 k144-20020a628496000000b00627f659a771mr16150885pfd.12.1679993279393;
        Tue, 28 Mar 2023 01:47:59 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 e27-20020a63545b000000b00513092bdca1sm9119548pgm.73.2023.03.28.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 01:47:59 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	broonie@kernel.org,
	daniel.baluta@nxp.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	shengjiu.wang@nxp.com
Subject: [PATCH v4] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Tue, 28 Mar 2023 14:17:53 +0530
Message-Id: <20230328084753.55200-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QOSOQBM5DHLXG42QFZIX7KLVPG62XQMX
X-Message-ID-Hash: QOSOQBM5DHLXG42QFZIX7KLVPG62XQMX
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:31 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOSOQBM5DHLXG42QFZIX7KLVPG62XQMX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the AK4458 audio DAC bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
Changes:
V1 -> V2: Use the correct way for dsd-path property
          Drop ak4458 label form example
V2 -> V3: ak4458 is the only one that does not support dsd-path, so we
          do not require to define an array
V3 -> V4: Add back dsd-path property description

 .../devicetree/bindings/sound/ak4458.txt      | 28 -------
 .../bindings/sound/asahi-kasei,ak4458.yaml    | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4458.txt
 create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4458.txt b/Documentation/devicetree/bindings/sound/ak4458.txt
deleted file mode 100644
index 0416c14895d6..000000000000
--- a/Documentation/devicetree/bindings/sound/ak4458.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-AK4458 audio DAC
-
-This device supports I2C mode.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak4458" or "asahi-kasei,ak4497"
-- reg : The I2C address of the device for I2C
-
-Optional properties:
-- reset-gpios: A GPIO specifier for the power down & reset pin
-- mute-gpios: A GPIO specifier for the soft mute pin
-- AVDD-supply: Analog power supply
-- DVDD-supply: Digital power supply
-- dsd-path: Select DSD input pins for ak4497
-            0: select #16, #17, #19 pins
-            1: select #3, #4, #5 pins
-
-Example:
-
-&i2c {
-	ak4458: dac@10 {
-		compatible = "asahi-kasei,ak4458";
-		reg = <0x10>;
-		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>
-		mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
new file mode 100644
index 000000000000..608dce956be0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK4458 audio DAC
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - asahi-kasei,ak4458
+      - asahi-kasei,ak4497
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply
+
+  dvdd-supply:
+    description: Digital power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  mute-gpios:
+    maxItems: 1
+    description:
+      GPIO used to mute all the outputs
+
+  dsd-path:
+    description: Select DSD input pins for ak4497
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - const: 0
+        description: select #16, #17, #19 pins
+      - const: 1
+        description: select #3, #4, #5 pins
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: asahi-kasei,ak4458
+
+    then:
+      properties:
+        dsd-path: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@10 {
+            compatible = "asahi-kasei,ak4458";
+            reg = <0x10>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.34.1

