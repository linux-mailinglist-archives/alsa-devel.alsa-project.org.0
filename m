Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06F26463C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 14:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C66A1699;
	Thu, 10 Sep 2020 14:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C66A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599741828;
	bh=YfjWPnwTQprmXz47emBaBjCwWm0h/QobWKG3CasM2Rc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCJ2U75ReOFxCiKsgV7mj1Yoj9KQxgaPwJzpL381Q1CgckMak7YdUrChtii3aqtEx
	 cFgfgJMHzwxP+kTM/sL0Xnt1WovTm76Xfetd1v4UvJAUgsAibL2mjQUncEbpByvfbm
	 AaQENjVXTWsSSv6Peakf89X8j1oiAitxO4tNioHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C93F8028C;
	Thu, 10 Sep 2020 14:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61972F8010E; Thu, 10 Sep 2020 14:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F1E1F8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 14:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F1E1F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x6fLwzTA"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08ACfES1115777;
 Thu, 10 Sep 2020 07:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599741674;
 bh=RBWE7U0tlwFef9YzggYph/v9AwzgqEVQs2QRRG5UVLo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=x6fLwzTAiXx1RjqO+5Dn01SR7Aqv+16rlZ+TmeQmTbOoQepFgJ7ZZg51od4ldP7XZ
 hvwYiijRe4w2Q7P9eQLO/FNkswA+s770Ypzsi1z8mjFZN4tYD76ymFROqO/kpNodES
 MhNkp4BJNJrC1RCJ/Lk+UnQQg7K+kkKqa62OD3xY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ACfEFw006531;
 Thu, 10 Sep 2020 07:41:14 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 07:41:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 07:41:14 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08ACfAGN024223;
 Thu, 10 Sep 2020 07:41:12 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: ti,
 j721e-cpb-audio: Document support for j7200-cpb
Date: Thu, 10 Sep 2020 15:41:09 +0300
Message-ID: <20200910124110.19361-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910124110.19361-1-peter.ujfalusi@ti.com>
References: <20200910124110.19361-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

j721e or j7200 SOM can be attached to the same Common Processor Board (CPB)

With the j7200 SOM only the 48KHz family parent clock is available and
McASP0 is used for the audio.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../bindings/sound/ti,j721e-cpb-audio.yaml    | 92 ++++++++++++++-----
 1 file changed, 70 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
index d52cfbeb2d07..805da4d6a88e 100644
--- a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
@@ -18,18 +18,25 @@ description: |
   PLL15 (for 44.1KHz). The same PLLs are used for McASP10's AUXCLK clock via
   different HSDIVIDER.
 
-  Clocking setup for 48KHz family:
-  PLL4 ---> PLL4_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
-        |-> PLL4_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
+  Clocking setup for j721e:
+    48KHz family:
+    PLL4 ---> PLL4_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
+          |-> PLL4_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
 
-  Clocking setup for 44.1KHz family:
-  PLL15 ---> PLL15_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
-         |-> PLL15_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
+    44.1KHz family:
+    PLL15 ---> PLL15_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
+           |-> PLL15_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
+
+  Clocking setup for j7200:
+    48KHz family:
+    PLL4 ---> PLL4_HSDIV0 ---> MCASP0_AUXCLK ---> McASP0.auxclk
+          |-> PLL4_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
 
 properties:
   compatible:
-    items:
-      - const: ti,j721e-cpb-audio
+    enum:
+      - ti,j721e-cpb-audio
+      - ti,j7200-cpb-audio
 
   model:
     $ref: /schemas/types.yaml#/definitions/string
@@ -44,22 +51,12 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
 
   clocks:
-    items:
-      - description: AUXCLK clock for McASP used by CPB audio
-      - description: Parent for CPB_McASP auxclk (for 48KHz)
-      - description: Parent for CPB_McASP auxclk (for 44.1KHz)
-      - description: SCKI clock for the pcm3168a codec on CPB
-      - description: Parent for CPB_SCKI clock (for 48KHz)
-      - description: Parent for CPB_SCKI clock (for 44.1KHz)
+    minItems: 4
+    maxItems: 6
 
   clock-names:
-    items:
-      - const: cpb-mcasp-auxclk
-      - const: cpb-mcasp-auxclk-48000
-      - const: cpb-mcasp-auxclk-44100
-      - const: cpb-codec-scki
-      - const: cpb-codec-scki-48000
-      - const: cpb-codec-scki-44100
+    minItems: 4
+    maxItems: 6
 
 required:
   - compatible
@@ -71,6 +68,57 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,j721e-cpb-audio
+
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          items:
+            - description: AUXCLK clock for McASP used by CPB audio
+            - description: Parent for CPB_McASP auxclk (for 48KHz)
+            - description: Parent for CPB_McASP auxclk (for 44.1KHz)
+            - description: SCKI clock for the pcm3168a codec on CPB
+            - description: Parent for CPB_SCKI clock (for 48KHz)
+            - description: Parent for CPB_SCKI clock (for 44.1KHz)
+
+        clock-names:
+          items:
+            - const: cpb-mcasp-auxclk
+            - const: cpb-mcasp-auxclk-48000
+            - const: cpb-mcasp-auxclk-44100
+            - const: cpb-codec-scki
+            - const: cpb-codec-scki-48000
+            - const: cpb-codec-scki-44100
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,j7200-cpb-audio
+
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+          items:
+            - description: AUXCLK clock for McASP used by CPB audio
+            - description: Parent for CPB_McASP auxclk (for 48KHz)
+            - description: SCKI clock for the pcm3168a codec on CPB
+            - description: Parent for CPB_SCKI clock (for 48KHz)
+
+        clock-names:
+          items:
+            - const: cpb-mcasp-auxclk
+            - const: cpb-mcasp-auxclk-48000
+            - const: cpb-codec-scki
+            - const: cpb-codec-scki-48000
+
 examples:
   - |+
     sound {
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

