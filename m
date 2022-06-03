Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1553CB55
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 16:07:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6676186C;
	Fri,  3 Jun 2022 16:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6676186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654265271;
	bh=Hh07qKWtrq9pkw6iE7h3rIpvli7y8bEU8sC7SGunJUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mk7k8O6nwyk2MregeLZGIHTgFbOCrakV+1guKe63He9IQhR+Sqnp8A27Fj4SAiOl5
	 vE4mJGLi2TTg5q5myn6DQvJ4tpIpz8U5a7+R5PKvDSyD4FG9aNoKy6R0/SD0Tr66Ux
	 5wed1ltxwgfDZRPVt7w9q9ROwWD7zJHS8MKFbA+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34890F8053A;
	Fri,  3 Jun 2022 16:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73888F80539; Fri,  3 Jun 2022 16:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90BD6F804D6
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 16:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90BD6F804D6
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-0006Wc-5I; Fri, 03 Jun 2022 16:05:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-006EWN-GP; Fri, 03 Jun 2022 16:05:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vT-00DxJa-Gh; Fri, 03 Jun 2022 16:05:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 M R Swami Reddy <mr.swami.reddy@ti.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Subject: [PATCH 3/4] ASoC: lm49453: Drop no-op remove function
Date: Fri,  3 Jun 2022 16:05:12 +0200
Message-Id: <20220603140513.131142-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
References: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; h=from:subject;
 bh=Hh07qKWtrq9pkw6iE7h3rIpvli7y8bEU8sC7SGunJUQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimhUQpAfZbH4QMOm/aCYzFh6P3aS/JFtFgaceRoa2
 o2UsF8aJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpoVEAAKCRDB/BR4rcrsCVtRB/
 9hhehPdGmBXylg67/O3qzNp2dlq6JVIVGh63RU/jrupGdAw18kjWEuL/2fiFQv4HhIp4oVgyQ9rR+v
 3WlyZmKXm8qunPPOsfz6zlNYEAbQbLSJH0Y3tMjeQZcZoxcuknv2oTmc02i9NG32yz9INeB4ck2ONW
 TklNyv/nsu/cJ0SfHo13Y4uMnBziUuH36ambAXsTiZWH5foHg8iruAQvX7fIUrjJiai4P+Y9F1MqC6
 SKnsqinmZ33Zb7frcmG01hEbs/OWiV2G0oWr5VabhWtvVkx4wH6DC+Hwq0zkiqt8+b9dMr3mUdWBCX
 ySW4avmFCwvXfNRZ0Or7gMHJYWQm4r
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

https://lore.kernel.org/alsa-devel/20220526204016.1724630-1-u.kleine-koenig@pengutronix.de

 sound/soc/codecs/lm49453.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index bd0078e4499b..c4900ada8618 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1442,11 +1442,6 @@ static int lm49453_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static int lm49453_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static const struct i2c_device_id lm49453_i2c_id[] = {
 	{ "lm49453", 0 },
 	{ }
@@ -1458,7 +1453,6 @@ static struct i2c_driver lm49453_i2c_driver = {
 		.name = "lm49453",
 	},
 	.probe_new = lm49453_i2c_probe,
-	.remove = lm49453_i2c_remove,
 	.id_table = lm49453_i2c_id,
 };
 
-- 
2.36.1

