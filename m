Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510ACB4D00F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9837E6021E;
	Tue,  9 Sep 2025 14:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9837E6021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419719;
	bh=1TL3XNAOnKIufLktw17XryVC4/ANfrq/osZ8lKNQsFU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eRhz/xxPm5cGKYt1muHUK+s+w1nk2sQDf2ovyIUVaxVba6vJMgdIPhlSYaQUTK4Tb
	 93rOOptKBM1F3osJYYU2etIF5damcbuNvs2UrBl18Wsr0H2P/3intbxZnBL5XfcKd6
	 be/O1UjVXKazXWEI/5fFIZ5lxOLqZQSTYmh60QY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97868F8060A; Tue,  9 Sep 2025 14:07:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4311FF80609;
	Tue,  9 Sep 2025 14:07:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3F2F804FF; Fri, 22 Aug 2025 07:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB51FF80246
	for <alsa-devel@alsa-project.org>; Fri, 22 Aug 2025 07:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB51FF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=D9UEIZe7
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57M5EvPS646872;
	Fri, 22 Aug 2025 00:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755839697;
	bh=s3OZ+5uJNZlQQkYCda1jyqfEOisnzWAp6eQe4RhwOfo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=D9UEIZe7MAButNXfhKS3sKuCYJNhqFJoqtYCMbjChT2VCWPJBrus77MF7PGJPBNai
	 QegSIVnkaaUubskux0SKyOXKCeGTVsOt6pHMVWY25hBPyzBaIaR3M6dvU0zcJPpttx
	 mBjKnbc+UQGVm6stc9SiVlwFM+9VDA0xoJLyraNM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57M5Ev3X2663247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 00:14:57 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 00:14:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 00:14:56 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57M5EYps3296152;
	Fri, 22 Aug 2025 00:14:45 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <andriy.shevchenko@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <shenghao-ding@ti.com>, <baojun.xu@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lgirdwood@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <k-yi@ti.com>,
        <henry.lo@ti.com>, <robinchen@ti.com>, <jesse-ji@ti.com>,
        <will-wang@ti.com>
Subject: [PATCH v2 2/2] ASoC: tas2781: Add tas2118, tas2x20, tas5825 support
Date: Fri, 22 Aug 2025 13:14:09 +0800
Message-ID: <20250822051410.1732-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20250822051410.1732-1-baojun.xu@ti.com>
References: <20250822051410.1732-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RCTMWHRZSCVXZ5JG7LRTMGE2O4SNUJ5O
X-Message-ID-Hash: RCTMWHRZSCVXZ5JG7LRTMGE2O4SNUJ5O
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:07:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCTMWHRZSCVXZ5JG7LRTMGE2O4SNUJ5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update ti,tas2781.yaml for added tas2118, tas2x20, tas5825.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v2:
 - Update the mail list for maintainers of yaml file
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 73 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index 5ea1cdc593b5..fb57b63a00a2 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
+# Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
@@ -11,30 +11,62 @@ maintainers:
   - Shenghao Ding <shenghao-ding@ti.com>
 
 description: |
+  The TAS2118/TAS2X20 is mono, digital input Class-D audio amplifier
+  optimized for efficiently driving high peak power into small loudspeakers.
+  Integrated speaker voltage and current sense provides for
+  real time monitoring of loudspeaker behavior.
   The TAS2563/TAS2781 is a mono, digital input Class-D audio
   amplifier optimized for efficiently driving high peak power into
   small loudspeakers. An integrated on-chip DSP supports Texas
   Instruments Smart Amp speaker protection algorithm. The
   integrated speaker voltage and current sense provides for real time
   monitoring of loudspeaker behavior.
+  The TAS5825 is a stereo, digital input Class-D audio
+  amplifier optimized for efficiently driving high peak power into
+  small loudspeakers. An integrated on-chip DSP supports Texas
+  Instruments Smart Amp speaker protection algorithm. The
+  integrated speaker voltage and current sense provides for real time
+  monitoring of loudspeaker behavior.
 
   Specifications about the audio amplifier can be found at:
+    https://www.ti.com/lit/gpn/tas2120
+    https://www.ti.com/lit/gpn/tas2320
     https://www.ti.com/lit/gpn/tas2563
     https://www.ti.com/lit/gpn/tas2781
+    https://www.ti.com/lit/gpn/tas5825m
 
 properties:
   compatible:
     description: |
+      ti,tas2020: 3.2-W Mono Digital Input Class-D Speaker Amp with 5.5V PVDD
+      Support.
+
+      ti,tas2118: 5-W Mono Digital Input Class-D Speaker Amp with Integrated
+      8.4-V Class-H Boost.
+
+      ti,tas2120: 8.2-W Mono Digital Input Class-D Speaker Amp with
+      Integrated 14.75V Class-H Boost.
+
+      ti,tas2320: 15-W Mono Digital Input Class-D Speaker Amp with 15V Support.
+
       ti,tas2563: 6.1-W Boosted Class-D Audio Amplifier With Integrated
       DSP and IV Sense, 16/20/24/32bit stereo I2S or multichannel TDM.
 
       ti,tas2781: 24-V Class-D Amplifier with Real Time Integrated Speaker
       Protection and Audio Processing, 16/20/24/32bit stereo I2S or
       multichannel TDM.
+
+      ti,tas5825: 38-W Stereo, Inductor-Less, Digital Input, Closed-Loop 4.5V
+      to 26.4V Class-D Audio Amplifier with 192-kHz Extended Audio Processing.
     oneOf:
       - items:
           - enum:
+              - ti,tas2020
+              - ti,tas2118
+              - ti,tas2120
+              - ti,tas2320
               - ti,tas2563
+              - ti,tas5825
           - const: ti,tas2781
       - enum:
           - ti,tas2781
@@ -61,6 +93,27 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tas2020
+              - ti,tas2118
+              - ti,tas2120
+              - ti,tas2320
+    then:
+      properties:
+        reg:
+          description:
+            I2C address, in multiple-AMP case, all the i2c address
+            aggregate as one Audio Device to support multiple audio slots.
+          maxItems: 4
+          minItems: 1
+          items:
+            minimum: 0x48
+            maximum: 0x4b
+
   - if:
       properties:
         compatible:
@@ -97,6 +150,24 @@ allOf:
             minimum: 0x38
             maximum: 0x3f
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tas5825
+    then:
+      properties:
+        reg:
+          description:
+            I2C address, in multiple-AMP case, all the i2c address
+            aggregate as one Audio Device to support multiple audio slots.
+          maxItems: 4
+          minItems: 1
+          items:
+            minimum: 0x4c
+            maximum: 0x4f
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

