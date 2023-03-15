Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6166BB7EF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EA61434;
	Wed, 15 Mar 2023 16:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EA61434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894512;
	bh=R5sAzYAeAz7UmVg6PWNYIucRjNJbrP/w9lKFt0p3Gao=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dNGoL6XeVfFDKbr3NPn8mJpmxMCida4zpWWLhU/qJHZBNePPzNstKOGrfSElybeFl
	 TDkU3UV5Fdt3pMgXSbg+A9KFGO49msqTLcaHEEXV5yi06kPRh695yCaOSt3fyxId+R
	 hx1e3MVmLYz30mc4oRuZoTx5/Z+FmA0Fcrrl5OHM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ECA4F80799;
	Wed, 15 Mar 2023 16:13:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62EC2F805E2; Wed, 15 Mar 2023 16:09:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AA9F1F805F2
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9F1F805F2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-00007Q-4u; Wed, 15 Mar 2023 16:08:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-004Kd1-AZ; Wed, 15 Mar 2023 16:08:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0057jc-I9; Wed, 15 Mar 2023 16:08:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 121/173] ASoC: rockchip: rockchip_pdm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:53 +0100
Message-Id: <20230315150745.67084-122-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=R5sAzYAeAz7UmVg6PWNYIucRjNJbrP/w9lKFt0p3Gao=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6crhdW9NWhoT42/vTOyQdYigF3pALKqxNJZ
 NnN8gf0oa2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHenAAKCRDB/BR4rcrs
 CV7VCACHC9Ttbsh6xSWGAbxwntOXecBcaQjBkMc+v9ENniX5X74SoujiSvdBudMwghC86tHV5C3
 tr05oIw5rG8NeXZHzqOlb/y7yA2nZteiJ4rWuIw+lPd4yDUv7RmoLBkRxLR7zEBGDZ1sNRYLpTn
 pxJbp1t7rcq2VH7B79ECp1RkfGQNh9TNHa6XwPok8V4JkeBjdC5PwgCm7+cCQO+kr7ymvPu1lCI
 SzjfUgMw+Qvdvy6DjywJGNZiuixU4Uf0cR/48lqXGg17/f2FUW6S9ivskE1q2uKdR7Q+uunGdIz
 4Z6PHEEQZz3rXRMO3vUCWdLj16FbxabRrfglJPps6OPTc+WK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: EVH6E5HXQA62HG5D6SLS74QRT64TXIDK
X-Message-ID-Hash: EVH6E5HXQA62HG5D6SLS74QRT64TXIDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVH6E5HXQA62HG5D6SLS74QRT64TXIDK/>
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
 sound/soc/rockchip/rockchip_pdm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 6ce92b1db790..52f9aae60be8 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -661,7 +661,7 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_pdm_remove(struct platform_device *pdev)
+static void rockchip_pdm_remove(struct platform_device *pdev)
 {
 	struct rk_pdm_dev *pdm = dev_get_drvdata(&pdev->dev);
 
@@ -671,8 +671,6 @@ static int rockchip_pdm_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(pdm->clk);
 	clk_disable_unprepare(pdm->hclk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -710,7 +708,7 @@ static const struct dev_pm_ops rockchip_pdm_pm_ops = {
 
 static struct platform_driver rockchip_pdm_driver = {
 	.probe  = rockchip_pdm_probe,
-	.remove = rockchip_pdm_remove,
+	.remove_new = rockchip_pdm_remove,
 	.driver = {
 		.name = "rockchip-pdm",
 		.of_match_table = of_match_ptr(rockchip_pdm_match),
-- 
2.39.2

