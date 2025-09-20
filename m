Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC040C47501
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:46:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E14E601AF;
	Mon, 10 Nov 2025 15:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E14E601AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785998;
	bh=9RcGvOkOXT/d8Hxm2c0v67xGchk2M+hVVdjqG6EcoD4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U+mgWXJcBda3d/7XOoTrANrtvThH0D4X1ThOE/X0kVuNKzo1YcdBj52V4jT1RKqcM
	 cqU2IFAHscodKLjuBE/XvaTMezvBXLH0KRH3INfXIUJnYlvHPZaqo0fR8piBFsjvYk
	 cJIU3575ytsyGSfMpZHbLpoROVdcJHl7BDkZ3JUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C4EBF896E8; Mon, 10 Nov 2025 15:41:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52522F896F6;
	Mon, 10 Nov 2025 15:41:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E556BF8032D; Sat, 20 Sep 2025 08:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 856A6F8016E
	for <alsa-devel@alsa-project.org>; Sat, 20 Sep 2025 08:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856A6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=tuUEa5IA
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58K6LHfa859875;
	Sat, 20 Sep 2025 01:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758349278;
	bh=3kbgb0IN9bjPFXfBctaJeLpVfYUyl6fZMxymQW5eud0=;
	h=From:To:CC:Subject:Date;
	b=tuUEa5IAjC0RzYPmNHcSFcSxfdp3vODt0NnoIO30i/JP+HL/ir8b+408SAeRRVKaH
	 vn8+0mItiko8qvucvpeQenZ+lsNZlf5e2iYwYdEwVm0QMai00mh79SekwMUwhk2XaQ
	 l/6Y1n47DE2wp1+3Ov5IlDOm9yqKmG0P9IGCGDxM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58K6LHBW3448206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 20 Sep 2025 01:21:17 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 20
 Sep 2025 01:21:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 20 Sep 2025 01:21:17 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58K6L98x3734016;
	Sat, 20 Sep 2025 01:21:10 -0500
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
Subject: [PATCH v1] ASoC: tas2781: Correct the wrong description and register
 address on tas2781
Date: Sat, 20 Sep 2025 14:20:44 +0800
Message-ID: <20250920062044.1904-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
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
Message-ID-Hash: HFNNND3KXO5OJFML7DYTKXN64JYQKGX7
X-Message-ID-Hash: HFNNND3KXO5OJFML7DYTKXN64JYQKGX7
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFNNND3KXO5OJFML7DYTKXN64JYQKGX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Correct the wrong description for TAS257X. Combined TAS5825 with TAS2563,
as they use the same register address and number.
Correct the register address and number for TAS5827.

Fixes: 7095d688de38 ("ASoC: tas2781: Add tas2118, tas2x20, tas5825 support")
Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index 011211112be4..bd00afa47d62 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -11,11 +11,13 @@ maintainers:
   - Shenghao Ding <shenghao-ding@ti.com>
 
 description: |
-  The TAS2118/TAS2X20/TAS257x is mono, digital input Class-D audio
+  The TAS2118/TAS2X20 is mono, digital input Class-D audio
   amplifier optimized for efficiently driving high peak power into
   small loudspeakers.
-  Integrated speaker voltage and current sense provides for
-  real time monitoring of loudspeaker behavior.
+  The TAS257x is mono, digital input Class-D audio amplifier optimized
+  for efficiently driving high peak power into small loudspeakers.
+  Integrated speaker voltage and current sense provides for real time
+  monitoring of loudspeaker behavior.
   The TAS2563/TAS2781 is a mono, digital input Class-D audio
   amplifier optimized for efficiently driving high peak power into
   small loudspeakers. An integrated on-chip DSP supports Texas
@@ -25,9 +27,7 @@ description: |
   The TAS5825/TAS5827 is a stereo, digital input Class-D audio
   amplifier optimized for efficiently driving high peak power into
   small loudspeakers. An integrated on-chip DSP supports Texas
-  Instruments Smart Amp speaker protection algorithm. The
-  integrated speaker voltage and current sense provides for real time
-  monitoring of loudspeaker behavior.
+  Instruments Smart Amp speaker protection algorithm.
 
   Specifications about the audio amplifier can be found at:
     https://www.ti.com/lit/gpn/tas2120
@@ -131,6 +131,7 @@ allOf:
           contains:
             enum:
               - ti,tas2563
+              - ti,tas5825
     then:
       properties:
         reg:
@@ -181,15 +182,14 @@ allOf:
         compatible:
           contains:
             enum:
-              - ti,tas5825
               - ti,tas5827
     then:
       properties:
         reg:
-          maxItems: 4
+          maxItems: 6
           items:
-            minimum: 0x4c
-            maximum: 0x4f
+            minimum: 0x60
+            maximum: 0x65
 
 additionalProperties: false
 
-- 
2.43.0

