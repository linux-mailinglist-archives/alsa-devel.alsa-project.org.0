Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F46BB882
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BF81532;
	Wed, 15 Mar 2023 16:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BF81532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895544;
	bh=PFMpSw9IGFJcEAKF3FeqPJ0/4In5fqn24McFFYwxkMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oKRjBKgcOhvAbrPemccPGpd+95w/Gnx7DVbsg21/zpnDeImpn3jFaMO4zqLRWoNli
	 y25/pleK6XSv1BSDCUj/HcdlQdhi5bQdSjW0pmozJSkcv2YeqYRe9U+sz4Xabxsr2A
	 Q0k0kfj92DASF48grJtcODGRgSioysNq2BuApSJs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19EC4F80605;
	Wed, 15 Mar 2023 16:17:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3CF8F8061F; Wed, 15 Mar 2023 16:10:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D64BF80637
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D64BF80637
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000RL-Ip; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-004Kew-03; Wed, 15 Mar 2023 16:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-0057lF-9M; Wed, 15 Mar 2023 16:08:29 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 147/173] ASoC: tegra: tegra20_ac97: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:19 +0100
Message-Id: <20230315150745.67084-148-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=PFMpSw9IGFJcEAKF3FeqPJ0/4In5fqn24McFFYwxkMQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7tl+aWZTYs/bRbpOugPsYwDEEN5VG34wfeG
 q1FQOOuro6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe7QAKCRDB/BR4rcrs
 CXHHB/914JKOxvGA3HKq5KrEd9PgAZcCh2v+3oY90zL22a05NqX2YB3GtDogV2l6gXV+BGjgTEW
 XTR/qwxG2xrGohQkl38HvkVch9Zbg/nsHK1KnQvfb0Wyj5bXbAbwoUY95sJp6ho4m19RmwDXYar
 mXQip9Yjf4LriClgBYq58g0KzGOXht/lehdC+ie4A/hRcBdY8IKkOqDNwm9acGT7zq7oWt5x4Su
 +awEpdAPfTDJA8rLvl/ZTQm5arnbTB8VTdVW9iYKtohtLtbgLYoKaZuHWRXlgVkWzFdIjge3dxQ
 5a+e0qaQHvwbej5eTQjYpIq8/KM3sQEvqToMkzerSRyQvbYF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: DCEGF7ECUYMBWWHS2I3BOOOTNHNUWKLW
X-Message-ID-Hash: DCEGF7ECUYMBWWHS2I3BOOOTNHNUWKLW
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
Archived-At: <>
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
 sound/soc/tegra/tegra20_ac97.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index d23d88a10899..fea6955f7f43 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -429,7 +429,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra20_ac97_platform_remove(struct platform_device *pdev)
+static void tegra20_ac97_platform_remove(struct platform_device *pdev)
 {
 	struct tegra20_ac97 *ac97 = dev_get_drvdata(&pdev->dev);
 
@@ -439,8 +439,6 @@ static int tegra20_ac97_platform_remove(struct platform_device *pdev)
 	clk_disable_unprepare(ac97->clk_ac97);
 
 	snd_soc_set_ac97_ops(NULL);
-
-	return 0;
 }
 
 static const struct of_device_id tegra20_ac97_of_match[] = {
@@ -454,7 +452,7 @@ static struct platform_driver tegra20_ac97_driver = {
 		.of_match_table = tegra20_ac97_of_match,
 	},
 	.probe = tegra20_ac97_platform_probe,
-	.remove = tegra20_ac97_platform_remove,
+	.remove_new = tegra20_ac97_platform_remove,
 };
 module_platform_driver(tegra20_ac97_driver);
 
-- 
2.39.2

