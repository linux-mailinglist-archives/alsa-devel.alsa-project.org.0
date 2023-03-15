Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A55D6BB790
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8A81261;
	Wed, 15 Mar 2023 16:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8A81261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893835;
	bh=FOfIj2pV04aWWA4gsQJnB0qF0b40DO1206/6g6bNZSk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n1hQelRDCAkYzIU59LWPqzHE1baaDpiIZM9KpAs4Nfr7gSJyFv99uRy0zevgN8V93
	 ymmYMO1sbFiCXtBX6LK6qKv6nGaEp3f4IIvoWFjMZLEvbxyCWlZC/WeHjvsHLtIAFw
	 sCPEUgqU0t7FtM0T6EHxmhvl0te/S4aW++UUaBUA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93397F80686;
	Wed, 15 Mar 2023 16:11:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEA5BF8016C; Wed, 15 Mar 2023 16:09:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 186F6F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186F6F8016C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0007Ry-HI; Wed, 15 Mar 2023 16:08:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-004KWa-Uw; Wed, 15 Mar 2023 16:08:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0057eJ-W5; Wed, 15 Mar 2023 16:08:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Allison Randal <allison@lohutok.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 039/173] ASoC: bcm: cygnus-ssp: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:31 +0100
Message-Id: <20230315150745.67084-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=FOfIj2pV04aWWA4gsQJnB0qF0b40DO1206/6g6bNZSk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2dv2+30yy3xC9w/q2zfPFOMQd5kFNUcn8zh
 fp26fHKbxiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdnQAKCRDB/BR4rcrs
 CRwcB/9RmUFA62/bGJzNSzRta91M19j8ABIiM7A7CU/afcE4Yv/PX7dqULvsmf5GWFXk1uVQ/t6
 U8wFz9Fy0PISZk3ZGMbqfLE71K6VljaMZDX2nimifDq1Yy7yIrR1fEJRr4n9sbF4+uwyY1+vW9f
 Arh0MBDD4Oi2E7UGR5pp9q+VxxQQneM5iZ+awEHwI+XJbb4ciEwI0B2RNMY/XJcauhAQwyfR/x/
 1J9I7rDC7rySKOa1aa82OSMtMXaEooLvRQObgqB08fKzd49Auz1AyPbwh5kvKBqM/dvZo41r9Ww
 CzC8UclNEOix56m5fKLyJx//A7MizepNQttqy5vIGhgVzdam
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: BMYNIRU6BVDBWMJDH7QIJW2BF7PSMVGF
X-Message-ID-Hash: BMYNIRU6BVDBWMJDH7QIJW2BF7PSMVGF
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMYNIRU6BVDBWMJDH7QIJW2BF7PSMVGF/>
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
 sound/soc/bcm/cygnus-ssp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 2a92e33e1fbf..8638bf22ef5c 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1377,11 +1377,9 @@ static int cygnus_ssp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int cygnus_ssp_remove(struct platform_device *pdev)
+static void cygnus_ssp_remove(struct platform_device *pdev)
 {
 	cygnus_soc_platform_unregister(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id cygnus_ssp_of_match[] = {
@@ -1392,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, cygnus_ssp_of_match);
 
 static struct platform_driver cygnus_ssp_driver = {
 	.probe		= cygnus_ssp_probe,
-	.remove		= cygnus_ssp_remove,
+	.remove_new	= cygnus_ssp_remove,
 	.driver		= {
 		.name	= "cygnus-ssp",
 		.of_match_table = cygnus_ssp_of_match,
-- 
2.39.2

