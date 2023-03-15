Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B04F6BB750
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:15:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1A612AD;
	Wed, 15 Mar 2023 16:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1A612AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893345;
	bh=tOybs4YO5WnX4XdM6zgWvbw/Ws2T59aBJKBlajmdgtE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kvkA8Zg0QuTnxwtRkc1qBzvGwkT+ZoK3pt9qdM3t/rQmdp6EPc+t4Ab8PbHFZqIbr
	 CMhuCsLqSTl1ZjMyDtkSWi6BHeslWmgWrReXI/7b6M7RexpA+xED2ZVtNha8WuSF5t
	 8i8z0OpqeTg14L3uenWYEerOalnCnjOo56J0NDJQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D029BF805D8;
	Wed, 15 Mar 2023 16:09:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A038F80607; Wed, 15 Mar 2023 16:08:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E4D0F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E4D0F800C9
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjX-0007Sq-5B; Wed, 15 Mar 2023 16:08:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjW-004KWp-FX; Wed, 15 Mar 2023 16:08:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjV-0057ea-Rq; Wed, 15 Mar 2023 16:08:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 043/173] ASoC: codecs: cs47l24: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:35 +0100
Message-Id: <20230315150745.67084-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tOybs4YO5WnX4XdM6zgWvbw/Ws2T59aBJKBlajmdgtE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2psg7lC4HgMpAmy42w8tkFW43V2qaXwfn/8
 NlYbx7TNB2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdqQAKCRDB/BR4rcrs
 CfmrB/9fje5rtegEWUU3YUFr31jvSXOuduQjgew5BZeL7MC4CoJLeUSN8xWNB6/9Rbj1OH1cgbz
 DbXTkyX9kDrCVNHwGE4NFOiptsv1ikyjWb09VnfQit6yBjqsw7HT66Hqzy4LBKN4KUTZW9Nspam
 8mYcPR0OkwHis5jisFkGDXVSHKkoMUqBS8dLqMECqUdgvVIWFGk1fTwRMdZTPhSByGbJFCcp2mq
 BGJ2Y3/gqS6vapc3Gk1ci+rWzyG3hezPW6mCdIQyx5o2fqEYpahYRUJfPeDVSdGUPj+ucG+c4oH
 cDL/VdJzpLNvMVGw4nRvHw6teuUuLChrmFVXSH3JXyRWp8RT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: LSD3MKXULTV7GEQT5ZBNVLHCWB7OINPE
X-Message-ID-Hash: LSD3MKXULTV7GEQT5ZBNVLHCWB7OINPE
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSD3MKXULTV7GEQT5ZBNVLHCWB7OINPE/>
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
 sound/soc/codecs/cs47l24.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index f9a2b865d717..a07b621d463e 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1319,7 +1319,7 @@ static int cs47l24_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cs47l24_remove(struct platform_device *pdev)
+static void cs47l24_remove(struct platform_device *pdev)
 {
 	struct cs47l24_priv *cs47l24 = platform_get_drvdata(pdev);
 	struct arizona *arizona = cs47l24->core.arizona;
@@ -1333,8 +1333,6 @@ static int cs47l24_remove(struct platform_device *pdev)
 
 	arizona_set_irq_wake(arizona, ARIZONA_IRQ_DSP_IRQ1, 0);
 	arizona_free_irq(arizona, ARIZONA_IRQ_DSP_IRQ1, cs47l24);
-
-	return 0;
 }
 
 static struct platform_driver cs47l24_codec_driver = {
@@ -1342,7 +1340,7 @@ static struct platform_driver cs47l24_codec_driver = {
 		.name = "cs47l24-codec",
 	},
 	.probe = cs47l24_probe,
-	.remove = cs47l24_remove,
+	.remove_new = cs47l24_remove,
 };
 
 module_platform_driver(cs47l24_codec_driver);
-- 
2.39.2

