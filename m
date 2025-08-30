Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9589B4F406
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68F66023A;
	Tue,  9 Sep 2025 14:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68F66023A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419883;
	bh=qfyv3oMp3domLy8FxDk2uV8pVIu7xX53qtHqe1eXx6w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SUNBC704/UXKwehbOX1ewpeuD5ZuE1+c7sF/lXI3mNhUqBUQeLEwFVCfnBrJrukT4
	 m+zCUjERma53binQ9chAm9qRPVt2qk784l0tWdq1KIEm/hngsYWaxDwpd+0bAvnICG
	 iMhgrk1w3OapYpeM1wcSFZokhP4ZNQwMA4rgZJao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60A8FF80602; Tue,  9 Sep 2025 14:10:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D2DDF805FF;
	Tue,  9 Sep 2025 14:10:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FBF6F80272; Sat, 30 Aug 2025 08:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F384F80072
	for <alsa-devel@alsa-project.org>; Sat, 30 Aug 2025 08:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F384F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=t7ep6Dr8
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57U6Fg3Y2393700;
	Sat, 30 Aug 2025 01:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756534542;
	bh=/3h3pBMnXj801ChBgkwa7CRTuzA6xKhT1CxYrz6psP0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t7ep6Dr8S6toVvLaDdT+/g/m1lFrpte9ZARxJZt7p83oqWyRXYEzAl6DXkUBm43ba
	 1zV7fwXTnZNMM+G7yXHqqZSFuVBzif620XzFKimVFSn7XpMeaf0BwWfyfXH3n8cDzC
	 cYMqSKtaoGxLLSQV56maPqCVgn3QgiD8nsNj3x90=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57U6Fgeo366883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 30 Aug 2025 01:15:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 30
 Aug 2025 01:15:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 30 Aug 2025 01:15:42 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57U6FLtt3461942;
	Sat, 30 Aug 2025 01:15:33 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <andriy.shevchenko@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <shenghao-ding@ti.com>, <baojun.xu@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <lgirdwood@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <k-yi@ti.com>,
        <henry.lo@ti.com>, <robinchen@ti.com>, <jesse-ji@ti.com>,
        <will-wang@ti.com>, <jim.shil@goertek.com>, <toastcheng@google.com>,
        <chinkaiting@google.com>
Subject: [PATCH v4 2/2] ASoC: tas2781: Add tas2118, tas2x20, tas5825 support
Date: Sat, 30 Aug 2025 14:14:59 +0800
Message-ID: <20250830061459.24371-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20250830061459.24371-1-baojun.xu@ti.com>
References: <20250830061459.24371-1-baojun.xu@ti.com>
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
Message-ID-Hash: FAQULZCSJCG54GB3FZMOPKX35AFXKGAI
X-Message-ID-Hash: FAQULZCSJCG54GB3FZMOPKX35AFXKGAI
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:10:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAQULZCSJCG54GB3FZMOPKX35AFXKGAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update ti,tas2781.yaml for adding tas2118, tas2x20, tas257x and tas582x.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v4:
 - Change description for adding tas257x and tas5827
 - Added descriptions for tas2570, tas2572 and tas5827
 - Remove unnecessary description for I2C register
v3:
 - Remove unnecessary minItems.
 - Remove unnecessary description for tas5825.
v2:
 - Update the mail list for maintainers of yaml file
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 96 ++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index 5ea1cdc593b5..0f1da803253e 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
+# Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
@@ -11,30 +11,77 @@ maintainers:
   - Shenghao Ding <shenghao-ding@ti.com>
 
 description: |
+  The TAS2118/TAS2X20/TAS257x is mono, digital input Class-D audio
+  amplifier optimized for efficiently driving high peak power into
+  small loudspeakers.
+  Integrated speaker voltage and current sense provides for
+  real time monitoring of loudspeaker behavior.
   The TAS2563/TAS2781 is a mono, digital input Class-D audio
   amplifier optimized for efficiently driving high peak power into
   small loudspeakers. An integrated on-chip DSP supports Texas
   Instruments Smart Amp speaker protection algorithm. The
   integrated speaker voltage and current sense provides for real time
   monitoring of loudspeaker behavior.
+  The TAS5825/TAS5827 is a stereo, digital input Class-D audio
+  amplifier optimized for efficiently driving high peak power into
+  small loudspeakers. An integrated on-chip DSP supports Texas
+  Instruments Smart Amp speaker protection algorithm. The
+  integrated speaker voltage and current sense provides for real time
+  monitoring of loudspeaker behavior.
 
   Specifications about the audio amplifier can be found at:
+    https://www.ti.com/lit/gpn/tas2120
+    https://www.ti.com/lit/gpn/tas2320
     https://www.ti.com/lit/gpn/tas2563
+    https://www.ti.com/lit/gpn/tas2572
     https://www.ti.com/lit/gpn/tas2781
+    https://www.ti.com/lit/gpn/tas5825m
+    https://www.ti.com/lit/gpn/tas5827
 
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
+
+      ti,tas2570: 5.8-W Digital Input smart amp with I/V sense and integrated
+      11-V Class-H Boost
+
+      ti,tas2572: 6.6-W Digital Input smart amp with I/V sense and integrated
+      13-V Class-H Boost
 
       ti,tas2781: 24-V Class-D Amplifier with Real Time Integrated Speaker
       Protection and Audio Processing, 16/20/24/32bit stereo I2S or
       multichannel TDM.
+
+      ti,tas5825: 38-W Stereo, Inductor-Less, Digital Input, Closed-Loop 4.5V
+      to 26.4V Class-D Audio Amplifier with 192-kHz Extended Audio Processing.
+
+      ti,tas5827: 47-W Stereo, Digital Input, High Efficiency Closed-Loop Class-D
+      Amplifier with Class-H Algorithm
     oneOf:
       - items:
           - enum:
+              - ti,tas2020
+              - ti,tas2118
+              - ti,tas2120
+              - ti,tas2320
               - ti,tas2563
+              - ti,tas2570
+              - ti,tas2572
+              - ti,tas5825
+              - ti,tas5827
           - const: ti,tas2781
       - enum:
           - ti,tas2781
@@ -61,6 +108,23 @@ required:
 
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
+          maxItems: 4
+          items:
+            minimum: 0x48
+            maximum: 0x4b
+
   - if:
       properties:
         compatible:
@@ -79,6 +143,21 @@ allOf:
             minimum: 0x4c
             maximum: 0x4f
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tas2570
+              - ti,tas2572
+    then:
+      properties:
+        reg:
+          maxItems: 4
+          items:
+            minimum: 0x48
+            maximum: 0x4b
+
   - if:
       properties:
         compatible:
@@ -97,6 +176,21 @@ allOf:
             minimum: 0x38
             maximum: 0x3f
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,tas5825
+              - ti,tas5827
+    then:
+      properties:
+        reg:
+          maxItems: 4
+          items:
+            minimum: 0x4c
+            maximum: 0x4f
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

