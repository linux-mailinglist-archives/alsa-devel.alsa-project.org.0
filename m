Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042656BB86C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 673B014F6;
	Wed, 15 Mar 2023 16:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 673B014F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895387;
	bh=UvNbuIChL43fRZbKAzAW9MXGKXGX7X94tgxcXLTFzjo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uVW6WSnHE+BZgj0nDkgbETpkCXzBlUXkqADCGTuDWs+n9r0ApCE3oLmEtl2CmYKEU
	 a/HZRHgMve8V1vjTAdLoWalT67SIdcT2GiFHmJ6TfsR8Xzhwy3/COsCQjEG5721JiX
	 OSk187V2UWhqNXEwojQmid6ggXk7ArqB6kxg8G2g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9518DF896E0;
	Wed, 15 Mar 2023 16:16:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA80AF80617; Wed, 15 Mar 2023 16:10:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BD385F8062F
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD385F8062F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk1-0000Y9-2p; Wed, 15 Mar 2023 16:08:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-004Kfm-71; Wed, 15 Mar 2023 16:08:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjv-0057lx-FC; Wed, 15 Mar 2023 16:08:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 157/173] ASoC: tegra: tegra210_ope: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:29 +0100
Message-Id: <20230315150745.67084-158-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=UvNbuIChL43fRZbKAzAW9MXGKXGX7X94tgxcXLTFzjo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8LfHgorUhNb5QV6Hm3+5pSkCDFfBkIMp0T1
 d4RU/Aw/KCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfCwAKCRDB/BR4rcrs
 CZLWB/44sj6h7iefhewueAzEA0tz7Z3OWj67+60oiDCg57I796InWlyBbTiV3O237iU11ThmMuw
 T7jo9zoZKOoUsgn8BAQjSScSb6ny3hNqIE56KOBUaUAp+MfBIZcYsSimVxKZXpqteVWivcXkble
 8kc452yqafZ9uw0DxydchR26S35KnQLfhiA8ucY+CEiNCuj0lPnGOiCs5QbP+enonDjTqwBJC15
 nUKKshs8ExL7SNIuAzFvAmJ5/709rmwEaiCW/pBq0UI4/nWHbRvtEE/a6sngepOlrUbh6zpW2yy
 gjSxnVThjuWZ3lDEU2K5gufvuKCAsSlm7+0PV+jSpw67enct
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: NJFEGZGA72ZNMD7JODKCWRVVDVHT7V2Q
X-Message-ID-Hash: NJFEGZGA72ZNMD7JODKCWRVVDVHT7V2Q
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJFEGZGA72ZNMD7JODKCWRVVDVHT7V2Q/>
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
 sound/soc/tegra/tegra210_ope.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 3dd2bdec657b..98e726432615 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -347,11 +347,9 @@ static int tegra210_ope_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra210_ope_remove(struct platform_device *pdev)
+static void tegra210_ope_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused tegra210_ope_runtime_suspend(struct device *dev)
@@ -410,7 +408,7 @@ static struct platform_driver tegra210_ope_driver = {
 		.pm = &tegra210_ope_pm_ops,
 	},
 	.probe = tegra210_ope_probe,
-	.remove = tegra210_ope_remove,
+	.remove_new = tegra210_ope_remove,
 };
 module_platform_driver(tegra210_ope_driver)
 
-- 
2.39.2

