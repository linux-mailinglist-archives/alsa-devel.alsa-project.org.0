Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF996BB859
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:46:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD5F14E3;
	Wed, 15 Mar 2023 16:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD5F14E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895210;
	bh=mG2xnGK54c3gkW/J424fJ+pvT7zOveXy6saMBndeJ+c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UeBRpmcgwpDqT1/xbc0GNKlxWAZziUukRStYrPORcRbNBmf5x/5g7g5Vt9AHyxx4+
	 MwvRc3g0djae6AgB9r3rj9mgvMpjL4kA5WQ2PjgpXIbDGPq2YMxYykRtvFEWDaYdi0
	 fbm8ycC/Yy32OjH8JWv166qONQMta8en59KM6sNk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5E5F89623;
	Wed, 15 Mar 2023 16:16:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22750F8060D; Wed, 15 Mar 2023 16:10:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A8922F8055B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8922F8055B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSk1-0000ag-MD; Wed, 15 Mar 2023 16:08:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjw-004Kg2-PG; Wed, 15 Mar 2023 16:08:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjv-0057m5-SY; Wed, 15 Mar 2023 16:08:31 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 159/173] ASoC: tegra: tegra30_ahub: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:31 +0100
Message-Id: <20230315150745.67084-160-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mG2xnGK54c3gkW/J424fJ+pvT7zOveXy6saMBndeJ+c=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8QzEiiU8opy8RYp3fNcee8lJIQ5bdkDGkZY
 XU1XbYXPCaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfEAAKCRDB/BR4rcrs
 CcfnB/9KJz1M50Tu4usZY4MPTUlYp5yhkvN4jpmmLVx/uANQWiFIOMdPMzoBDo8FkEEQG3mpl6W
 5UwOA3vLyS8gg0LIJssUu7GfJPQi5dq1eGPPQaoCy7dnlGIIItcms0GnfcBlSqAuH7mNbJdzoGW
 ClzbzwehwCBfzpJyh1CfSdnVaOAgqsmCdXyomKaYuxHaRAAu+oHWMuClsYVXavoN/HfrYr2B+/F
 BF9fKQxoFvpFm0DEj2hlquDhY+nAOfr5ltn1rBQjOcvpjOY/zxzVxaAk2N0DrBnGlGD+ZPst2LA
 caEvF24AqoEZ7vvB171AbB+AzKffwDO1R4J1zsTTQpPTWbwq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 5I3774XKQJX2NLZBRU2QPXYA77PL4EWO
X-Message-ID-Hash: 5I3774XKQJX2NLZBRU2QPXYA77PL4EWO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5I3774XKQJX2NLZBRU2QPXYA77PL4EWO/>
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
 sound/soc/tegra/tegra30_ahub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index ef011a488ceb..d2e8078e444a 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -592,13 +592,11 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra30_ahub_remove(struct platform_device *pdev)
+static void tegra30_ahub_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	ahub = NULL;
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
@@ -610,7 +608,7 @@ static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 
 static struct platform_driver tegra30_ahub_driver = {
 	.probe = tegra30_ahub_probe,
-	.remove = tegra30_ahub_remove,
+	.remove_new = tegra30_ahub_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra30_ahub_of_match,
-- 
2.39.2

