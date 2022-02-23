Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E74C0639
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F9ED1906;
	Wed, 23 Feb 2022 01:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F9ED1906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576527;
	bh=X6cDO2IZYH5YUAmhWdP3tosc8gH4NMxm2yYNRHpi2/E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aiXCZa4Oj/JAohtZYRluxQWC6pkXwntTqYjwD5FctJ2o86bryScV3PwhMUkFAPtf4
	 KdPGcU1Do2gYy5XVz0sLjZUkgx9wSRRBQ56G8WG4qolNAv4iqW52lNQQYZMOCUJV8m
	 28O18STMSmk3lpHZ1zh4JYICl5jUqoiWM5apKakU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BCA7F801F5;
	Wed, 23 Feb 2022 01:34:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B215F801EC; Wed, 23 Feb 2022 01:34:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ACD6F800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ACD6F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="juJV4Fzb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63D2D60500;
 Wed, 23 Feb 2022 00:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED76CC340E8;
 Wed, 23 Feb 2022 00:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645576453;
 bh=X6cDO2IZYH5YUAmhWdP3tosc8gH4NMxm2yYNRHpi2/E=;
 h=From:To:Cc:Subject:Date:From;
 b=juJV4Fzbxoqy/vcgMdcUs4SDk6U3mg67hLkfca90q3yyIsdq2izVC7DW+hY9UdHld
 yCHW48OwI9iFVyws4gqj5LKtuIc95zqo8u9XD0VFeVeX5adsryoaCk4uVzCoqUrT2K
 6SGEGnjVI/EprPiDv5szOotzJHYqGUvgDsY2g7NakA62Wi8giottbAUkSm+FbstxGL
 wmQ4Xyw1N0vXKcouS8axzc/ePumyGMkLNCeW/fR2Iv199sKfh+gbUvQXboCbPmgZuB
 BA0JL7CX0hX65VPn4aFuXWvxWS/9wmsLALjuoeciBvvyJ6wwjGvGIOnwCgkCosa9FK
 53YM0pmMYEFUw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: uda134x: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:34:09 +0000
Message-Id: <20220223003409.1820405-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; h=from:subject;
 bh=X6cDO2IZYH5YUAmhWdP3tosc8gH4NMxm2yYNRHpi2/E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFYDq/RolxlX7P/9/J11RJQnTMyzTfAWw6qhXvzOz
 boTOLb6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWA6gAKCRAk1otyXVSH0P39B/
 4qhyczxJX7MnHi3qIXJF+NgajM0aKhrL+oWacN85Ae5RYKkqBRTohlE3e8B6fUWPICnO6bKUY3Qjgv
 yXlH/nS/HBctGm3dNaCvMu1MPpuVagADQGTqgear4etQWkD4GZMTAj0trwgw1LEIfvZLb/lQcWtT+j
 vTFGxorQQBRKFVqciWLDWubto2D1UQuGkZpP8vR+N4k2oRDCv8Oc/qKXEcvMMR+xwCvoUeA/8eTPSD
 GPEZZxXHADIlTLpUrIXWOND1CYPT89cTPwm7if1TriGnzUUkGkWewC5iXSYNpPYEwiJsEUrExhHPIU
 MWPMERphsOzhJcT0d+IKGlIa4X5xyT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the uda134x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/uda134x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/uda134x.c b/sound/soc/codecs/uda134x.c
index bf9182cedb82..037833c509f7 100644
--- a/sound/soc/codecs/uda134x.c
+++ b/sound/soc/codecs/uda134x.c
@@ -272,9 +272,9 @@ static int uda134x_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	pr_debug("%s fmt: %08X\n", __func__, fmt);
 
-	/* codec supports only full slave mode */
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS) {
-		printk(KERN_ERR "%s unsupported slave mode\n", __func__);
+	/* codec supports only full consumer mode */
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
+		printk(KERN_ERR "%s unsupported clocking mode\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.30.2

