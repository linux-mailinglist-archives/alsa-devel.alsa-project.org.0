Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 670076BB808
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9105A1342;
	Wed, 15 Mar 2023 16:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9105A1342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894640;
	bh=bxa7oqwO4CDIhDDV/+gTG3tBSwdbzGBsmosnfqeoLaY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HANBasIfrhD3zTXNGFikcw1Tx/EEnFDYSHt3ZAbHACs8Fgoyg6OCRxmLoir2tFcTu
	 55GeiJRfLNcQekLB8EwFVzQrTvE3VAVOVEVvI0bjTIdj0quiGzYwQnZYnDimDpgkvQ
	 i2BeB5fESkf90xxpYWCjRoznMH/HDzLp9xpisrL4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C20D4F80804;
	Wed, 15 Mar 2023 16:14:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC88CF805E3; Wed, 15 Mar 2023 16:10:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 28217F805F9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28217F805F9
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-00006b-1H; Wed, 15 Mar 2023 16:08:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-004Kcw-41; Wed, 15 Mar 2023 16:08:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0057jY-Ai; Wed, 15 Mar 2023 16:08:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 120/173] ASoC: rockchip: rockchip_i2s_tdm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:52 +0100
Message-Id: <20230315150745.67084-121-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=bxa7oqwO4CDIhDDV/+gTG3tBSwdbzGBsmosnfqeoLaY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6ZppXe7kh2gT9GFFh7N7KCNurmQRJeuc3hj
 khN4tvLC2+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHemQAKCRDB/BR4rcrs
 CVFWCACTvskd6CjuJJv2mGvB9WqemBva4WyJup6JkKzyHHI46MtxXK88Bc7BFV5bVq69hoDHJf6
 apmLfll3+uSPFXjUEKXaHdW5ukGDAt1ErmVqS/vL6FilGrO48SyZfoSVQN6SL8uXNQDel0xhIHw
 qlhhmFZGfA8voisLJW9yrtkKjCWvAloPIyKz+McWBhx+arOCz3DKgBSlHnbrfycWXQfMXG4rdXN
 5tAuDANryH93tW7a3ou2SvlGSjidmcwY0lIa+YqD/sn0vMaRWOBR6LEe416MWEXyYRTwS66RR74
 a+mo7CofdSC1h/MV/UdOkft3HR6TAPvxOd8yfTMEhzukQFIg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: Z5I7FC22IWGC72BW2EHZTQ7UW2DSYX2Y
X-Message-ID-Hash: Z5I7FC22IWGC72BW2EHZTQ7UW2DSYX2Y
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5I7FC22IWGC72BW2EHZTQ7UW2DSYX2Y/>
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
 sound/soc/rockchip/rockchip_i2s_tdm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 166257c6ae14..c2e9fd5ab05e 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1722,14 +1722,12 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
+static void rockchip_i2s_tdm_remove(struct platform_device *pdev)
 {
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		i2s_tdm_runtime_suspend(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused rockchip_i2s_tdm_suspend(struct device *dev)
@@ -1764,7 +1762,7 @@ static const struct dev_pm_ops rockchip_i2s_tdm_pm_ops = {
 
 static struct platform_driver rockchip_i2s_tdm_driver = {
 	.probe = rockchip_i2s_tdm_probe,
-	.remove = rockchip_i2s_tdm_remove,
+	.remove_new = rockchip_i2s_tdm_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_tdm_match),
-- 
2.39.2

