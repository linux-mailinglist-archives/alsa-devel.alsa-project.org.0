Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B21C4F8FE4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:51:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36D1D18E9;
	Fri,  8 Apr 2022 09:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36D1D18E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404314;
	bh=iyaAiY7y+2ZwIaAI7AnPRf+b1bjY8B6s9Yuq7JTdakI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vusv2dMjOCSHe3GzzdnC/+i5VwRRC0F45eQjAwcsxMd4dNZugl1ZK/JrAVNGUY7r1
	 uAPWM5hd6BdihTdb6PEN/j0lyhNd1frGIc76eURAmb3h9pJ6ixy9YhzbN7LryMKTUT
	 qthvkwfXvIIoj8I5xL3EBpdreVxx0qzmWYfsdNEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A05BDF80549;
	Fri,  8 Apr 2022 09:48:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 018D1F8016A; Tue,  5 Apr 2022 17:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3A24F8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 17:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3A24F8012C
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <afa@pengutronix.de>)
 id 1nblZT-0004nd-AF; Tue, 05 Apr 2022 17:58:19 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <afa@pengutronix.de>)
 id 1nblZR-0038Jb-G8; Tue, 05 Apr 2022 17:58:17 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Viorel Suman <viorel.suman@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] ASoC: fsl_sai: fix 1:1 bclk:mclk ratio support
Date: Tue,  5 Apr 2022 17:57:31 +0200
Message-Id: <20220405155731.745413-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org
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

Refactoring in commit a50b7926d015 ("ASoC: fsl_sai: implement 1:1
bclk:mclk ratio support") led to the bypass never happening
as (ratio = 1) was caught in the existing if (ratio & 1) continue;
check. The correct check sequence instead is:

 - skip all ratios lower than one and higher than 512
 - skip all odd ratios except for 1:1
 - skip 1:1 ratio if and only if !support_1_1_ratio

And for all others, calculate the appropriate divider. Adjust the
code to facilitate this.

Fixes: a50b7926d015 ("ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index a992d51568cc..50c377f16097 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -372,7 +372,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 			continue;
 		if (ratio == 1 && !support_1_1_ratio)
 			continue;
-		else if (ratio & 1)
+		if ((ratio & 1) && ratio > 1)
 			continue;
 
 		diff = abs((long)clk_rate - ratio * freq);
-- 
2.30.2

