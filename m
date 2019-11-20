Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5F103AEF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 14:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6CDB16F2;
	Wed, 20 Nov 2019 14:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6CDB16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574256038;
	bh=HTTS6fISBVWhBWlkw+Bd3WK4cjt8aYZ+0tY4yPuPg3k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=is3zIeRQoHdVVSByQtw8LuIZUkIB/hyfIhSKRJ1Y9GKtVgf+545JZWfwsYHxH9z44
	 qsNdFM7HRCrM9Hs9wr0q7rH3fEjXKjBjD+qXqQFgAUPJh7SeVKB/akKWiSd788ENpb
	 5+JEp/m+5HAPvCuaPMtGaLakvr7fTxp/LlqJIDeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649E8F8014A;
	Wed, 20 Nov 2019 14:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8376FF8014C; Wed, 20 Nov 2019 14:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D402AF800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 14:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D402AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oOfGpnZu"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKDI1bd078479;
 Wed, 20 Nov 2019 07:18:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1574255881;
 bh=QdL1YZVRIl1y5ZM+krtIZH2b+YerFkdPDnlCsambCAw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oOfGpnZuNaxMlzBAFnrzC0CN+jHdu6oeUSUUkvJkWhleHKx6awSnorVpRul3LzHo6
 910xGXWfqFK8LrcWjUMxgxCPs4tnMfVMWkBAweAgNoHtPPTqLWuOzAeyLErRMyX628
 kElqi+xnZradkF/PyjtXYyZjCYroAe6Uqgo88V3g=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKDI1GO120842
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Nov 2019 07:18:01 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 07:17:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 07:17:59 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDHru6067880;
 Wed, 20 Nov 2019 07:17:57 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 20 Nov 2019 15:17:52 +0200
Message-ID: <20191120131753.6831-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120131753.6831-1-peter.ujfalusi@ti.com>
References: <20191120131753.6831-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: [alsa-devel] [PATCH 1/2] ASoC: dt-bindings: pcm3168a: Update the
	optional RST gpio for clarity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use the standard name for the gpion in DT: reset-gpios

Document that the RST line is low active and update the example
accordingly.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
index f30aebc7603a..a02ecaab5183 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
@@ -27,9 +27,10 @@ For required properties on SPI/I2C, consult SPI/I2C device tree documentation
 
 Optional properties:
 
-  - rst-gpios : Optional RST gpio line for the codec
-		RST = low: device power-down
-		RST = high: device is enabled
+  - reset-gpios : Optional reset gpio line connected to RST pin of the codec.
+		  The RST line is low active:
+		  RST = low: device power-down
+		  RST = high: device is enabled
 
 Examples:
 
@@ -40,7 +41,7 @@ i2c0: i2c0@0 {
 	pcm3168a: audio-codec@44 {
 		compatible = "ti,pcm3168a";
 		reg = <0x44>;
-		rst-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
 		clocks = <&clk_core CLK_AUDIO>;
 		clock-names = "scki";
 		VDD1-supply = <&supply3v3>;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
