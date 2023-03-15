Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B836BB86D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65811516;
	Wed, 15 Mar 2023 16:49:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65811516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895398;
	bh=Iku3I77HZ0sgVoOuGEEbei4XlKGKaxeyHQbkdOGZIfM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uDDllFGWeXvZ2dUfjKjUpooJT79/9qepF99DdjJKP6CU3I09kuOIZMBj3AwNCscfk
	 S6URD4ue2zfsIO55xC9z8TUHL6PwXhGiLyDC5hNO3eAnIAmczcVVBthUFAbOCsZ3TU
	 CvinSNaPr5m2g+LizuSx6qkjn5SvHMyqPKwCVEPM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2FCBF896E5;
	Wed, 15 Mar 2023 16:16:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C693F8061B; Wed, 15 Mar 2023 16:10:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D1439F80630
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1439F80630
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk3-0000ir-FE; Wed, 15 Mar 2023 16:08:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-004Kgt-UK; Wed, 15 Mar 2023 16:08:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0057mm-B8; Wed, 15 Mar 2023 16:08:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 170/173] ASoC: xilinx: xlnx_spdif: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:42 +0100
Message-Id: <20230315150745.67084-171-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Iku3I77HZ0sgVoOuGEEbei4XlKGKaxeyHQbkdOGZIfM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8wdrG7Ew2/HIZZFRGdBqWXUpYCbOyh8MdEk
 J0faUl8aPCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfMAAKCRDB/BR4rcrs
 CTvhB/92P7LtVtuxCw6olOi57lWMPcnaSRmzLPCR5cIItc3wDn6/7LSUhx+CUf5KdBT0uudeVLo
 VvNsdLjGvksKzd61wbYjrdcnocd71nuZWvnYJObd9NCTPZ/LkNVQ52U7473pcrY7nY2W9QrWcEl
 E9k7GRTZaQ58Vyc0JbZJ4YUAJgXiXAJOuef9ifxMpw+X66PrcFWb5rxrMz4wQNCa9zNTzAAwIBe
 KZ4apoOpZrkVBPqeWHj4NjtplWJUMYvqkEj77bccUi5mEtBYWC3ZDsZL0snD0FxvQ3mwfByuc4Z
 8wPkeEytv2pKRk/m8OwwW01KGTyyJ6k3DxNvwhyJkKCf+kjz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: GPFPVI3WUTGWMBJCAHCN6ZHXEOUKF4BA
X-Message-ID-Hash: GPFPVI3WUTGWMBJCAHCN6ZHXEOUKF4BA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPFPVI3WUTGWMBJCAHCN6ZHXEOUKF4BA/>
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
 sound/soc/xilinx/xlnx_spdif.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 7342048e9875..d52d5fc7b5b8 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -312,12 +312,11 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xlnx_spdif_remove(struct platform_device *pdev)
+static void xlnx_spdif_remove(struct platform_device *pdev)
 {
 	struct spdif_dev_data *ctx = dev_get_drvdata(&pdev->dev);
 
 	clk_disable_unprepare(ctx->axi_clk);
-	return 0;
 }
 
 static struct platform_driver xlnx_spdif_driver = {
@@ -326,7 +325,7 @@ static struct platform_driver xlnx_spdif_driver = {
 		.of_match_table = xlnx_spdif_of_match,
 	},
 	.probe = xlnx_spdif_probe,
-	.remove = xlnx_spdif_remove,
+	.remove_new = xlnx_spdif_remove,
 };
 module_platform_driver(xlnx_spdif_driver);
 
-- 
2.39.2

