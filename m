Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA46BB725
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:11:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6421269;
	Wed, 15 Mar 2023 16:10:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6421269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893064;
	bh=l9lrBeE+uxHDHwLvnATNNRJxmkX1G4wZ/xIs4YXCxRM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mBxFsVptTwm0/uXn6C+/ka7+QSBp7UHzHf7fSmWIz/F+8Tbm0oFHByapfyWR390Oc
	 9bgs9SWP//XPTILgadUtak8sCOKn5Xc/eKb6KuHLi+RC1w0+OD88adGFF1UtWFMIGo
	 EBYxO+FbPqLaKmexO7YicCVOVXV5c9MRrQA7WXaA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8926F805E5;
	Wed, 15 Mar 2023 16:08:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B381F805AF; Wed, 15 Mar 2023 16:08:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 948D2F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 948D2F8016C
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-00076x-Ul; Wed, 15 Mar 2023 16:08:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-004KUZ-9f; Wed, 15 Mar 2023 16:08:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-0057ck-Ls; Wed, 15 Mar 2023 16:07:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 015/173] ASoC: amd: acp-pcm-dma: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:07 +0100
Message-Id: <20230315150745.67084-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=l9lrBeE+uxHDHwLvnATNNRJxmkX1G4wZ/xIs4YXCxRM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1UlFqxUj9YTw2vtRXhSUJcDXWNizlks5Zfn
 q11UsDPyjKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdVAAKCRDB/BR4rcrs
 CdDfB/9+mxgYt6VjXjKD6C5jANBeocaLrDPN7OQiyzO5JaACr0tJWNjM8U7kLdNa/46u38OaK45
 bLA50uhqAzhShEsR1jDr5D835RFu+ghWRkBN2DLuWyyt0XaYQzGUGxZWeFuxu/o4rdFdizPoSZD
 6LBz2cJAdy0chtbRrR+mdLh1/FpVgS8zfgXvc9EAS3HUXeSddgwayNsb8CEB7QLQEOVCmvCZykl
 3kZPIPvV50vXMFjDVitzCl0QMvgZVZpzbzTp9ydkQCYrF9IlnkLmqNkSTgZQSwNebPowqo1msBT
 VufX3ObNwY3+WaP+i+QWcVQqqE6d0vr0dxI1d9HWc1etj/G0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 4GSPN4BPZCBYSV7GDV2A6QYICK4SHSUT
X-Message-ID-Hash: 4GSPN4BPZCBYSV7GDV2A6QYICK4SHSUT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GSPN4BPZCBYSV7GDV2A6QYICK4SHSUT/>
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
 sound/soc/amd/acp-pcm-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 198358d28ea9..d41df316da58 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1323,7 +1323,7 @@ static int acp_audio_probe(struct platform_device *pdev)
 	return status;
 }
 
-static int acp_audio_remove(struct platform_device *pdev)
+static void acp_audio_remove(struct platform_device *pdev)
 {
 	int status;
 	struct audio_drv_data *adata = dev_get_drvdata(&pdev->dev);
@@ -1332,8 +1332,6 @@ static int acp_audio_remove(struct platform_device *pdev)
 	if (status)
 		dev_err(&pdev->dev, "ACP Deinit failed status:%d\n", status);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int acp_pcm_resume(struct device *dev)
@@ -1428,7 +1426,7 @@ static const struct dev_pm_ops acp_pm_ops = {
 
 static struct platform_driver acp_dma_driver = {
 	.probe = acp_audio_probe,
-	.remove = acp_audio_remove,
+	.remove_new = acp_audio_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &acp_pm_ops,
-- 
2.39.2

