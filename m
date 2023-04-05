Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FD46D99B2
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F696EB4;
	Thu,  6 Apr 2023 16:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F696EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791430;
	bh=RYn84u9G/Zkcu+i+8WqfZViWCExSwrO8oyFcv6bImRM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U7UJR5F3KepbkvlCW3ba/0wSu7axd1cD0wz3ZFsxKkVYVXKCyYG5Y9DgyPNVgD4k/
	 Jziuj/pqHxy0Pg8wZLXCPwUX0W11V0fyAdOue0sUiWOKlZGwKsuY5F7i1a9+xJg0Uu
	 rhEhGFuvFa3FSMdV2Lfs8DzhM+eVym42Q8EsL9z0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E613F805B6;
	Thu,  6 Apr 2023 16:26:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC891F8024C; Wed,  5 Apr 2023 22:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B236F80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B236F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hn5nvYZl
Received: by mail-pj1-x102f.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so40630766pjb.4
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680725028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=47jcjFBV2Bf2A+zp4VCowtO0VoXUDpf6jywhaI3b9P0=;
        b=hn5nvYZlCGOAOIdPKry5XznwJu9mcOIFNVRVPxQyYPWVIwoWUtktRh92Gcd2Ljwxrt
         +oRDXTiDdt3rS9XUqrgZrL8ZrDnzRZhq/lJ54iOb4LNIwpN1Li9iiGSgw1d8Ps8Rkn4u
         Jweotuv+VumA6vpcnvL1p/UsYZ7VbuMOTilL3Db0pWVKA3gU4sN8Z1mD8s20N/SfWqi+
         JT2FF+E7MhpuaGIhydfUKTh9n1q7S8G6hkaLVx+lzI9OBNcHOg7sJBXMHleczMdDkQJ0
         OoK0Q4Gf2giCezf14j+e7QPHYzV0sRZzkxKjIptHUA2lwN4LKxknCrn+CFPkq0PvK0D9
         st7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680725028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47jcjFBV2Bf2A+zp4VCowtO0VoXUDpf6jywhaI3b9P0=;
        b=7Vg8l9k9ucbQY5FXN9kxmq8ETRqVUeZCW3oieXPmBbGW4WJVPCJ/G2mf+QMU0BATl/
         qrd7EzAiUaxBxlNtb2q2DO6GjqjNLUfREnznjOVzTrlQ6r1veEUKGFtP0DEoLsl7YGNU
         A/SX0advCHKegPB5I/MV2W42EZISfIqA/18F3c2ehmfY3XMRufeBMBbBqiI1CfC0YwG3
         5LgLHyDCKDjOYqDts7ersBEf3HoZHlBNkSHTiE+/YVrLKGSRDjkIWCxiZro+mi9nNvKb
         4j/Z/osurLqncT0qoJMmNHdx+6Grtk4CT0bY6UVK5QGk/OqzZs+LZDvsPqJnya5Sje+D
         Hk7w==
X-Gm-Message-State: AAQBX9e6Ase6zelPKmqDkFhyxtFB7Me/OEHbklTjhDJt0x0It3YVO/qL
	nfSgaskixJFtQEbykKtqVoc=
X-Google-Smtp-Source: 
 AKy350bH9quWl48CyBEK2jXmqe17A0UwrjOLuRyrTJSkFzz6IW+pfSpvPUEigQ04BONESA8FYnRsWQ==
X-Received: by 2002:a17:90b:1b4a:b0:241:b90:4a1c with SMTP id
 nv10-20020a17090b1b4a00b002410b904a1cmr7863663pjb.44.1680725027654;
        Wed, 05 Apr 2023 13:03:47 -0700 (PDT)
Received: from pavilion.. ([2402:e280:218d:82:84b8:1620:d3a4:f59c])
        by smtp.gmail.com with ESMTPSA id
 w7-20020a17090aea0700b00240dee12285sm1761903pjy.34.2023.04.05.13.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:03:47 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.baluta@nxp.com
Subject: [PATCH] ASoC: dt-bindings: wm8904: Convert to dtschema
Date: Thu,  6 Apr 2023 01:33:41 +0530
Message-Id: <20230405200341.4911-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CS72ZMJQWRXPYPBPUETZZROC7SGU74JK
X-Message-ID-Hash: CS72ZMJQWRXPYPBPUETZZROC7SGU74JK
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:27 +0000
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saalim Quadri <danascape@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CS72ZMJQWRXPYPBPUETZZROC7SGU74JK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the WM8904 audio CODEC bindings to DT schema

Signed-off-by: Saalim Quadri <danascape@gmail.com>
---
 .../devicetree/bindings/sound/wlf,wm8904.yaml | 66 +++++++++++++++++++
 .../devicetree/bindings/sound/wm8904.txt      | 33 ----------
 2 files changed, 66 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/wm8904.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
new file mode 100644
index 000000000000..78d76c1c1326
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/wlf,wm8904.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WM8904 audio CODEC
+
+description: |
+  Pins on the device (for linking into audio routes):
+      * IN1L
+      * IN1R
+      * IN2L
+      * IN2R
+      * IN3L
+      * IN3R
+      * HPOUTL
+      * HPOUTR
+      * LINEOUTL
+      * LINEOUTR
+      * MICBIAS
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
+      - wlf,wm8904
+      - wlf,wm8912
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@1a {
+            compatible = "wlf,wm8904";
+            reg = <0x1a>;
+            clocks = <&pck0>;
+            clock-names = "mclk";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/wm8904.txt b/Documentation/devicetree/bindings/sound/wm8904.txt
deleted file mode 100644
index 66bf261423b9..000000000000
--- a/Documentation/devicetree/bindings/sound/wm8904.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-WM8904 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-  - compatible: "wlf,wm8904" or "wlf,wm8912"
-  - reg: the I2C address of the device.
-  - clock-names: "mclk"
-  - clocks: reference to
-    <Documentation/devicetree/bindings/clock/clock-bindings.txt>
-
-Pins on the device (for linking into audio routes):
-
-  * IN1L
-  * IN1R
-  * IN2L
-  * IN2R
-  * IN3L
-  * IN3R
-  * HPOUTL
-  * HPOUTR
-  * LINEOUTL
-  * LINEOUTR
-  * MICBIAS
-
-Examples:
-
-codec: wm8904@1a {
-	compatible = "wlf,wm8904";
-	reg = <0x1a>;
-	clocks = <&pck0>;
-	clock-names = "mclk";
-};
-- 
2.34.1

