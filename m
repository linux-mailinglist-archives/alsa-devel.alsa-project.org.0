Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B563764A8F0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:57:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F6C2418;
	Mon, 12 Dec 2022 21:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F6C2418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878622;
	bh=k+rHtyNHPIWkorC5Eie2x9iYUarG6EgHFZi/z50Qu+I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GCFmo2pi2LEn4jdhJhFcoNNKK9c5whURZZENYL2oLdCK4P/PDcrLQ9e6hNwNuKrxI
	 yO1i0KzOMIMizMHE21sRwF5uBsrSgGg0SIAvNgKAUQJsjd64EGMh4sjXyuWu/efyUM
	 GcWYQxB9I/syUCxvxTci4/Xp9DXEkEggoL+5GF1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB554F8055A;
	Mon, 12 Dec 2022 21:54:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 981FFF80533; Mon, 12 Dec 2022 21:54:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AAFF804D7
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AAFF804D7
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poV-00017N-8F; Mon, 12 Dec 2022 21:54:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-00464Z-P4; Mon, 12 Dec 2022 21:54:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-004ai3-Pb; Mon, 12 Dec 2022 21:54:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 10/15] ASoC: mc13783: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:54:01 +0100
Message-Id: <20221212205406.3771071-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=878;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=k+rHtyNHPIWkorC5Eie2x9iYUarG6EgHFZi/z50Qu+I=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TYnUytDRWZIAzemZjsUs7HadgUD0EBRiz0K3v5
 72AM+OyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eU2AAKCRDB/BR4rcrsCdzsB/
 4lJZg0a7xZl+uQDy2q61eupY+oLoNHZwf3uAcYfKoxg1UPkOCnEiCcRuKIz3jFjbVlsyz3weqaD29+
 YfKVg57gg1Nfa1uRXj/Xuzvz48LfcJmoNieumDd8ZMXIiCCB261I67WZgLbT8T6rV6AAkShqUIRwU9
 b2IIa37dBijqz7KYOvS8M/gioBk8EgLUIXxQFDg5uqWUpeo/D6Fl2l2q9I5r0WK4pe27O/oQnJ13MS
 PgP475ff8rELTE81VFNUw7GphKQ1m210/vvH4DdrFdY8ajXdYqBALAFRvgzONDC/zB3Yalm+lIFSY4
 2bKfIWjnQHiz6yt+AUW1xlzsxPG60X
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/mc13783.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/mc13783.c b/sound/soc/codecs/mc13783.c
index 71490f11d96a..086ac97e8386 100644
--- a/sound/soc/codecs/mc13783.c
+++ b/sound/soc/codecs/mc13783.c
@@ -776,16 +776,10 @@ static int __init mc13783_codec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mc13783_codec_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver mc13783_codec_driver = {
 	.driver = {
 		.name	= "mc13783-codec",
 	},
-	.remove = mc13783_codec_remove,
 };
 module_platform_driver_probe(mc13783_codec_driver, mc13783_codec_probe);
 
-- 
2.38.1

