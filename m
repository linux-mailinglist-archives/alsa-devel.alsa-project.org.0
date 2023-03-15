Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7956BB72C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00ED41286;
	Wed, 15 Mar 2023 16:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00ED41286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893122;
	bh=6zPvsMrcq/da71Hbs0K3EoyDvbKriRqVsR5bhLLAghA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b5Vno6IWTGLMHCmKPy1aHY4jhmzKis+YUFADZBUSgfhDKhCLTGDCEt+RcUchfNM9W
	 d1wI1mCQEPRHKcF0abwfMugsvSiZuKG9mudUnhElS1SwMlRBBt1ctW5R4XPAOCveE6
	 iRdXt2eByqqSiDqZbFlsiuWpetRQnuK+fZAL1mNQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30439F8063C;
	Wed, 15 Mar 2023 16:08:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C14BF805C3; Wed, 15 Mar 2023 16:08:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A981AF80423
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A981AF80423
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-00076q-D7; Wed, 15 Mar 2023 16:08:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-004KUQ-5J; Wed, 15 Mar 2023 16:08:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-0057ch-F2; Wed, 15 Mar 2023 16:07:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 014/173] ASoC: adi: axi-spdif: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:06 +0100
Message-Id: <20230315150745.67084-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=6zPvsMrcq/da71Hbs0K3EoyDvbKriRqVsR5bhLLAghA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1Rjet2r5whUVY6cIZCKKba/qZqYfbVn4iAL
 t0qpCFZA+2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdUQAKCRDB/BR4rcrs
 Ca2EB/0XysJBXVYKRCpWP8K2jDXo/fMFP0BEN0e6HBZ2nH9iuaeYSOOhkErhrLMhsyBZoFF7k8C
 lySTgWuPJ3yZr6u7QvxnR6wmp3+PVqqQC4ED6Ywvm4WHvRVsFTB724+vBGxMhGFOdW8ckrPITI5
 FE5v7Zm6pTYoYghP/wB0w2RJ5BIlCPwjJ6AWsX/ICO4nd8PoA2FhN0njtuIuCPj3LHGtD9F+Z7z
 ZOApwWpdG1m5dzEw0jdXxj8pEH2MFvKQVjWqyWY7km89Ab82mf9c9ScdXTU3mh3a3881u7xjodw
 62WGzuMooeROxEE2F8B1qapmVpW+7lWgs02GaMGbyX9jTpLu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: H6Z4WKH6MP7BGT4G5G6VVKPAGCYKYNG3
X-Message-ID-Hash: H6Z4WKH6MP7BGT4G5G6VVKPAGCYKYNG3
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
Archived-At: <>
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
 sound/soc/adi/axi-spdif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index 51b968ea21da..e4c99bbc9cdd 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -239,13 +239,11 @@ static int axi_spdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int axi_spdif_dev_remove(struct platform_device *pdev)
+static void axi_spdif_dev_remove(struct platform_device *pdev)
 {
 	struct axi_spdif *spdif = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(spdif->clk);
-
-	return 0;
 }
 
 static const struct of_device_id axi_spdif_of_match[] = {
@@ -260,7 +258,7 @@ static struct platform_driver axi_spdif_driver = {
 		.of_match_table = axi_spdif_of_match,
 	},
 	.probe = axi_spdif_probe,
-	.remove = axi_spdif_dev_remove,
+	.remove_new = axi_spdif_dev_remove,
 };
 module_platform_driver(axi_spdif_driver);
 
-- 
2.39.2

