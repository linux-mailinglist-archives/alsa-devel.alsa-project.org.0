Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6F6BB85A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F0714DC;
	Wed, 15 Mar 2023 16:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F0714DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895224;
	bh=fWZJsnGH2uLdHPwSxxFOSiOxqdOu0m80cnpD2MOxUNM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gzp5KQldcnECRvUmxaKue9EQF4dUq+T2aIEZVibPdVj/5el34gyYiCHp0TA0MtWdg
	 css8zaIM/F5ZETwWuEl4NnqKzU4RkDFHWLmcT/9rfGELG1ZVz+jpsqcXtE+2IcKQaH
	 9D+afgvpWR+Uh8iaeVgih4hT9L0wxB9Gor8ZBFVM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C2ABF89629;
	Wed, 15 Mar 2023 16:16:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0024FF8060D; Wed, 15 Mar 2023 16:10:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C087FF80620
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C087FF80620
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjy-0000R2-8V; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjt-004Keu-VV; Wed, 15 Mar 2023 16:08:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-0057l8-SX; Wed, 15 Mar 2023 16:08:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH 145/173] ASoC: tegra: tegra186_asrc: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:07:17 +0100
Message-Id: <20230315150745.67084-146-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fWZJsnGH2uLdHPwSxxFOSiOxqdOu0m80cnpD2MOxUNM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7ny82Qx0kG9i3881DP3w0MzH0IoaBMpztfv
 /lcwA2cHYqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe5wAKCRDB/BR4rcrs
 CY7UB/9WdGGSIQw8NtZbUPG4pp4H0jA/2ygBa/MNqOKrAOmGDw0VjI0K/SKB1DUSWVoh3S4p4FE
 MiE62ad48jJH3vro0izu8ympDsAlcnz0asT23wccnRNBJ1nTM2PbCYXnbEa6+shYBwHihlWTJKn
 O1O7LUzyPLG4kf0bpBBeEINv9slMrO1n2ypza9x3xy2V4mMGlDMK6jf4E9EeE+BM2gnlSW8ahmy
 LtC1Dzu1TVRi/jNaZgnTRfQMFZLR8s86mWx5d8NCLwRHFNrDTV9rhwsLhhdMk20QT99mOJnO4QG
 N4LlgXdm3mm7cya7+4ohrwcJRxG+WoR0FinszMNQvmazBQaf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 6W35IN5AOEYK3YDQZ6EKNCUXWMVZ3HPR
X-Message-ID-Hash: 6W35IN5AOEYK3YDQZ6EKNCUXWMVZ3HPR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6W35IN5AOEYK3YDQZ6EKNCUXWMVZ3HPR/>
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
 sound/soc/tegra/tegra186_asrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 9f12faaa609d..e016a6a7f7c4 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -1016,11 +1016,9 @@ static int tegra186_asrc_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra186_asrc_platform_remove(struct platform_device *pdev)
+static void tegra186_asrc_platform_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra186_asrc_pm_ops = {
@@ -1037,7 +1035,7 @@ static struct platform_driver tegra186_asrc_driver = {
 		.pm = &tegra186_asrc_pm_ops,
 	},
 	.probe = tegra186_asrc_platform_probe,
-	.remove = tegra186_asrc_platform_remove,
+	.remove_new = tegra186_asrc_platform_remove,
 };
 module_platform_driver(tegra186_asrc_driver)
 
-- 
2.39.2

