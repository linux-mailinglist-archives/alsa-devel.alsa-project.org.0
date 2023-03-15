Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9AC6BB773
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4501232;
	Wed, 15 Mar 2023 16:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4501232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893602;
	bh=Y9/ywlnTgqNKTLchH8T9XAPtwQIwm194Y4H+j5YQEqc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cljG0yjsqITPFDRuMOB7Mu+BQ8wLk+SDQGkEFsIqcEIBbL88BCif/T2Aqtg78gTDM
	 93TSqEZ9azs8aIX1dQnU8YsiwaSfPA0vNjCX1NdeI2oEnT2KRpkdQgvSQeVeo/NxOf
	 d8VPi/A6AlTVp3AdQIDHDMtSpj7WaoFgOMNdJWlA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D591FF80578;
	Wed, 15 Mar 2023 16:10:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C07E0F8057F; Wed, 15 Mar 2023 16:08:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E7538F8057A
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7538F8057A
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjZ-0007Wq-Pb; Wed, 15 Mar 2023 16:08:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjZ-004KXm-3a; Wed, 15 Mar 2023 16:08:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0057fF-2i; Wed, 15 Mar 2023 16:08:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 053/173] ASoC: codecs: msm8916-wcd-analog: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:45 +0100
Message-Id: <20230315150745.67084-54-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Y9/ywlnTgqNKTLchH8T9XAPtwQIwm194Y4H+j5YQEqc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3GMS+x0EhcvYyueftmJmtkGa/n/BJ/3kCOW
 7aLKkqcYzqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdxgAKCRDB/BR4rcrs
 CctjB/46yz1Drz4KKqQIX1BwiyH3MwpBoqS8HCDYOLrfBhovuw6Di5AbEKAMpcrMkUCeNITRqAy
 0CamLjHar04n25/fK//SFoM16yTDJnEI5xEOeS1xyntN0EzlA6cc4HeC3ZgpRXQp1Dr54dzmxwv
 8XlDGfCG+UUrXtENyJxDhVO66ouPKAh//TOK9ujG3Ni2r8sdIn3XEwkB6uJKDTDU3g85jt42NDX
 dXQ63tnjX45nXuWryLBclwnsGOF7KJ3fTmN88D3VdT3lZOP1INlqFywf5ivfJJSYgGujkaqXtxj
 HxzyarxbOYUv5o82qfg0XKfyPK41KMDkhE1Pq1Tg8cBAuM9q
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ZEOFN4LNOP57DBG5HZMFYRW3X4XJRUX5
X-Message-ID-Hash: ZEOFN4LNOP57DBG5HZMFYRW3X4XJRUX5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEOFN4LNOP57DBG5HZMFYRW3X4XJRUX5/>
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
 sound/soc/codecs/msm8916-wcd-analog.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 78e543eb3c83..cec90cf920ff 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -1276,13 +1276,11 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pm8916_wcd_analog_spmi_remove(struct platform_device *pdev)
+static void pm8916_wcd_analog_spmi_remove(struct platform_device *pdev)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(&pdev->dev);
 
 	clk_disable_unprepare(priv->mclk);
-
-	return 0;
 }
 
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
@@ -1298,7 +1296,7 @@ static struct platform_driver pm8916_wcd_analog_spmi_driver = {
 		   .of_match_table = pm8916_wcd_analog_spmi_match_table,
 	},
 	.probe = pm8916_wcd_analog_spmi_probe,
-	.remove = pm8916_wcd_analog_spmi_remove,
+	.remove_new = pm8916_wcd_analog_spmi_remove,
 };
 
 module_platform_driver(pm8916_wcd_analog_spmi_driver);
-- 
2.39.2

