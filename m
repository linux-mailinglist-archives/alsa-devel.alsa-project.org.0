Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AE6BB7E4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:33:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F96113D1;
	Wed, 15 Mar 2023 16:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F96113D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894386;
	bh=YPO4VR6mwV6Uj6GEU4R+EW+Lyni9vsTb3MHMAInqoV8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DG1LEkm5QOwGvIlhkEsrMh/SJMbcvD17rOuL/iNkmUvzmrn223sEB4qzifnM2MoYV
	 zUkI8PNmI0b7m5cxu4cMa/CNtW4DETGFxwpwNYIUuO9JwnWBuEMcWvmKCga0PwVlsm
	 c7gLGZcTBvc/ka9C+C+K1lKuKv65UK6Zan1dUY44=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C685F8074E;
	Wed, 15 Mar 2023 16:13:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A13FF805D8; Wed, 15 Mar 2023 16:09:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 867CBF805E3
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867CBF805E3
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-00086u-NL; Wed, 15 Mar 2023 16:08:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-004KaS-4q; Wed, 15 Mar 2023 16:08:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-0057hV-5u; Wed, 15 Mar 2023 16:08:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Minghao Chi <chi.minghao@zte.com.cn>
Subject: [PATCH 088/173] ASoC: img: img-parallel-out: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:20 +0100
Message-Id: <20230315150745.67084-89-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=YPO4VR6mwV6Uj6GEU4R+EW+Lyni9vsTb3MHMAInqoV8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd41JqjwKyXKeAh7wqoKU/c0+FdnbjKHRfkLT
 hu9d2/mZ5yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeNQAKCRDB/BR4rcrs
 CXWEB/wMH4UV6WqSFTFcCiTl6rXeWmQVPOShqRcXkVnM9VqgOiEevzE15BvnGVK673v9Zcot0Ig
 9lZzd3CRMyKIQgKQYAdLPVNIyDJ7K02oksvgZ/SLuG4GtJkXeXGPwfoyLcZ/rwNGDHKFjsYcY+I
 41A1A89AhxHFerkWQ+WwOh+5+jO0RZJE+9Ir4HBMxajhJqVmeM7Y5QAwUsJkISWb4wMZROE67bX
 rMubKhLpTPlpB6FNtqNsqizkVBVufZufobxVdyVTv4+fd7vK11oiD+G/NiHw5bh7bTLJ96P17cl
 aWB79V8MJv26kc+uqTDfAs/rf+ryL5cC6ioDGhpGNXc0IQQP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: OXTQP6MOFHBXHOD3CABLNFNSMN4IO3CS
X-Message-ID-Hash: OXTQP6MOFHBXHOD3CABLNFNSMN4IO3CS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXTQP6MOFHBXHOD3CABLNFNSMN4IO3CS/>
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
 sound/soc/img/img-parallel-out.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 08506b05e226..df1291ee2b3b 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -282,7 +282,7 @@ static int img_prl_out_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int img_prl_out_dev_remove(struct platform_device *pdev)
+static void img_prl_out_dev_remove(struct platform_device *pdev)
 {
 	struct img_prl_out *prl = platform_get_drvdata(pdev);
 
@@ -291,8 +291,6 @@ static int img_prl_out_dev_remove(struct platform_device *pdev)
 		img_prl_out_suspend(&pdev->dev);
 
 	clk_disable_unprepare(prl->clk_sys);
-
-	return 0;
 }
 
 static const struct of_device_id img_prl_out_of_match[] = {
@@ -313,7 +311,7 @@ static struct platform_driver img_prl_out_driver = {
 		.pm = &img_prl_out_pm_ops
 	},
 	.probe = img_prl_out_probe,
-	.remove = img_prl_out_dev_remove
+	.remove_new = img_prl_out_dev_remove
 };
 module_platform_driver(img_prl_out_driver);
 
-- 
2.39.2

