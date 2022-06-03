Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2953CB51
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 16:06:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41ED81828;
	Fri,  3 Jun 2022 16:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41ED81828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654265188;
	bh=n8Owvgb1VqpotX4WhzsH4KXg3NhH0ZaqT+ibRVdL7Gk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUTVxtcaM0sx2wM5ngBPajd73Q7AskPQ8MJPIPraE1o5ZMsYGbR7aD+wgf7DWLUu/
	 03fOIRHWOiPM0L19NzPQzFGtz3Cu2XVA0w+yFewT6Wxv935+3ehy/ASvuNgyerkWvP
	 SMb90btrMQ11Psa4Yy43btDphsjWYTRh82XzzjOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2609EF80089;
	Fri,  3 Jun 2022 16:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92260F804FC; Fri,  3 Jun 2022 16:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94589F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 16:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94589F800F5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-0006Wg-4O; Fri, 03 Jun 2022 16:05:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-006EWQ-N1; Fri, 03 Jun 2022 16:05:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vT-00DxJd-MD; Fri, 03 Jun 2022 16:05:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
Subject: [PATCH 4/4] ASoC: da732x: Drop no-op remove function
Date: Fri,  3 Jun 2022 16:05:13 +0200
Message-Id: <20220603140513.131142-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
References: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; h=from:subject;
 bh=n8Owvgb1VqpotX4WhzsH4KXg3NhH0ZaqT+ibRVdL7Gk=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMSTNEhX+XZXKe6r2QK6Zd7CCt2d5aJJi8LHnDLd/iTY827hN
 cHp4J6MxCwMjF4OsmCJLXZGW2ASJNf/tSpZwwwxiZQKZwsDFKQAT+dXLwdA99ZFy6m6Ge4tF350MNR
 S/yi2X8C+w7q3inkKJ/TuZ3GziF7kV+NVvZ3+bKs/CO6doW9eMSsPXFrG/v7ZZWaZmyHRcOXVtyrem
 wsC8e/2iEcvDPlnUThYzsdt5e4LSgr9CL9vYWJL1DzEFG3247Zqd4jKZp0W/c+m9+639r3Snl8n8vi
 GxwnNhXCq/aN6LQq3Qz827E1ce2yC5vVtJb/KkFaVacwt1DuY+ndF05AnT4sXx7PprMn371WRf+Qie
 3Wb3R/xpynPGC+F/s6OaEr/5icnpfJjIubgzP7FFKF5yeW3oFwlpIYG8BzNe5urNjZA9uOTKpQWv04
 /NSjo1k8Fo7skuPVkTD8/CZJc+AA==
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

A remove callback that just returns 0 is equivalent to no callback at all
as can be seen in i2c_device_remove(). So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Previous submission:

https://lore.kernel.org/alsa-devel/20220526203708.1723898-1-u.kleine-koenig@pengutronix.de

 sound/soc/codecs/da732x.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index f14cddf23f42..3f1cfee10df3 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1546,11 +1546,6 @@ static int da732x_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static int da732x_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static const struct i2c_device_id da732x_i2c_id[] = {
 	{ "da7320", 0},
 	{ }
@@ -1562,7 +1557,6 @@ static struct i2c_driver da732x_i2c_driver = {
 		.name	= "da7320",
 	},
 	.probe_new	= da732x_i2c_probe,
-	.remove		= da732x_i2c_remove,
 	.id_table	= da732x_i2c_id,
 };
 
-- 
2.36.1

