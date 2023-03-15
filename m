Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9876BB821
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296B61478;
	Wed, 15 Mar 2023 16:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296B61478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894863;
	bh=mkEA2aglVrZicYe+eAFWE7drEQFhyfBxx2S9b8QGsDI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMU5IinerMX2rFNEdbDGEgbWWy11B7gQC3Rq1+5saagVgf56lttIkbJ9mMXjX3AoM
	 2Z8qj5EGPl+lmSC2IPUsSIhhCu+3rDlZZCbpCidB0H5BNDUb/1te5uZ+4MqKKVI//T
	 RxtPQW+yIcn1RmSOMBAdtp/gPMZTwhtjbNGrUoDE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CE8DF80C0D;
	Wed, 15 Mar 2023 16:14:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5B6AF805AF; Wed, 15 Mar 2023 16:10:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BE8AF8060A
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE8AF8060A
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-0000Jh-Fi; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-004KeD-1G; Wed, 15 Mar 2023 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0057kY-Sm; Wed, 15 Mar 2023 16:08:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 136/173] ASoC: stm: stm32_adfsdm: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:08 +0100
Message-Id: <20230315150745.67084-137-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mkEA2aglVrZicYe+eAFWE7drEQFhyfBxx2S9b8QGsDI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7KrH18BKn6U5TdR0h99SdCYDXnSsCGZlZWO
 lXdTzExb5+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeygAKCRDB/BR4rcrs
 CeFlB/9b4zj1DMI0KekPjwfjO/6X4fGR4QmZVhy3RG441iQZTYXUUpIi56sqakT4hWfixMulfCZ
 jalr6IzIuLtLiNmrhi8ggcllJIbzLCK+PcacY5nAtScVQ062PbynwU5XuSE1ik1HXojBp5HctL/
 3jxkC2Zdm/z+4MDkd7dVimP18I6t/aFhTyRpNiBmVnKYLsiar4glu1Kw7DWt01Zin62trRg2O36
 EVI4aq1rx4wegyCh414DlUkHEG0VFrZZ0L9Lqi8F0ZNEsOQVQ2BnKn4mRGbY/8RCAXUg8g644BV
 uVA/weNz9A4wkcyKddy7+FamBZTsghFM8iSAXynFlZpiYDlD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: FMYXSG5BYRW76DIU7I72A6CFGZJWDD5G
X-Message-ID-Hash: FMYXSG5BYRW76DIU7I72A6CFGZJWDD5G
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMYXSG5BYRW76DIU7I72A6CFGZJWDD5G/>
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
 sound/soc/stm/stm32_adfsdm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 837c1848d9bf..a8fff7378641 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -386,12 +386,10 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm32_adfsdm_remove(struct platform_device *pdev)
+static void stm32_adfsdm_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_component(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static struct platform_driver stm32_adfsdm_driver = {
@@ -400,7 +398,7 @@ static struct platform_driver stm32_adfsdm_driver = {
 		   .of_match_table = stm32_adfsdm_of_match,
 		   },
 	.probe = stm32_adfsdm_probe,
-	.remove = stm32_adfsdm_remove,
+	.remove_new = stm32_adfsdm_remove,
 };
 
 module_platform_driver(stm32_adfsdm_driver);
-- 
2.39.2

