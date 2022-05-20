Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC352EDA7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 15:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6720172C;
	Fri, 20 May 2022 15:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6720172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653055146;
	bh=8EpgGp73lszRCHe+ALVlGHBcYp18RdxmZLceyE6uv8A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SWb0PLrzWINDB68r4flM5YahmgJiJ2eOduNnwWil2O/1KlqTd5ZM69QPJL8hVLFKW
	 KUpOCIwThPN2wzdBsXB/JunMDWSKVHJGfoKNCOI5/ZJKVGAqccmI0bqNun7H3sKiiX
	 AGzlE3lAu+0qgwHt/Eshu8bS9njntXTjhkyIkT7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E78F801F5;
	Fri, 20 May 2022 15:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E8EF8019D; Fri, 20 May 2022 15:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1241F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 15:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1241F800F0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ns38X-0005Dr-Iv; Fri, 20 May 2022 15:57:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ns38X-003Ukz-3Y; Fri, 20 May 2022 15:57:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ns38V-00AykV-1E; Fri, 20 May 2022 15:57:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l45: Make bmc150_magn_remove() return void
Date: Fri, 20 May 2022 15:57:40 +0200
Message-Id: <20220520135740.770801-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359; h=from:subject;
 bh=8EpgGp73lszRCHe+ALVlGHBcYp18RdxmZLceyE6uv8A=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih55QaPfQOvodZZCuVpj9yYxxaYS7gJ36uPwkshT7
 qewQu5yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYoeeUAAKCRDB/BR4rcrsCRFpB/
 4/ciB/26VuYXzYMjoaVe5NU3K81sGenhkNKqd4nO0RtOAY2HstwGwi8GV56IcIb3Ka8L1lKk1LgCHh
 0ZUvNwyJ7QWVID9Q+RWMYUCPRe4JUqqhjIOvO3UHnZz0HFKmyvZ/O2sok225VeeGLUwDlgr7tz5AUD
 FWLXZrmaJYFKkrUfbjQz1T8GE1bmaVFbAcnZ7oWGK6vkYoOMufoNlrir4rGQTF4g4I5jrx6KQKqHOs
 GWtEfYI2Ut7lrcaGko7CNEDSK4cnkkj/CB//tvcqpHFcyWXrO66J5m/sCtHqTMCU8Y6wP6xpbRHqtV
 RK7p6rJO5Z7/IlFXetF6utWyu1Lgtz
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

