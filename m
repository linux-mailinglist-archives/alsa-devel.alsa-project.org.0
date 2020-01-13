Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286D13AA66
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:14:09 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F431910;
	Mon, 13 Jan 2020 16:14:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F431910
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 430BDF80227;
	Mon, 13 Jan 2020 16:13:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CF7F801F7; Mon, 13 Jan 2020 16:13:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 502A6F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:13:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 502A6F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KjEznEfN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jcBJZYDCWAErekn301zYS+p8kyhQXzKr9MlVsCmYNUA=; b=KjEznEfNNc4w
 WX4k7ksnzNKoGXwuBPDrth9OeIMmtIwd76RJZ9FXMb5JeNHSkAQSpWbUP12Jt8mfQqyL8kpkAf3Al
 4V8GTZhWSMe6iw+fEiamyJEenN8kXulrE8XJidHDqugzaMxCRDLqw7s8aYWz8xCiEBEsqEUZLpP6B
 GUsoE=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir1Om-0003Kh-DT; Mon, 13 Jan 2020 15:13:00 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id EBF44D01965; Mon, 13 Jan 2020 15:12:59 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200105102753.83108-1-stephan@gerhold.net>
Message-Id: <applied-20200105102753.83108-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Date: Mon, 13 Jan 2020 15:12:59 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [alsa-devel] Applied "ASoC: msm8916-wcd-digital: Reset RX
	interpolation path after use" to the asoc tree
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

   ASoC: msm8916-wcd-digital: Reset RX interpolation path after use

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 85578bbd642f65065039b1765ebe1a867d5435b0 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Sun, 5 Jan 2020 11:27:53 +0100
Subject: [PATCH] ASoC: msm8916-wcd-digital: Reset RX interpolation path after
 use

For some reason, attempting to route audio through QDSP6 on MSM8916
causes the RX interpolation path to get "stuck" after playing audio
a few times. In this situation, the analog codec part is still working,
but the RX path in the digital codec stops working, so you only hear
the analog parts powering up. After a reboot everything works again.

So far I was not able to reproduce the problem when using lpass-cpu.

The downstream kernel driver avoids this by resetting the RX
interpolation path after use. In mainline we do something similar
for the TX decimator (LPASS_CDC_CLK_TX_RESET_B1_CTL), but the
interpolator reset (LPASS_CDC_CLK_RX_RESET_CTL) got lost when the
msm8916-wcd driver was split into analog and digital.

Fix this problem by adding the reset to
msm8916_wcd_digital_enable_interpolator().

Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Link: https://lore.kernel.org/r/20200105102753.83108-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 58b2468fb2a7..09fccacadd6b 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -586,6 +586,12 @@ static int msm8916_wcd_digital_enable_interpolator(
 		snd_soc_component_write(component, rx_gain_reg[w->shift],
 			      snd_soc_component_read32(component, rx_gain_reg[w->shift]));
 		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
+					      1 << w->shift, 1 << w->shift);
+		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
+					      1 << w->shift, 0x0);
+		break;
 	}
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
