Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E11742E9C5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 09:12:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E900A167F;
	Fri, 15 Oct 2021 09:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E900A167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634281976;
	bh=KPhIZ3YevEEbJhN+BsV/teb4yZoR65eByc4E/AI6oe4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tvwVFUGeOnwJ1yEhFaDA6XJWHFJXTKvKav2aXRIrUfeC+0aSSksnDOBTPfyynHYlL
	 mbO527qGMQC1Oe95M3fTG5dyr4gH/pdxmq8GUvdoebqVDKV2wOA/TJ8xtOjg8IukZr
	 LIObrgAe51VgniSIM0yGehDRxei0J36pUIG/DBJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40719F8028D;
	Fri, 15 Oct 2021 09:11:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B447AF80269; Fri, 15 Oct 2021 09:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE312F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 09:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE312F8016C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mbHNA-0006an-26; Fri, 15 Oct 2021 09:11:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mbHN7-0000Fg-Uy; Fri, 15 Oct 2021 09:11:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mbHN7-0006wZ-Tp; Fri, 15 Oct 2021 09:11:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] sound: soc: tlv320aic32x4: Make aic32x4_remove() return void
Date: Fri, 15 Oct 2021 09:11:13 +0200
Message-Id: <20211015071113.2795767-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=nRNU/h5dN0hs6QQdYrn9XplF1ZR0nboidS4cpkp3qDI=;
 m=2e5HCshqMt6dybePlB07FsppmCU/zxeR26wervi3tws=;
 p=ET5WVtEOuO659Yg8+YuLjG7ttyClm3n+0otQ9SrIUgA=;
 g=9c9909311a8b559b124f8407491711be13fdf2b5
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFpKYgACgkQwfwUeK3K7AlALAf/RUg
 6zfanHCHtHIXVMCCP0xByiI/Q2w5shLXJXILQQTO6MjzI1K9ILBJjpvMP0NB7sMmrjVNE7L/SoAq3
 xHHgPA2lNbxmyuJ6RgD5WY0oxXOjRXnNpYZPiRb2SiNVd2aroa4shXCm9bGnhvXXNiqUHCwcThOJ/
 XJpBGRwYkQvKo7VJT7iV9VuYNcaAoorEjIQDnnG4toBcW+CyN3j+MGHzsWQcZEPd2oKMwhZgeKAts
 iQ9itaLhW0jZQ2tCwufeoZuo12k/L3CXMQpPZrGT5U/JlwzXCgWHi1USqZlBXwX0erIZ2kesGY3Ta
 W2BdNlZkb2QDSWBiv/O2CJsHaxtKcIA==
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

Up to now aic32x4_remove() returns zero unconditionally. Make it return
void instead which makes it easier to see in the callers that there is
no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 4 +++-
 sound/soc/codecs/tlv320aic32x4-spi.c | 4 +++-
 sound/soc/codecs/tlv320aic32x4.c     | 4 +---
 sound/soc/codecs/tlv320aic32x4.h     | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 04ad38311360..ed70e3d9baf2 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -44,7 +44,9 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c,
 
 static int aic32x4_i2c_remove(struct i2c_client *i2c)
 {
-	return aic32x4_remove(&i2c->dev);
+	aic32x4_remove(&i2c->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id aic32x4_i2c_id[] = {
diff --git a/sound/soc/codecs/tlv320aic32x4-spi.c b/sound/soc/codecs/tlv320aic32x4-spi.c
index e81c72958a82..a8958cd1c692 100644
--- a/sound/soc/codecs/tlv320aic32x4-spi.c
+++ b/sound/soc/codecs/tlv320aic32x4-spi.c
@@ -48,7 +48,9 @@ static int aic32x4_spi_probe(struct spi_device *spi)
 
 static int aic32x4_spi_remove(struct spi_device *spi)
 {
-	return aic32x4_remove(&spi->dev);
+	aic32x4_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id aic32x4_spi_id[] = {
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index d39c7d52ecfd..8f42fd7bc053 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1418,13 +1418,11 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL(aic32x4_probe);
 
-int aic32x4_remove(struct device *dev)
+void aic32x4_remove(struct device *dev)
 {
 	struct aic32x4_priv *aic32x4 = dev_get_drvdata(dev);
 
 	aic32x4_disable_regulators(aic32x4);
-
-	return 0;
 }
 EXPORT_SYMBOL(aic32x4_remove);
 
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index e9fd2e55d6c3..4de5bd9e8cc5 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -18,7 +18,7 @@ enum aic32x4_type {
 
 extern const struct regmap_config aic32x4_regmap_config;
 int aic32x4_probe(struct device *dev, struct regmap *regmap);
-int aic32x4_remove(struct device *dev);
+void aic32x4_remove(struct device *dev);
 int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 
 /* tlv320aic32x4 register space (in decimal to match datasheet) */
-- 
2.30.2

