Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472736BB87B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:51:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30201528;
	Wed, 15 Mar 2023 16:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30201528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895514;
	bh=cMAYeO0+VOjeXrDjSWG+h8vjSkeIg2bFXTwzxl2A03s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TzfI1iB54ObI05nxMcWW9raNvzLYYluvG5yLU4BXfJwVH1+RQLsHyQYqZxG2Kzb+w
	 752e+xS0BfaMVxxcM6jVHVyeE8PAPn5Q0HseBjJlWIqdHb7wufZzShTUjxSyeTTCgX
	 aUDr7IJIpxj3USvPq0/rcurQ7pzSMJfjAdESZHDw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B65C2F80601;
	Wed, 15 Mar 2023 16:17:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4184F8061E; Wed, 15 Mar 2023 16:10:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A2C13F80639
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2C13F80639
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk3-0000iR-E1; Wed, 15 Mar 2023 16:08:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-004Kgo-Qj; Wed, 15 Mar 2023 16:08:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0057mh-4b; Wed, 15 Mar 2023 16:08:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 169/173] ASoC: xilinx: xlnx_formatter_pcm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:07:41 +0100
Message-Id: <20230315150745.67084-170-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=cMAYeO0+VOjeXrDjSWG+h8vjSkeIg2bFXTwzxl2A03s=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8tsix8ovPHcmjSb5WVclIJ95cZKMK+OceDz
 nLaCPrg9UaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfLQAKCRDB/BR4rcrs
 CTVNCACVVcokxyJ7l3AoHUx9lUobRwIhEh6GV4g1GH0LN7PeWAfFMeYe1hxiO6aUIQgTZ2HDeXL
 O3muvWNnSsR5QxohocGTXkr2C4oOhwDG2Ei+03ZX9gSMMGeQ1bgdHs3BmPgEII3H1T+JhmIzDZB
 TnoQis1OtZLkPhiMzyndVfI9shJmJSTsumYe4nrM8V15Oih2LkLKJgx3n2WsfGPyqPXBz+NbkBE
 K7cLDBqD2ckZqeiF6/UARLhQ7PWJ7feFTkQWz8eOEw6pwg3Z7EmH5bwF+hru2yajZnWaGE8eA5R
 lLyy7W9emKNswiBFRTan926NoOBOm7Aq5wYdTJrG7llhPSTh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 5DFTBOK6G3RF5P3QQ2Y4HQ62TKNRFOL3
X-Message-ID-Hash: 5DFTBOK6G3RF5P3QQ2Y4HQ62TKNRFOL3
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DFTBOK6G3RF5P3QQ2Y4HQ62TKNRFOL3/>
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
 sound/soc/xilinx/xlnx_formatter_pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index ff1fe62fea70..299cfb5e2022 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -687,7 +687,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xlnx_formatter_pcm_remove(struct platform_device *pdev)
+static void xlnx_formatter_pcm_remove(struct platform_device *pdev)
 {
 	int ret = 0;
 	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(&pdev->dev);
@@ -703,7 +703,6 @@ static int xlnx_formatter_pcm_remove(struct platform_device *pdev)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
 
 	clk_disable_unprepare(adata->axi_clk);
-	return 0;
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {
@@ -714,7 +713,7 @@ MODULE_DEVICE_TABLE(of, xlnx_formatter_pcm_of_match);
 
 static struct platform_driver xlnx_formatter_pcm_driver = {
 	.probe	= xlnx_formatter_pcm_probe,
-	.remove	= xlnx_formatter_pcm_remove,
+	.remove_new = xlnx_formatter_pcm_remove,
 	.driver	= {
 		.name	= DRV_NAME,
 		.of_match_table	= xlnx_formatter_pcm_of_match,
-- 
2.39.2

