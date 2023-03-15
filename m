Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79E6BB862
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:47:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB4B614B6;
	Wed, 15 Mar 2023 16:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB4B614B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895270;
	bh=tH1fqkyGsGjPKdIEAp+LvjTKyjqxxpS1lexqFqgI+Z4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aoOhbrYuSqDZrBtns/n2PKlvFNo7Te4fnEiKe4+IZK3CufBcF+5E9PRk2ZyzhSnlZ
	 ic3OC4zmfg8IWz7EKVdtfadnCh2W4kJPus1/f7XTOTB1c57+mOilyEXehe38hwdpJe
	 KFnSBM0p6wGZdJAkAnMRHol1FX0Xt3So1tOBytBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D183FF805F6;
	Wed, 15 Mar 2023 16:16:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54B02F80610; Wed, 15 Mar 2023 16:10:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ED27EF80624
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED27EF80624
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjz-0000WK-WA; Wed, 15 Mar 2023 16:08:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjv-004Kfc-Jm; Wed, 15 Mar 2023 16:08:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSju-0057lk-Ob; Wed, 15 Mar 2023 16:08:30 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 154/173] ASoC: tegra: tegra210_i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:07:26 +0100
Message-Id: <20230315150745.67084-155-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tH1fqkyGsGjPKdIEAp+LvjTKyjqxxpS1lexqFqgI+Z4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8CrFXDH2jjw5yiOOFG+8tgO7EeCD77/oe3k
 eiD9DGU4d2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfAgAKCRDB/BR4rcrs
 CXAbCACYH9ByLZqYTGX2IAl3xx9HTrah5SwbRX8IU31Rn3BosIZ3c0wxajoKuhqL+D26EfkCA8i
 dvI1OfJiXyUajycWo1TZESwkE75Tyu275zlWktGh8ouB9Te0FsNDDnNLtxi4XKoOLcbMuXsaBTX
 l7eEgeB51p+AveSf8rPnpuX7o/ygAFO/aHu7wHBhVuRvAygt6/xVP0KwuAbA+/mxp+swM5+4WY3
 mmHMZXLC1XpkNTDEDpd8RJIxNYpR30sCidGLopDQAA6xq/mBRX1bL1SgyHj3PLVb7FCoRMjSxtg
 25cfDrdmWsgO7eOc3/FjXQeZh15VmNgKGcBqNhq6iuW7mdEA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: RGH6TUKZ4LZWVHWLCVOAUAY7T5MFEDXQ
X-Message-ID-Hash: RGH6TUKZ4LZWVHWLCVOAUAY7T5MFEDXQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGH6TUKZ4LZWVHWLCVOAUAY7T5MFEDXQ/>
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
 sound/soc/tegra/tegra210_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 39ffa4d76b59..21724cd3525e 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -931,11 +931,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra210_i2s_remove(struct platform_device *pdev)
+static void tegra210_i2s_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra210_i2s_pm_ops = {
@@ -958,7 +956,7 @@ static struct platform_driver tegra210_i2s_driver = {
 		.pm = &tegra210_i2s_pm_ops,
 	},
 	.probe = tegra210_i2s_probe,
-	.remove = tegra210_i2s_remove,
+	.remove_new = tegra210_i2s_remove,
 };
 module_platform_driver(tegra210_i2s_driver)
 
-- 
2.39.2

