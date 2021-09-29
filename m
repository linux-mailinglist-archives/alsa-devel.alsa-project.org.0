Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36A41C52E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 15:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC1516A6;
	Wed, 29 Sep 2021 15:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC1516A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632920758;
	bh=nTsMS5FuEecHRtiP97tQv0CtO7X6KShT1hlr5raOLl0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PN7NnrJqb+xxW5lGfQYACl5WQvOjOnFxvr+e54W2PE7LFMBP52GmRrl8ocM3OvsVB
	 F7p6wzyFfMHkplYefpKbiHy9RnkBaWN0tHuZaW80sCzyC+PQQhZZPyPxg7iupXqmT8
	 PvOToJ1Jv1+p+YE7z3FAuWCLN584Lb8trKZ9SxDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95A0BF80113;
	Wed, 29 Sep 2021 15:04:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD6BF80227; Wed, 29 Sep 2021 15:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0C45F80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 15:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C45F80161
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 18TD4KjP4014979,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 18TD4KjP4014979
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Sep 2021 21:04:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 29 Sep 2021 21:04:20 +0800
Received: from localhost.localdomain (172.22.234.227) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 29 Sep 2021 21:04:18 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: rt5682s: fix the device-tree schema errors
Date: Wed, 29 Sep 2021 21:04:06 +0800
Message-ID: <20210929130406.24325-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.234.227]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/29/2021 12:47:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvMjkgpFekyCAxMTowNjowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, jack.yu@realtek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Derek Fang <derek.fang@realtek.com>, shumingf@realtek.com, flove@realtek.com
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

From: Derek Fang <derek.fang@realtek.com>

Fix the device-tree schema errors that be reported by using 'make
dt_binding_check'.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 .../devicetree/bindings/sound/realtek,rt5682s.yaml   | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index 7a5f1d0fd3e2..2b8b7b51fe55 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -29,6 +29,8 @@ properties:
       - 0 # dmic1 data is not used
       - 1 # using GPIO2 pin as dmic1 data pin
       - 2 # using GPIO5 pin as dmic1 data pin
+    description: |
+      Specify which GPIO pin be used as DMIC1 data pin.
 
   realtek,dmic1-clk-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -36,12 +38,16 @@ properties:
       - 0 # dmic1 clk is not used
       - 1 # using GPIO1 pin as dmic1 clock pin
       - 2 # using GPIO3 pin as dmic1 clock pin
+    description: |
+      Specify which GPIO pin be used as DMIC1 clk pin.
 
   realtek,jd-src:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum:
       - 0 # No JD is used
       - 1 # using JD1 as JD source
+    description: |
+      Specify which JD source be used.
 
   realtek,ldo1-en-gpios:
     description: |
@@ -72,9 +78,9 @@ properties:
     const: 1
 
   clock-output-names:
-    items:
-      - description: Name given for DAI word clock output.
-      - description: Name given for DAI bit clock output.
+    minItems: 2
+    maxItems: 2
+    description: Name given for DAI word clock and bit clock outputs.
 
 additionalProperties: false
 
-- 
2.17.1

