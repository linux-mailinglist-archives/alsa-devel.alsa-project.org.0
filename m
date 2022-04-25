Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F6C50E98C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 21:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BB21848;
	Mon, 25 Apr 2022 21:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BB21848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650915213;
	bh=aytEzzqd8p70MXAQzzm9XPRgY38S6phcaT5Su2FugZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vOqs5cCzA47dBZGwuAgF4ddBPi8/oaQofHLxr/nlXBooEEWWoGGLUs+NjVrjMTXm3
	 xtuTXRrb84070fbdlG7rKJot9I2SSgpm/I8LCMxYlmBKuZrq39OpHQlHI2J/pY0Jab
	 Dfxi1Ewya8/21c4KwZEtCxQQKRXUVls+3+Fx3teo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A24EF800FA;
	Mon, 25 Apr 2022 21:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99C21F8016A; Mon, 25 Apr 2022 21:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68C9BF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 21:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C9BF800FA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4RY-0004gr-GL; Mon, 25 Apr 2022 21:32:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4RZ-005CoH-6h; Mon, 25 Apr 2022 21:32:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nj4RX-005aWg-4k; Mon, 25 Apr 2022 21:32:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: tas6424: Return zero in remove callback
Date: Mon, 25 Apr 2022 21:32:06 +0200
Message-Id: <20220425193206.61710-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; h=from:subject;
 bh=aytEzzqd8p70MXAQzzm9XPRgY38S6phcaT5Su2FugZY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiZvcxik2BTuAMjWHAHx5958IP/xbntI1PCszznqdi
 r/BneWiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYmb3MQAKCRDB/BR4rcrsCaCcB/
 wIUQjD/AqXRkHwIOPT9stOnUsiGLTKKwu17GMnlNfmbjpoT/AxqsEZi0uGRjAv1u9N5V0C1x3NMEnl
 7iK/VBpDg1IsxcVTRNJ1M0gkIOBX9wR5MRYP/WaVo92/cu2RsGmGLG5BtY9d2TKaxEboD86DVs4aPD
 ufqCoCwdlpM3mjx4y/tVk8ZzytWdu7AgzAJfZdjvJuVDel/wiRsDnoAfbw4pXcftZA7ouNQzTuntUj
 ObQSilhhb4PigSrVF8UyIS+i/N4aHgQHflob123SLklWwBFgNmMmnANZAy7pZsGji20QZ1sn2Ecyj/
 L0PZ1liYxDsaI2BS0QhLYAszXXcMa0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The only effect of returning an error code in an i2c remove callback
(compared to returning zero) is that the i2c core emits a generic
warning. The device is still removed.

So even if disabling the regulators fails it's sensible to return zero
to suppress the additional generic and little helpful error message.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/tas6424.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index 59543d392110..8b587c4e6c97 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -786,10 +786,8 @@ static int tas6424_i2c_remove(struct i2c_client *client)
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(tas6424->supplies),
 				     tas6424->supplies);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(dev, "unable to disable supplies: %d\n", ret);
-		return ret;
-	}
 
 	return 0;
 }

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

