Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83E6BB81F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C36C147A;
	Wed, 15 Mar 2023 16:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C36C147A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894829;
	bh=e8NKkAkmXtqhoRNheSMdJEhJyByEz8N+Tj0JK7q0Q1k=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S20PPEQ+C35P4aZicjsAY6CDF/uSO04fG6WlZAvOsVjGpzlIDZ+E7Odtv+k7Jr0R6
	 7XLZixlBa2mA1OkQq9r/E/OPkxAXlBGjr0D6cYkMtrImhdtcIeHs2jFlMafuvcQknn
	 ASPSt6dO/jYxj5tXkCHoSx8So/knUwpGWS3tFNrc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AD21F808F4;
	Wed, 15 Mar 2023 16:14:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B557DF805F7; Wed, 15 Mar 2023 16:10:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90648F80606
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90648F80606
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-0000Df-8N; Wed, 15 Mar 2023 16:08:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-004KdZ-9h; Wed, 15 Mar 2023 16:08:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0057k1-Tp; Wed, 15 Mar 2023 16:08:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 127/173] ASoC: samsung: pcm: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:59 +0100
Message-Id: <20230315150745.67084-128-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=e8NKkAkmXtqhoRNheSMdJEhJyByEz8N+Tj0JK7q0Q1k=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6vo/Ev1ZLBHFWx+nNIrrr+gCYZg3IEUD/kA
 aEQfo7o/nqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHerwAKCRDB/BR4rcrs
 CV3ZCACTaaC5xAoBXbBJgn83tK8IHcUuyQIGYZxRkRF+jgeM9t5uWKOEsM8SHYHVgwYb7yiSfTu
 jJtqOyHkyBnT8hmKT0btrvamRqNNV9GWhbV+hDjVbMlxbQtErv3tKKtEqFfnO5AYig/f2kNvxtn
 k4VKfQ6lmZ76sqf7cYmg0/eoZRgdWxiz95oF4/TqaIPLEXf1KPeJbybCErrfbQL15lzrt4ox1GG
 ZPX6wAz/dfTeDcUV714ZWfGb2BFnpV7HRvTm+5PbucDq3FGQyWOwLzV7v/8Muz5v+gOj8OT3JeE
 TphFYySHnXFH6UxHj34nHnerFynSVVM6vUXHW1KfpFThlBK3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 2CNNROYT6OXFQXZOSEM4JTJPH4NIMMOU
X-Message-ID-Hash: 2CNNROYT6OXFQXZOSEM4JTJPH4NIMMOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CNNROYT6OXFQXZOSEM4JTJPH4NIMMOU/>
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
 sound/soc/samsung/pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index e859252ae5e6..335fe5cb9cfc 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -579,20 +579,18 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int s3c_pcm_dev_remove(struct platform_device *pdev)
+static void s3c_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct s3c_pcm_info *pcm = &s3c_pcm[pdev->id];
 
 	pm_runtime_disable(&pdev->dev);
 	clk_disable_unprepare(pcm->cclk);
 	clk_disable_unprepare(pcm->pclk);
-
-	return 0;
 }
 
 static struct platform_driver s3c_pcm_driver = {
 	.probe  = s3c_pcm_dev_probe,
-	.remove = s3c_pcm_dev_remove,
+	.remove_new = s3c_pcm_dev_remove,
 	.driver = {
 		.name = "samsung-pcm",
 	},
-- 
2.39.2

