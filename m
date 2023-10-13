Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2877C9035
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 00:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9423284A;
	Sat, 14 Oct 2023 00:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9423284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697235779;
	bh=TllgjmOjMn10IcS4j2LTAf95NQP1JOMB2P4WeNA3glA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WUwcfkflwq+KLYe2gKcGm62Huu+VdV1doPMac9zwgr67+Cv0s6x37j+ZobJB5uJ49
	 aFrnLKP6pl/nPfnrgV0EiKji0vdElrU1jWOTbmnYA7AOQzS528RoxDQO9un5UUjFzl
	 9hcgTntNr36Gk+Easaclm9rIuYRhbEgJIR5ByK8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93CB2F8057C; Sat, 14 Oct 2023 00:21:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EF7F80571;
	Sat, 14 Oct 2023 00:21:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D484F802E8; Sat, 14 Oct 2023 00:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0059BF802BE
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 00:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0059BF802BE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVv-0003u2-Mh; Sat, 14 Oct 2023 00:20:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-001UR1-MZ; Sat, 14 Oct 2023 00:20:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qrQVu-00FrGo-DA; Sat, 14 Oct 2023 00:20:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 1/7] ASoC: rockchip: i2s_tdm: Convert to platform remove
 callback returning void
Date: Sat, 14 Oct 2023 00:19:47 +0200
Message-ID: <20231013221945.1489203-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
References: <20231013221945.1489203-9-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=TllgjmOjMn10IcS4j2LTAf95NQP1JOMB2P4WeNA3glA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKcKCP/NXhj0+ihQ+srsUX95YXpJG5+0IZy8Iu
 eZgljftmt2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSnCggAKCRCPgPtYfRL+
 TmSFB/4sT4DJ034kWuvTwoq22jsYVgiW1Q7xzIWZcBuAX2Spwetg9y0flIXxPLCfAj+yn+6uBZw
 1o/nympFzyUhMsxc48WTFX2j7o2sQW4NNLhB3xfA/T/H71MnXZb92R/VKs9WSJc6QcDzXD+bNus
 Ff9Wf3PMWoIUPIKq5vpxEDqavSeewxK7m4F40Cr/cYk2wn2ONgGNeFQDfMUOK8wgzJceCF1fTIW
 mL6dDSi3cszIQHnHcmt4O/x5laqTFEPvk4RbqOcsNDA+h0ZouQMBthj1yl1gbLF7zeZ5NwsPqWs
 O5Pxu+sVWG/iQ/d7JgfWF3pWYmhAtPmZ5ZUJtpFT1dJR6ahL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: WCC37J7WFPQMSBE3J4S52XCKU67NEVWD
X-Message-ID-Hash: WCC37J7WFPQMSBE3J4S52XCKU67NEVWD
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCC37J7WFPQMSBE3J4S52XCKU67NEVWD/>
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
 sound/soc/rockchip/rockchip_i2s_tdm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 7e996550d1df..5c51dbef6e86 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1714,14 +1714,12 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
+static void rockchip_i2s_tdm_remove(struct platform_device *pdev)
 {
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		i2s_tdm_runtime_suspend(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused rockchip_i2s_tdm_suspend(struct device *dev)
@@ -1756,7 +1754,7 @@ static const struct dev_pm_ops rockchip_i2s_tdm_pm_ops = {
 
 static struct platform_driver rockchip_i2s_tdm_driver = {
 	.probe = rockchip_i2s_tdm_probe,
-	.remove = rockchip_i2s_tdm_remove,
+	.remove_new = rockchip_i2s_tdm_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_tdm_match),
-- 
2.42.0

