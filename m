Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E66BB72B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:11:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305BE1275;
	Wed, 15 Mar 2023 16:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305BE1275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893113;
	bh=ojZJhvg3lC1NvDLBuVBmrNfwZ+MPVa0jn+L9VKCrgsg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MJ8/44e18CkF4ftUrF0T6746yrHv3ZpHCdRVLtFTd70+V1DViF9TOTuN1Y+9mNS1B
	 2IGreMmI5t/ChqEDAn7faDVOw1Ua57pbSeVqhr/TZAA9yW9ePThanlIZmPrljp7GIS
	 p88GlknAzRF0Pdt8JValJAzHjQHJMAUreVi84cCA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F2DCF8060B;
	Wed, 15 Mar 2023 16:08:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1FB8F805BD; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 75B2DF80520
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75B2DF80520
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-00077I-Hi; Wed, 15 Mar 2023 16:08:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-004KUe-H8; Wed, 15 Mar 2023 16:08:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-0057co-Su; Wed, 15 Mar 2023 16:07:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Subject: [PATCH 016/173] ASoC: amd: acp: rembrandt: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:08 +0100
Message-Id: <20230315150745.67084-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ojZJhvg3lC1NvDLBuVBmrNfwZ+MPVa0jn+L9VKCrgsg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1ZUZj9+dKmDEkpQC2Jm2mvm/rnKrKN48gzv
 HV6ew6OInSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdWQAKCRDB/BR4rcrs
 CevuB/434mSvIL8DfYzrc53OTy+8uNLd/l9F5NFIjLUdlNt6YwQMy7gHvtKTLgd17eURiQ5sGvX
 aAEldutS1XNSMei5hNHiOcXi2Bald1Kce7A+p2YsQSFPY8C1mrb5qD9Ou0JyCG+DOdbs4smwejn
 mAF9WVZSI1XMY2x1hTEwObCgFYzl4lIZGnJE7SHQPOtQC4i7Eq1TY8zPr5pcqufM97DC4GOHy1F
 hSGFrdhkkf/nH5k8npN1dfe4+h7qb+PzGuA3+dYlLhFJHEjcM0XjuKk1N/joIHg7Iox0HH3H5Of
 Z48wip6YrOyVzr94YhemnS7WbqEBAJmsftatlPXQhM0ZBffd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: IQCASWKVWFJPG3CWSGYQFB5VGEW4MXDU
X-Message-ID-Hash: IQCASWKVWFJPG3CWSGYQFB5VGEW4MXDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQCASWKVWFJPG3CWSGYQFB5VGEW4MXDU/>
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
 sound/soc/amd/acp/acp-rembrandt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 15cd3f8cc82c..5c455cc04113 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -366,7 +366,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rembrandt_audio_remove(struct platform_device *pdev)
+static void rembrandt_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
@@ -376,12 +376,11 @@ static int rembrandt_audio_remove(struct platform_device *pdev)
 
 	acp6x_disable_interrupts(adata);
 	acp_platform_unregister(dev);
-	return 0;
 }
 
 static struct platform_driver rembrandt_driver = {
 	.probe = rembrandt_audio_probe,
-	.remove = rembrandt_audio_remove,
+	.remove_new = rembrandt_audio_remove,
 	.driver = {
 		.name = "acp_asoc_rembrandt",
 	},
-- 
2.39.2

