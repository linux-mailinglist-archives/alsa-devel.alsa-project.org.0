Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF4435F59
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 12:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3E3167F;
	Thu, 21 Oct 2021 12:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3E3167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634812686;
	bh=db2E0ul6CcuVUV6S9bc+r5PtjqFygICmdumVZiZO8pk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HQCd1oK0CePsAts4ZSEC3Em5dmOc/tIUyllxrUM0JlPHFWN4gWaSK2JIuHsi414lA
	 xp810e8fOBTv4LOwATS69tWWUn8keHsnlbaIKHn2kIiK4gYK6GfhGUYdBJBuMQtanO
	 OYhibpJ/aAkEK6dHnt6InCd0u63HUIVlWemDW+VU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21E33F80246;
	Thu, 21 Oct 2021 12:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5FE2F80240; Thu, 21 Oct 2021 12:36:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C242F800F2
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 12:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C242F800F2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdVR2-0006Ja-3O; Thu, 21 Oct 2021 12:36:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdVQz-0008Ck-9h; Thu, 21 Oct 2021 12:36:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdVQz-0000ur-8h; Thu, 21 Oct 2021 12:36:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: cs42l51: improve error handling in cs42l51_remove()
Date: Thu, 21 Oct 2021 12:36:27 +0200
Message-Id: <20211021103627.70975-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=Y2jPTUiHQlo2FH/Jn5iNV8x+kysrYCQM2qiUBDjYhfo=;
 m=oKqh91FCQNwpxBDgGajfXJitlGQ0eZv7Gt5FLPpy2d0=;
 p=Z20HZikouO/Y1p6a3mHBjGKhL4WHgP2b7QyFta7lILE=;
 g=43e3edfdb5c58e5e52d6540ccac7e1bf44cd66d6
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFxQqgACgkQwfwUeK3K7Al70Af+KhD
 Mc7Xy+5pepgdsh1p/ngTm6X+1tNLdUo2kfOPmI2TiIlBE3ChdNqQmx5FFjgDMdK/fKL5gsEVOTJ8X
 NphG4lEtaQMlXSHaEv7EnQijC+AJGSWoWtfDM/Xt2/JTUrwz9iFI9wvtG76QKxy27CTm5WwvVBH5U
 2Bwz/l9sIue9mg4vokAoQEIuCNpK/1P0t4vgn4uPO0M9xxIIznDAEIDTKA/huB4fPYK2kscUNPcwf
 YOdahoUjYl5EdhLGWA01NwXxR2hRDsIC4SW2o7wnlxraKqISDyszSWxaAlBn9WBzaUTMqJciHtB8I
 hOs0RWruHGs8rCYnqJxnsbCSqqNPQNw==
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

When disabling a regulator fails while the device goes away, it doesn't
make sense to reenable the already disabled regulators, so use
regulator_bulk_force_disable() instead of regulator_bulk_disable(). In
the error case returning an error code is also hardly sensible because
the only effect is that the i2c core emits a generic error message.
Replace this by a more specific message and make sure the i2c remove
callback returns 0 instead.

While at it also change cs42l51_remove() to return void as it doesn't
yield any meaningful return value any more.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

a bit unsure if regulator_bulk_force_disable() is indeed the right
function here, its documentation specifies a different usecase.

My motivation for this change was to make it obvious in
cs42l51_i2c_remove() that there is no error to handle to eventually make
i2c remove callbacks return void, too.

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
index c61b17dc2af8..f3667693e2ea 100644
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
+	ret = regulator_bulk_force_disable(ARRAY_SIZE(cs42l51->supplies),
+					   cs42l51->supplies);
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
-- 
2.30.2

