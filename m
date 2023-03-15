Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4F6BB775
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:20:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0FA12E3;
	Wed, 15 Mar 2023 16:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0FA12E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893615;
	bh=SsRRGH025TBMYguZNbOSbNFDfqd34EijQq3q6O0cmT4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJ8RANtHOmh06v39OQCHguwWCU6NuwEBhBVQvIFIzjLH66HPC5xjNOUFhZnV+k1Bc
	 2SJj1Z9K0xqhjrrl161B/Mjb7ag+S9KHV6DXJeYrwYJDgETICEQZrfevlROI30+yyr
	 LhOJJBnZcqm3zMXGC0RSRX2dwSjrNGieZErTzh8M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B4AF8057E;
	Wed, 15 Mar 2023 16:11:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B90BF8057E; Wed, 15 Mar 2023 16:08:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 098DBF80580
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 098DBF80580
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0007Ji-I2; Wed, 15 Mar 2023 16:08:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-004KVi-MI; Wed, 15 Mar 2023 16:08:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-0057dg-Nc; Wed, 15 Mar 2023 16:08:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 029/173] ASoC: atmel: mchp-spdiftx: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:21 +0100
Message-Id: <20230315150745.67084-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=SsRRGH025TBMYguZNbOSbNFDfqd34EijQq3q6O0cmT4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2AxoxR/WnTgFelyNPRnbjyrOzO6r8ixARgc
 uZ8b0km602JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdgAAKCRDB/BR4rcrs
 CWRHCACFQmbZkcNlsf5DMUnas4oIg7Emblfp3WDbyxXjG/prbDIW5qMA2wzePnzBn4acefGQ2yR
 xlr+p3GsOEGuuRttlcFlGtwYCrjD269crMMMkj42CN04fkxtioe2jhhKyzQ9X0Mc84g2KzOTIVq
 tC1pInasrevX1vk/f0lxJKqy/gibSUHXvN760niAqHw2dAzb6hcc7Z/r+FQk9si1yhpI+yPwtMb
 NEfv9dTkOR2Etn3jmCmSAl3VGIP6rdk0Sj68jU08Y1UUQ+IxIBlxjZGjnd1cNwFbprZGwh6aS4/
 Z5s/MF2im+9LzyWv7p94tB/WlDh7STDxE1e5hpfQF9b8JCKn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: JJLJUUPGKWFJDBIJ3BD6OAS3CU4GFAO7
X-Message-ID-Hash: JJLJUUPGKWFJDBIJ3BD6OAS3CU4GFAO7
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJLJUUPGKWFJDBIJ3BD6OAS3CU4GFAO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/atmel/mchp-spdiftx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 20d135c718b0..850cd97bc229 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -891,7 +891,7 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mchp_spdiftx_remove(struct platform_device *pdev)
+static void mchp_spdiftx_remove(struct platform_device *pdev)
 {
 	struct mchp_spdiftx_dev *dev = platform_get_drvdata(pdev);
 
@@ -899,13 +899,11 @@ static int mchp_spdiftx_remove(struct platform_device *pdev)
 		mchp_spdiftx_runtime_suspend(dev->dev);
 
 	pm_runtime_disable(dev->dev);
-
-	return 0;
 }
 
 static struct platform_driver mchp_spdiftx_driver = {
 	.probe	= mchp_spdiftx_probe,
-	.remove = mchp_spdiftx_remove,
+	.remove_new = mchp_spdiftx_remove,
 	.driver	= {
 		.name	= "mchp_spdiftx",
 		.of_match_table = of_match_ptr(mchp_spdiftx_dt_ids),
-- 
2.39.2

