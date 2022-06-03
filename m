Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8B53CB52
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 16:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13EC81852;
	Fri,  3 Jun 2022 16:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13EC81852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654265220;
	bh=pifN2socAuwsAFvTmJK79lfXNrGZoM00ynB/5O0nQ6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d1GWxa8D03RqEV3hGDxcz74LImzVTJ4qcRYCRDgd7nIuvMTV06xL0WduQ+80xxGVs
	 KE4kCDOZAsUeW5G5D1295cAqjfy2lTn22B/ae8B9SLwZ5phvh0ZatczmO5lHptv4JO
	 qFEuXzPXg3oRv872j8QgnffHrU3vluGx0Z3JR8x4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D043FF804CC;
	Fri,  3 Jun 2022 16:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ED23F80525; Fri,  3 Jun 2022 16:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4451FF80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 16:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4451FF80089
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vU-0006WV-VM; Fri, 03 Jun 2022 16:05:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-006EWD-5a; Fri, 03 Jun 2022 16:05:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vT-00DxJU-5t; Fri, 03 Jun 2022 16:05:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: ak4642: Drop no-op remove function
Date: Fri,  3 Jun 2022 16:05:10 +0200
Message-Id: <20220603140513.131142-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
References: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; h=from:subject;
 bh=pifN2socAuwsAFvTmJK79lfXNrGZoM00ynB/5O0nQ6Y=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimhUJEO6kJg7SpCYavGIbcIdj6jMqdrwkHPGrCv03
 l5UUBy6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpoVCQAKCRDB/BR4rcrsCdd7B/
 446LPin83JHWEJi42omSYsnt53uz2KaxIUWPxOkny+gEVCiBmzC5JVHYeR1vS3MU05RhH1L/bwABDT
 hk3bqQ5xMN/wJmSX+zIC+Ep8rNw5NgA46YCN/V41rT0j9fSq0TfGWPjg+PwJa9k6JH3UGGNOln0/Tn
 +J3Jr440znly7TJIEr7WDSxfhgGF62xfAgdXDnjeJbb0JH4m9BJJY9K4GSlu4+G0uXqHAfpWo32MOA
 g4U1cu01Fe6nE0OPIl7zAkmPZGbQVLyFxltZc9l3+G0JDwviJjchhZOYB45R+SHCkRzCQvARYe6VNU
 OOfUa0Lxb4b96GvXIb37ea72ckiaJ4
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

https://lore.kernel.org/alsa-devel/20220526134239.1593877-1-u.kleine-koenig@pengutronix.de

 sound/soc/codecs/ak4613.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 55e773f92122..648208d40d06 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -919,18 +919,12 @@ static int ak4613_i2c_probe(struct i2c_client *i2c)
 				      &ak4613_dai, 1);
 }
 
-static int ak4613_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static struct i2c_driver ak4613_i2c_driver = {
 	.driver = {
 		.name = "ak4613-codec",
 		.of_match_table = ak4613_of_match,
 	},
 	.probe_new	= ak4613_i2c_probe,
-	.remove		= ak4613_i2c_remove,
 	.id_table	= ak4613_i2c_id,
 };
 
-- 
2.36.1

