Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A26075354BF
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 22:42:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4565E16D9;
	Thu, 26 May 2022 22:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4565E16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653597778;
	bh=EsxoeHI3099IUDvh7F2JLm2lGbKRkyLS/8OvdE8lYBw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mq3ZGpDveeRb7ixoD1TzJgKOBdE5E5DkIh2H2rsceAmvpi0pnpOjBivQIHosec7XT
	 5QohOK1fNlZ1n89+JwS2jqysV9foW/PPQxlFOG9kg42TG0E4Ei/mW+pFx+q6XX7UMb
	 SgI2VdbjED/yOYfTdLAfNI+KaJhFMrpTEvmtuE9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A28F80171;
	Thu, 26 May 2022 22:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88AA6F8014B; Thu, 26 May 2022 22:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CC9FF80100
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 22:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC9FF80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuKIp-000871-0y; Thu, 26 May 2022 22:41:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuKIp-004k0r-KC; Thu, 26 May 2022 22:41:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nuKIn-00CKUn-Na; Thu, 26 May 2022 22:41:49 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: da7219: Drop no-op remove function
Date: Thu, 26 May 2022 22:41:45 +0200
Message-Id: <20220526204145.1725323-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025; h=from:subject;
 bh=EsxoeHI3099IUDvh7F2JLm2lGbKRkyLS/8OvdE8lYBw=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBij+YD70mw1g/bmtXbQUmFXgBjfgEDWiAyAElcch0D
 ENzRCQaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYo/mAwAKCRDB/BR4rcrsCT9JB/
 9C7NDJGufR9N6dy+jp85aBjnN560fn0V+O7ph6X2VFrZLz+IbhVKYRJi4M1haReUL4XrhUaEJKQtnT
 J8OsHa3sJy6lNr839V6e6i7pb4mdhGcs0nEW2TKEQLnHw7rrz7x8oW66/UfWpmg/4r3VZp8XX3ba9c
 sArEIrjiqbPrDSUeNHgutIAwtTMr5OPufYb0CzMiYnfR2KZDvBgWHhAHX0MqWDrd3KTF2iixaCwYQ1
 KvMC3FkSDXLVm9q4CdpEr/9H2e+kANjawJnGm6CP685Bd1+lvQJKndYUIKYdE6nD8BtuwC7y2ylj69
 xYHHeJHbFQ6EMvFcPpEflSGNTv+n8m
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
 sound/soc/codecs/da7219.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index c7493549a9a5..7df18a2c36b9 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2694,11 +2694,6 @@ static int da7219_i2c_probe(struct i2c_client *i2c,
 	return ret;
 }
 
-static int da7219_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static const struct i2c_device_id da7219_i2c_id[] = {
 	{ "da7219", },
 	{ }
@@ -2712,7 +2707,6 @@ static struct i2c_driver da7219_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(da7219_acpi_match),
 	},
 	.probe		= da7219_i2c_probe,
-	.remove		= da7219_i2c_remove,
 	.id_table	= da7219_i2c_id,
 };
 

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

