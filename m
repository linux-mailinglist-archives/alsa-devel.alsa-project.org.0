Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F55354AE
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 22:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537E316C0;
	Thu, 26 May 2022 22:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537E316C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653597692;
	bh=hW6lCYGXht4qVLz4UbJdRpyOxnzxCaN+x7Ow3h2Sz0Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zpzu5yuhsQkP4MLJmHtswEZYUjyCPj5eghNxD9KuhmpHjY05Jx6/4cWSMYwufLlBm
	 LOnJG1eyMbhUh5QaGx0N98UZxrSvdLjzZ8rwtpOYJ5FNj4/R8wRcDSRYU7f2g9ypS1
	 zpmGuECT+9PkgTTO5n5elnlCqZRcMvNBfXAcDEuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3FA2F800D0;
	Thu, 26 May 2022 22:40:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE0CAF8014B; Thu, 26 May 2022 22:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1252F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 22:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1252F800D0
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuKHQ-0007b4-2C; Thu, 26 May 2022 22:40:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuKHQ-004k0e-9a; Thu, 26 May 2022 22:40:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuKHO-00CKUe-BW; Thu, 26 May 2022 22:40:22 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: M R Swami Reddy <mr.swami.reddy@ti.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: lm49453: Drop no-op remove function
Date: Thu, 26 May 2022 22:40:16 +0200
Message-Id: <20220526204016.1724630-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; h=from:subject;
 bh=hW6lCYGXht4qVLz4UbJdRpyOxnzxCaN+x7Ow3h2Sz0Q=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBij+Wt3rURHF/V0NsQe+gDdQxRPoQMP4ovIHT7Sg8w
 M00dGX6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYo/lrQAKCRDB/BR4rcrsCQH1B/
 9IPf62pjq806fClNpNp5TpMWVMqNU9E+CfSbhFBc7ut1e5fLvqp0GZ/nHNnbgrHcdwYm5KXaAGW5nI
 BQSx8ir3I/rvo82/2MPvzb4cTVJCgdbnwZYliL92XoLH0ly7CReSwOK8UEz0EFuu6czFM2prW3XAwK
 r2w5hk0soR2vXAr/g7n7CYvi4C8BJoYl7FuG+WippIfOWT3dyjLAwN4B5b/pfj2aUFnEt30hX8iCF6
 HTm5LqyaYAbuKvUs0+L9zYdxhg+k7bSF1SReZ5fc6uuujC1n0l5PBXI3IPkh+meWgzhxarq9xKkdWc
 lTNf7jZrz1HFTwZCKFyPfYtBmcEfYs
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
 sound/soc/codecs/lm49453.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 973d781b4b6a..86cead5022c0 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1443,11 +1443,6 @@ static int lm49453_i2c_probe(struct i2c_client *i2c,
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
@@ -1459,7 +1454,6 @@ static struct i2c_driver lm49453_i2c_driver = {
 		.name = "lm49453",
 	},
 	.probe = lm49453_i2c_probe,
-	.remove = lm49453_i2c_remove,
 	.id_table = lm49453_i2c_id,
 };
 

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

