Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 850EA6BB7CF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9C31324;
	Wed, 15 Mar 2023 16:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9C31324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894230;
	bh=cmP13A8o+Za6P3YFXH6efMNV7cvca/r1fIYEacD5Ox4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eIVpdBDavQwVdd1kGkZ7DjjJ23NvmtMWmPTJ28yyBDDxj1EBXM33dsZOTB88ptV+g
	 GQASaswFK6X80j5/eP6eGGUl4b3IrYIClJjA1vI8soUkbQPRYLNVGD1r5/2IeKxhGn
	 veQF37ytXJQyLybKq+uNUwAu3V1R7nVD7QXh14yw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6D9F8016C;
	Wed, 15 Mar 2023 16:12:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A6BF805C5; Wed, 15 Mar 2023 16:09:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E17AFF805D8
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E17AFF805D8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0007yd-V7; Wed, 15 Mar 2023 16:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-004KZt-DG; Wed, 15 Mar 2023 16:08:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0057h1-JI; Wed, 15 Mar 2023 16:08:14 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 081/173] ASoC: fsl: mpc8610_hpcd: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:13 +0100
Message-Id: <20230315150745.67084-82-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=cmP13A8o+Za6P3YFXH6efMNV7cvca/r1fIYEacD5Ox4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4gX/B9WGBIOLpcfX8F1BzBvFGywuHUixuIG
 urHDoa46bqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeIAAKCRDB/BR4rcrs
 CSxaB/47Qy6arHQwRzgUwnsusrjFdHZpR5Rs/abN9oJx+WtFCSkpKjGT011O2RlsXBbDU48lXTa
 7y+qJf8g4aqxV1eeJhkTGqYA0r9TiWpr0fmHGfNkYfmIfxrV3g89K4dOrS4viLwVVQTUXg20aqi
 gFwLjMB+jHbBav8992AnGYmwnSvBplu9KD578YUaA7m2KEDBEs0Ubf+eyGGyLyVsUpeZmkRyGYN
 X7Sge04lRcOAD7VAT00JNsKk02pRceHYZO9l8d/wAFU25N0fJzaKfA9/3UbrW1Ilp249bjEBUth
 rtYK/P+2C8RmVXjRr9L2ASbzP1lE/S2a8TRMxv7V9/9r6MVx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: CGV3V7R3NPZYV2TY6WNQTHBAXGMEJDVL
X-Message-ID-Hash: CGV3V7R3NPZYV2TY6WNQTHBAXGMEJDVL
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGV3V7R3NPZYV2TY6WNQTHBAXGMEJDVL/>
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
 sound/soc/fsl/mpc8610_hpcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index e71a992fbf93..ea2076ea8afe 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -387,7 +387,7 @@ static int mpc8610_hpcd_probe(struct platform_device *pdev)
  *
  * This function is called when the platform device is removed.
  */
-static int mpc8610_hpcd_remove(struct platform_device *pdev)
+static void mpc8610_hpcd_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct mpc8610_hpcd_data *machine_data =
@@ -395,13 +395,11 @@ static int mpc8610_hpcd_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_card(card);
 	kfree(machine_data);
-
-	return 0;
 }
 
 static struct platform_driver mpc8610_hpcd_driver = {
 	.probe = mpc8610_hpcd_probe,
-	.remove = mpc8610_hpcd_remove,
+	.remove_new = mpc8610_hpcd_remove,
 	.driver = {
 		/* The name must match 'compatible' property in the device tree,
 		 * in lowercase letters.
-- 
2.39.2

