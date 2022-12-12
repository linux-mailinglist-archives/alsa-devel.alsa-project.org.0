Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA764A8ED
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:56:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA7C22D9;
	Mon, 12 Dec 2022 21:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA7C22D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878593;
	bh=FRqA7RHqZvB/o5CRPzfLhwxQuBgBYrCUo/OSeSsNzgk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E1vzMJEImiU2tuukDSr50zf0JRa+HnssqiP0TMXdP/KSI4yCGq8DXVHWrJNpter3e
	 +kbj/CFMzDOrsjy8kBGaXIWaVzgEiKRXHlUVhhRZDpvxNTeE82UH2JUi4TfVqkB8xf
	 e1Cr5Vstpwvoaj2zd/yZ64Phgp87jA1v1rAlAAWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB84F80538;
	Mon, 12 Dec 2022 21:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C4BFF800F8; Mon, 12 Dec 2022 21:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E29F800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E29F800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poU-000163-31; Mon, 12 Dec 2022 21:54:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poS-00464D-Aa; Mon, 12 Dec 2022 21:54:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poS-004ahp-Dz; Mon, 12 Dec 2022 21:54:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 07/15] ASoC: adau7002: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:53:58 +0100
Message-Id: <20221212205406.3771071-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FRqA7RHqZvB/o5CRPzfLhwxQuBgBYrCUo/OSeSsNzgk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TOIdMPxbICx7vTi3jQ5Ux2daH8NLPgOvnJw1TY
 hm+D4RKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eUzgAKCRDB/BR4rcrsCdGmB/
 9i7X7dJbnzC9ZrpISnPWYXQeo6QRzPOV4Rlyg9f7xuOU3o2ZRcbKN1v8FLfOeaN7N3F5UwBp/jDW+U
 oH7DGRcSUedmll4vRVo5RkGLPUtCR2T8fof7GcoHX/A5t3CtPxkMGUtDinwUq1WnrnzMu2JP7OO/lX
 03CFDJSdnSClh6JWjHr1C4jzez/qrdGx8tJqUFyHjM5Yw22+a/JamrUeojSaOVoFl4jNBHsspsX/AI
 3vnO6mb6dIfEnMbYSjy1wWJ2IHN+qmjf0Y7xmmodAF9471tW0pmHinrme/bmrlXopmBW2UfJ6+Dbc2
 aliogRHorqStGo83eIY9/mIjtGtMR5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/adau7002.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/adau7002.c b/sound/soc/codecs/adau7002.c
index 401bafabc8eb..c9134e1de0b2 100644
--- a/sound/soc/codecs/adau7002.c
+++ b/sound/soc/codecs/adau7002.c
@@ -100,11 +100,6 @@ static int adau7002_probe(struct platform_device *pdev)
 			&adau7002_dai, 1);
 }
 
-static int adau7002_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id adau7002_dt_ids[] = {
 	{ .compatible = "adi,adau7002", },
@@ -128,7 +123,6 @@ static struct platform_driver adau7002_driver = {
 		.acpi_match_table = ACPI_PTR(adau7002_acpi_match),
 	},
 	.probe = adau7002_probe,
-	.remove = adau7002_remove,
 };
 module_platform_driver(adau7002_driver);
 
-- 
2.38.1

