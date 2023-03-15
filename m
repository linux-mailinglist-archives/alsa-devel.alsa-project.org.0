Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A86BB77B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9F712FA;
	Wed, 15 Mar 2023 16:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9F712FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893660;
	bh=vVhfKYChdGCpFoV8VXoZDbmT40JDxWXqp+ADtV9wJyg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mv5ZAEcXuLQMvLw4cp6RYhUg6AqAwAvo485MQDYE058qUA7BUPjXjKtLO/Mpyf/w4
	 4zXTbHJz2WxIeyEPgK5vesf7SwymaEi01a/STTwoGkv2dqsag/K6kY3bp3R9ufJlKp
	 oiNYWXCDN+8x+ZY5fIkJ5lmAekb41d0x6h+ThyHQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A5EF80624;
	Wed, 15 Mar 2023 16:11:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 678E2F80589; Wed, 15 Mar 2023 16:09:00 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BC72F8058C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC72F8058C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0007V4-Qz; Wed, 15 Mar 2023 16:08:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-004KXO-UG; Wed, 15 Mar 2023 16:08:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0057ez-7c; Wed, 15 Mar 2023 16:08:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 049/173] ASoC: codecs: lpass-rx-macro: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:41 +0100
Message-Id: <20230315150745.67084-50-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vVhfKYChdGCpFoV8VXoZDbmT40JDxWXqp+ADtV9wJyg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd261Dtpx4y4uMJt9VRAdaq/Cwj3PAEuvCP4E
 Xx6kk2FzU2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdugAKCRDB/BR4rcrs
 CRxNB/9n9hOfbGKJv7Nlk/mA1raV+A3+dA0VorP057qctps1egGvJX96qUvHq18LheZB+UlsaPw
 pVRVv4ICylNfQTIcGnCIwzqoph0wDVa1O1ukV06gxFW+HWOuQHB2PTSWzGZYKQilpD3s0z8FhpB
 +m/WTDSOKbcr1r9X4yU4Dl1VJiLneYK3QkSmOwoxEEagDjIhzBGVNUJBgseYKvcuRLIdCAfWz7o
 vaor693vxiS5TeBtTBdRMyCzSaD67fHAIjSh5nQsHIr8qgTcN2rtzKyee1sGpSu1DxOo0R8mEJv
 Ac40ZkT+jPFTgDaUFM+5Ci39MuWp9AdkcPpCx+pW5IOmEB9a
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: CAISTKNQGZM2A3G4ML6XC64C4PBQCXGT
X-Message-ID-Hash: CAISTKNQGZM2A3G4ML6XC64C4PBQCXGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAISTKNQGZM2A3G4ML6XC64C4PBQCXGT/>
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
 sound/soc/codecs/lpass-rx-macro.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a73a7d7a1c0a..9e0a4e8a46c3 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3639,7 +3639,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rx_macro_remove(struct platform_device *pdev)
+static void rx_macro_remove(struct platform_device *pdev)
 {
 	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
 
@@ -3650,8 +3650,6 @@ static int rx_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 
 	lpass_macro_pds_exit(rx->pds);
-
-	return 0;
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {
@@ -3723,7 +3721,7 @@ static struct platform_driver rx_macro_driver = {
 		.pm = &rx_macro_pm_ops,
 	},
 	.probe = rx_macro_probe,
-	.remove = rx_macro_remove,
+	.remove_new = rx_macro_remove,
 };
 
 module_platform_driver(rx_macro_driver);
-- 
2.39.2

