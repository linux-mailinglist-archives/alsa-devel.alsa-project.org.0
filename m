Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D816BB872
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:51:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20DE152C;
	Wed, 15 Mar 2023 16:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20DE152C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895464;
	bh=XMeII0RdOtxphRzHkvGSDdSw/5DkBBmHMFgBoQlWdIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a/5LPJ+apTtTGwoIP0YM0FyMulwK4sLIxg7g3ef9fdUQGrwGsoygB+GChlPO0dZd8
	 qigji7eWWfWyPxFxcsJ3bzqRFedUpb370BAuZB/Z/FGpBpCXtMg3MW9iaVzs3XSjHR
	 04eQWzr552Zdauskn7Rr86ZE8Dahu2OjVl89+ShM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D65F896F6;
	Wed, 15 Mar 2023 16:17:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B136F8061D; Wed, 15 Mar 2023 16:10:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 85527F80635
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85527F80635
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000Nt-07; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Kee-9j; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-0057ks-2i; Wed, 15 Mar 2023 16:08:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 141/173] ASoC: sunxi: sun4i-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:13 +0100
Message-Id: <20230315150745.67084-142-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=XMeII0RdOtxphRzHkvGSDdSw/5DkBBmHMFgBoQlWdIQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7a1nCZFs0/sRGiRjaH/NOEtQWa5LWd/3AGq
 apgzANfQKiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe2gAKCRDB/BR4rcrs
 CRUZCACV6EGN0CLlFZ2zP5JJe31vt6VGTy0FlY+8oe2S4EmZGkEU6zDyAUCjhKhj1Bn5Y71d4xU
 kq+DIVA6hRcI2UUB2WL4tRIP3qtMpPVslKt4HcLiu8zu7RatUAx+2jZncEIZl7pDC0LjT9KwyO6
 /j9Jllzj5lCp96Miw/etWOFlIpBq7qmu0oaYTq8JA5N8WGF55GnuSx+ezsnOPRSSHzqaYg3KIBh
 CREh28dwdeG6ZackuHdX7menpCJWLdLYUo5AvUGoN4K8LleXRvYEbGDgYcqb+qu8+VjAAddeZNN
 OXZ8c0EYjGUBlNMmVkveG9qBrzS/rLuDuDeocEnZ/5Aqf5gS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: BLJRTCOQZQ72KBZMRAZUS7ZQU2EAES2Y
X-Message-ID-Hash: BLJRTCOQZQ72KBZMRAZUS7ZQU2EAES2Y
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLJRTCOQZQ72KBZMRAZUS7ZQU2EAES2Y/>
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
 sound/soc/sunxi/sun4i-i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 6028871825ba..669d712bbe9f 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1606,7 +1606,7 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int sun4i_i2s_remove(struct platform_device *pdev)
+static void sun4i_i2s_remove(struct platform_device *pdev)
 {
 	struct sun4i_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
@@ -1616,8 +1616,6 @@ static int sun4i_i2s_remove(struct platform_device *pdev)
 
 	if (!IS_ERR(i2s->rst))
 		reset_control_assert(i2s->rst);
-
-	return 0;
 }
 
 static const struct of_device_id sun4i_i2s_match[] = {
@@ -1660,7 +1658,7 @@ static const struct dev_pm_ops sun4i_i2s_pm_ops = {
 
 static struct platform_driver sun4i_i2s_driver = {
 	.probe	= sun4i_i2s_probe,
-	.remove	= sun4i_i2s_remove,
+	.remove_new = sun4i_i2s_remove,
 	.driver	= {
 		.name		= "sun4i-i2s",
 		.of_match_table	= sun4i_i2s_match,
-- 
2.39.2

