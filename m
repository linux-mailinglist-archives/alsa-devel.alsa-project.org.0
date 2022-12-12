Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50764A8EA
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:55:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779F52135;
	Mon, 12 Dec 2022 21:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779F52135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878544;
	bh=pGiiaOMHX/S6U0odCV2R8yqf4GElkVjJnV4JrpyZYKo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P7J/ZKl43tJVm2RqeTccGBHtG9XyN7szM5zFMFznR95KoH9tEivQGyO15Nle+FSOZ
	 onlXp2mbd4xrFHgA867km9zeFMQ6gjqbxqTjNk66O78pzKa2uTFFbqz2bndtvA0bS7
	 K0CueNvoY1Z4dlIv2gDQ1W16aQ+2kcN0PV0pU4DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E3F4F8051A;
	Mon, 12 Dec 2022 21:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC0CF800F8; Mon, 12 Dec 2022 21:54:21 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EAC5F800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EAC5F800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-00015t-5C; Mon, 12 Dec 2022 21:54:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poQ-00463w-Dg; Mon, 12 Dec 2022 21:54:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poQ-004ahX-Ab; Mon, 12 Dec 2022 21:54:10 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/15] ASoC: amd: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:53:53 +0100
Message-Id: <20221212205406.3771071-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=pGiiaOMHX/S6U0odCV2R8yqf4GElkVjJnV4JrpyZYKo=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5S9hp5tepPB5HKUWwwv9QFaVrtI30+zPLJSUlVM
 c+w9vuqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eUvQAKCRDB/BR4rcrsCa3lB/
 4ngQ+XzIB/nT7N2uh+waqH8v+yqk/um7abU+uSkh5xondt3I5vfuaH22mMwO9GcqNxBBHSLSqgV6DI
 lSHBF04e07u4yLLtZ7hfQ6Z98+ERqWcrQzJnxSuD6KAlHlaYHyqysTwU5Bmsi60vKae1c5CLRNRwEM
 dlCZ4JjFrSd4kdr/yGEh2r8iRFBxGf65zxQV7IMuU4joAeggZhkkKWn9L7qa4pM+MoAnkxp9rFA39F
 BT/+43oYHBbenMZWL11Mbmznck8DPkPaIMB0Trhwxksch4u4HtsF77opawqWUZo4bOI9lzZ/8qJVI3
 mycpBdXdVJfZsqbdGkIWOxJm42hCng
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
 sound/soc/amd/raven/acp3x-i2s.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index aa38cef1776d..4ba83689482a 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -315,16 +315,8 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int acp3x_dai_remove(struct platform_device *pdev)
-{
-	/* As we use devm_ memory alloc there is nothing TBD here */
-
-	return 0;
-}
-
 static struct platform_driver acp3x_dai_driver = {
 	.probe = acp3x_dai_probe,
-	.remove = acp3x_dai_remove,
 	.driver = {
 		.name = "acp3x_i2s_playcap",
 	},
-- 
2.38.1

