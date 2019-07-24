Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EDB72751
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 07:29:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A30B192A;
	Wed, 24 Jul 2019 07:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A30B192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563946160;
	bh=xtxXV4QqlyhFpmrCueS1CaL/++5epkzbV7/ZzgV6pDU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rqw8IYFbL8i3099Un0MUuPz/tpQOlPmbyCPcPqTFl1whkqO2ZtsVz+sMfjcUp6Hdp
	 VCP7EF+KW0eN3lr3i38S3XGqgrPluZ9VU+zVxUMsSDgRfbEEvwDCWYMPb25POWdgtl
	 aggx9LQuTDxRMVS4v8yuw/D3TrIJriinrEJMsq5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EEF2F8026F;
	Wed, 24 Jul 2019 07:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0108F803D1; Wed, 24 Jul 2019 07:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BFA6F8026F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 07:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BFA6F8026F
Received: from localhost.localdomain ([92.140.204.221]) by mwinf5d09 with ME
 id gVTR2000H4n7eLC03VTRSq; Wed, 24 Jul 2019 07:27:28 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Jul 2019 07:27:28 +0200
X-ME-IP: 92.140.204.221
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 gustavo@embeddedor.com, patches@opensource.cirrus.com
Date: Wed, 24 Jul 2019 07:26:32 +0200
Message-Id: <20190724052632.30476-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: wm8955: Fix a typo in
	'wm8995_pll_factors()' function name
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

This should be 'wm8955_pll_factors()' instead.
Fix it and use it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/wm8955.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index cd204f79647d..ec82a8fafdf6 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -143,7 +143,7 @@ struct pll_factors {
  * to allow rounding later */
 #define FIXED_FLL_SIZE ((1 << 22) * 10)
 
-static int wm8995_pll_factors(struct device *dev,
+static int wm8955_pll_factors(struct device *dev,
 			      int Fref, int Fout, struct pll_factors *pll)
 {
 	u64 Kpart;
@@ -282,7 +282,7 @@ static int wm8955_configure_clocking(struct snd_soc_component *component)
 
 		/* Use the last divider configuration we saw for the
 		 * sample rate. */
-		ret = wm8995_pll_factors(component->dev, wm8955->mclk_rate,
+		ret = wm8955_pll_factors(component->dev, wm8955->mclk_rate,
 					 clock_cfgs[sr].mclk, &pll);
 		if (ret != 0) {
 			dev_err(component->dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
