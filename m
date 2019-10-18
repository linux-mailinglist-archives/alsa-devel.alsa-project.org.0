Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C57DDDCDAB
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F89166F;
	Fri, 18 Oct 2019 20:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F89166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422401;
	bh=D5oSojA0YVjRJlVd9t7sU17uImDBpWf4/rWPi5lu7p0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OVB0WeRVtfIOaFXmF38gDRzw3RCD3SOFidjLto4MLMlGCmar1DCMqZBJ6mqQowf/F
	 bOBcuX8HYk6wio12WK98Cp1/YlBXMiKA8cSaRI8AWmdwRY4Ym3qQi4l4MlU633aucj
	 ZOHTvp2btc5jlc/yXl+r/5pYs7Kwa2KNCXfjfaOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F24C4F8064C;
	Fri, 18 Oct 2019 20:07:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43E12F80611; Fri, 18 Oct 2019 20:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE8EF80322
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE8EF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WjwNhdAg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kIdn4VulEh9KHSu4X43j6W5Pl8dnzX5CpSEuHNMmqZg=; b=WjwNhdAgMXyf
 f/FpHLUkv9G0+RYaluq+UfZ74TKDku8p3GcVgmeDSuHf+HaJTuXfnFgJHPx9fLV5vwYYdOA0mDbXC
 An0OrN8jGzCDLrpDYYQiHfZgoMOeRPov+MKLyAN4SwFfRe2vbPKQOhxCXCIzXgyv8NSADueQtIhib
 PbwmU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeS-0004FY-Lf; Fri, 18 Oct 2019 18:07:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1F8F92743259; Fri, 18 Oct 2019 19:07:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20191018082040.31022-1-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20191018180700.1F8F92743259@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:07:00 +0100 (BST)
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com, alexandre.torgue@st.com,
 tiwai@suse.com, arnaud.pouliquen@st.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, benjamin.gaignard@st.com
Subject: [alsa-devel] Applied "ASoC: stm32: sai: fix sysclk management on
	shutdown" to the asoc tree
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

   ASoC: stm32: sai: fix sysclk management on shutdown

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 9b7a7f921689d6c254e5acd670be631ebd82d54d Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Fri, 18 Oct 2019 10:20:40 +0200
Subject: [PATCH] ASoC: stm32: sai: fix sysclk management on shutdown

The commit below, adds a call to sysclk callback on shutdown.
This introduces a regression in stm32 SAI driver, as some clock
services are called twice, leading to unbalanced calls.
Move processing related to mclk from shutdown to sysclk callback.
When requested frequency is 0, assume shutdown and release mclk.

Fixes: 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to sysclk when shutdown")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20191018082040.31022-1-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index d7501f88aaa6..a4060813bc74 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -505,10 +505,20 @@ static int stm32_sai_set_sysclk(struct snd_soc_dai *cpu_dai,
 	if (dir == SND_SOC_CLOCK_OUT && sai->sai_mclk) {
 		ret = regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX,
 					 SAI_XCR1_NODIV,
-					 (unsigned int)~SAI_XCR1_NODIV);
+					 freq ? 0 : SAI_XCR1_NODIV);
 		if (ret < 0)
 			return ret;
 
+		/* Assume shutdown if requested frequency is 0Hz */
+		if (!freq) {
+			/* Release mclk rate only if rate was actually set */
+			if (sai->mclk_rate) {
+				clk_rate_exclusive_put(sai->sai_mclk);
+				sai->mclk_rate = 0;
+			}
+			return 0;
+		}
+
 		/* If master clock is used, set parent clock now */
 		ret = stm32_sai_set_parent_clock(sai, freq);
 		if (ret)
@@ -1093,15 +1103,6 @@ static void stm32_sai_shutdown(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, STM_SAI_IMR_REGX, SAI_XIMR_MASK, 0);
 
-	regmap_update_bits(sai->regmap, STM_SAI_CR1_REGX, SAI_XCR1_NODIV,
-			   SAI_XCR1_NODIV);
-
-	/* Release mclk rate only if rate was actually set */
-	if (sai->mclk_rate) {
-		clk_rate_exclusive_put(sai->sai_mclk);
-		sai->mclk_rate = 0;
-	}
-
 	clk_disable_unprepare(sai->sai_ck);
 
 	spin_lock_irqsave(&sai->irq_lock, flags);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
