Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B76BB7E9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:34:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE40513D9;
	Wed, 15 Mar 2023 16:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE40513D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894453;
	bh=ZdN5klOvP29SLEvL9BI/I7KMW66b93lMlx6fT9RACus=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F9vEfETlcEvF9H5nl6ajsQpcrvh3jBpMXdXpPh86agFA6zWwiiL/16/vwl8FcNveW
	 sKu7afIZUCAHGeb0HZhOx9y5+mtv/ZWZctzSY25O2m9jdDWG9RmB0hatU2wsP3PThq
	 S24Na1eyL9mzCnE3NkjQ0yDlpFs9RehtF4J0McBY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5544CF8076C;
	Wed, 15 Mar 2023 16:13:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1530DF805E0; Wed, 15 Mar 2023 16:09:53 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 66CCBF805ED
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CCBF805ED
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjr-00005m-Q3; Wed, 15 Mar 2023 16:08:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-004Kcq-RU; Wed, 15 Mar 2023 16:08:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0057jV-3h; Wed, 15 Mar 2023 16:08:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 119/173] ASoC: rockchip: rockchip_i2s: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:51 +0100
Message-Id: <20230315150745.67084-120-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZdN5klOvP29SLEvL9BI/I7KMW66b93lMlx6fT9RACus=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6WemVdfuqwbUAkWKuntINDcKvOWrL0cEGeh
 Ee6iAGfQPSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHelgAKCRDB/BR4rcrs
 CaTSB/wPuI/OBYaVHWcxJ5VpT8HzmX3sG7MAiLtlNlaP8Gah5scZSqJIjLXeQoozOA6b1hw5UTd
 1oeX1fwtgbNYA82yxbZIVJQvvW4B3Sm97gxcvMSK8aLqarRHoirRyne4rdXICNMfT53gz71pOdq
 rYd3kD8W+3dYQNNmeDA5CuuZkitBGjI3SCJ7Gvsbdzw8/WwFjtvpc0vfWXsj7D3RSJ0K2d5LRTr
 +rZZkAsCF3vNrK4faLodDCmDwc1wm5j+5trYuTY79cJfPjsmT/Y1DhYciinZW0BcfIFuOULvmjc
 bf5y/CgQVty7SW3fbWfS9bnNnu6vMkUWVNbRXeLw5pZkJpD1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: QFMOEJ7SOEFFIPZTMAD3AYPCJCISILNB
X-Message-ID-Hash: QFMOEJ7SOEFFIPZTMAD3AYPCJCISILNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFMOEJ7SOEFFIPZTMAD3AYPCJCISILNB/>
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
 sound/soc/rockchip/rockchip_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index a8758ad68442..79abec24a5a2 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -850,7 +850,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_i2s_remove(struct platform_device *pdev)
+static void rockchip_i2s_remove(struct platform_device *pdev)
 {
 	struct rk_i2s_dev *i2s = dev_get_drvdata(&pdev->dev);
 
@@ -859,8 +859,6 @@ static int rockchip_i2s_remove(struct platform_device *pdev)
 		i2s_runtime_suspend(&pdev->dev);
 
 	clk_disable_unprepare(i2s->hclk);
-
-	return 0;
 }
 
 static const struct dev_pm_ops rockchip_i2s_pm_ops = {
@@ -870,7 +868,7 @@ static const struct dev_pm_ops rockchip_i2s_pm_ops = {
 
 static struct platform_driver rockchip_i2s_driver = {
 	.probe = rockchip_i2s_probe,
-	.remove = rockchip_i2s_remove,
+	.remove_new = rockchip_i2s_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_match),
-- 
2.39.2

