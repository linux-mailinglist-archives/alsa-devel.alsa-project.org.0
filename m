Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA14890A3
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 08:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7991635;
	Mon, 10 Jan 2022 08:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7991635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641799212;
	bh=vmkoKIYv0StyTHpVRRQgeDpfygLwDICuKkT9/Qw/8ME=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eHfz4FlkqZPCnAi94aB5AnsEZ/bV43P4RNICw5VLxe/x88SJ4xJcxz6JI91IKAjDb
	 LFjwMfkk/9wX2kE8Wpl77nfCCn5a1jjFIKmBtuS59bXU1Um3jW4xo3D6FYGT0NJg8L
	 zLmbLcfMvtpPCmSDSuICtzALFEdP7GvqVhjROghU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB3BF80134;
	Mon, 10 Jan 2022 08:19:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1E3F8012E; Mon, 10 Jan 2022 08:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A095F800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 08:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A095F800B6
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n6ox4-0003bD-Gr; Mon, 10 Jan 2022 08:18:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n6ox0-009Twd-Kv; Mon, 10 Jan 2022 08:18:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n6owz-0008HT-M8; Mon, 10 Jan 2022 08:18:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: cs42l51: Improve error handling in cs42l51_remove()
Date: Mon, 10 Jan 2022 08:18:32 +0100
Message-Id: <20220110071832.306185-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; h=from:subject;
 bh=vmkoKIYv0StyTHpVRRQgeDpfygLwDICuKkT9/Qw/8ME=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBh293EKGJmbtSnRDkL2KIBXKjJBeEDEkXb2q422xQL
 qD1nGdyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYdvdxAAKCRDB/BR4rcrsCdprB/
 9SWqKJOLApgy2yleUIAEkuQoSi/gwdXHP03n1ykA1mOAJgRgDQmnGzY4Z/dHrbM+0Jb4iYT7Qrxyru
 A/NLCvIXMBjg02XCZjIAQS84PJWq/AlIalTrVRcAJ12hov50WqXfwUKqnDnmGUvocVkR5iZOd1gVKf
 2IMLtAmWON4CiKlrMQyeyB7cqPpNFiJKCrOEGMicZTOxQbN2j6pysVeSiFpqkWJ2y+eV8SuWiiS2n1
 Q/x73TvqjgPAgShO0Pdrs5W0tZc5IoCWr36GvyllojScCrOVAr0ClEX5Szmk6ull985VSDyZ2cRJia
 bI8KdG5mm4VL9xVzsDvl/dGhPskwv7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
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

When disabling a regulator fails while the device goes away, there is
little we can do and the machine is probably in enough trouble that any
action we'd want to take fails anyhow.

The return value used to be passed on in cs42l51_i2c_remove() (i.e. the
i2c device remove callback). But the i2c core ignores the error code
(apart from emitting a generic warning) and removes the device anyhow.

So return 0 unconditionally in cs42l51_i2c_remove(), and instead of
returning the error code to the upper layer emit a more helpful warning
message. After that nobody is interested any more in the actual error
code, so let cs42l51_remove() return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

compared to v1 (Message-Id:
20211021103627.70975-1-u.kleine-koenig@pengutronix.de) I'm using
regulator_bulk_disable() instead of regulator_bulk_force_disable().

Best regards
Uwe

 sound/soc/codecs/cs42l51-i2c.c |  4 +++-
 sound/soc/codecs/cs42l51.c     | 11 ++++++++---
 sound/soc/codecs/cs42l51.h     |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l51-i2c.c b/sound/soc/codecs/cs42l51-i2c.c
index 70260e0a8f09..3cb21a2ba29f 100644
--- a/sound/soc/codecs/cs42l51-i2c.c
+++ b/sound/soc/codecs/cs42l51-i2c.c
@@ -31,7 +31,9 @@ static int cs42l51_i2c_probe(struct i2c_client *i2c,
 
 static int cs42l51_i2c_remove(struct i2c_client *i2c)
 {
-	return cs42l51_remove(&i2c->dev);
+	cs42l51_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct dev_pm_ops cs42l51_pm_ops = {
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index c61b17dc2af8..e9c3cb4e2bfc 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -793,14 +793,19 @@ int cs42l51_probe(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(cs42l51_probe);
 
-int cs42l51_remove(struct device *dev)
+void cs42l51_remove(struct device *dev)
 {
 	struct cs42l51_private *cs42l51 = dev_get_drvdata(dev);
+	int ret;
 
 	gpiod_set_value_cansleep(cs42l51->reset_gpio, 1);
 
-	return regulator_bulk_disable(ARRAY_SIZE(cs42l51->supplies),
-				      cs42l51->supplies);
+	ret = regulator_bulk_disable(ARRAY_SIZE(cs42l51->supplies),
+				     cs42l51->supplies);
+	if (ret)
+		dev_warn(dev, "Failed to disable all regulators (%pe)\n",
+			 ERR_PTR(ret));
+
 }
 EXPORT_SYMBOL_GPL(cs42l51_remove);
 
diff --git a/sound/soc/codecs/cs42l51.h b/sound/soc/codecs/cs42l51.h
index 9d06cf7f8876..a79343e8a54e 100644
--- a/sound/soc/codecs/cs42l51.h
+++ b/sound/soc/codecs/cs42l51.h
@@ -13,7 +13,7 @@ struct device;
 
 extern const struct regmap_config cs42l51_regmap;
 int cs42l51_probe(struct device *dev, struct regmap *regmap);
-int cs42l51_remove(struct device *dev);
+void cs42l51_remove(struct device *dev);
 int __maybe_unused cs42l51_suspend(struct device *dev);
 int __maybe_unused cs42l51_resume(struct device *dev);
 extern const struct of_device_id cs42l51_of_match[];

base-commit: df0cc57e057f18e44dac8e6c18aba47ab53202f9
-- 
2.34.1

