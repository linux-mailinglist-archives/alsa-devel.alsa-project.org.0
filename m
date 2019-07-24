Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ADF727B9
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 08:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BF51935;
	Wed, 24 Jul 2019 08:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BF51935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563948188;
	bh=wMgkUVmEeD83D1/DjHd5+FSpLvVV1o6zw5HiTPOKIbo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g8RO5M7037IBp6wQFUlNbgxmcr4GWyV2WR+3zkTVqdPE2wSfcVs1vpW/Lk6Q36wHO
	 nOxvBHqqZ64u4LosubUygIpdsyom+By9dXI+UdFw4IuJARvtR1G5wg+YLUvmCAu7V3
	 BWqxr55qmo9VMxN7tEWL971Li/GCPRHR7sfrepXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5287FF803D6;
	Wed, 24 Jul 2019 08:01:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A1CDF803D1; Wed, 24 Jul 2019 08:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD349F8026F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 08:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD349F8026F
Received: from localhost.localdomain ([92.140.204.221]) by mwinf5d09 with ME
 id gW1F2000A4n7eLC03W1Gqa; Wed, 24 Jul 2019 08:01:17 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Jul 2019 08:01:17 +0200
X-ME-IP: 92.140.204.221
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: brian.austin@cirrus.com, Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Date: Wed, 24 Jul 2019 08:00:23 +0200
Message-Id: <20190724060023.31302-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: cs4271: Fix a typo in the
	CS4171_NR_RATIOS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This should be CS4271_NR_RATIOS.
Fix it and use it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/cs4271.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 1d03a1348162..04b86a51e055 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -334,7 +334,7 @@ static struct cs4271_clk_cfg cs4271_clk_tab[] = {
 	{0, CS4271_MODE1_MODE_4X, 256,  CS4271_MODE1_DIV_2},
 };
 
-#define CS4171_NR_RATIOS ARRAY_SIZE(cs4271_clk_tab)
+#define CS4271_NR_RATIOS ARRAY_SIZE(cs4271_clk_tab)
 
 static int cs4271_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
@@ -383,13 +383,13 @@ static int cs4271_hw_params(struct snd_pcm_substream *substream,
 		val = CS4271_MODE1_MODE_4X;
 
 	ratio = cs4271->mclk / cs4271->rate;
-	for (i = 0; i < CS4171_NR_RATIOS; i++)
+	for (i = 0; i < CS4271_NR_RATIOS; i++)
 		if ((cs4271_clk_tab[i].master == cs4271->master) &&
 		    (cs4271_clk_tab[i].speed_mode == val) &&
 		    (cs4271_clk_tab[i].ratio == ratio))
 			break;
 
-	if (i == CS4171_NR_RATIOS) {
+	if (i == CS4271_NR_RATIOS) {
 		dev_err(component->dev, "Invalid sample rate\n");
 		return -EINVAL;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
