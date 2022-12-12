Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE064A8F7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:58:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69CA82A1A;
	Mon, 12 Dec 2022 21:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69CA82A1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878701;
	bh=OSm9Xm56nyenrSMuk0D0fepZdveAL2uCsSsQlUfmTR0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XDArnl+LJ/FOj4KSVdKIkb3RcolnhWouKL5apCidI0yBbrHbfDSiDfPqsLlYWH/wQ
	 PDtUpIDzaWVxb22d+hR/1CUdSgkGvJl6H/BXoA0UvvtbGwAN75JBCt3vMn1E+nrWQi
	 QZ6SIoh/yqGEWrByiqNQCZlY4GiGpB7osMe0cVcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D390F8059F;
	Mon, 12 Dec 2022 21:54:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C109F8057B; Mon, 12 Dec 2022 21:54:31 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 6353DF8056F
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6353DF8056F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-00015v-CW; Mon, 12 Dec 2022 21:54:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poR-004645-P2; Mon, 12 Dec 2022 21:54:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poR-004ahf-GK; Mon, 12 Dec 2022 21:54:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 04/15] ASoC: atmel-pdmic: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:53:55 +0100
Message-Id: <20221212205406.3771071-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OSm9Xm56nyenrSMuk0D0fepZdveAL2uCsSsQlUfmTR0=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TEf4G4Lr2vEB3HV8YF/vjSlfIRCDrVnNKWe1Sc
 uj4IjjGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eUxAAKCRDB/BR4rcrsCa9lB/
 4gT0O3EjH73UT9ZblEhGpXN5yoPiGMpsblgebbinDs1pBAN0wr16chNuXbY0ZFQFfr/K8NlVAVmPD7
 CFgGvOh/2TmBUiW6DaV8CJMGkbizj/aAyyCLdmiV7VENE3UrgP61MDUWpHSuT3dp160UhoSsUdTisO
 wd5nySFSo1EY8eDiHxkNMsTs+/350CfNq0HvyL6WFhcYwi5A0tCCy7lbB92Cv2a/dQS7Vdh5gkvVD5
 V2RTRH2zECD2iXf7aNwdJvBhJkSt7bqQy18OkjZdx8vhUvGMIir3cN94IehWb7bvpc/cGcx0a8HSbZ
 V6nMSxyKfNL/zCVheL+u3pEWpd9LWo
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/atmel/atmel-pdmic.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 77ff12baead5..12cd40b15644 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -692,11 +692,6 @@ static int atmel_pdmic_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int atmel_pdmic_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver atmel_pdmic_driver = {
 	.driver	= {
 		.name		= "atmel-pdmic",
@@ -704,7 +699,6 @@ static struct platform_driver atmel_pdmic_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe	= atmel_pdmic_probe,
-	.remove	= atmel_pdmic_remove,
 };
 module_platform_driver(atmel_pdmic_driver);
 
-- 
2.38.1

