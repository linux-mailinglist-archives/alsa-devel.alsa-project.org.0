Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC152F1B5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 19:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389A1173D;
	Fri, 20 May 2022 19:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389A1173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653068120;
	bh=8EpgGp73lszRCHe+ALVlGHBcYp18RdxmZLceyE6uv8A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQThDJGv/Nutw4zogr4mupXWAkKTLF4hw0WRiZRX5zta4ekZtWrWx5s57oOu/ALqM
	 S2ogEmw82S3aVsYH/sq9LtyXPxb0bLmC/Bnzn913bH9aCgGCpa0pW7rxO6FuSeVBUX
	 D+moXqRuj4d211c3tYdBGSnr2U6N0x6TH1R78HsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF252F801F5;
	Fri, 20 May 2022 19:34:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E049F8019D; Fri, 20 May 2022 19:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07784F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 19:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07784F80109
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ns6Vn-0007lt-3M; Fri, 20 May 2022 19:34:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ns6Vk-003WeW-Ms; Fri, 20 May 2022 19:33:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ns6Vi-00B13D-BU; Fri, 20 May 2022 19:33:58 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: cs35l45: Make cs35l45_remove() return void
Date: Fri, 20 May 2022 19:33:49 +0200
Message-Id: <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520144738.GM38351@ediswmail.ad.cirrus.com>
References: <20220520144738.GM38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359; h=from:subject;
 bh=8EpgGp73lszRCHe+ALVlGHBcYp18RdxmZLceyE6uv8A=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih9D4993Qkx5WZIjDu+kDCsKZkALz2I2JVXF+F4LA
 PDEl1kWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYofQ+AAKCRDB/BR4rcrsCaTgB/
 9BRU7AiABlaUl57csuKO3Y/C44SVlZmd+fCHyRcT6tvWoAJ/ZegZRDi2crGGB9/p2tfPtAAWysj67h
 E1J9j5fOsmi7km4wN2WAjFrRQJdCxlyNRFGEBcrXpu7BKMz8MFusRZ3O3rmggRAJvFEg0Ejb5zlVio
 gbWB7naYdjEOpydZBlZJwfjc8+5gRMRmzembJI2OWFVej8zY6mx2ELaY3onflZjDhftVjo21ytX3nq
 ZYROC4WBMc4lqdLCyWqeFKD6esoxIIopC6LToX2yFXwOkk1/HD1YtEhZkzcbXP1V9HabD9PpGGcOov
 gGL2rQcvqSU6ovDkG1lInS1S9pb1cF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
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

cs35l45_remove() always returns zero. Make it return no value which
makes it easier to see in the callers that there is no error to handle.

Also the return value of i2c driver remove callbacks is ignored anyway.
This prepares making i2c remove callbacks return void, too.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/cs35l45-i2c.c | 4 +++-
 sound/soc/codecs/cs35l45.c     | 4 +---
 sound/soc/codecs/cs35l45.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index 18ebf1e14b91..53a57320d0ab 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -40,7 +40,9 @@ static int cs35l45_i2c_remove(struct i2c_client *client)
 {
 	struct cs35l45_private *cs35l45 = i2c_get_clientdata(client);
 
-	return cs35l45_remove(cs35l45);
+	cs35l45_remove(cs35l45);
+
+	return 0;
 }
 
 static const struct of_device_id cs35l45_of_match[] = {
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 7822626d3693..64a3abe14010 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -669,7 +669,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 }
 EXPORT_SYMBOL_GPL(cs35l45_probe);
 
-int cs35l45_remove(struct cs35l45_private *cs35l45)
+void cs35l45_remove(struct cs35l45_private *cs35l45)
 {
 	pm_runtime_disable(cs35l45->dev);
 
@@ -677,8 +677,6 @@ int cs35l45_remove(struct cs35l45_private *cs35l45)
 	regulator_disable(cs35l45->vdd_a);
 	/* VDD_BATT must be the last to power-off */
 	regulator_disable(cs35l45->vdd_batt);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(cs35l45_remove);
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 4e266d19cd1c..680891bcfce9 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -212,6 +212,6 @@ extern const struct regmap_config cs35l45_spi_regmap;
 int cs35l45_apply_patch(struct cs35l45_private *cs43l45);
 unsigned int cs35l45_get_clk_freq_id(unsigned int freq);
 int cs35l45_probe(struct cs35l45_private *cs35l45);
-int cs35l45_remove(struct cs35l45_private *cs35l45);
+void cs35l45_remove(struct cs35l45_private *cs35l45);
 
 #endif /* CS35L45_H */

base-commit: 0d463d016000d68d7e982720b5e4380b2d83409a
-- 
2.35.1

