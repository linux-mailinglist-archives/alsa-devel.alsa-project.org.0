Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478C6CEEE7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2E886E;
	Wed, 29 Mar 2023 18:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2E886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106346;
	bh=UN1lHdLmqwcMyQIhpDmlSfkIefUAk+e5aw3W734tomQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=By0Za1K7fRg4Udk9+4iXrVJSlhCLmqxnN46eV6vu7GKoaIUohL6Am011kimJdiFTw
	 n9CG/GW9sEoScXydxYJeBK1xpGrzfPi4nIGylg19U90s2zW0wFeNCsG8TrqdShjDyF
	 ChP2KbkgsJv/2gmkQ4VkR4ZubSeUQeO0j32yvGNM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ADC3F8024E;
	Wed, 29 Mar 2023 18:11:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C72F802E8; Sat, 25 Mar 2023 21:10:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB411F80254
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 21:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB411F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=px9wskqb
Received: by mail-pj1-x1033.google.com with SMTP id a16so4320499pjs.4
        for <alsa-devel@alsa-project.org>;
 Sat, 25 Mar 2023 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679775014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MDnfgRR+FKWTZeyRUEXrJ/4XfAf+pAOJ+XLicsZDFY=;
        b=px9wskqbmul8hBoJORyRP4neV8/Hvmjf5eTbvPjtT3Cs23m7w+hLnhS1ZuAGVhiV2I
         YqbQf9Nlxvh0b0VDWewSiK3W9gm6IhidjWox1/53fSNDqoGVeu03hy6UiRtWG98Vug9f
         NFhw/Hr3YYskB/qYkPBNeo6t+7akLNIb/miYLph3qS79x59ai4ED1vxid8IiddXWnITd
         jzdZXk2hC8Ulqn6+xF0BqERu17RGBc7U4OiAET8yBEfylpDP/y68mwUAkQpIfUwqdk3x
         IIqPzeeH0XuaF6IXCzqTDzIC7mVc1h5ezXzFfqtIEsw6Gt5iXmwKnYlUk7a2g5EOcbFx
         hdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679775014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MDnfgRR+FKWTZeyRUEXrJ/4XfAf+pAOJ+XLicsZDFY=;
        b=c0N8NhyfBjsEi3Kfyk1kJ8BBpozSnrw1voo/Buj3dNNO74xCi+3OkLsnOu1vcHRNF2
         ou3xFqlLJf0aZSD+LNrHcFSksRLgDAo6npYEVp900qouyoB4UPu+EOGLbHq99rqGnefQ
         VvgBmAReidtjvaLxqfQkxsgzVIK/77udj0OG1P3kqBx0og7PQ4mrPV1xzfd+Nwh4tWRR
         Cup+7H5kbGfBl+pTmBvUXbaf3K4angvSEgimQODOwW4H8Q6YxC7JPn/1PKx6fBUFZW5m
         wmVhTFyPAiUbh3D6fTUK6/4B45ZmVCMnOzAWVFfJg49nEyH1B+dQvNUehz6fPgKWvtjT
         PFrA==
X-Gm-Message-State: AAQBX9c/k9QdMwDdYClMCC7XYQIR7E/6O2Nl+2tHF5AAV7J/UY9Z/yjk
	UA01JiLnf6p8vdBqOkuW1QQ=
X-Google-Smtp-Source: 
 AKy350YoJZmEKk7JQ3rokJa/yebKHOjEddC4sTXKvMiAnVB0jfaCLehulWplY+iwJJyJq9RfC9pY6A==
X-Received: by 2002:a17:902:cec6:b0:19a:ad2f:2df9 with SMTP id
 d6-20020a170902cec600b0019aad2f2df9mr7745873plg.55.1679775013718;
        Sat, 25 Mar 2023 13:10:13 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:dbe7:6935:261d:5dd6])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a170902b28400b001a06b33923bsm16358813plr.164.2023.03.25.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 13:10:13 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: shengjiu.wang@nxp.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Sun, 26 Mar 2023 01:40:07 +0530
Message-Id: <20230325201007.13006-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PL5H6CZYP44M47RWSON5SPTYWS3HW3P6
X-Message-ID-Hash: PL5H6CZYP44M47RWSON5SPTYWS3HW3P6
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:11:31 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PL5H6CZYP44M47RWSON5SPTYWS3HW3P6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the AK4458 audio DAC bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/ak4458.txt      | 28 ---------
 .../bindings/sound/asahi-kasei,ak4458.yaml    | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 28 deletions(-)
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
index 000000000000..b97aee96fa17
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -0,0 +1,62 @@
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
+        ak4458: codec@10 {
+            compatible = "asahi-kasei,ak4458";
+            reg = <0x10>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+        };
+    };
-- 
2.34.1

