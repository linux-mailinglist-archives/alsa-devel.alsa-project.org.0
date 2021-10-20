Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B603434C09
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 15:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9B916E4;
	Wed, 20 Oct 2021 15:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9B916E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634736370;
	bh=Xn4uBrkmVl/DcmbnVi4suK9jT5sHJaFVbSC3yP+geMQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vP6Fa3hqhWIjFArryyfoxYL2qjR8+ugeg3imb5qCI8RfPz+R+bWp3Q5W0KjiNyS03
	 hnu+rvBk/qJvzmzjeu9ggld1Ivs4ldvqzcjR4prAWKN9pUCHwP86wtffuHI2iFbR1w
	 k0xvNt52d+vyBMB37wRW5cjQgoUfC4hktxhPC5o4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C6FF80224;
	Wed, 20 Oct 2021 15:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DABC4F80229; Wed, 20 Oct 2021 15:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB15F800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 15:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB15F800ED
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBa6-0004ip-GX; Wed, 20 Oct 2021 15:24:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBa3-00064k-6K; Wed, 20 Oct 2021 15:24:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBa3-000484-5R; Wed, 20 Oct 2021 15:24:31 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l41: Make cs35l41_remove() return void
Date: Wed, 20 Oct 2021 15:24:16 +0200
Message-Id: <20211020132416.30288-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=gqftZhOeCWy1o/U6mmaWSodh8qNzB5SZyyB9EbDoL5Q=;
 m=q85Di2enxIlGA3mX9bomn+4sTWjOoYGxoeqVHOBsEu0=;
 p=hisnpkakSKL2IiQpZM6zZrcnZMnDuQF+9L99uc2WLks=;
 g=2b96b2a695c64714a84d3c179eee1abb445feb82
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFwGH0ACgkQwfwUeK3K7AmZEwf/UB3
 l2pQ2vaq7DJ9YU1jQjC2cvHj2dJsGH/yLtQVfUQ4zl/M1n4J0XFVEqFRW456u/s7iCQSjLmI6HxY3
 +B59oVE0Vo50V1LK40Ih8Ql3J3Drg+Nkv0OVgmYki0y9MtNBT08hN5PvDw7efuvqmlrz0syNk+pV7
 260vNTAAnXtCY6+xd3Uk5MJ4jfuAfH4rhmw/isFiVrdQ8qZd8pH4geGK6obRL4dqiWq/1owZGNTbQ
 6E8VzFrfQhhb1r9P4Z1JrcuxluFC2Bx36DNE2TPqY4SnWXaWQW/614mxZbZ7rD8PYMMF7/GlTdzvA
 gAhDtbi4jKaKItSBBRdBrtrFwzCua+Q==
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

Up to now cs35l41_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c, platform and spi remove callbacks is
ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/cs35l41-i2c.c | 4 +++-
 sound/soc/codecs/cs35l41-spi.c | 4 +++-
 sound/soc/codecs/cs35l41.c     | 4 +---
 sound/soc/codecs/cs35l41.h     | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index 2f3d1bd8e046..d5fa8d2c4a70 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -75,7 +75,9 @@ static int cs35l41_i2c_remove(struct i2c_client *client)
 {
 	struct cs35l41_private *cs35l41 = i2c_get_clientdata(client);
 
-	return cs35l41_remove(cs35l41);
+	cs35l41_remove(cs35l41);
+
+	return 0;
 }
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index eac64779eea8..90a921f726c3 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -100,7 +100,9 @@ static int cs35l41_spi_remove(struct spi_device *spi)
 {
 	struct cs35l41_private *cs35l41 = spi_get_drvdata(spi);
 
-	return cs35l41_remove(cs35l41);
+	cs35l41_remove(cs35l41);
+
+	return 0;
 }
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b16eb6610c0e..94ed21d7676f 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1433,13 +1433,11 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 	return ret;
 }
 
-int cs35l41_remove(struct cs35l41_private *cs35l41)
+void cs35l41_remove(struct cs35l41_private *cs35l41)
 {
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
 	regulator_bulk_disable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
 	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
-
-	return 0;
 }
 
 MODULE_DESCRIPTION("ASoC CS35L41 driver");
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index 0e2639d6ef19..6cffe8a55beb 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -770,6 +770,6 @@ struct cs35l41_private {
 
 int cs35l41_probe(struct cs35l41_private *cs35l41,
 		  struct cs35l41_platform_data *pdata);
-int cs35l41_remove(struct cs35l41_private *cs35l41);
+void cs35l41_remove(struct cs35l41_private *cs35l41);
 
 #endif /*__CS35L41_H__*/
-- 
2.30.2

