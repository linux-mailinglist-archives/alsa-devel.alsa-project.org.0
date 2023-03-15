Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E906BB86F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:50:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B72B14EB;
	Wed, 15 Mar 2023 16:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B72B14EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895431;
	bh=+PSIk5ytlBUkrF6SL8Drk1L0HNHB7Ho/Dh/SUxPwpUA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EZfbL7dSxnokE9TUOjBQReAMdrCDPPCAZ2RC5eNjzLrzC8haVxDkomy9mRbfTJE2U
	 fN8cbzKoI/hhcca6Mr6DfLFsl991wCJ3GYbaNX78MaGpU7w1193HOdPJRVz8XuKLA2
	 9EBtTdPsdQdMly/kNCzK1fqNHbh3EJOCI5brve/s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91CE5F8055C;
	Wed, 15 Mar 2023 16:17:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07CA6F8061C; Wed, 15 Mar 2023 16:10:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EB770F80634
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB770F80634
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjz-0000UO-JE; Wed, 15 Mar 2023 16:08:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-004KfN-T2; Wed, 15 Mar 2023 16:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-0057lZ-4W; Wed, 15 Mar 2023 16:08:30 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 151/173] ASoC: tegra: tegra210_ahub: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:07:23 +0100
Message-Id: <20230315150745.67084-152-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=+PSIk5ytlBUkrF6SL8Drk1L0HNHB7Ho/Dh/SUxPwpUA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd75ftcPaSuLnJ9+1IvdMR8p4/+b9/mO5BFmr
 MosQaXvBV+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe+QAKCRDB/BR4rcrs
 CYBJB/wOwkLOw2nY3YYlL5u79nTvlbUZeyEVcksJX5FegoYVbEcVdRnQPGTMMC3Uw2724XPIZQg
 lrXSvMMaWx5OueJthb4/iP4HYesWanIw6vGV8WoJ4iN/ZSwRJhUP54uKg2q63EX4yO++JNnaBct
 6cby1DXBd3ayURnhXPI+rW97LOK1pWt+dsX39ZRoY4V7zlQwIYdoNBpI6O9kRnFy0VDXoefI8Aw
 uP0nIbZbB6oXdbCfvmRyzMvRQHQ7hO6WkhTnShQOalB1ZVd1Z+VMhg3rjWZBx2PEADF61zANOIw
 cbV9Sdajns9et19G1kH998oQ3wlFqAgA6OzU3uUjH49dJJu0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: PBQVPS4LNTAJVNFLIN2UR4TCMXEX2IIQ
X-Message-ID-Hash: PBQVPS4LNTAJVNFLIN2UR4TCMXEX2IIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBQVPS4LNTAJVNFLIN2UR4TCMXEX2IIQ/>
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
 sound/soc/tegra/tegra210_ahub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index b38d205b69cc..8c00c09eeefb 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -1410,11 +1410,9 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_ahub_remove(struct platform_device *pdev)
+static void tegra_ahub_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra_ahub_pm_ops = {
@@ -1426,7 +1424,7 @@ static const struct dev_pm_ops tegra_ahub_pm_ops = {
 
 static struct platform_driver tegra_ahub_driver = {
 	.probe = tegra_ahub_probe,
-	.remove = tegra_ahub_remove,
+	.remove_new = tegra_ahub_remove,
 	.driver = {
 		.name = "tegra210-ahub",
 		.of_match_table = tegra_ahub_of_match,
-- 
2.39.2

