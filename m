Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF11CF220
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 12:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261FF167F;
	Tue, 12 May 2020 12:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261FF167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589278139;
	bh=NUQmGpTpZtcLfzxkyqreEuq4NJbIqv1WAoNZKAJeS9Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hiBrxhPhLQhQlZc1C18dUH6E2aSJxTnmNtCOXeygbuHVpiy55iBdmhIwIp4b2B6xw
	 jMKYe6ONCtmUpGamWtzByLpF0Ya+mQDdQ/O6eSoCaKpLHxQqDf+b4tK7JXEh301CC1
	 rttMDJYOm6FZPjem3FAsgjKgT2+rOin46yu35Zy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AB4F800E3;
	Tue, 12 May 2020 12:07:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C433DF80112; Tue, 12 May 2020 12:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D178F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 12:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D178F800AA
Received: from localhost.localdomain ([93.22.148.175]) by mwinf5d78 with ME
 id dm782200V3nHaxZ03m78v6; Tue, 12 May 2020 12:07:11 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 12 May 2020 12:07:11 +0200
X-ME-IP: 93.22.148.175
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linus.walleij@linaro.org, lee.jones@linaro.org
Subject: [PATCH] ASoC: ux500: mop500: Fix some refcounted resources issues
Date: Tue, 12 May 2020 12:07:05 +0200
Message-Id: <20200512100705.246349-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

There are 2 issues here:
   - if one of the 'of_parse_phandle' fails, calling 'mop500_of_node_put()'
     is a no-op because the 'mop500_dai_links' structure has not been
     initialized yet, so the referenced are not decremented
   - The reference stored in 'mop500_dai_links[i].codecs' is refcounted
     only once in the probe and must be decremented only once.

Fixes: 39013bd60e79 ("ASoC: Ux500: Dispose of device nodes correctly")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/ux500/mop500.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index 2873e8e6f02b..cdae1190b930 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -63,10 +63,11 @@ static void mop500_of_node_put(void)
 {
 	int i;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < 2; i++)
 		of_node_put(mop500_dai_links[i].cpus->of_node);
-		of_node_put(mop500_dai_links[i].codecs->of_node);
-	}
+
+	/* Both links use the same codec, which is refcounted only once */
+	of_node_put(mop500_dai_links[0].codecs->of_node);
 }
 
 static int mop500_of_probe(struct platform_device *pdev,
@@ -81,7 +82,9 @@ static int mop500_of_probe(struct platform_device *pdev,
 
 	if (!(msp_np[0] && msp_np[1] && codec_np)) {
 		dev_err(&pdev->dev, "Phandle missing or invalid\n");
-		mop500_of_node_put();
+		for (i = 0; i < 2; i++)
+			of_node_put(msp_np[i]);
+		of_node_put(codec_np);
 		return -EINVAL;
 	}
 
-- 
2.25.1

