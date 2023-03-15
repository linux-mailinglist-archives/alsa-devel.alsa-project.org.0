Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551C36BB787
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:22:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB20212B8;
	Wed, 15 Mar 2023 16:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB20212B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893739;
	bh=ueRLfq7zDXFW2TvGzuKTVn84yuV4EQj5F21mMX8Xhlo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JSjCtRyScZXy2FsMCL+FwVLeuFU62Jzsul34FK5jQxM1BWI1+N/BPkBq9srC7ltiu
	 xRrhqiXBYY0Tig05sihTp9XGRtFyXGv0255B31Xufc4yxR8xiebMEbjCRLHpXPZgEZ
	 MKp65j092Y7JKFeSIIYvsYW3DkclPCPkNjeybY8E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB93F80673;
	Wed, 15 Mar 2023 16:11:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF9ADF80651; Wed, 15 Mar 2023 16:09:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 98F93F805A8
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98F93F805A8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0007Z7-99; Wed, 15 Mar 2023 16:08:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-004KY0-F0; Wed, 15 Mar 2023 16:08:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjY-0057fI-Af; Wed, 15 Mar 2023 16:08:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 054/173] ASoC: codecs: msm8916-wcd-digital: Convert to
 platform remove callback returning void
Date: Wed, 15 Mar 2023 16:05:46 +0100
Message-Id: <20230315150745.67084-55-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ueRLfq7zDXFW2TvGzuKTVn84yuV4EQj5F21mMX8Xhlo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3KpYRkZhznXZ6/UqWo5z1KlgkQE1IOOO3CJ
 lea/WxNxLGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdygAKCRDB/BR4rcrs
 CR/qB/9nMoBeLOdKBbsSfq07OGCTovI6ibuFVXajf60uCyYO058OpKcAhhbkJ3eW6Xk5o+qr+jh
 5FNCp2Lc2T5rKH/UKbkcK4JGSqrg96oZ8bfXMGQTkgVSv76inlEPXuW09epgWdU648/UoC12HfL
 AK7kbY8Ug2Sv38CZxoC6gmZ/Iy4EO12VUaA5Nbpt8mYKWCsWh4kIsZReXz5tkE5pShLoEZBTtZR
 0NiqtkZT+6TsrV7VFRiaZKcriLihXeel4iuKBMd+9ckWuZw7IZorFiyKbnYN3fgeAZTkiAEYepU
 LUhxfTQ8JNC9APkBLa7XXmnwfhQU9OW7D5PxaWZ3ZCV1PkAu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: JH2OVJY225WYNIRADZL44LWIASUZSMO7
X-Message-ID-Hash: JH2OVJY225WYNIRADZL44LWIASUZSMO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JH2OVJY225WYNIRADZL44LWIASUZSMO7/>
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
 sound/soc/codecs/msm8916-wcd-digital.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index d490a0f18675..978c4d056e81 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -1220,14 +1220,12 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int msm8916_wcd_digital_remove(struct platform_device *pdev)
+static void msm8916_wcd_digital_remove(struct platform_device *pdev)
 {
 	struct msm8916_wcd_digital_priv *priv = dev_get_drvdata(&pdev->dev);
 
 	clk_disable_unprepare(priv->mclk);
 	clk_disable_unprepare(priv->ahbclk);
-
-	return 0;
 }
 
 static const struct of_device_id msm8916_wcd_digital_match_table[] = {
@@ -1243,7 +1241,7 @@ static struct platform_driver msm8916_wcd_digital_driver = {
 		   .of_match_table = msm8916_wcd_digital_match_table,
 	},
 	.probe = msm8916_wcd_digital_probe,
-	.remove = msm8916_wcd_digital_remove,
+	.remove_new = msm8916_wcd_digital_remove,
 };
 
 module_platform_driver(msm8916_wcd_digital_driver);
-- 
2.39.2

