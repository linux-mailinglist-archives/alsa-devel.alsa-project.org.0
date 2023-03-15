Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3A6BB7C5
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:29:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13ACE138D;
	Wed, 15 Mar 2023 16:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13ACE138D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894153;
	bh=lzER8ngZs/WYY6pUSzDfleqHc+/c2ZIHZ4U1i4Rx9PE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rW7+7TzJBbRcyIhEPfUq6s7N7lcF98fsliO+ZZIL5m2iBF0YFOFl0zdzc6v2E3z7w
	 sV+1yVPjUQU9Dz67/DXNtgkR+eve0iuiH0whXH0nrGu8C2FascPsn6JiPmww6/8l6E
	 6dS1oH51ULvZHaH/Hv2xwUNiYf+jq+o26FOnPmV4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A09DF806E3;
	Wed, 15 Mar 2023 16:12:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB886F805C3; Wed, 15 Mar 2023 16:09:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80974F805D2
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80974F805D2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0007ov-PW; Wed, 15 Mar 2023 16:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZK-Kl; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0057gb-35; Wed, 15 Mar 2023 16:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 074/173] ASoC: fsl: fsl_ssi: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:06 +0100
Message-Id: <20230315150745.67084-75-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=lzER8ngZs/WYY6pUSzDfleqHc+/c2ZIHZ4U1i4Rx9PE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4M8Yqw4jJ6QAV9A+zyKfTN2KWgqLGZwp9DD
 PRnMffi9suJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeDAAKCRDB/BR4rcrs
 CUB/CACVKjX4L/z6ettvWGUCLZLr44rN2PJVfK8cbMZYSkTiqsg8TEDGOvQd0AfpAAfnXVXN4kl
 LbxBH9spuorzBFruAcDKnQhchOGXbFHcIddmpZrUekZAUcqf4AZ+oaHAEG2SM4sDJ39gy4aw9hF
 +Ncd2dhbvDZtDH5lFhFufWcUu61bG88RwaQVEKrn/iRoVz5fdqCk+bdeU2nPdvKwkrwJc2mhewH
 zEzRHg/RcgRaCHb72GSYKMz1Y4BHPlkzOaJUPiU96tN5usn+2FiImojkZYQh89o5UxShtMnLwNx
 v198IlyDJXQsrrQW8S0vVJ90vEkCMZGWDWohyTpiFd7Qw/Qn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: JHLEU3IQID3JYFCVFLR3BNWZX6GJXCBS
X-Message-ID-Hash: JHLEU3IQID3JYFCVFLR3BNWZX6GJXCBS
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHLEU3IQID3JYFCVFLR3BNWZX6GJXCBS/>
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
 sound/soc/fsl/fsl_ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 46a53551b955..f9097268589c 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1671,7 +1671,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_ssi_remove(struct platform_device *pdev)
+static void fsl_ssi_remove(struct platform_device *pdev)
 {
 	struct fsl_ssi *ssi = dev_get_drvdata(&pdev->dev);
 
@@ -1690,8 +1690,6 @@ static int fsl_ssi_remove(struct platform_device *pdev)
 		snd_soc_set_ac97_ops(NULL);
 		mutex_destroy(&ssi->ac97_reg_lock);
 	}
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1737,7 +1735,7 @@ static struct platform_driver fsl_ssi_driver = {
 		.pm = &fsl_ssi_pm,
 	},
 	.probe = fsl_ssi_probe,
-	.remove = fsl_ssi_remove,
+	.remove_new = fsl_ssi_remove,
 };
 
 module_platform_driver(fsl_ssi_driver);
-- 
2.39.2

