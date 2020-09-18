Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7362704B5
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 21:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D355D16AC;
	Fri, 18 Sep 2020 21:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D355D16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600456173;
	bh=Nakj6fW1uUbcSrmIpd1Iatz+ofdGOWgvbVCOIMME2S8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWHYy8FhcAfDIVhXRsb+mEg5ENdxVezE7rAj+WM9i6CVP51ClV6jn1G/1k1Pi72xS
	 vrHreRnMYNSeOHAO3045HNAvTFIJ53wFsp2tIf0q5p0QF7ofIjWqgcxzE8GoMSpCZJ
	 V1simxfW0Yj+UCQiaB2fv1gE8ml9kCdNElzsuR80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8586DF802DF;
	Fri, 18 Sep 2020 21:06:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 046A6F802A7; Fri, 18 Sep 2020 21:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 391ECF8015C
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 21:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 391ECF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Huqcok7F"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ67l5067319;
 Fri, 18 Sep 2020 14:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600455967;
 bh=SuC07PDfmDmZkHNGotu4rKFFSf7BkH+mxsA1p5rSHEg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Huqcok7FCnC3sfGezQGWF6DFpYbkswS3JO203HqCc+MTtmOhC1VoEADqlBnmHQlPn
 MmToFYW0N/fBzVzNQCcWPDuLZEtmJFh8to9FdXfekwgC6dlD34d20bKbLx3BNK4yHN
 z62Gr1bdEz6Bul47QRMxb521J2zZr8tTYqb21B/g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IJ66Ir078852
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 14:06:06 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 14:06:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 14:06:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ65Yv013112;
 Fri, 18 Sep 2020 14:06:05 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 4/9] ASoC: tas2770: Fix required DT properties in the code
Date: Fri, 18 Sep 2020 14:05:43 -0500
Message-ID: <20200918190548.12598-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918190548.12598-1-dmurphy@ti.com>
References: <20200918190548.12598-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

The devicetree binding indicates that the ti,asi-format, ti,imon-slot-no
and ti,vmon-slot-no are not required but the driver requires them or it
fails to probe. Honor the binding and allow these entries to be optional
and set the corresponding values to the default values for each as defined
in the data sheet.

Fixes: 1a476abc723e6 ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 7c6f61946ab3..bdfdad5f4f64 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -708,29 +708,28 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,asi-format",
 					&tas2770->asi_format);
 	if (rc) {
-		dev_err(tas2770->dev, "Looking up %s property failed %d\n",
-			"ti,asi-format", rc);
-		goto end;
+		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
+			"ti,asi-format");
+		tas2770->asi_format = 0;
 	}
 
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
 			&tas2770->i_sense_slot);
 	if (rc) {
-		dev_err(tas2770->dev, "Looking up %s property failed %d\n",
-			"ti,imon-slot-no", rc);
-		goto end;
+		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
+			"ti,imon-slot-no");
+		tas2770->i_sense_slot = 0;
 	}
 
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
 				&tas2770->v_sense_slot);
 	if (rc) {
-		dev_err(tas2770->dev, "Looking up %s property failed %d\n",
-			"ti,vmon-slot-no", rc);
-		goto end;
+		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
+			"ti,vmon-slot-no");
+		tas2770->v_sense_slot = 2;
 	}
 
-end:
-	return rc;
+	return 0;
 }
 
 static int tas2770_i2c_probe(struct i2c_client *client,
-- 
2.28.0

