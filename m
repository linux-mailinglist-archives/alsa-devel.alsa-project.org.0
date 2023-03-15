Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2B6BB84E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B8414B6;
	Wed, 15 Mar 2023 16:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B8414B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895084;
	bh=Ye5g1gghrV9Sm/9HNFXIbWrlR3eA628GPRnVOdt5+OU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hiwI4+fKoyNzN6L6BzlIYgMfjSALSUyw1OPP3F9l3EZlc3oHyEeI942JT7ZRPo8p9
	 63dzX5kk/g/oz4OFKxzd7a0JzxQLVb2HYLlL+hM0uMAOOtV4+x0f6T03kMxRafHStV
	 yJytIqNN+h5tb1JSj+FHdEABVkbEHNiCXYSt1MNM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D4DF805AA;
	Wed, 15 Mar 2023 16:15:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B85A4F80605; Wed, 15 Mar 2023 16:10:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 06A32F80619
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A32F80619
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000RK-Au; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-004Kex-06; Wed, 15 Mar 2023 16:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-0057lB-3V; Wed, 15 Mar 2023 16:08:29 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 146/173] ASoC: tegra: tegra186_dspk: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:07:18 +0100
Message-Id: <20230315150745.67084-147-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Ye5g1gghrV9Sm/9HNFXIbWrlR3eA628GPRnVOdt5+OU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7qjEOW9UkHu9CmGlJjL8sn4Z0G6scI5G19t
 tXtr/r9WP+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe6gAKCRDB/BR4rcrs
 CWRwB/49eujdvervl9zc1OUrG/6VTmE8WmytgLVWJVFBxSfj/GZIWg4mysTYWn1DyWVPK64pexi
 QFduWIKzH2l/sxIoJvO1ZUmiihC2/Qk6mDOm+XPkB0kgHg0hf/itAFN1/8jQqpIjT396/3Ay+94
 iuX7fr4AvFw/KtODi9+XZz04/EWLcdnQZwuXkFzDpNZfegsg+O305SAsmbKgM39+5ZEtUZP/ZvO
 WGDrplFQ5hunqmEEwuveVcgKQkxA1VTOHMi1ytAqkjvoLB59KDrhINwaXxCZXk8qmuO8TNyoko+
 OU3pUG3K/HIcBprQKqgP4xZ2/VBMRydVFNPbkgryV8OAKiR3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 5BE7AGWG2PUASZX3HUFW56WIM32ZTIT5
X-Message-ID-Hash: 5BE7AGWG2PUASZX3HUFW56WIM32ZTIT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BE7AGWG2PUASZX3HUFW56WIM32ZTIT5/>
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
 sound/soc/tegra/tegra186_dspk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index a74c980ee775..a0ce7eb11de9 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -524,11 +524,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra186_dspk_platform_remove(struct platform_device *pdev)
+static void tegra186_dspk_platform_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra186_dspk_pm_ops = {
@@ -545,7 +543,7 @@ static struct platform_driver tegra186_dspk_driver = {
 		.pm = &tegra186_dspk_pm_ops,
 	},
 	.probe = tegra186_dspk_platform_probe,
-	.remove = tegra186_dspk_platform_remove,
+	.remove_new = tegra186_dspk_platform_remove,
 };
 module_platform_driver(tegra186_dspk_driver);
 
-- 
2.39.2

