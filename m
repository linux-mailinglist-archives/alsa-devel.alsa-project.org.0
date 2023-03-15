Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C439A6BB7F5
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:35:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E30B13B7;
	Wed, 15 Mar 2023 16:34:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E30B13B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894531;
	bh=rlWaemh5g1rU89YQHf9WoIxkHz6iNm5nKoRUg8ayQWU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IMXtdPaUOxqQq6oTGLoZlCeUhKdUSjPq29ca5glF/PaZPDdFY6GeL5Z4Z4Go6yuzN
	 CA2Jsf70OeYRdx2QbhqibNBcGvRo7fEY2MQrnua2sYVGP5AhPgLHhDzM5Nq8EJsWPP
	 mVgt9iIknGdgNQJUz10Ore6BtbWd7OMkNMEpxXzM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E590EF805B3;
	Wed, 15 Mar 2023 16:13:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D477F805E2; Wed, 15 Mar 2023 16:09:57 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 59F5CF8051B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F5CF8051B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-00008j-Gl; Wed, 15 Mar 2023 16:08:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-004KdB-K2; Wed, 15 Mar 2023 16:08:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0057jl-1Z; Wed, 15 Mar 2023 16:08:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 123/173] ASoC: rockchip: rockchip_spdif: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:55 +0100
Message-Id: <20230315150745.67084-124-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=rlWaemh5g1rU89YQHf9WoIxkHz6iNm5nKoRUg8ayQWU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6iN/f1A+POuc00eAzNx+MicdH5YwPwIHzDF
 fnYJxlQM+qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeogAKCRDB/BR4rcrs
 CWCaB/9ZFn64nRSnQ7vzabp6712lwI3s6X0NLJKZD5OP+GPLprl/YMMK/KksxgLBIh9XzWdr/+2
 7dlGddyyvmsTKFVBmc006vaXoj/An8bywG82MJyN4sQ+FsSofM2KhUXakOF0aJRrwobi6dxLK65
 VUfLhskBlZye7NpnTDMD/AtwfFAVZeb1mXBujvPJxhvKIXd4lKZx1Gccfhv5e+u7unG78LYoJ64
 v8MzPA+ViWbkzym9jVSjti1dENGjnXDueup7SnyDmGpet4tfoFhTtbw2/J3EuyWmplu0Coh2k6B
 ybes8lR+RJNg9cGZ54EolMScG65aMldYl2kEsYkzdbMhhLVx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: OESJD5BLV2XPFH2P52K6FBWXOFN32PUZ
X-Message-ID-Hash: OESJD5BLV2XPFH2P52K6FBWXOFN32PUZ
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OESJD5BLV2XPFH2P52K6FBWXOFN32PUZ/>
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
 sound/soc/rockchip/rockchip_spdif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 2d937fcf357d..0b73fe94e4bb 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -367,13 +367,11 @@ static int rk_spdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rk_spdif_remove(struct platform_device *pdev)
+static void rk_spdif_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		rk_spdif_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops rk_spdif_pm_ops = {
@@ -383,7 +381,7 @@ static const struct dev_pm_ops rk_spdif_pm_ops = {
 
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
-	.remove = rk_spdif_remove,
+	.remove_new = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
 		.of_match_table = of_match_ptr(rk_spdif_match),
-- 
2.39.2

