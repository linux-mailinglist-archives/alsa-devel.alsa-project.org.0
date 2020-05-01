Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290831C13F9
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 15:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF37616A2;
	Fri,  1 May 2020 15:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF37616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588340266;
	bh=Kh/msCxwRgXFSdlIX3Qt+SXVL5MK1dVNY6zwm0oleMc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SxIeaaoJkAYnjnN7Q2ixMC1jQhS/rSZu3uej1UedViHabkPMZDXd63Qs6yhehfAhO
	 DaTLQ+zcT9Vo510gx18g5jBUuYycWWd8airRuu68YjwpyUCdcBeAunNb05KoFytaRR
	 Z9oogiQ+GRXkuSrVxWGU59Nzdg92+R/W1Ngr8YyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB1EF80217;
	Fri,  1 May 2020 15:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA850F8022B; Fri,  1 May 2020 15:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A76F800E5
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 15:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A76F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ee6qUgJz"
Received: from localhost.localdomain (unknown [194.230.155.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB44C208DB;
 Fri,  1 May 2020 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588340153;
 bh=Kh/msCxwRgXFSdlIX3Qt+SXVL5MK1dVNY6zwm0oleMc=;
 h=From:To:Cc:Subject:Date:From;
 b=Ee6qUgJzQ6b+ci43bqqzMHTmf0+xPNmN7L9D6usB9g9aRax8uiOnTUpADzEicObyN
 dKcdpe9WJnwe8I7z+D5GUsfTDv1XN+L0SvEpGJgOBZ6hn6c6M+BmIlN4H7jC57vN5N
 rdl51T06Pc1CcE9/HRor9YfRQ9ArTGiT2tG9wBtc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: sound: wm8994: Correct required supplies based
 on actual implementaion
Date: Fri,  1 May 2020 15:35:34 +0200
Message-Id: <20200501133534.6706-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: patches@opensource.cirrus.com, Jonathan Bakker <xc-racer2@live.ca>,
 Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
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

The required supplies in bindings were actually not matching
implementation making the bindings incorrect and misleading.  The Linux
kernel driver requires all supplies to be present.  Also for wlf,wm8994
uses just DBVDD-supply instead of DBVDDn-supply (n: <1,3>).

Reported-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/sound/wm8994.txt       | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
index 68cccc4653ba..367b58ce1bb9 100644
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ b/Documentation/devicetree/bindings/sound/wm8994.txt
@@ -14,9 +14,15 @@ Required properties:
   - #gpio-cells : Must be 2. The first cell is the pin number and the
     second cell is used to specify optional parameters (currently unused).
 
-  - AVDD2-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply, CPVDD-supply,
-    SPKVDD1-supply, SPKVDD2-supply : power supplies for the device, as covered
-    in Documentation/devicetree/bindings/regulator/regulator.txt
+  - power supplies for the device, as covered in
+    Documentation/devicetree/bindings/regulator/regulator.txt, depending
+    on compatible:
+    - for wlf,wm1811 and wlf,wm8958:
+      AVDD1-supply, AVDD2-supply, DBVDD1-supply, DBVDD2-supply, DBVDD3-supply,
+      DCVDD-supply, CPVDD-supply, SPKVDD1-supply, SPKVDD2-supply
+    - for wlf,wm8994:
+      AVDD1-supply, AVDD2-supply, DBVDD-supply, DCVDD-supply, CPVDD-supply,
+      SPKVDD1-supply, SPKVDD2-supply
 
 Optional properties:
 
@@ -73,11 +79,11 @@ wm8994: codec@1a {
 
 	lineout1-se;
 
+	AVDD1-supply = <&regulator>;
 	AVDD2-supply = <&regulator>;
 	CPVDD-supply = <&regulator>;
-	DBVDD1-supply = <&regulator>;
-	DBVDD2-supply = <&regulator>;
-	DBVDD3-supply = <&regulator>;
+	DBVDD-supply = <&regulator>;
+	DCVDD-supply = <&regulator>;
 	SPKVDD1-supply = <&regulator>;
 	SPKVDD2-supply = <&regulator>;
 };
-- 
2.17.1

