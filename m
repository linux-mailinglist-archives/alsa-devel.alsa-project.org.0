Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01502525594
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 21:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98DC01AE3;
	Thu, 12 May 2022 21:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98DC01AE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652382972;
	bh=vdWNAVi0ghDacevEaPZsVyey1+m4P2AeNO5Sv6H/WF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHRJRK34SZXfbguGQNhJrARLGl/fofbNYwkfVMha0KZYj+KNR9OS1b2hk+HPe+SMk
	 4OJGCdy6BvD07GowTsbRB6hLzHe5WZYqejVff5IkkFRxeN0mIaytl5Hi/tqd8MqkIR
	 IJeC11z348wOr5B/HgJuRvrvlTBv2T0BQ0CppthE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D44BDF80511;
	Thu, 12 May 2022 21:14:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48D79F8050F; Thu, 12 May 2022 21:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A9EBF8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 21:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9EBF8010B
Received: from player691.ha.ovh.net (unknown [10.108.20.113])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 5111E2485F
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 19:14:36 +0000 (UTC)
Received: from mesotic.com (82-65-23-224.subs.proxad.net [82.65.23.224])
 (Authenticated sender: dylan.laduranty@mesotic.com)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 1C6F32A832F0C;
 Thu, 12 May 2022 19:14:33 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0050a86a382-aa0d-4168-b945-97230eabdd68,
 22B69E6227CD80ADC50F3962316E1959FFA6139C)
 smtp.auth=dylan.laduranty@mesotic.com
X-OVh-ClientIp: 82.65.23.224
From: Dylan Laduranty <dylan.laduranty@mesotic.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins drive
 strength
Date: Thu, 12 May 2022 21:13:52 +0200
Message-Id: <20220512191352.15602-2-dylan.laduranty@mesotic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
References: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
X-Ovh-Tracer-Id: 6673208749986729164
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfsedttdertdertddtnecuhfhrohhmpeffhihlrghnucfnrgguuhhrrghnthihuceougihlhgrnhdrlhgrughurhgrnhhthiesmhgvshhothhitgdrtghomheqnecuggftrfgrthhtvghrnhepgeejgeejtdfhlefgkeegkeeihfevleduleettedufeehkeektdehgffhkeduvdfgnecukfhppedtrddtrddtrddtpdekvddrieehrddvfedrvddvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieeluddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpeguhihlrghnrdhlrgguuhhrrghnthihsehmvghsohhtihgtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
Cc: Dylan Laduranty <dylan.laduranty@mesotic.com>, nuno.sa@analog.com
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

Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
---

Changes since v1:
Add description values table per new entries

 .../bindings/sound/adi,adau7118.yaml          | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index fb78967ee17b..226693ebd446 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -51,6 +51,42 @@ properties:
       maximum: 1
     default: [0, 0, 1, 1]
 
+  adi,pdm-clk0-ds:
+    description: |
+      This property set the drive strength of PDM CLK0 output pad.
+      Possible values are: 0, 1, 2, 3 as per the following table:
+      0 = 2.5 mA / 3.3V
+      1 =   5 mA / 3.3V
+      2 =  10 mA / 3.3V
+      3 =  25 mA / 3.3V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [3, 2, 1, 0]
+    default: 2
+
+  adi,pdm-clk1-ds:
+    description: |
+      This property set the drive strength of PDM CLK1 output pad.
+      Possible values are: 0, 1, 2, 3 as per the following table:
+      0 = 2.5 mA / 3.3V
+      1 =   5 mA / 3.3V
+      2 =  10 mA / 3.3V
+      3 =  25 mA / 3.3V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [3, 2, 1, 0]
+    default: 2
+
+  adi,sdata-ds:
+    description: |
+      This property set the drive strength of SDATA output pad.
+      Possible values are: 0, 1, 2, 3 as per the following table:
+      0 = 2.5 mA / 3.3V
+      1 =   5 mA / 3.3V
+      2 =  10 mA / 3.3V
+      3 =  25 mA / 3.3V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [3, 2, 1, 0]
+    default: 2
+
 required:
   - "#sound-dai-cells"
   - compatible
@@ -73,6 +109,9 @@ examples:
                 dvdd-supply = <&supply>;
                 adi,pdm-clk-map = <1 1 0 0>;
                 adi,decimation-ratio = <16>;
+                adi,pdm-clk0-ds = <3>;
+                adi,pdm-clk1-ds = <3>;
+                adi,sdata-ds = <3>;
         };
     };
 
-- 
2.17.1

