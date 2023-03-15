Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C16BB789
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158C812E0;
	Wed, 15 Mar 2023 16:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158C812E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893776;
	bh=RdOTx4L18PJgB7/4GgPBuAX3vG8GwHh3vhRU82NKGcc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dk2XyW55yiNR9a75Qq3OVXA1/3r8k7mVQnUFBRtln4gWUAn9K4SCo+vpZ5nzWXxcR
	 fkNSJDRnkJtR0pW4hfEBLxdI4a8/Et10PhhNu7BKXcaieWwnjTZaRThfH1O84iHlIr
	 Tu2Dy9Tux+2Rkuy5HUANdgKyNrY2JwjRAk0NgJz0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 486A0F805FF;
	Wed, 15 Mar 2023 16:11:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61180F80655; Wed, 15 Mar 2023 16:09:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 113A4F805AC
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 113A4F805AC
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjU-0007Jt-LS; Wed, 15 Mar 2023 16:08:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-004KVn-PS; Wed, 15 Mar 2023 16:08:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-0057dl-VV; Wed, 15 Mar 2023 16:08:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 030/173] ASoC: atmel: mikroe-proto: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:22 +0100
Message-Id: <20230315150745.67084-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=RdOTx4L18PJgB7/4GgPBuAX3vG8GwHh3vhRU82NKGcc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd2DBoOoR8WJCor1CmdLOgFkJanJY8JJuFm2C
 YlN/3DywMCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdgwAKCRDB/BR4rcrs
 CfDtB/9cKtBpAv0x5H4EobXVvpeWykgbqGmgHlNFZidQ7fOrwytsRGMEVDnBh/D15CNlNnbBl7Y
 bKF+90NOl6bUenwXG92qYosCFlfXtrbi/pvjV2X2lflsfuoWvK3hDWITlbPZFtGnyZX+3sOxp9m
 okKf+P3bbREB+oJIyFSvMQr/aowiAySonA3ImRXQLlA85W1iC36KGSr4aoWvrQwmQQwgG1fp+3Z
 DlsHq+ghrqNgIYw8Grz79R9KMK/tVtLV6oSSfmK26ApEWFNSICeiXads04A3/pwMWU3zuuorbF+
 f/iUIQUSpP34zmmS6LWxwmYOSubs1DHddPL5BV50nTpzpFKj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: EMDD4QL2HP55Y4LQCS3S64EQSR3MMBZA
X-Message-ID-Hash: EMDD4QL2HP55Y4LQCS3S64EQSR3MMBZA
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMDD4QL2HP55Y4LQCS3S64EQSR3MMBZA/>
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
 sound/soc/atmel/mikroe-proto.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 954460719aa3..30c87c2c1b0b 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -155,11 +155,9 @@ static int snd_proto_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int snd_proto_remove(struct platform_device *pdev)
+static void snd_proto_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_card(&snd_proto);
-
-	return 0;
 }
 
 static const struct of_device_id snd_proto_of_match[] = {
@@ -174,7 +172,7 @@ static struct platform_driver snd_proto_driver = {
 		.of_match_table = snd_proto_of_match,
 	},
 	.probe	  = snd_proto_probe,
-	.remove	 = snd_proto_remove,
+	.remove_new	 = snd_proto_remove,
 };
 
 module_platform_driver(snd_proto_driver);
-- 
2.39.2

