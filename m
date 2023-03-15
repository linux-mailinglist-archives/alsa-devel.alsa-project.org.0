Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301566BB771
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:19:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A51B128D;
	Wed, 15 Mar 2023 16:18:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A51B128D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893583;
	bh=NzNDm/HojukvVqZFqRi5AV29oj3+cF2D9GfAu+OQLyU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cg4JuXfqfBlse8g2NQ6WzC6AFR+POI3bSTJHP3bnDwJjx80OCKYHJx3/klUyZ4d0O
	 TttiEe3UxY0IeisXFCcky7v0O1NT1pIAuJe2Wr6WAw6N2cVzhRrRdXkkxEVY8RdON/
	 5yWlgvVRLWsgh96UYp8FJWtkh6hRBdw3fehwjkz8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B90F80620;
	Wed, 15 Mar 2023 16:10:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F38FF80651; Wed, 15 Mar 2023 16:08:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B89F8057B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B89F8057B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0007Vl-W9; Wed, 15 Mar 2023 16:08:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-004KXZ-Bd; Wed, 15 Mar 2023 16:08:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0057f6-LX; Wed, 15 Mar 2023 16:08:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 051/173] ASoC: codecs: lpass-va-macro: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:43 +0100
Message-Id: <20230315150745.67084-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=NzNDm/HojukvVqZFqRi5AV29oj3+cF2D9GfAu+OQLyU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3ABWfMOyarl2u4EcT06HoSow/WP20EIrIQ8
 JKbbr4644+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdwAAKCRDB/BR4rcrs
 CSx5CACHonlMiasUul/4T3O4Hg2D3CT8c3cqts0I38Ok3TMXDHi6NhJzP8f1PCU3RYokizXYEAG
 56MUVp79IedUbDNYtfEwau+dUh5ix9Cxhf5ec6l3tVfStGBhc+iCgvvY5NFqha38kt5Nd/zyQpX
 10i0o8ZB/JBQJ6uY/HJvyVuj5dpkiFwT4emUCp7lnjcWScHGY2FUTNkSVhM9v3C2/L1ba40usXn
 NWpPZlVsA588BqZLPpA9pcDOg4nt+EPXAnAaYUrUKWGqzHomijhFhIU0USB4WGdFaRGUIyF1Wp9
 sJYoF6mW67KdYFqCCawRn3YdWHiY1NlIUwxFOsjbnKkSWy1S
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 2YISMIAG6XCWMLBXFERBHENJSYFAKZQ5
X-Message-ID-Hash: 2YISMIAG6XCWMLBXFERBHENJSYFAKZQ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YISMIAG6XCWMLBXFERBHENJSYFAKZQ5/>
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
 sound/soc/codecs/lpass-va-macro.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index fd62817d29a0..74724448da50 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1575,7 +1575,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int va_macro_remove(struct platform_device *pdev)
+static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
@@ -1584,8 +1584,6 @@ static int va_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(va->macro);
 
 	lpass_macro_pds_exit(va->pds);
-
-	return 0;
 }
 
 static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
@@ -1639,7 +1637,7 @@ static struct platform_driver va_macro_driver = {
 		.pm = &va_macro_pm_ops,
 	},
 	.probe = va_macro_probe,
-	.remove = va_macro_remove,
+	.remove_new = va_macro_remove,
 };
 
 module_platform_driver(va_macro_driver);
-- 
2.39.2

