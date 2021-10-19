Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA49432FEA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 019A416AE;
	Tue, 19 Oct 2021 09:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 019A416AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634629384;
	bh=HQzEm5p0wLtvR6WR5w9qk9SfZbh6U4IXARetoqcJxTg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BqRDQJCeWDJ6RKhQhrSBowclrqEyoRdc8OsdmC3LFlqNcyEyxzVCH/fOQo2c2Rhjc
	 fAn1a2d2sDcSYrPBWMV6oQOvP5jroUiIYJqpiRtpjJlFS4RGKSi7hNa0ATEa/Uir9w
	 orhvtRt9eewqnuuHh45wN9fMP/kSGs3roPeeYHDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C9ABF8026C;
	Tue, 19 Oct 2021 09:41:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CD8F80155; Tue, 19 Oct 2021 09:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2DF8F80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DF8F80155
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mcjka-0000v2-6B; Tue, 19 Oct 2021 09:41:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mcjkY-0002Tz-Js; Tue, 19 Oct 2021 09:41:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mcjkY-0003bQ-It; Tue, 19 Oct 2021 09:41:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
Date: Tue, 19 Oct 2021 09:41:25 +0200
Message-Id: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=8w7HYJGqdbQ2kbG1aXspZbTyWRRLPAjmywmDfVm7IYA=;
 m=PnSaQHMz3IEmULDyb5K8OkLrNaSYGahxv3SwQ4WTGOI=;
 p=hotap3Y2LDS3qFowdf7lx0zLRrc6B5QEQak9kgN63sU=;
 g=1da81ec36054ff0ab34683732bddc543160beea0
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFudqEACgkQwfwUeK3K7AmTdgf8DQJ
 0uk2BQZFdvyF2Xz5VfiursT8uoSv3l5N+trPg1OlUFH28NpX5TfbJbG9U1dTyYvfBuKLgP0kV1Ct/
 lAHWqKMAW34TwuATbcN04cLKnfPUNfsaGftQzmEHEVMXLd6mNWj+HHDTsAcCbyJ09Ia5FQqB1f4Z2
 7s/oeIKMYn9wrENnsaooqEbkDpIecefxNZAIa3VV80JtZ1QzI9vR7tVg8z5ledzm3Q1y133NJMsWS
 amKJvms6bIOTQEkAbdnvxxk8W/RLEQuCcE3VVwNm5l09CPGhgyjaj+7OfUzJCMnpuIPOfwPFhfRm1
 paKrfz1WuPr60Q1jYF4Si+xYWfyQemA==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa@kernel.org>, alsa-devel@alsa-project.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-spi@vger.kernel.org
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

Up to now aic3x_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/tlv320aic3x-i2c.c | 4 +++-
 sound/soc/codecs/tlv320aic3x-spi.c | 4 +++-
 sound/soc/codecs/tlv320aic3x.c     | 3 +--
 sound/soc/codecs/tlv320aic3x.h     | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
index cd0558ed4dd4..2f272bc3f5da 100644
--- a/sound/soc/codecs/tlv320aic3x-i2c.c
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -32,7 +32,9 @@ static int aic3x_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *i
 
 static int aic3x_i2c_remove(struct i2c_client *i2c)
 {
-	return aic3x_remove(&i2c->dev);
+	aic3x_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id aic3x_i2c_id[] = {
diff --git a/sound/soc/codecs/tlv320aic3x-spi.c b/sound/soc/codecs/tlv320aic3x-spi.c
index 8c7b6bb9223f..494e84402232 100644
--- a/sound/soc/codecs/tlv320aic3x-spi.c
+++ b/sound/soc/codecs/tlv320aic3x-spi.c
@@ -37,7 +37,9 @@ static int aic3x_spi_probe(struct spi_device *spi)
 
 static int aic3x_spi_remove(struct spi_device *spi)
 {
-	return aic3x_remove(&spi->dev);
+	aic3x_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id aic3x_spi_id[] = {
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 7731593a5509..d53037b1509d 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1870,7 +1870,7 @@ int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver
 }
 EXPORT_SYMBOL(aic3x_probe);
 
-int aic3x_remove(struct device *dev)
+void aic3x_remove(struct device *dev)
 {
 	struct aic3x_priv *aic3x = dev_get_drvdata(dev);
 
@@ -1881,7 +1881,6 @@ int aic3x_remove(struct device *dev)
 		gpio_set_value(aic3x->gpio_reset, 0);
 		gpio_free(aic3x->gpio_reset);
 	}
-	return 0;
 }
 EXPORT_SYMBOL(aic3x_remove);
 
diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
index 7e0063913017..14298f9e6d9b 100644
--- a/sound/soc/codecs/tlv320aic3x.h
+++ b/sound/soc/codecs/tlv320aic3x.h
@@ -14,7 +14,7 @@ struct regmap_config;
 
 extern const struct regmap_config aic3x_regmap;
 int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver_data);
-int aic3x_remove(struct device *dev);
+void aic3x_remove(struct device *dev);
 
 #define AIC3X_MODEL_3X 0
 #define AIC3X_MODEL_33 1
-- 
2.30.2

