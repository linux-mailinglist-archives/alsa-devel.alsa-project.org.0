Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A26BB736
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:12:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA44126F;
	Wed, 15 Mar 2023 16:12:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA44126F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893177;
	bh=58pwx6LCcANvd2JiSXBwBOaBRAasufu5xSQZ0gnGNI4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tdo2UuoruzOEvjqF0CZt2kyNwSTwsm0SHRC5+zPdE56MmqqZd7bsc6OnHMEGkWP/g
	 mLalzQmZLmMT8gVXiWKy79gzq/JYRIuQ9pM1PWR4AhOojnapsRU7ft2N37NIR5sKyX
	 nZnnq7kH+WwcCQLiAc+mJZqycw7zhXVcOvsJzOTc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9543F80533;
	Wed, 15 Mar 2023 16:09:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8E9BF805E0; Wed, 15 Mar 2023 16:08:27 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C07C8F804B1
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07C8F804B1
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-00076r-Sk; Wed, 15 Mar 2023 16:08:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjQ-004KUR-5D; Wed, 15 Mar 2023 16:08:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-0057cZ-23; Wed, 15 Mar 2023 16:07:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 012/173] ALSA: sh_dac_audio: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:04 +0100
Message-Id: <20230315150745.67084-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=58pwx6LCcANvd2JiSXBwBOaBRAasufu5xSQZ0gnGNI4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1Mag0KQu4LR+fUCnhsNPXIcsRXf/6m7a8oP
 /426+epKxqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdTAAKCRDB/BR4rcrs
 CQYtB/9lYDayxVlNUVoQup/O6MFWg2vDH6KQv/+k26HVq5WCb0C4PNHkvUOn/xjI5HZvONDu9hj
 tqwjzafkrlHViYDB8Co4nPBLBYo/aYQcKZ+0DtGP0uGfG4VPplMBx/rmcYzKQ7UJJ3lwK4O7xYq
 /i3FBZNYdw8Wy8VLuGeoFsW7m4ELZ2GRg+5aIeA0LN+SIpjKDxdjs+612pbmKlR1ijLZZWVhBRy
 tLA4Ev+2qNUon5dNAFUvdwlxY7Tz5tynHIegR+aO3XF5pWbC7AfRKczqXN7sDb8LOHIVkGYyAmm
 HQst8XCwCcMoLtQtNHaejGSeHqVzBFjWDL4Ktx9Bme7nK7F3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: X76M3XXY5HOT6QZUEN2LHP35TO6DJP3S
X-Message-ID-Hash: X76M3XXY5HOT6QZUEN2LHP35TO6DJP3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X76M3XXY5HOT6QZUEN2LHP35TO6DJP3S/>
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
 sound/sh/sh_dac_audio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/sh/sh_dac_audio.c b/sound/sh/sh_dac_audio.c
index 8ebd972846ac..8cf571955c9d 100644
--- a/sound/sh/sh_dac_audio.c
+++ b/sound/sh/sh_dac_audio.c
@@ -257,10 +257,9 @@ static int snd_sh_dac_pcm(struct snd_sh_dac *chip, int device)
 
 
 /* driver .remove  --  destructor */
-static int snd_sh_dac_remove(struct platform_device *devptr)
+static void snd_sh_dac_remove(struct platform_device *devptr)
 {
 	snd_card_free(platform_get_drvdata(devptr));
-	return 0;
 }
 
 /* free -- it has been defined by create */
@@ -403,7 +402,7 @@ static int snd_sh_dac_probe(struct platform_device *devptr)
  */
 static struct platform_driver sh_dac_driver = {
 	.probe	= snd_sh_dac_probe,
-	.remove = snd_sh_dac_remove,
+	.remove_new = snd_sh_dac_remove,
 	.driver = {
 		.name = "dac_audio",
 	},
-- 
2.39.2

