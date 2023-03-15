Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A899C6BB853
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 190841490;
	Wed, 15 Mar 2023 16:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 190841490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895144;
	bh=Yk/xa9Gr7/kpCtKBTzVC2b340W2BgIxvfRppl4LhIOs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gwP54Xiw8j+g61q9rXMPr7Xaw+6dXs7SqjThycXuvrw/ucNDD+Q5fwlWRkq5nSOgk
	 xou+8LWfcfsIVKBzuBb/Icx4rMXdlBPSA49rw/tAScm+vKMpAMfB2hDGuw9vQa0PLo
	 GXvA40Z+lfDi27efzo31mFf5Dh2TrP7bWErNHGqA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDB09F80CBB;
	Wed, 15 Mar 2023 16:15:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2302F80609; Wed, 15 Mar 2023 16:10:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 60E94F8061E
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E94F8061E
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-0000Ji-7Q; Wed, 15 Mar 2023 16:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-004KeE-1n; Wed, 15 Mar 2023 16:08:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjp-0057kJ-W7; Wed, 15 Mar 2023 16:08:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	Shang XiaoJing <shangxiaojing@huawei.com>
Subject: [PATCH 132/173] ASoC: sh: rcar: Convert to platform remove callback
 returning void
Date: Wed, 15 Mar 2023 16:07:04 +0100
Message-Id: <20230315150745.67084-133-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Yk/xa9Gr7/kpCtKBTzVC2b340W2BgIxvfRppl4LhIOs=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6+wD09m+gJ6EHIFMe/Hh6t845X6LxBWKRCx
 bsFn43z4WiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHevgAKCRDB/BR4rcrs
 CcLQB/oDblXhbI1BwMlgDNs8D2vud9kpJ0w3DoYymBF3/Cnta1jmqYRBwOhmN4RiQdnJPouiTFI
 8akO+IACCAnr332817qOf9hXtrBkKlbfqqjHZbhitCbQhyd9PqWMPYUz6D+tKivE9ErLGAClXZC
 yihp00M+O6/epmAGZKASTu/gFK+ybyAc7nwt0t30A5GmITVhfCtocNUf4msX8G3THxHvdXwqAFa
 NdJOCFplxgapC5Y1TsEKn1gWHZfo8BIcMT+wSHJ9Ao4ayqrT1KkfAbuzfhFMw6x6h19wknMvtPh
 zhJ3yGp1XxzIGxt2dfYE5qMLiZmFnFk1Xn1csc3r8D+q80A5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: LNPIBKBDFBM623JR7DWCVYBW657RCBAM
X-Message-ID-Hash: LNPIBKBDFBM623JR7DWCVYBW657RCBAM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNPIBKBDFBM623JR7DWCVYBW657RCBAM/>
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
 sound/soc/sh/rcar/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index cb17f7d0cf0c..6a522e6dd85a 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1987,7 +1987,7 @@ static int rsnd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rsnd_remove(struct platform_device *pdev)
+static void rsnd_remove(struct platform_device *pdev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(&pdev->dev);
 	struct rsnd_dai *rdai;
@@ -2019,8 +2019,6 @@ static int rsnd_remove(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(remove_func); i++)
 		remove_func[i](priv);
-
-	return 0;
 }
 
 static int __maybe_unused rsnd_suspend(struct device *dev)
@@ -2052,7 +2050,7 @@ static struct platform_driver rsnd_driver = {
 		.of_match_table = rsnd_of_match,
 	},
 	.probe		= rsnd_probe,
-	.remove		= rsnd_remove,
+	.remove_new	= rsnd_remove,
 };
 module_platform_driver(rsnd_driver);
 
-- 
2.39.2

