Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1536BB84B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71EC514B3;
	Wed, 15 Mar 2023 16:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71EC514B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895064;
	bh=OyEOZykefhgVgex7iCw3irk3tvrRh0H+0rRIsGTTINM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nNrPUrMjlWSQOsJTGH/LqEZjSRqyni0NupjQ3NSNrffUWhP2xH9ZTjeDUTvO3rJ0D
	 TNMRB3UklC8Xk0ZRg+rXK1LdR8oKxnDvSEiEOAMWWljTEK0bgGlrnKPoucTd8uFhGw
	 VA29ahtKRQw8yFtLEnbLD61fqizFJidi0Vzkhghk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74BF0F805D5;
	Wed, 15 Mar 2023 16:15:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DDA7F80601; Wed, 15 Mar 2023 16:10:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F342CF8060D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F342CF8060D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0008By-Ce; Wed, 15 Mar 2023 16:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-004Kah-4O; Wed, 15 Mar 2023 16:08:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0057hp-9M; Wed, 15 Mar 2023 16:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 093/173] ASoC: Intel: sst: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:06:25 +0100
Message-Id: <20230315150745.67084-94-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OyEOZykefhgVgex7iCw3irk3tvrRh0H+0rRIsGTTINM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5DLQ7R1quKibSGqQzvLfAW3IURcigi10X+Y
 rPIv9o4696JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeQwAKCRDB/BR4rcrs
 CbvIB/9rqKxAXqbqx1PDqKnKcar/PdobNh/ancOHp6kYlRhVAfAj4nRv0tkUCm234z0g5fsJodn
 jZKLfJsz79up47E7kfKBJDCdSIMTjLnNwIFeMPOIuyNuXDz7aOnfAolmCyFtkmsNA9d/7mDBUeW
 2WP2mKGQAQsjkZMU9dihz3+6B6Zt9dtUM/uL75dj2MzOz99ltwaUc1ETnYVPqB6wiUqzVUi70Kh
 5c2sSI1ssjlF3yf4bscamntzeHHsRdYKxWUFpg07Zo8CHJCD24gGV6e9c6QFnNkpZrCy+3f1ccg
 7Yr5qjzP2shjwvJl0CdcDQ1+El7B3TYaAzH1VRf/0VMvX2sz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7PDRAWM6W2NEW7QBJJOV37S63IPS6NV7
X-Message-ID-Hash: 7PDRAWM6W2NEW7QBJJOV37S63IPS6NV7
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PDRAWM6W2NEW7QBJJOV37S63IPS6NV7/>
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
 sound/soc/intel/atom/sst/sst_acpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index 3be64430c256..d3973936426a 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -335,14 +335,13 @@ static int sst_acpi_probe(struct platform_device *pdev)
 * This function is called by OS when a device is unloaded
 * This frees the interrupt etc
 */
-static int sst_acpi_remove(struct platform_device *pdev)
+static void sst_acpi_remove(struct platform_device *pdev)
 {
 	struct intel_sst_drv *ctx;
 
 	ctx = platform_get_drvdata(pdev);
 	sst_context_cleanup(ctx);
 	platform_set_drvdata(pdev, NULL);
-	return 0;
 }
 
 static const struct acpi_device_id sst_acpi_ids[] = {
@@ -360,7 +359,7 @@ static struct platform_driver sst_acpi_driver = {
 		.pm			= &intel_sst_pm,
 	},
 	.probe	= sst_acpi_probe,
-	.remove	= sst_acpi_remove,
+	.remove_new = sst_acpi_remove,
 };
 
 module_platform_driver(sst_acpi_driver);
-- 
2.39.2

