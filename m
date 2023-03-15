Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F66BB7CB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7A513A8;
	Wed, 15 Mar 2023 16:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7A513A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894201;
	bh=S7bx951p+HOZI+R4A02wuTDzqf4/t544R+GallvPJHE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SkxYdxGRO3kOBepA//xQeqtlnapQTsz1xfBcEZPnczQmeycyQBolT36hYs8CQIU5T
	 p38DBHO7SwU8ORFluCDUUrtrIf43m0cEoqa76NEpJh1f0ENz96mtoWviUetZyl2W0b
	 BttrSY9Kiwl0cE4JGJReIpFZX110WepBD0J2+PEE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C54CF80534;
	Wed, 15 Mar 2023 16:12:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E644F805C5; Wed, 15 Mar 2023 16:09:38 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BA3DF805D4
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA3DF805D4
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSji-00081Q-Gq; Wed, 15 Mar 2023 16:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-004Ka8-Ux; Wed, 15 Mar 2023 16:08:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0057hF-AX; Wed, 15 Mar 2023 16:08:15 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 084/173] ASoC: fsl: pcm030-audio-fabric: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:06:16 +0100
Message-Id: <20230315150745.67084-85-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=S7bx951p+HOZI+R4A02wuTDzqf4/t544R+GallvPJHE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4pIsou8KuPZoqVMvpX3nR3jV2JC+jYU65ej
 plOGJHSy+2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeKQAKCRDB/BR4rcrs
 CQIiB/96MPapTnv4TtYcEOyHeljMgwTE7ZJZfTtKT+xwgaTLuQ2JvUeEkmn0uuSv2VNbeqpox73
 n78aQPNBRPUyEWSzNokAEfFJ0FbDEPhtdAtPFnSDisYocolP2bzRHaujMV7hxN0ZQHgUVMd9Gwf
 i44SvIHLXaDBuSZkYcfqIh3mYM/r4wroo+Vfy5AhdNbFMyASJWX6pr0CO7QlwFADNwQWTXjZMLb
 NbRO+cuBqf908B7IpK2JtgpD05EVDd/UJmc6NaNPbraTG7aTHmfupUaQdWkyvN3XsHdcu1JrxO6
 HTm2fYgo4i9phlsd5IXbO7zGd2eLWbTmuBp2ym11K3soxAq6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ZPETNC6HK6ECN6QG4DBB5ZPUDOKPYOKP
X-Message-ID-Hash: ZPETNC6HK6ECN6QG4DBB5ZPUDOKPYOKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPETNC6HK6ECN6QG4DBB5ZPUDOKPYOKP/>
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
 sound/soc/fsl/pcm030-audio-fabric.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 997c3e66c636..d24c02e90878 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -109,14 +109,12 @@ static int pcm030_fabric_probe(struct platform_device *op)
 
 }
 
-static int pcm030_fabric_remove(struct platform_device *op)
+static void pcm030_fabric_remove(struct platform_device *op)
 {
 	struct pcm030_audio_data *pdata = platform_get_drvdata(op);
 
 	snd_soc_unregister_card(pdata->card);
 	platform_device_unregister(pdata->codec_device);
-
-	return 0;
 }
 
 static const struct of_device_id pcm030_audio_match[] = {
@@ -127,7 +125,7 @@ MODULE_DEVICE_TABLE(of, pcm030_audio_match);
 
 static struct platform_driver pcm030_fabric_driver = {
 	.probe		= pcm030_fabric_probe,
-	.remove		= pcm030_fabric_remove,
+	.remove_new	= pcm030_fabric_remove,
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table    = pcm030_audio_match,
-- 
2.39.2

