Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8064A8F1
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:57:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FFD23F5;
	Mon, 12 Dec 2022 21:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FFD23F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878638;
	bh=uiL6Eq9/Ggr25fq7eJ1pzxylk51PhPxxSMcjI3xRJRc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I3xd9deYWIe4D8cSB4L8Oz9aXKMTZ+TnCSDceMRfftN0kXQT/fb4KnFiJ2/+mzr7l
	 aBZUw5GGw8W79YUkVu8qbHK5husoATVRSYBFbhy743E7kKG4VyVh7sRAh0ika9zDzm
	 kiB5ZrPVOyUEAhwMbXs8SSaHEgpTo+eB4llfcYks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5BEF8055C;
	Mon, 12 Dec 2022 21:54:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17731F80535; Mon, 12 Dec 2022 21:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E33F800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E33F800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poV-00016i-Px; Mon, 12 Dec 2022 21:54:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poS-00464P-Q0; Mon, 12 Dec 2022 21:54:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poS-004aht-Ra; Mon, 12 Dec 2022 21:54:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/15] ASoC: bt-sco: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:53:59 +0100
Message-Id: <20221212205406.3771071-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=uiL6Eq9/Ggr25fq7eJ1pzxylk51PhPxxSMcjI3xRJRc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TR8Cfge0QaVAUmv3sZyzwJtkehCgS/uZJkMS8i
 yZ/9RK6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eU0QAKCRDB/BR4rcrsCea0B/
 9+RUOG/F4HIstUN4S/E+ActR84FjRnVZsVv+CGcODhTyKgIVkyokGyZM1EkUu93B7QXyTmDUNg0Pc7
 cdzB8F8Mt08h69YCmEbzzFkzwNpTd47BLYEfLDz0vujdweIoq2wdzKlcDmBTnk08RapNUla0bYu613
 b7L4Dj91NJ54ygGQIgtWJkJMWkhFL1zHncURq6AAgSH/e0wWF5zwRX7L78NZUIe1KnlPXRyv01V6XY
 wpzaj8cq7GnvkUZEdOJ9caDoCk654+Mic0r441CncTNuVbYQSTBljl9vbgUWsjL9n2beROcaXnL4b9
 yfbjlxarYzlBzr14LPHZGozR7n4e0l
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/bt-sco.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/bt-sco.c b/sound/soc/codecs/bt-sco.c
index 4086b6a53de8..3afcef2dfa35 100644
--- a/sound/soc/codecs/bt-sco.c
+++ b/sound/soc/codecs/bt-sco.c
@@ -78,11 +78,6 @@ static int bt_sco_probe(struct platform_device *pdev)
 				      bt_sco_dai, ARRAY_SIZE(bt_sco_dai));
 }
 
-static int bt_sco_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct platform_device_id bt_sco_driver_ids[] = {
 	{
 		.name		= "dfbmcs320",
@@ -109,7 +104,6 @@ static struct platform_driver bt_sco_driver = {
 		.of_match_table = of_match_ptr(bt_sco_codec_of_match),
 	},
 	.probe = bt_sco_probe,
-	.remove = bt_sco_remove,
 	.id_table = bt_sco_driver_ids,
 };
 
-- 
2.38.1

