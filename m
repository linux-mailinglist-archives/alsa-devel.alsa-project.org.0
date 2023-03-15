Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC96BB855
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A025F14CE;
	Wed, 15 Mar 2023 16:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A025F14CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895161;
	bh=ujWcgrFi4KsfS0xBsaORvQfzou45iwq4W+cZLZtf78I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VGFekNcp1spIImgZit70xPAcFDeVe3vfmmFC3cZT8nl+V5EH8rcTMYzcIspjO3gpJ
	 E7BdqkqgCA6Tnq0K3+iIy5uXH8H0v23tMX72UqHTmAngmzaN6wrKkfobZwIANgZkkZ
	 M4BHtOGaUt5rn4bNEgs8wKBf6N5hG9UUN2FnbCGY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C9EF89610;
	Wed, 15 Mar 2023 16:15:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F6D0F8060A; Wed, 15 Mar 2023 16:10:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E5FFF8061C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E5FFF8061C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjz-0000T0-0H; Wed, 15 Mar 2023 16:08:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-004KfF-Gi; Wed, 15 Mar 2023 16:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-0057lN-NA; Wed, 15 Mar 2023 16:08:29 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 149/173] ASoC: tegra: tegra210_admaif: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:07:21 +0100
Message-Id: <20230315150745.67084-150-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ujWcgrFi4KsfS0xBsaORvQfzou45iwq4W+cZLZtf78I=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7zfKFWA/MI8S/6DYDfM73PmC+sJKgaxQAp1
 5SsaCfBxTqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe8wAKCRDB/BR4rcrs
 CSrXB/9omCqig4IrymQlP9lYUouO557lutd98YgbA638LQIkPPUnUxmG0yWK8DmBOpLKfo2UR48
 ApCKH4dxYuiLK2NKEwp7kaVNw5SV0+PNoApSAaM8UzR68DB5bwLnZyistaUYxLmv9QGuzFXHpEL
 Nd1pHbYtPkhHCwrVwFVJJmzdf0fCAh5+HCVKh+zEtDD8sj7hX++4+QSS3fVI09oOw2ADPnVBol9
 2vf203kECPuZtENKZH9hYcpNJMCcqWD/1ls95F2s1S5TPzrb6LibsLkeX/FfVAu9fE0Q/3ci08B
 VO5dXsqh8MPWmeRnMQc3n5TZY5+D+oBALR2PlWskoRzMM7RU
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: PFUVVUIKAA6ZTMAAPXDMNYOEDOQX5IZD
X-Message-ID-Hash: PFUVVUIKAA6ZTMAAPXDMNYOEDOQX5IZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFUVVUIKAA6ZTMAAPXDMNYOEDOQX5IZD/>
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
 sound/soc/tegra/tegra210_admaif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 100a2b6e6063..6868508585a0 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -842,11 +842,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_admaif_remove(struct platform_device *pdev)
+static void tegra_admaif_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra_admaif_pm_ops = {
@@ -858,7 +856,7 @@ static const struct dev_pm_ops tegra_admaif_pm_ops = {
 
 static struct platform_driver tegra_admaif_driver = {
 	.probe = tegra_admaif_probe,
-	.remove = tegra_admaif_remove,
+	.remove_new = tegra_admaif_remove,
 	.driver = {
 		.name = "tegra210-admaif",
 		.of_match_table = tegra_admaif_of_match,
-- 
2.39.2

