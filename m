Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546626BB7FC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7C61435;
	Wed, 15 Mar 2023 16:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7C61435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894562;
	bh=DYgV418G1HHJeUqCA1P1kSgz2wPVPuFAcd/9MCT5gwM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fV9srsi8whuATtGQc8mEr8bxElKp44jllW8LyWA7gSEtXz17YMSBahH29QvQTQSw6
	 slBJp+4i7CtYwmrYkyWnhUsQWklxz/JUR3ilqAXT4dpbyfKbz2w/kEc9xMw/3YVKdC
	 pT4ZkFqSrUUUWr2ddrnNlVQT0oGd2fd24x6IAH3c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E0CCF80529;
	Wed, 15 Mar 2023 16:13:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24852F805D9; Wed, 15 Mar 2023 16:09:58 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 39C06F805F5
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C06F805F5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjs-00007m-6A; Wed, 15 Mar 2023 16:08:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-004Kd4-CM; Wed, 15 Mar 2023 16:08:24 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0057jg-PB; Wed, 15 Mar 2023 16:08:23 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 122/173] ASoC: rockchip: rockchip_rt5645: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:54 +0100
Message-Id: <20230315150745.67084-123-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=DYgV418G1HHJeUqCA1P1kSgz2wPVPuFAcd/9MCT5gwM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6f1wJzQoQD2KJzDYqef/HTE55r9Gi6cw/3Y
 j+egw14J2yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHenwAKCRDB/BR4rcrs
 CStYB/wKLpGaEafdneDGlLIhen0gzV3CF324RUbG9aCV5HIu06+4ZtTa3ojtN2fdpsiyPnDSnQh
 RYSpAIJda34Z26emwUC1P7qwqjBqxDMT6K2gvK+8o99EdttfdR83juiiymJg/fAEX8U4OjtEWgC
 9PT2Xtx6CoMIMkRkcbhDv2wOSchPsfLFxE+YkSWgQYrsBuAscZmMrkrfDY+0T1KRHgym7X1hTga
 UJAhaxFCxh5zhxy3OcmEuDhwCNvWcshLE62Hd9nvqr2z/b0aoetqFXh2aJw74WPWQKz6/mOaruf
 gQfin9fYn38PLvvIty1tW/im8tlNMtiOi743hv1yOZM9GQWc
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: LHW7NXTLJAFDQ5ERVXLTMTEWCDAAYUKV
X-Message-ID-Hash: LHW7NXTLJAFDQ5ERVXLTMTEWCDAAYUKV
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHW7NXTLJAFDQ5ERVXLTMTEWCDAAYUKV/>
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
 sound/soc/rockchip/rockchip_rt5645.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index d07cc5c813f2..e73a342b7953 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -206,14 +206,12 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int snd_rk_mc_remove(struct platform_device *pdev)
+static void snd_rk_mc_remove(struct platform_device *pdev)
 {
 	of_node_put(rk_dailink.cpus->of_node);
 	rk_dailink.cpus->of_node = NULL;
 	of_node_put(rk_dailink.codecs->of_node);
 	rk_dailink.codecs->of_node = NULL;
-
-	return 0;
 }
 
 static const struct of_device_id rockchip_rt5645_of_match[] = {
@@ -225,7 +223,7 @@ MODULE_DEVICE_TABLE(of, rockchip_rt5645_of_match);
 
 static struct platform_driver snd_rk_mc_driver = {
 	.probe = snd_rk_mc_probe,
-	.remove = snd_rk_mc_remove,
+	.remove_new = snd_rk_mc_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &snd_soc_pm_ops,
-- 
2.39.2

