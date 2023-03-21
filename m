Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656EE6C6927
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32ECEC7;
	Thu, 23 Mar 2023 14:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32ECEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577020;
	bh=SGjtxG2x4xchw0XuY4jtWD5eNSEekG4kSGz6tEAPKvo=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QmWSa1RzPvGTqERja8+00xBeNzxPm4pWzI3JQnDlFud8M81/aRVtR7y+vlfg3ovF+
	 go3/S1I8fcAUAKm/HdRsB7z7QYzGQGhVoW1XhVRCfITB/41PAQnMwmrR5ENiTtH9JO
	 sXm+aCeVufI3Q9aRVxK+qCZmLFnJ1NTmuTU9ieUI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE295F8052D;
	Thu, 23 Mar 2023 14:08:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C55D9F8027B; Tue, 21 Mar 2023 19:08:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3142F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 19:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3142F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Oz0uTH19
Received: by mail-pf1-x431.google.com with SMTP id z11so9559836pfh.4
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Mar 2023 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679422102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/rMnDzTtzdcuKbx17fhDdJNMf1h2Fo2LL02Vb+CLhM=;
        b=Oz0uTH19riE739DTfb3G3nD8aJwC6wR5n8PTyU5asLq3QwHqln2ZjEe2ks3kJKs5WG
         ZvJrpHusWjKKjThTPqs17fkB3o3VMQXePDHF6ooFdEvUNAg7k0QrMnAHE+C2pYQizdwe
         XPTjeyYyg9c4C+fjgiAxgvzG+0L+xdE/C1Um+Rl4usWQMEU4zB4oZ1pdBudcX3NwbeED
         8cmWAHBpsVtYScaVc9WlaKZLOKiBtM4dIVHT6wBcZFQldqrDdM6iVv5OZ7NM2Kxx26ad
         Mtdu0wV2VEdrDvV1cRETdksIcyz1PF8maBY+G5vTkKvlcurIrLCWa+5cGTJerqBTEpep
         YY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679422102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/rMnDzTtzdcuKbx17fhDdJNMf1h2Fo2LL02Vb+CLhM=;
        b=hBtnrCcT9duihatkdh70ZvYTrPA/UXf0Xm4HtWvv8cBy6YnkgxIxbJ+RSu7dx5irAH
         JhFPbbHOi+4la09j9TsrGtstheNC9juKaEbKb4T4bznqdGEOJJP+AR00quqtK/9ZkHWR
         5YHD8+x63FBiChV+Vw5/j/cdE4QfgRCRX/3xfDqP770U2xrJ9rNOxmzlEZuqMM90KLei
         +Zf4D1tjqEYp9ZEKD7ROrPM6Re0hXJZHOUyH2RqYz7gEoWtK5OC3q+yzdAKfEzJU92AU
         1tbVVPYrdIFXggq84j/YhinIpnZ1B1d2SosmZmlqt41fBRV5o9wWs1/oOkLhYrs3m4Rn
         L72Q==
X-Gm-Message-State: AO0yUKU90E2ZAD7jb5e7djiP9cT8mxCY+yxiR/dBZFITVvZr7ygsmE6n
	Y8T2RI7foyelCOirCHcxm/0=
X-Google-Smtp-Source: 
 AK7set8Y5LDotwJmgDk9x8Q5w4bKASWDV6/0OiAfBWqilwxolMKj/ewwXe85vIJsjNQ8JOrk8MgXag==
X-Received: by 2002:aa7:98db:0:b0:628:cff:1440 with SMTP id
 e27-20020aa798db000000b006280cff1440mr545007pfm.28.1679422101460;
        Tue, 21 Mar 2023 11:08:21 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:1776:b945:875a:a34])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a62bd15000000b005895f9657ebsm8522918pff.70.2023.03.21.11.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:08:21 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] ASoC: dt-bindings: ak5558: Convert to dtschema
Date: Tue, 21 Mar 2023 23:38:09 +0530
Message-Id: <20230321180809.9215-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UXVXOEJTEUWMLEGC2ZRZH6HPRFUYB6QD
X-Message-ID-Hash: UXVXOEJTEUWMLEGC2ZRZH6HPRFUYB6QD
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:08:41 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXVXOEJTEUWMLEGC2ZRZH6HPRFUYB6QD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the AK5558 ADC audio codec bindings to DT schema.

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/ak5558.txt      | 24 ---------
 .../devicetree/bindings/sound/ak5558.yaml     | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak5558.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ak5558.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak5558.txt b/Documentation/devicetree/bindings/sound/ak5558.txt
deleted file mode 100644
index e28708db6686..000000000000
--- a/Documentation/devicetree/bindings/sound/ak5558.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-AK5558 8 channel differential 32-bit delta-sigma ADC
-
-This device supports I2C mode only.
-
-Required properties:
-
-- compatible : "asahi-kasei,ak5558" or "asahi-kasei,ak5552".
-- reg : The I2C address of the device.
-
-Optional properties:
-
-- reset-gpios: A GPIO specifier for the power down & reset pin.
-- AVDD-supply: Analog power supply
-- DVDD-supply: Digital power supply
-
-Example:
-
-&i2c {
-	ak5558: adc@10 {
-		compatible = "asahi-kasei,ak5558";
-		reg = <0x10>;
-		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/ak5558.yaml b/Documentation/devicetree/bindings/sound/ak5558.yaml
new file mode 100644
index 000000000000..90fd734daeec
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ak5558.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ak5558.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK5558 ADC Device Tree Bindings
+
+maintainers:
+  - Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>
+  - Mihai Serban <mihai.serban@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - asahi-kasei,ak5558
+      - asahi-kasei,ak5552
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  avdd-supply:
+    description: A 1.8V supply that powers up the AVDD pin.
+
+  dvdd-supply:
+    description: A 1.2V supply that powers up the DVDD pin.
+
+  reset-gpios:
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
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ak5558: codec@10 {
+            compatible = "asahi-kasei,ak5558";
+            reg = <0x10>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.34.1

