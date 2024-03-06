Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2F877041
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:15:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C123DF9;
	Sat,  9 Mar 2024 11:15:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C123DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979323;
	bh=fCf8VgKAZPcTn7Hbdj2zRMYVft3c4RyIgKvpUyrpq9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sI2N8nAZrE9paVtBSTsiKXWw14ccWhDlo8VBgq1X27EEXridZeqpc7dupjrk7+JEJ
	 Vt5YszBG35ctGChmQJ7CVDtR8r2r5Q509wurrEnWRPJueSdyxP11SE2CVctTQd18T7
	 jBYLaZYUR7DcoYM8b7+zcE67gHkARkcYldErKzfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6950BF806AD; Sat,  9 Mar 2024 11:13:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B074F806B9;
	Sat,  9 Mar 2024 11:13:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38B46F8024E; Wed,  6 Mar 2024 02:34:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-39.sinamail.sina.com.cn (mail78-39.sinamail.sina.com.cn
 [219.142.78.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3924BF801F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 02:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3924BF801F5
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.235) with ESMTP
	id 65E7C81800003DE4; Wed, 6 Mar 2024 09:34:21 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4B4DBEA8F7494573A9940413471E1AE4
X-SMAIL-UIID: 4B4DBEA8F7494573A9940413471E1AE4-20240306-093421
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 2/2] ASoC: codecs: ES8326: change support for ES8326
Date: Wed,  6 Mar 2024 09:34:14 +0800
Message-Id: <20240306013414.18708-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240306013414.18708-1-zhangyi@everest-semi.com>
References: <20240306013414.18708-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OLH3AIRWPKESH7EGZHT2WZGOXVFV5XJP
X-Message-ID-Hash: OLH3AIRWPKESH7EGZHT2WZGOXVFV5XJP
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:10:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLH3AIRWPKESH7EGZHT2WZGOXVFV5XJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Removed mic1-src and mic2-src. and changed default value
of interrupt-clk

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../bindings/sound/everest,es8326.yaml        | 22 ++-----------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
index 07781408e788..5c9ee6ba7980 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8326.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -37,22 +37,6 @@ properties:
     maximum: 0x0f
     default: 0x0f
 
-  everest,mic1-src:
-    $ref: /schemas/types.yaml#/definitions/uint8
-    description:
-      the value of reg 2A when headset plugged.
-    minimum: 0x00
-    maximum: 0x77
-    default: 0x22
-
-  everest,mic2-src:
-    $ref: /schemas/types.yaml#/definitions/uint8
-    description:
-      the value of reg 2A when headset unplugged.
-    minimum: 0x00
-    maximum: 0x77
-    default: 0x44
-
   everest,jack-detect-inverted:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -87,7 +71,7 @@ properties:
        0 means the chip detect jack type again after button released.
     minimum: 0
     maximum: 0x7f
-    default: 0x45
+    default: 0x00
 
 required:
   - compatible
@@ -107,10 +91,8 @@ examples:
         clocks = <&clks 10>;
         clock-names = "mclk";
         #sound-dai-cells = <0>;
-        everest,mic1-src = [22];
-        everest,mic2-src = [44];
         everest,jack-pol = [0e];
         everest,interrupt-src = [08];
-        everest,interrupt-clk = [45];
+        everest,interrupt-clk = [00];
       };
     };
-- 
2.17.1

