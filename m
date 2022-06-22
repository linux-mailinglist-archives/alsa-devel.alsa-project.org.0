Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3590554296
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 08:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8A01ACE;
	Wed, 22 Jun 2022 08:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8A01ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655878743;
	bh=eiyXG3pBRs5nRw79SIrE5EI49l+fhM838Co01RZLOVU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=js+VtFJebkzgFfS/rMzhvFqrQs35fh0XTOrq/JwOsudCHtLyVp8VDA+dzqePB2LAg
	 ntlUO02v+4N0WKGFjp+NtSw1Sf+YfOlUI/bFCjPQKu8WwAb1TW5nWm+2GPCld+eonY
	 Cqc41tuGngBgXPU+3tQTgJRsbRfI7jBznAO8bmXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE74F80118;
	Wed, 22 Jun 2022 08:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B5DCF802D2; Wed, 22 Jun 2022 08:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B3E3F80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 08:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B3E3F80100
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3tgR-0006xD-Mz; Wed, 22 Jun 2022 08:17:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3tgN-001ybT-PS; Wed, 22 Jun 2022 08:17:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o3tgO-000MQA-Jc; Wed, 22 Jun 2022 08:17:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: amd: acp: Fix error handling in .remove()
Date: Wed, 22 Jun 2022 08:17:39 +0200
Message-Id: <20220622061739.225966-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373; h=from:subject;
 bh=eiyXG3pBRs5nRw79SIrE5EI49l+fhM838Co01RZLOVU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBisrP/a/czR+CiN6mSoO0GOAZItP87b6zNL5oU5wcp
 414LaveJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrKz/wAKCRDB/BR4rcrsCZu6B/
 4rTT0vCWrx5iTyC7BNpCxYDLb84ja+AOOHBnEj330H37UXasppsuMBt4Xy84DTPFt+0qkRwuishDf7
 6rVznpYb6uYiiXjxaOatsQ+3V4Kokl15BPqQfU+4uEKB+/7aZWgLTqNIwINgp1mEXK1TAe4RPi8VFA
 v/K7rgJDcVvaBbnVIwywP3NAJYo2gwp2ql5mWOc2LrBezHZhrI+3GK8U00zncDq2cxhMLgt4fcAvwV
 cK578zZh+wzyoYWC97vKWfpFvygaQ1resrSzjBaSW+XburfXFBgbzzVrVMo3H5hVZmm0SOyTqtpsKs
 W7NfBMi3Yep68HPtLm0pQDoae+izAl
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Even in the presence of problems (here: rn_acp_deinit() might fail), it's
important to unregister all resources acquired during .probe() because
even if .remove() returns an error code, the device is removed.

As .remove() is only called after .probe() returned success, platdata
must be valid, so the first check in .remove() can just be dropped.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/amd/acp/acp-renoir.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 75c9229ece97..8375c00ff4c3 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -307,16 +307,10 @@ static int renoir_audio_remove(struct platform_device *pdev)
 	int ret;
 
 	chip = dev_get_platdata(&pdev->dev);
-	if (!chip || !chip->base) {
-		dev_err(&pdev->dev, "ACP chip data is NULL\n");
-		return -ENODEV;
-	}
 
 	ret = rn_acp_deinit(chip->base);
-	if (ret) {
-		dev_err(&pdev->dev, "ACP de-init Failed\n");
-		return -EINVAL;
-	}
+	if (ret)
+		dev_err(&pdev->dev, "ACP de-init Failed (%pe)\n", ERR_PTR(ret));
 
 	acp_platform_unregister(dev);
 	return 0;

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

