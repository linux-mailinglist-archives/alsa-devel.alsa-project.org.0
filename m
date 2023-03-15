Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067D6BB749
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA8CF1277;
	Wed, 15 Mar 2023 16:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA8CF1277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893268;
	bh=ccbxKj/wVrW1k3p+wz37IPmkCcgaA7P6rLPSrcKu3F0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ftYuZBNgHoOx/qwiZPkfhWZJdKZ7cRq8jxZp0jiaIfpivDygf/VnuSU69j7XEBdhr
	 tLuBuToJW+LEtbVzVjoJPn2R+x36R/DC2w/CMKJ2al2TUBh8Fby/cA8rA4s3eODc41
	 nxoZYv1EDVfJTuys5F/FJxF1d96tfFW/BeW5ZBAM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D9AF805BF;
	Wed, 15 Mar 2023 16:09:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 925DDF805ED; Wed, 15 Mar 2023 16:08:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B758F80552
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B758F80552
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-00076f-Kj; Wed, 15 Mar 2023 16:08:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-004KUA-Ma; Wed, 15 Mar 2023 16:07:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-0057cM-Ep; Wed, 15 Mar 2023 16:07:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH 009/173] ALSA: hda/tegra: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:05:01 +0100
Message-Id: <20230315150745.67084-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ccbxKj/wVrW1k3p+wz37IPmkCcgaA7P6rLPSrcKu3F0=;
 b=owEBbAGT/pANAwAKAcH8FHityuwJAcsmYgBkEd1DYvVyivyZVtM1lJfkVuZJPFCK+WU9VbX+D
 U5mXh5bhASJATIEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdQwAKCRDB/BR4rcrs
 Cbb8B/iw1O2f2Gyx2OcdkGH+Wt6GGyPScEG1op/2RCJQHmkxubaapU/62d+28zhjgeUdd/seE6j
 JnIJQgUTL0zSDLhbw94f2hlN5KAFySmn/bmxlRkRD4zvRwkU47GsYLUekZJrff9Vek2Rfqj7DHr
 vWB6vw1Yg8kc3m3qgehv7J7M5RDXEmktnO4HPjyqcrU7iDw91fKQb9Z356EANd3fgjwMD9VfEYM
 rsQTlN1gMwoNBBFFqZV4iIOJdrTLJocWx36hsdE7kJRwCMNGP+oVeC5Av++dOniI0KXuywYVI9v
 S0EbIrUrOrBFtYe3aMk46wWIiJwvehmjHbDO/Onbk0Eop7g=
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 3NWSRGOXTKREFISSYEXCZMP3JT4GA6O6
X-Message-ID-Hash: 3NWSRGOXTKREFISSYEXCZMP3JT4GA6O6
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NWSRGOXTKREFISSYEXCZMP3JT4GA6O6/>
List-Archive: <>
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
 sound/pci/hda/hda_tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index c2bf86781894..9d0ab043880b 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -580,12 +580,10 @@ static void hda_tegra_probe_work(struct work_struct *work)
 	return; /* no error return from async probe */
 }
 
-static int hda_tegra_remove(struct platform_device *pdev)
+static void hda_tegra_remove(struct platform_device *pdev)
 {
 	snd_card_free(dev_get_drvdata(&pdev->dev));
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static void hda_tegra_shutdown(struct platform_device *pdev)
@@ -607,7 +605,7 @@ static struct platform_driver tegra_platform_hda = {
 		.of_match_table = hda_tegra_match,
 	},
 	.probe = hda_tegra_probe,
-	.remove = hda_tegra_remove,
+	.remove_new = hda_tegra_remove,
 	.shutdown = hda_tegra_shutdown,
 };
 module_platform_driver(tegra_platform_hda);
-- 
2.39.2

