Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC074F29
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5511B1B14;
	Thu, 25 Jul 2019 15:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5511B1B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060952;
	bh=sW9q3DoLkcfG5ZziCgczoMNNZ1cc34NOtmJ5Uenjc24=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vh7xtyqmesmXk9x3hTRJCVxlWS2u+XlEvDp3Sca0XUo0kd/c96AicebcJblQEZdMD
	 f+aKbWGrn7BZF6tA6w94QIHt9CAW9j9GKhAktpokYBDb4bf2oyGfYwhI1zVXDgRfJj
	 v/6YEZwdJ6mYf0YKaYSi0f34R4ukXmqSJQBYNURU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42119F8049A;
	Thu, 25 Jul 2019 15:19:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AEF3F80481; Thu, 25 Jul 2019 15:19:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 059D7F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 059D7F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="K8ueLngN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AU1a2IfoyouC85cKHisrxj3yktohPbk85rW4J+ECNHU=; b=K8ueLngNqYmN
 8eioERGfHjIDaZf9cu5QD1S14vkJ3L+4/z5IRhu83UtgPYL52JgTP9hB3Ec8QHPHSin/kbJQdSt9Z
 sq1DNMLL53GNMbX3UVy+UsSUy0zc7n7VeTHg3P/3L5NOpiIKl2RpGsk8yqmBmzb0Dd/L4UH0Pch8c
 QMT0M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdeY-0002rT-QF; Thu, 25 Jul 2019 13:19:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 496612742B63; Thu, 25 Jul 2019 14:19:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190725083411.7211-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190725131926.496612742B63@ypsilon.sirena.org.uk>
Date: Thu, 25 Jul 2019 14:19:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, jsarha@ti.com, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Add support for
	RIGHT_J format" to the asoc tree
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

   ASoC: ti: davinci-mcasp: Add support for RIGHT_J format

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

From 816fe206138a7e3895c3a74fbd326a51df003f70 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 25 Jul 2019 11:34:11 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Add support for RIGHT_J format

The formater unit's rotation needs to be programmed differently for right
aligned bus format to have the data moved to the correct place.

Take the opportunity and simplify the formater unit setup code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190725083411.7211-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 43 ++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index ac59b509ead5..09ba3d3c70a0 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -465,6 +465,7 @@ static int davinci_mcasp_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		/* FS need to be inverted */
 		inv_fs = true;
 		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_LEFT_J:
 		/* configure a full-word SYNC pulse (LRCLK) */
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG, FSXDUR);
@@ -758,34 +759,28 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
 				       int sample_width)
 {
 	u32 fmt;
-	u32 tx_rotate = (sample_width / 4) & 0x7;
+	u32 tx_rotate, rx_rotate, slot_width;
 	u32 mask = (1ULL << sample_width) - 1;
-	u32 slot_width = sample_width;
-
-	/*
-	 * For captured data we should not rotate, inversion and masking is
-	 * enoguh to get the data to the right position:
-	 * Format	  data from bus		after reverse (XRBUF)
-	 * S16_LE:	|LSB|MSB|xxx|xxx|	|xxx|xxx|MSB|LSB|
-	 * S24_3LE:	|LSB|DAT|MSB|xxx|	|xxx|MSB|DAT|LSB|
-	 * S24_LE:	|LSB|DAT|MSB|xxx|	|xxx|MSB|DAT|LSB|
-	 * S32_LE:	|LSB|DAT|DAT|MSB|	|MSB|DAT|DAT|LSB|
-	 */
-	u32 rx_rotate = 0;
 
+	if (mcasp->slot_width)
+		slot_width = mcasp->slot_width;
+	else
+		slot_width = sample_width;
 	/*
-	 * Setting the tdm slot width either with set_clkdiv() or
-	 * set_tdm_slot() allows us to for example send 32 bits per
-	 * channel to the codec, while only 16 of them carry audio
-	 * payload.
+	 * TX rotation:
+	 * right aligned formats: rotate w/ slot_width
+	 * left aligned formats: rotate w/ sample_width
+	 *
+	 * RX rotation:
+	 * right aligned formats: no rotation needed
+	 * left aligned formats: rotate w/ (slot_width - sample_width)
 	 */
-	if (mcasp->slot_width) {
-		/*
-		 * When we have more bclk then it is needed for the
-		 * data, we need to use the rotation to move the
-		 * received samples to have correct alignment.
-		 */
-		slot_width = mcasp->slot_width;
+	if ((mcasp->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) ==
+	    SND_SOC_DAIFMT_RIGHT_J) {
+		tx_rotate = (slot_width / 4) & 0x7;
+		rx_rotate = 0;
+	} else {
+		tx_rotate = (sample_width / 4) & 0x7;
 		rx_rotate = (slot_width - sample_width) / 4;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
