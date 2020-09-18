Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213F02704B7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 21:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5611689;
	Fri, 18 Sep 2020 21:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5611689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600456219;
	bh=qtCpf3WLBu6T8rj5OoMcRWafR4vzkprDWqD5EQqWo4c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXDbB5K/sxiMiYwgzX52dN6LOE3iQQJN9UOZSc09NYCaUEFzXbcdIhzmGejn35EK1
	 LKabEjqsqj6wWHkGZpOn8+FfCwlPw9Ombe2NfnmhIKq1z7+IdVEZ8Ae68bEcTfYpwm
	 +cJVcqkCDPvh+75JwMyd8l545i8mAzndIwWdZfYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4B97F802E7;
	Fri, 18 Sep 2020 21:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D09DF802E3; Fri, 18 Sep 2020 21:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19289F8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 21:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19289F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O215L2To"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6B1Z067330;
 Fri, 18 Sep 2020 14:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600455971;
 bh=8MJa9OWUfuKyK2DPvT28uonc54QcPfadLbC0Yzo+5bQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=O215L2To8zCa8R5KyzGRA93eQCtffCw8cdTpbeTC/dy0mHQD6M0jlnyMRBXVXdiS/
 NsjdmzeLVIOC2EOK28qBVW04QO8mF+Jckq9ZNBStOZnQbwTMXv4cSw7OkiPs0N3MXZ
 6BNxWcHv8zV/DKT/ElStYSpu5VH3O5LFzttSiWWs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6BsY101189;
 Fri, 18 Sep 2020 14:06:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 14:06:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 14:06:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6AKS083581;
 Fri, 18 Sep 2020 14:06:11 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 5/9] ASoC: tas2770: Fix unbalanced calls to pm_runtime
Date: Fri, 18 Sep 2020 14:05:44 -0500
Message-ID: <20200918190548.12598-5-dmurphy@ti.com>
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

Fix the unbalanced call to the pm_runtime_disable when removing the
module.  pm_runtime_enable is not called nor is the pm_runtime setup in
the code.  Remove the i2c_remove function and the pm_runtime_disable.

Fixes: 1a476abc723e6 ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index bdfdad5f4f64..16979583cd68 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -16,7 +16,6 @@
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -785,13 +784,6 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 	return result;
 }
 
-static int tas2770_i2c_remove(struct i2c_client *client)
-{
-	pm_runtime_disable(&client->dev);
-	return 0;
-}
-
-
 static const struct i2c_device_id tas2770_i2c_id[] = {
 	{ "tas2770", 0},
 	{ }
@@ -812,7 +804,6 @@ static struct i2c_driver tas2770_i2c_driver = {
 		.of_match_table = of_match_ptr(tas2770_of_match),
 	},
 	.probe      = tas2770_i2c_probe,
-	.remove     = tas2770_i2c_remove,
 	.id_table   = tas2770_i2c_id,
 };
 
-- 
2.28.0

