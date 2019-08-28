Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBCA1D98
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9138D169F;
	Thu, 29 Aug 2019 16:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9138D169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090169;
	bh=i0pqFGK8fbqTnyV2UU7xaQcRQNmTOf7YRZqrl2RIcJM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RzWFMd5AZGwQqoeFwaH1z1opZh2tqJ9REcZrkCAOeVkBF8YHv7GcXlX3SWc4sll+l
	 wq7lkuwYsIVkf/LeuwbvaGDhJ/3zi5VscKpebJLOq1NYGu26EB6cxd1pcV7evZ+R48
	 D3zFPasfNWE54iDquufbfEcxOxPVZ/DSoZ4s1114=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF8BDF89790;
	Wed, 28 Aug 2019 15:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E78F89794; Wed, 28 Aug 2019 15:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D960F8978F
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 15:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D960F8978F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oSjvIP5w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4yMUOUxgWj2lZBjlvoHQjM2lBLStqB07tRhlHPrCe0I=; b=oSjvIP5wOYL+
 kKdtYJTP67Q44LcBNovPVSxQe5tjC+T6szzaQ883WdjtIk8vCKF88aa46jqjmQGkqWCGnaby8hi6Y
 irCOTbp9vGKtqDBV1/oVp7qJbSVM/TaQpNfrMTUIg/S1AcrjbUVtemyeFrldrB+SQ1M68XapZRKqE
 dm9tY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i2xl5-0004Gk-Iw; Wed, 28 Aug 2019 13:13:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 99E842742B61; Wed, 28 Aug 2019 14:13:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20190822095653.7200-3-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190828131306.99E842742B61@ypsilon.sirena.org.uk>
Date: Wed, 28 Aug 2019 14:13:06 +0100 (BST)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
Subject: [alsa-devel] Applied "ASoC: wcd9335: Fix primary interpolator max
	rate" to the asoc tree
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

   ASoC: wcd9335: Fix primary interpolator max rate

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

From a8a652bfac7f4a60dfbe07a8c95c65506601b2e1 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 22 Aug 2019 10:56:51 +0100
Subject: [PATCH] ASoC: wcd9335: Fix primary interpolator max rate

On this codec SLIMBus RX path supports 384000 rate on primary interpolator.
Add this missing rate as supported rate.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20190822095653.7200-3-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 956602788d0e..03f8a94bba2f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2071,9 +2071,10 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF1_PB,
 		.playback = {
 			.stream_name = "AIF1 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.rate_min = 8000,
 			.channels_min = 1,
 			.channels_max = 2,
@@ -2099,10 +2100,11 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF2_PB,
 		.playback = {
 			.stream_name = "AIF2 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -2127,10 +2129,11 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF3_PB,
 		.playback = {
 			.stream_name = "AIF3 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
@@ -2155,10 +2158,11 @@ static struct snd_soc_dai_driver wcd9335_slim_dais[] = {
 		.id = AIF4_PB,
 		.playback = {
 			.stream_name = "AIF4 Playback",
-			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK,
+			.rates = WCD9335_RATES_MASK | WCD9335_FRAC_RATES_MASK |
+				 SNDRV_PCM_RATE_384000,
 			.formats = WCD9335_FORMATS_S16_S24_LE,
 			.rate_min = 8000,
-			.rate_max = 192000,
+			.rate_max = 384000,
 			.channels_min = 1,
 			.channels_max = 2,
 		},
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
