Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C468850E981
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 21:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613661843;
	Mon, 25 Apr 2022 21:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613661843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650915122;
	bh=+cc4yFMT0h9UAjUH3DxcsAUeKNdI0vm+sgGTjC0LVzM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QXJb7rft7pHK2dfeQDvHU8xZWiwv2vu4H1Anc3icpQtG+g08k0Laz/LNrAhqA8HsW
	 FEtfLM6Cab/j4YxBvpxlpxv4Swd3/WqktpjRpkl55M57e7hyCyySLbxdZAuAkva5D8
	 mNA4pgC3piF1VJkmLvVOBQQH4RFCiKh0cNgMUqUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CABE6F8016B;
	Mon, 25 Apr 2022 21:31:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B47F8016A; Mon, 25 Apr 2022 21:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1C73F800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 21:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1C73F800FA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4Py-0004Ra-Dg; Mon, 25 Apr 2022 21:30:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4Px-005Co3-Ey; Mon, 25 Apr 2022 21:30:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4Pv-005aWF-Ct; Mon, 25 Apr 2022 21:30:39 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: pcm1789: Make pcm1789_common_exit() return void
Date: Mon, 25 Apr 2022 21:30:23 +0200
Message-Id: <20220425193023.61046-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; h=from:subject;
 bh=+cc4yFMT0h9UAjUH3DxcsAUeKNdI0vm+sgGTjC0LVzM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiZvbLKe7OmkO0h0zielrL4CiFKdPAYjf0XNXLtNPu
 pYmmiyuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYmb2ywAKCRDB/BR4rcrsCRZZCA
 CUDBJ+SItNDx+JF83dD0bNTZe1NjWpu1j1Rl4oyxWx+OmZL7qIMS4MxZw/lX6pM/4Y2X69GM2KeGiF
 WgVJjEpXi3MUGMMlmOrsAPdHG/lSTE5kit4ytWaZN23iA8YSfSNmu6oZdwFWnzZdEqnoPlgYObEcZr
 hnTqEqJ3iXLzH0lhF/GuWcntkOrRDwbTgyLf1SOGtulxtekjSX9xYaEFTiYH6MXqfP0YR+wdhluDqv
 vuiHYzXnD8zJfOopxQALHX287eXgb2XTMH5bvnrgqrda0mIlmyshs8WRaKflSReQnD3BiS6G/rtyMo
 NgqH31hMb59M48mro71bXwi1gK8G0R
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
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

This function returns zero unconditionally, so there isn't any benefit
of returning a value. Make it return void to be able to see at a glance
that the return value of pcm1789_i2c_remove() is always zero.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/pcm1789-i2c.c | 4 +++-
 sound/soc/codecs/pcm1789.c     | 4 +---
 sound/soc/codecs/pcm1789.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/pcm1789-i2c.c b/sound/soc/codecs/pcm1789-i2c.c
index 7a6be45f8149..3396f237637c 100644
--- a/sound/soc/codecs/pcm1789-i2c.c
+++ b/sound/soc/codecs/pcm1789-i2c.c
@@ -30,7 +30,9 @@ static int pcm1789_i2c_probe(struct i2c_client *client,
 
 static int pcm1789_i2c_remove(struct i2c_client *client)
 {
-	return pcm1789_common_exit(&client->dev);
+	pcm1789_common_exit(&client->dev);
+
+	return 0;
 }
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
index 620dec172ce7..35788b57e11f 100644
--- a/sound/soc/codecs/pcm1789.c
+++ b/sound/soc/codecs/pcm1789.c
@@ -259,13 +259,11 @@ int pcm1789_common_init(struct device *dev, struct regmap *regmap)
 }
 EXPORT_SYMBOL_GPL(pcm1789_common_init);
 
-int pcm1789_common_exit(struct device *dev)
+void pcm1789_common_exit(struct device *dev)
 {
 	struct pcm1789_private *priv = dev_get_drvdata(dev);
 
 	flush_work(&priv->work);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(pcm1789_common_exit);
 
diff --git a/sound/soc/codecs/pcm1789.h b/sound/soc/codecs/pcm1789.h
index c446d789ed48..79439c8322b3 100644
--- a/sound/soc/codecs/pcm1789.h
+++ b/sound/soc/codecs/pcm1789.h
@@ -12,6 +12,6 @@
 extern const struct regmap_config pcm1789_regmap_config;
 
 int pcm1789_common_init(struct device *dev, struct regmap *regmap);
-int pcm1789_common_exit(struct device *dev);
+void pcm1789_common_exit(struct device *dev);
 
 #endif

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

