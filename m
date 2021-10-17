Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C008843070E
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 09:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3064917CA;
	Sun, 17 Oct 2021 09:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3064917CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634455960;
	bh=3+vtlI/GKOqIJv9bO4rSR6sZpXmR+Y37RUJD83mmfvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PsiReVWI+vA4TxbyUEuqUWt2peQ34zBsBgNu3at4W0S7Rae30c/2wWn3deUiABKk4
	 xwE6ij2aI5BOJyjfvK5ELj0gwdqtQgN3QWgnVAU3M4lOeNsr+jBoZVmaT+6lQjFNew
	 iOqv35m+1rLxz5MlJxIMJ/is+bZAViLlXgoJ4PCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F0CF8026C;
	Sun, 17 Oct 2021 09:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE049F80256; Sun, 17 Oct 2021 09:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7ADFF801DB
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 09:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7ADFF801DB
Received: from pop-os.home ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id c0dWmm9RWWUfjc0dWm9RJT; Sun, 17 Oct 2021 09:31:18 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 17 Oct 2021 09:31:18 +0200
X-ME-IP: 92.140.161.106
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, yang.lee@linux.alibaba.com
Subject: [PATCH] ASoC: codecs: Fix WCD_MBHC_HPH_PA_EN usage
Date: Sun, 17 Oct 2021 09:31:12 +0200
Message-Id: <988948f7f266aa00698704687537335b7e6a67b2.1634455711.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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

'hphpa_on' is known to be false, so the if block at the end of the function
is dead code.

Turn it into a meaningful code by having 'hphpa_on' be static. Use is as a
flip-flop variable.

Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The purpose of this patch is not to be correct (!) but to draw attention
on several points:
   - in 'wcd_mbhc_adc_hs_rem_irq()', the "if (hphpa_on)" path is dead code
     because 'hphpa_on' is known to be false
   - What is this magic number '3'?
     All 'wcd_mbhc_read_field()' look for 0 or non-0
   - a 'mutex_[un]lock()' in an IRQ handler looks spurious to me

Instead of this (likely broken) patch, it is likely that something is
missing elsewhere. Maybe in 'wcd_mbhc_adc_hs_ins_irq()'.
I also guess that 'hphpa_on' should be read for somewhere else.
---
 sound/soc/codecs/wcd-mbhc-v2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 405128ccb4b0..783d8c35bc1b 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1176,7 +1176,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	struct wcd_mbhc *mbhc = data;
 	unsigned long timeout;
 	int adc_threshold, output_mv, retry = 0;
-	bool hphpa_on = false;
+	static bool hphpa_on = false;
 
 	mutex_lock(&mbhc->lock);
 	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
@@ -1212,6 +1212,9 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 
 	if (hphpa_on) {
 		hphpa_on = false;
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 0);
+	} else {
+		hphpa_on = true;
 		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 3);
 	}
 exit:
-- 
2.30.2

