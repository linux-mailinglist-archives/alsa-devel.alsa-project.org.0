Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65CB49119E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 23:10:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E79B18BA;
	Mon, 17 Jan 2022 23:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E79B18BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642457420;
	bh=tOGpxueevZIK3fo8Y0MnhBS1efoj2Na5yalUvbRyw5w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LevXN8KXh+O5lXmMtPnW2A0TfDdI3+mK0DtWnsWMEs6vwrN9kjpIYsmD4Pb65UBFZ
	 5clWjQ5817RvjWIumCUCzaaJTwA27sCXyUkopKigyR7TMsQrKZ2cpPp5xAUIygA3Ne
	 APdo1j2XONklfp6Yqq2m/ad4PM2o5RsrOeV3KCrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B75B8F800CE;
	Mon, 17 Jan 2022 23:09:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BDA2F80249; Mon, 17 Jan 2022 23:09:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C56EF800CE
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 23:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C56EF800CE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9aBO-0003hF-SZ; Mon, 17 Jan 2022 23:08:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9aBC-00Atjv-3H; Mon, 17 Jan 2022 23:08:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n9aBB-0001oV-0v; Mon, 17 Jan 2022 23:08:45 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l41: Make cs35l41_hda_remove() return void
Date: Mon, 17 Jan 2022 23:00:55 +0100
Message-Id: <20220117220055.120955-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; h=from:subject;
 bh=tOGpxueevZIK3fo8Y0MnhBS1efoj2Na5yalUvbRyw5w=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMSQ+fc53Kez7Irkdpxd2RSrZPI2sLO37cCow40We37Fgd72e
 eJXOTkZjFgZGLgZZMUWWuiItsQkSa/7blSzhhhnEygQyhYGLUwAm4pzFwdAmXtP09Vfc/Ms//1R/kA
 yLfLSh3k92+l5GhQYvQRtFY7bGoj1vD/RE/I0vT/rZt3mr6q3n67obEv6ab9542vmIgWpy0aqZPw14
 Ytv3Vj78ULpUwOLCyv5qo5jpdQ7r13stOfcr5V/kyq754RtVlbO3VXg0aHg4mE5QC+ufZGHM+WGZyY
 9PWaEFW6RCk3JCNkbKH/qWrRyqbvw5/bV00YufiVv7fh8+83Phs/SCWLY3DywqYxUNkndYKMtmWwpM
 +zTd2WbPlJSS6Gz/s5+LOmwkfcL7BQQ+mvmpKPh+i70TrGm+NFT8dIZv3zbpf2EWzH+cH8b3P8zf5r
 zUQujsNLV5jy/frLl8O6ttMdtHAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de
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

Up to now cs35l41_hda_remove() returns zero unconditionally. Make it
return void instead which makes it easier to see in the callers that
there is no error to handle.

Also the return value of i2c and spi remove callbacks is ignored anyway.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/pci/hda/cs35l41_hda.c     | 4 +---
 sound/pci/hda/cs35l41_hda.h     | 2 +-
 sound/pci/hda/cs35l41_hda_i2c.c | 4 +++-
 sound/pci/hda/cs35l41_hda_spi.c | 4 +++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 30b40d865863..ce3782826830 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -508,7 +508,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 }
 EXPORT_SYMBOL_GPL(cs35l41_hda_probe);
 
-int cs35l41_hda_remove(struct device *dev)
+void cs35l41_hda_remove(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
@@ -517,8 +517,6 @@ int cs35l41_hda_remove(struct device *dev)
 	if (!cs35l41->vspk_always_on)
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(cs35l41_hda_remove);
 
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 76c69a8a22f6..8ecaddf5f132 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -64,6 +64,6 @@ struct cs35l41_hda {
 
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
 		      struct regmap *regmap);
-int cs35l41_hda_remove(struct device *dev);
+void cs35l41_hda_remove(struct device *dev);
 
 #endif /*__CS35L41_HDA_H__*/
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 4a9462fb5c14..d4240b8ded10 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -32,7 +32,9 @@ static int cs35l41_hda_i2c_probe(struct i2c_client *clt, const struct i2c_device
 
 static int cs35l41_hda_i2c_remove(struct i2c_client *clt)
 {
-	return cs35l41_hda_remove(&clt->dev);
+	cs35l41_hda_remove(&clt->dev);
+
+	return 0;
 }
 
 static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index 77426e96c58f..d63c487bc3a9 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -30,7 +30,9 @@ static int cs35l41_hda_spi_probe(struct spi_device *spi)
 
 static int cs35l41_hda_spi_remove(struct spi_device *spi)
 {
-	return cs35l41_hda_remove(&spi->dev);
+	cs35l41_hda_remove(&spi->dev);
+
+	return 0;
 }
 
 static const struct spi_device_id cs35l41_hda_spi_id[] = {

base-commit: 0c947b893d69231a9add855939da7c66237ab44f
-- 
2.34.1

