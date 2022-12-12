Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FBB64A8EB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5E0917D6;
	Mon, 12 Dec 2022 21:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5E0917D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878563;
	bh=CMcEJ3+zoX4JLirg6U5erqubkx/H+03bCT+uRNvqcyk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ogVucfkpl49y00Bh2aiCLfpKLMjs8qAc8XnCil7tUslhMotoP36MQc35AYAGkQBPV
	 NF53zPlCW3zJZwVDcJxfS1OZHwdUj8UE+5fgXCilk9gRGUIqTOpV2RHRTaAJ4fOSeg
	 i5cIxru8gqetLiyrmJLGxaFFixJwGIFnGgvEjl4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DDB3F80533;
	Mon, 12 Dec 2022 21:54:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C07A4F80508; Mon, 12 Dec 2022 21:54:22 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 13DEAF800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DEAF800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poU-00016w-FC; Mon, 12 Dec 2022 21:54:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-00464S-24; Mon, 12 Dec 2022 21:54:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-004ahx-6q; Mon, 12 Dec 2022 21:54:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/15] ASoC: cq93vc: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:54:00 +0100
Message-Id: <20221212205406.3771071-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=CMcEJ3+zoX4JLirg6U5erqubkx/H+03bCT+uRNvqcyk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TVajT2M7q2gVHSUvHKnIXfeEROMeYglxLKKVsD
 G6eah2uJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eU1QAKCRDB/BR4rcrsCSpFB/
 wMhi98n3egKNmh0x0J1hkG6LXkS7R+sJpOO+ouImlfLha6dyX9HX3sd4W7S9HKk0sN8XDdfZr9RhwP
 fV7614ufYFkSP6HSYPj7kNS/OLmpRq2qLZEdo+rMpplcnNsrJykryCdLdsGN81HuNboqqL4S4ANAMd
 C6PL0rab+DDMR7PBY7UDnLdp7ayJ1w7pVQnMwR0xj0QJALJ2ylH7PZdyZV/WnH8TonlHRb9QWYwAeU
 AnLwjq8MSaiPoNQJyDe1+0uNAX2mqFZYdSXL7bWL+wADVCI+CW6d9f0l0a27EkK6hJDgM21WZEQ2ze
 Nj8UYZpoxQxGHx8VXPLnrF7z0AyM5P
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
 sound/soc/codecs/cq93vc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/cq93vc.c b/sound/soc/codecs/cq93vc.c
index 14403b76c724..32b6a417d0e8 100644
--- a/sound/soc/codecs/cq93vc.c
+++ b/sound/soc/codecs/cq93vc.c
@@ -134,18 +134,12 @@ static int cq93vc_platform_probe(struct platform_device *pdev)
 			&soc_component_dev_cq93vc, &cq93vc_dai, 1);
 }
 
-static int cq93vc_platform_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver cq93vc_codec_driver = {
 	.driver = {
 			.name = "cq93vc-codec",
 	},
 
 	.probe = cq93vc_platform_probe,
-	.remove = cq93vc_platform_remove,
 };
 
 module_platform_driver(cq93vc_codec_driver);
-- 
2.38.1

