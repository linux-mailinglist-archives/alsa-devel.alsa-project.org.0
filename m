Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB96BB7D1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0C413B7;
	Wed, 15 Mar 2023 16:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0C413B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894245;
	bh=5iJtgOgyyo/1+teuoG4lbK5wrihjCwFgXsIUtvY7fKk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nHleTJT65GAePDXCSaffEJqx/XloFfXtWkMEuDIf+RvRW1Sm6jbIz1dnWUvIP8Tmh
	 yknJLDjMyr/2+bKhmCSmZTCCtVXHzA942vzJL2ct/HupfwJXt+qe1ZapQzDxCPTS4F
	 fVtUAq3Pp+Dc6T4HrV9xExRAn/B6s2zmMv/awt/I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E679F8070B;
	Wed, 15 Mar 2023 16:13:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07F0AF805C5; Wed, 15 Mar 2023 16:09:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E9DC4F804B1
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DC4F804B1
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0007v4-Ax; Wed, 15 Mar 2023 16:08:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-004KZc-Lq; Wed, 15 Mar 2023 16:08:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0057gr-V2; Wed, 15 Mar 2023 16:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 078/173] ASoC: fsl: imx-sgtl5000: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:10 +0100
Message-Id: <20230315150745.67084-79-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=5iJtgOgyyo/1+teuoG4lbK5wrihjCwFgXsIUtvY7fKk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4YnsK6Wcw+DgrmGVzyWor282+Gkb0GsMiM/
 9FAadCjGVWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeGAAKCRDB/BR4rcrs
 CVNhB/0WKbH0qNebg65VsfAebQjLoZYsqa5HL0aetoiq+JT/da0wkxu/NXLXD9bGmpT/m+Nlixe
 54quuOdIs9fOharyqFFdcMoKjsB76Hu0f2PvNGDpd/AruuSgD8DirhEmvOtzW1bzSm+1FQZhOFf
 9UBdDj9xNK6mt0nrcTnVEW3I8qZiTOGS3NgyxBNU+LVnr5E18CAZe9VQ1thbysG2INGB4vax6cq
 DYu6XWYxEhWNye0bHaKKqSA5z9J1Bvnk7ci/gwrEFefCzr9sR6ui2agJs90lpyG/Aow86aKI50a
 HAcAU+MvVVpd9smsYSMbhNNbUjuXDC15Nmbbz0TYkk2WT5dz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: IKUVTYOKVDVF6Z2JDNEFXK3SP2SSOBUP
X-Message-ID-Hash: IKUVTYOKVDVF6Z2JDNEFXK3SP2SSOBUP
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKUVTYOKVDVF6Z2JDNEFXK3SP2SSOBUP/>
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
 sound/soc/fsl/imx-sgtl5000.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 580a0d963f0e..26c22783927b 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -193,14 +193,12 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_sgtl5000_remove(struct platform_device *pdev)
+static void imx_sgtl5000_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct imx_sgtl5000_data *data = snd_soc_card_get_drvdata(card);
 
 	clk_put(data->codec_clk);
-
-	return 0;
 }
 
 static const struct of_device_id imx_sgtl5000_dt_ids[] = {
@@ -216,7 +214,7 @@ static struct platform_driver imx_sgtl5000_driver = {
 		.of_match_table = imx_sgtl5000_dt_ids,
 	},
 	.probe = imx_sgtl5000_probe,
-	.remove = imx_sgtl5000_remove,
+	.remove_new = imx_sgtl5000_remove,
 };
 module_platform_driver(imx_sgtl5000_driver);
 
-- 
2.39.2

