Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9D2758B1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 15:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E6F1705;
	Wed, 23 Sep 2020 15:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E6F1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600867766;
	bh=g6wBdwqLnNKy/EvgMnkaZNJMGFfDCXzrhzWJWY6BmtM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEgmG2BWRD3dK+QjrWBf/8nhsafRRN82vtIIi3CCXeyziq4Z9gNa0XAjKmzCZ2/Gj
	 POFj5FwVzFA7k5b3lbJ9dO5oORK4N4cJ3NmtnF/r/0oBYbJm9Lc02hu2UP6TC2XiIM
	 yVo4FWASCbFG6k8cjr7sAfxwz//0oU02FjiG4lto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0FDF802E0;
	Wed, 23 Sep 2020 15:26:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10472F802C3; Wed, 23 Sep 2020 15:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68330F800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 15:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68330F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y55UDMmk"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NDQHHe079425;
 Wed, 23 Sep 2020 08:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600867577;
 bh=6SSvm9G2P56pxI7wpDWCpaQ8Vvxx3pHTwKWjp8JbjVc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=y55UDMmkESUghVpJ4vZoD8XHFu4ZJN9FLY2rvwgzniKoHUelgrAtV4EVwuhbbUjpi
 OSQasSXFxEkq1nHH5lDMFoyTCTc+ts+uUZl/vkf6HEZk72anGt/IzuJzqg0qglW8GM
 PA/JDIKVwY3ZAj02AV/Om+v+NUCHL866g3Hr4hpE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NDQHqE045501
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 08:26:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 08:26:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 08:26:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NDQGsR049836;
 Wed, 23 Sep 2020 08:26:16 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 3/6] ASoC: tas2770: Set regcache when shutting down and waking
 device
Date: Wed, 23 Sep 2020 08:25:57 -0500
Message-ID: <20200923132600.10652-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923132600.10652-1-dmurphy@ti.com>
References: <20200923132600.10652-1-dmurphy@ti.com>
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

Set the regcache to cache data and mark cache as dirty when the device
is shutdown when suspend is called. When the device is woken up then
sync the cache and set to not caching the data.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 9f7363927c50..c42e653cd653 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -82,14 +82,20 @@ static int tas2770_codec_suspend(struct snd_soc_component *component)
 	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
+	regcache_cache_only(tas2770->regmap, true);
+	regcache_mark_dirty(tas2770->regmap);
+
 	if (tas2770->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 0);
 	} else {
 		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
 						    TAS2770_PWR_CTRL_MASK,
 						    TAS2770_PWR_CTRL_SHUTDOWN);
-		if (ret < 0)
+		if (ret < 0) {
+			regcache_cache_only(tas2770->regmap, false);
+			regcache_sync(tas2770->regmap);
 			return ret;
+		}
 
 		ret = 0;
 	}
@@ -110,11 +116,11 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 						    TAS2770_PWR_CTRL_ACTIVE);
 		if (ret < 0)
 			return ret;
-
-		ret = 0;
 	}
 
-	return ret;
+	regcache_cache_only(tas2770->regmap, false);
+
+	return regcache_sync(tas2770->regmap);
 }
 #else
 #define tas2770_codec_suspend NULL
-- 
2.28.0

