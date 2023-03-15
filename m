Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C16BB729
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9828D1278;
	Wed, 15 Mar 2023 16:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9828D1278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893093;
	bh=r6xsIZu/Gq7EbaOZeM2dEVsYJNMav6MeAEyizfe+kzE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UCHPn+jGyZ9skYJBB1cWLqG/bucA7wKDAZfllipCyeB0BKJeD+DstxyGRO1MI6/0M
	 tg7YsQ+IOxxqEKNgpXqJdSkg7BJIrLKAaBlvjkldGsU0z+JcvWbyHQu+r/IaKOePbe
	 1I9fgRyO+75P77KiIXxoq7sodKhEjG+n6M+hVIK4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C96F805FF;
	Wed, 15 Mar 2023 16:08:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69D79F805BA; Wed, 15 Mar 2023 16:08:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BD1B4F80529
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD1B4F80529
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-00075S-C4; Wed, 15 Mar 2023 16:07:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjN-004KTW-RY; Wed, 15 Mar 2023 16:07:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjM-0057by-Ud; Wed, 15 Mar 2023 16:07:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Subject: [PATCH 002/173] ASoC: amd: acp: rembrandt: Drop if blocks with always
 false condition
Date: Wed, 15 Mar 2023 16:04:54 +0100
Message-Id: <20230315150745.67084-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=r6xsIZu/Gq7EbaOZeM2dEVsYJNMav6MeAEyizfe+kzE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd0tEor5Q6i0e36oRLMBFicD/AAa2oZPlSzE3
 HwFthG7gCqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdLQAKCRDB/BR4rcrs
 CbOjCACLIjOHoelEDbJ4EBjzH0vMEHuEwGumI7XpOw38VwGHhfk31haDHkCRYZ8O98GIuoasoWl
 7CTo5DC3b8xHZOiqFktq9RHDcHQWhuhz0Fb6h6twrxnfMtA0R7MyDXnI1W5lnOwPkoJhaC8PJxk
 F/teu/QKtAPi6VJE2w8lQGcIzS+IdoIeq4isb23LchPLCYwWE2vSso7v4Fvkd7GiBGSukCLz3ba
 op714yn45xO/jrH2ZKZ2JxBxWLebKM105NedEflr6Ns/AHMeAcXaKpqD5w1gxIqWWaOpFbrId4u
 VKYk/K/0P9c8LgLYwCeD+PbUQcahTMbL08medmAbY5K8iWhB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: P3ADHFBCYGHF22OVMYCEZVQ7CJGAQMB4
X-Message-ID-Hash: P3ADHFBCYGHF22OVMYCEZVQ7CJGAQMB4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3ADHFBCYGHF22OVMYCEZVQ7CJGAQMB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

rembrandt_audio_remove() is only called after a successful call to
rembrandt_audio_probe(). With the latter it's sure that dev_get_platdata()
returns a non-NULL value and also that ->base is non-NULL. So the
corresponding check can be dropped.

While touching these lines join declaration and assignment into a single
line and make use of dev = &pdev->dev;

This prepares converting platform driver remove callbacks to return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/amd/acp/acp-rembrandt.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 2b57c0ca4e99..15cd3f8cc82c 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -370,13 +370,7 @@ static int rembrandt_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
-	struct acp_chip_info *chip;
-
-	chip = dev_get_platdata(&pdev->dev);
-	if (!chip || !chip->base) {
-		dev_err(&pdev->dev, "ACP chip data is NULL\n");
-		return -ENODEV;
-	}
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 
 	rmb_acp_deinit(chip->base);
 
-- 
2.39.2

