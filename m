Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1F6BB733
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C8A21268;
	Wed, 15 Mar 2023 16:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C8A21268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893156;
	bh=g4yCYuNhl6LIUMSC0Z8O7b1Q229FupMzuqD0eVQW/GI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aIfj5APYiwQ78bvzc2Ucu0dunfHtuVPbYnze5ToZTo2nSSgym539SKgJZcf9zwA6g
	 sZUcZe1au7NaBAATfRY1Gw9ZO5xwUy9EGtURpVKyihJJERktPM6r1GXc+fC3d2HzES
	 wAq0kHRdUMcqVDMENEEF3dypbv0c2eBr2NDArYHg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3D7F8057C;
	Wed, 15 Mar 2023 16:08:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8162F805DA; Wed, 15 Mar 2023 16:08:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 247F0F8052D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 247F0F8052D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-00076s-DB; Wed, 15 Mar 2023 16:08:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-004KUT-7C; Wed, 15 Mar 2023 16:08:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-0057cd-8J; Wed, 15 Mar 2023 16:07:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 013/173] ASoC: adi: axi-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:05 +0100
Message-Id: <20230315150745.67084-14-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=g4yCYuNhl6LIUMSC0Z8O7b1Q229FupMzuqD0eVQW/GI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1OQTdkca8miaku2Zm/O8ZhYYogGmoTLu0sa
 t1rN16hYzOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdTgAKCRDB/BR4rcrs
 CZkPB/9tuSi3mv6PhjKsy86ztFAP1Qb5qUOm5UWIv6sfPGA9I7Ict/mYhb4XV3gnuiWjIxoQ5tR
 HFuuCELTqmql2mt0/iDyb3KGXvK+xBLZ6U/Y/jtGyEen74YuIaPZRnA7GerJcS/BPr3KtwVaoIQ
 WfMr3ck8mprZS4+ciyvusjfVDTb/NvvBzndqFSERJ/vZZZ3cI95Odvr5Bn+jvCX0Ca4knHprM+k
 xW+4Erg3r8WOrf+axNydSjbexQcA2wbUe6SsFF3dksk3FkuySn33Sgf/x9WGb7tAIVucoWRGnlk
 frqgeZ7/tsEKOr0NxhJ4pX3/Jj8lasuOQamT+2qkWsaKcXIt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: HWPEGTOUB7GMHJ7ZJADJ32SK7CF73MLM
X-Message-ID-Hash: HWPEGTOUB7GMHJ7ZJADJ32SK7CF73MLM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWPEGTOUB7GMHJ7ZJADJ32SK7CF73MLM/>
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
 sound/soc/adi/axi-i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index b1342351bff4..d5b6f5187f8e 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -274,13 +274,11 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int axi_i2s_dev_remove(struct platform_device *pdev)
+static void axi_i2s_dev_remove(struct platform_device *pdev)
 {
 	struct axi_i2s *i2s = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(i2s->clk);
-
-	return 0;
 }
 
 static const struct of_device_id axi_i2s_of_match[] = {
@@ -295,7 +293,7 @@ static struct platform_driver axi_i2s_driver = {
 		.of_match_table = axi_i2s_of_match,
 	},
 	.probe = axi_i2s_probe,
-	.remove = axi_i2s_dev_remove,
+	.remove_new = axi_i2s_dev_remove,
 };
 module_platform_driver(axi_i2s_driver);
 
-- 
2.39.2

