Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30C630125
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 23:51:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9F716DC;
	Fri, 18 Nov 2022 23:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9F716DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668811863;
	bh=cLCm7ZSG0uf3WUmihMNCzTLEIQf8DCNxwBHsDY5tqjU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sc9AkXBVHI2vUtOPlzbJGj95xMsrE/zFrDQyzUFco2ADUKFRCwD9IFSjudFlB/BJI
	 qpTShK/V3FYFRGXMlC4zbABatK0HZ5gQ0zelqENy3A02kTEUdv3XM0w2d0RnfNISpr
	 3mmHdaqady6WPjxiuWc6lB7vNDMn1YbTOY+tqIec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F63F80580;
	Fri, 18 Nov 2022 23:48:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5F8F8056F; Fri, 18 Nov 2022 23:48:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B544CF80564
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 23:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B544CF80564
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9o-0005Xg-RK; Fri, 18 Nov 2022 23:48:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9k-0058uB-Uo; Fri, 18 Nov 2022 23:48:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9j-0000Vx-NI; Fri, 18 Nov 2022 23:48:19 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Daniel Mack <daniel@zonque.org>, Ryan Lee <ryan.lee.analog@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hui Tang <tanghui20@huawei.com>
Subject: [PATCH 602/606] ASoC: max98396: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:45:36 +0100
Message-Id: <20221118224540.619276-603-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in the probe function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/max98396.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index a7b6a23f2cd8..db3de41f10e0 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1731,9 +1731,9 @@ static void max98396_supply_disable(void *r)
 	regulator_disable((struct regulator *) r);
 }
 
-static int max98396_i2c_probe(struct i2c_client *i2c,
-			      const struct i2c_device_id *id)
+static int max98396_i2c_probe(struct i2c_client *i2c)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
 	struct max98396_priv *max98396 = NULL;
 	int i, ret, reg;
 
@@ -1907,7 +1907,7 @@ static struct i2c_driver max98396_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(max98396_acpi_match),
 		.pm = &max98396_pm,
 	},
-	.probe = max98396_i2c_probe,
+	.probe_new = max98396_i2c_probe,
 	.id_table = max98396_i2c_id,
 };
 
-- 
2.38.1

