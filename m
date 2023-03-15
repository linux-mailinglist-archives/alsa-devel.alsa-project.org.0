Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E36BB796
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4C612E5;
	Wed, 15 Mar 2023 16:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4C612E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893865;
	bh=ZJd+NqjGF6sjyp6Hxv+fUX3MgJu7y0CJa1wbdT9NG7A=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dxbealQIYmtCARDRTnwT5s6poQ2Gwj/PTh0WRFXXI+4th08vQYYEvbXVdny68IJp5
	 tgcDMMFkBC9BRrZYJAmMYzJZImfjHy9d7iLC6kp42plP51OOtdzN+R9qhnA/XKsoMT
	 RcaGjh9SCX5ZTL6c6pwmbzUECM8a1R/hUNNLiz8Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B82BF80693;
	Wed, 15 Mar 2023 16:11:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF51EF8065B; Wed, 15 Mar 2023 16:09:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 09535F805B3
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09535F805B3
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0007dc-5k; Wed, 15 Mar 2023 16:08:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-004KYW-K0; Wed, 15 Mar 2023 16:08:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSja-0057fl-BF; Wed, 15 Mar 2023 16:08:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 062/173] ASoC: dwc: dwc-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:54 +0100
Message-Id: <20230315150745.67084-63-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZJd+NqjGF6sjyp6Hxv+fUX3MgJu7y0CJa1wbdT9NG7A=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd3ocAxVmcoZAqObmU+fNwCrg7tH8S4Ui0vYI
 ptKgZLc/62JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd6AAKCRDB/BR4rcrs
 CbmNCACNXJVzVagzgE97orbPkhtsIe+G9Ne33bdGt2t5r3/UDCr3ZfSBIGPPumA+EsnCoiX0Mga
 LM76xUYbjToTVHB45yOgfZxv+E4BvLPHzwU8lzju/gar5kEZ53m+xM61oGhTpjfoHCVi4DczPib
 xoqwOeP8gkWMTe/B9sGvvQbuSZisCHDPUBf0xmClpTI29iONSs/ELIAStJhzvVZYFQUmaWNkogv
 0XL8CdGntzq7tXIog5WXe0bC/PYlaKcQSBv2soJ3c7/suLgBzUKU1pHbTjSwMV+/647ZJMJJ6dL
 +ZrfVl7WF4Hy9u3ljAwIGjEM/xIkR4ok4qWxWgJBObDpOZTv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: VMZRMUPH273RXDSW7TRGSOOXEWJQMVM3
X-Message-ID-Hash: VMZRMUPH273RXDSW7TRGSOOXEWJQMVM3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMZRMUPH273RXDSW7TRGSOOXEWJQMVM3/>
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
 sound/soc/dwc/dwc-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 7f7dd07c63b2..acdf98b2ee9c 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -730,7 +730,7 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dw_i2s_remove(struct platform_device *pdev)
+static void dw_i2s_remove(struct platform_device *pdev)
 {
 	struct dw_i2s_dev *dev = dev_get_drvdata(&pdev->dev);
 
@@ -738,7 +738,6 @@ static int dw_i2s_remove(struct platform_device *pdev)
 		clk_disable_unprepare(dev->clk);
 
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -756,7 +755,7 @@ static const struct dev_pm_ops dwc_pm_ops = {
 
 static struct platform_driver dw_i2s_driver = {
 	.probe		= dw_i2s_probe,
-	.remove		= dw_i2s_remove,
+	.remove_new	= dw_i2s_remove,
 	.driver		= {
 		.name	= "designware-i2s",
 		.of_match_table = of_match_ptr(dw_i2s_of_match),
-- 
2.39.2

