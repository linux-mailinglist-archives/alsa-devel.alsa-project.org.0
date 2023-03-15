Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73E6BB7E5
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:33:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A7713FB;
	Wed, 15 Mar 2023 16:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A7713FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894404;
	bh=ahl9KygTwblq68kPHzDYsCEqiARfMFVXvf8GAD2RDMg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ofG/5ReVtS8plEyNYlMm74bgZcXz/fDajb5CtbaQMGbB2nGh0ayTQiR4ei+ifS3Bv
	 pxiebGh9hIgtJ1IahMwmQkrbyPxk55wSXAxbYXmrCaZ4hCSYHz8Gvh58kSpRChfb9K
	 7HPa+PzEzUwP3ZT4wAOyltMz+HrG8o6awlxQzUqg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D7CAF80656;
	Wed, 15 Mar 2023 16:13:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA85EF805D8; Wed, 15 Mar 2023 16:09:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 956FCF805EE
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 956FCF805EE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0008N4-DX; Wed, 15 Mar 2023 16:08:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-004Kbo-Ul; Wed, 15 Mar 2023 16:08:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057id-2a; Wed, 15 Mar 2023 16:08:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH 106/173] ASoC: mediatek: mtk-btcvsd: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:38 +0100
Message-Id: <20230315150745.67084-107-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ahl9KygTwblq68kPHzDYsCEqiARfMFVXvf8GAD2RDMg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5rdLn2/QrNzz4s3XIAZIoZBbbcn3NAB5SYf
 Pxf3yJ0MV2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeawAKCRDB/BR4rcrs
 CQ6pCACY1l5JzzFwlvblloFP5e2I/4MbxP1QaVkmoDqg50Sx0sgrREEZzRHuGZO5gqOp5zYXso+
 aBrPJRmH4juyzHtrT0AVChmffwf13AJZz1eT6gVgKXYp4mTHpMUN4oArqDPrUirnnWXRAo/N6sN
 VZGND1DfZo+hoSyiqBLolJlCDrkeoj1k77bhj37X/zlzUTsgWwjoTRSiMRm5UJUG2MwAoH+/UMC
 G3BmOKbVl/clkIu/PhEcrxpJ9NoQ3MvfhMcbktr0/Tdienya0ezfbi8Hxk7C5iOKNYKWmNwBiG5
 NK4l5T6mlT+JXFdiEBaqPfV40WsbzCHHvUMa0pvyfNnc0WpJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 3X54YYLBLDCRVUNM7SJ5SKOZ5CAP23SC
X-Message-ID-Hash: 3X54YYLBLDCRVUNM7SJ5SKOZ5CAP23SC
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3X54YYLBLDCRVUNM7SJ5SKOZ5CAP23SC/>
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
 sound/soc/mediatek/common/mtk-btcvsd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index 1c28b41e4311..1ba0633e542f 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1387,13 +1387,12 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_btcvsd_snd_remove(struct platform_device *pdev)
+static void mtk_btcvsd_snd_remove(struct platform_device *pdev)
 {
 	struct mtk_btcvsd_snd *btcvsd = dev_get_drvdata(&pdev->dev);
 
 	iounmap(btcvsd->bt_pkv_base);
 	iounmap(btcvsd->bt_sram_bank2_base);
-	return 0;
 }
 
 static const struct of_device_id mtk_btcvsd_snd_dt_match[] = {
@@ -1408,7 +1407,7 @@ static struct platform_driver mtk_btcvsd_snd_driver = {
 		.of_match_table = mtk_btcvsd_snd_dt_match,
 	},
 	.probe = mtk_btcvsd_snd_probe,
-	.remove = mtk_btcvsd_snd_remove,
+	.remove_new = mtk_btcvsd_snd_remove,
 };
 
 module_platform_driver(mtk_btcvsd_snd_driver);
-- 
2.39.2

