Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFF8120545
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 13:16:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 026231657;
	Mon, 16 Dec 2019 13:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 026231657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576498616;
	bh=5VN6cvRqhEnhBcuqWXt653AdeG48KgxmAQ44Y30k9vs=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Zg+xCpaitO3S9ozZ2r1KSyUGhezDkBdaHZagmUQwk2bo1aJz9ap3FRJovimasLSaS
	 3CIoHHx+yOjPGUzk6G5yHSx7u0qIxqFYDY7ZSNwbwP3P4pnvOP7V89vog/YD6Z8An1
	 2/6hClaP0hXBajcVmN+8GTqL3OFrq302m2zqieYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09824F8033D;
	Mon, 16 Dec 2019 13:05:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766F4F80308; Mon, 16 Dec 2019 13:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6EA0BF802F8
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA0BF802F8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4051045;
 Mon, 16 Dec 2019 04:05:38 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4E93F719;
 Mon, 16 Dec 2019 04:05:37 -0800 (PST)
Date: Mon, 16 Dec 2019 12:05:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com>
Message-Id: <applied-1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Cc: kstewart@linuxfoundation.org, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 gregkh@linuxfoundation.org, shengjiu.wang@nxp.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 tglx@linutronix.de, allison@lohutok.net
Subject: [alsa-devel] Applied "ASoC: wm8962: fix lambda value" to the asoc
	tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wm8962: fix lambda value

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 556672d75ff486e0b6786056da624131679e0576 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Wed, 11 Dec 2019 19:57:22 +0800
Subject: [PATCH] ASoC: wm8962: fix lambda value

According to user manual, it is required that FLL_LAMBDA > 0
in all cases (Integer and Franctional modes).

Fixes: 9a76f1ff6e29 ("ASoC: Add initial WM8962 CODEC driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 3e5c69fbc33a..d9d59f45833f 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2788,7 +2788,7 @@ static int fll_factors(struct _fll_div *fll_div, unsigned int Fref,
 
 	if (target % Fref == 0) {
 		fll_div->theta = 0;
-		fll_div->lambda = 0;
+		fll_div->lambda = 1;
 	} else {
 		gcd_fll = gcd(target, fratio * Fref);
 
@@ -2858,7 +2858,7 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 		return -EINVAL;
 	}
 
-	if (fll_div.theta || fll_div.lambda)
+	if (fll_div.theta)
 		fll1 |= WM8962_FLL_FRAC;
 
 	/* Stop the FLL while we reconfigure */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
