Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E1B64A8EC
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:56:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39222211;
	Mon, 12 Dec 2022 21:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39222211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878573;
	bh=pfh6naBDzBi9UIjDmrIaZ1RSWIj8qeICSs4X2X1eZyI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ya+2L38ubKAIRfO7wTnZswMjGh41e8EfZLRn2aB+M65dso0w02Mu26ExbOXHUKiE5
	 HrGkUCICZ3b7zjcOeOnhCedLqfnx536tuRywowYEz4IH9bh5NyP3YFwDXpmkS9dJiL
	 +zE5nEzzFKNTS5W2aZbTrc9Z3J9ANWWkx2h2Us7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FA2F8052F;
	Mon, 12 Dec 2022 21:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0714CF80141; Mon, 12 Dec 2022 21:54:23 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CFB3F804D7
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CFB3F804D7
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poV-00017O-DI; Mon, 12 Dec 2022 21:54:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poU-00464e-0e; Mon, 12 Dec 2022 21:54:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poU-004ai7-20; Mon, 12 Dec 2022 21:54:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/15] ASoC: wl1273: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:54:02 +0100
Message-Id: <20221212205406.3771071-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=pfh6naBDzBi9UIjDmrIaZ1RSWIj8qeICSs4X2X1eZyI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TbiL8+sW8xDGAKJjJP1X8a/zm/pCT0z8b3MP0k
 ZwHXEjmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eU2wAKCRDB/BR4rcrsCc/zB/
 9sXTdC08hudPCocQDtoEPLagxE3YyQnCJD7tLneuI2SZkav0YWH4VeceIrXzfMZgFGquxhROmbzMsL
 l8lmIa9fw5Httme5QzqQgiGH9037bNP0gjf23eRmo2YmvVoxH6WJzeioq2hfidjv113+cL3mGp+1d+
 NDXIOSFNkcFHQ/1HLgusLidGAxjZCrdO8PVymSxkEcla3ieGSamBR9Rf3IRi9lx1FHSKH6DT77g5Z8
 4cr/rNa6rs4VWonrVpYUzMZteFrLMBElgW+i5dFfJ+Q+0lU1rhZJxKMue6M2lnWKS6IEPLT5PfngqL
 OGOhAw6gf2kebSaqRgegshkdGPuTga
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/wl1273.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wl1273.c b/sound/soc/codecs/wl1273.c
index 626278e4c923..737ca82cf976 100644
--- a/sound/soc/codecs/wl1273.c
+++ b/sound/soc/codecs/wl1273.c
@@ -484,11 +484,6 @@ static int wl1273_platform_probe(struct platform_device *pdev)
 				      &wl1273_dai, 1);
 }
 
-static int wl1273_platform_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 MODULE_ALIAS("platform:wl1273-codec");
 
 static struct platform_driver wl1273_platform_driver = {
@@ -496,7 +491,6 @@ static struct platform_driver wl1273_platform_driver = {
 		.name	= "wl1273-codec",
 	},
 	.probe		= wl1273_platform_probe,
-	.remove		= wl1273_platform_remove,
 };
 
 module_platform_driver(wl1273_platform_driver);
-- 
2.38.1

