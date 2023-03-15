Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44E6BB8AA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:54:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC15154A;
	Wed, 15 Mar 2023 16:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC15154A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895683;
	bh=zLxnf1jUFU7w0MTv+EbqAy7vb5dDXijHl5zIUv9JeqA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VS9yoTUW34GTKqMoP50U70ZgimGxLSH5HndeYA2tgk4EXMMWSSnqFnIdLmp9YXewb
	 yfzDjFbdg1I9N5ArpUWjUFPW5l60yi+k6a6ackpWBTMSbTIJJTaR9TCyRW7X7YfaP+
	 08sV2y6FhZF38TmlVnRJdp25m2w5Tdt0l190/E5E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1FBBF8972E;
	Wed, 15 Mar 2023 16:18:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF0F2F8059F; Wed, 15 Mar 2023 16:11:04 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CF3F7F805AB
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF3F7F805AB
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjn-0008Ij-JE; Wed, 15 Mar 2023 16:08:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-004KbR-UW; Wed, 15 Mar 2023 16:08:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-0057iH-00; Wed, 15 Mar 2023 16:08:19 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Gongjun Song <gongjun.song@intel.com>,
	Shuming Fan <shumingf@realtek.com>,
	Yong Zhi <yong.zhi@intel.com>
Subject: [PATCH 101/173] ASoC: Intel: sof_sdw: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:33 +0100
Message-Id: <20230315150745.67084-102-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=zLxnf1jUFU7w0MTv+EbqAy7vb5dDXijHl5zIUv9JeqA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5dK73QSFMe1md0vSdRz2fUVGnuIHNz5Frco
 YaWRK79ZgmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeXQAKCRDB/BR4rcrs
 CQo3B/4vq0sSCwqYFGsWGx1LQYD8MlvHN761N4y+a7uZy4AHgCShey7GJv2pqk87IDv3nn+Mfi5
 4BT1SwPg588I4iNX3Si5LUR9HFXwX8t3tH0/mlWKh7u/6xGZIzTBhnSyUlMAF+S+6SFOBJMzSjv
 WQgsYqezeHUg8xYzjusJKBP0WZweud97q1ZDK+wGivRoYjV6BY8PZbFijGB3FA31vjjo8LvR7zw
 +8bOXSndpl6u+urW/azK5FTPXyoa/0lfy0xlojGY3Nvw5fOGmZny8QBZ3uKhQfalaW+fJXx3TcE
 raqxRHACKZeU4yDew6U5DAXSn6psotdZClih2NRKgpLmOu61
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7ZQXTNDKEPQCKRTGW2O2ORLNCJ4LAE6L
X-Message-ID-Hash: 7ZQXTNDKEPQCKRTGW2O2ORLNCJ4LAE6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZQXTNDKEPQCKRTGW2O2ORLNCJ4LAE6L/>
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
 sound/soc/intel/boards/sof_sdw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d2ed807abde9..4ea69197791c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1602,13 +1602,11 @@ static int mc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mc_remove(struct platform_device *pdev)
+static void mc_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	mc_dailink_exit_loop(card);
-
-	return 0;
 }
 
 static struct platform_driver sof_sdw_driver = {
@@ -1617,7 +1615,7 @@ static struct platform_driver sof_sdw_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = mc_probe,
-	.remove = mc_remove,
+	.remove_new = mc_remove,
 };
 
 module_platform_driver(sof_sdw_driver);
-- 
2.39.2

