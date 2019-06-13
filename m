Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E543F9A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 17:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7ED180C;
	Thu, 13 Jun 2019 17:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7ED180C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560441550;
	bh=aT5vxRs1NRd8gzdKyK5f2q22R9jBWf/UsW3S4tNedxg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gaRyOvzBsj3psqR4PY+LyfQOnny5Ah6NN7AnRnNP6YVKI9jeQ4xSjm2EJ84ca1uXI
	 jpn+ko/h4qG98N4WHpBKv/RtEzfZRStcRGQO+3P5i9zMKNmQblzZifbNsixR1rYlEA
	 14nUv7HaNDT2lXRwAs+rbbY2HmQr4ayfm3o4nD4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0EC6F8972F;
	Thu, 13 Jun 2019 17:56:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 144BEF89703; Thu, 13 Jun 2019 17:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F18F896F1
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 17:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F18F896F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jqN9ylws"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=NT4gJipmjpVn0xWW+d+vcCZ9Pi3f9c66ByW2XjGlyZo=; b=jqN9ylwsZhH0
 y4Mhm5m9lqGG6n6tWdqwBTvEz2V4m+tRZLl8aJWlrsYx+WehBNi3S7XE0BJgknNu7P/1dWK9NxtU9
 aZaQGAxqOfBxtLECxv8IjRvEiaYD8shj3iYV9UYhLW3cFlSOKJ10cZzu3KoA1bwVgOQYL7Hvu5e1s
 j/UVo=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbS5f-0005H6-0L; Thu, 13 Jun 2019 15:56:39 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6B71C440049; Thu, 13 Jun 2019 16:56:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: John Hsu <KCHSU0@nuvoton.com>
In-Reply-To: <20190610034040.12629-1-KCHSU0@nuvoton.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613155638.6B71C440049@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 16:56:38 +0100 (BST)
Cc: alsa-devel@alsa-project.org, cychiang@google.com, WTLI@nuvoton.com,
 lgirdwood@gmail.com, yuhsuan@google.com, YHCHuang@nuvoton.com,
 Mark Brown <broonie@kernel.org>, CTLIN0@nuvoton.com, mhkuo@nuvoton.com,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] Applied "ASoC: nau8825: fix fake interruption when
	booting" to the asoc tree
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

   ASoC: nau8825: fix fake interruption when booting

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From cbb9f8ccc8232b4647c4180af653eee744818221 Mon Sep 17 00:00:00 2001
From: John Hsu <KCHSU0@nuvoton.com>
Date: Mon, 10 Jun 2019 11:40:40 +0800
Subject: [PATCH] ASoC: nau8825: fix fake interruption when booting

There is no pull-up resistor at IRQ line where it connects from
the codec to SoC. When booting, the signal of IRQ pin will keep low
which makes the SoC invoke the ISR repeatedly because the IRQ is
registered trigger low. It will not stop until the codec sets up
the interruption and pulls the signal high. In the patch,
nau8825 will internally pull the signal to high at booting in case
the fake interrupts happen.

Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
Tested-by: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/nau8825.c | 4 ++++
 sound/soc/codecs/nau8825.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 47e65cf99879..83ec841f7865 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1881,6 +1881,10 @@ static void nau8825_init_regs(struct nau8825 *nau8825)
 		NAU8825_JACK_EJECT_DEBOUNCE_MASK,
 		nau8825->jack_eject_debounce << NAU8825_JACK_EJECT_DEBOUNCE_SFT);
 
+	/* Pull up IRQ pin */
+	regmap_update_bits(regmap, NAU8825_REG_INTERRUPT_MASK,
+		NAU8825_IRQ_PIN_PULLUP | NAU8825_IRQ_PIN_PULL_EN,
+		NAU8825_IRQ_PIN_PULLUP | NAU8825_IRQ_PIN_PULL_EN);
 	/* Mask unneeded IRQs: 1 - disable, 0 - enable */
 	regmap_update_bits(regmap, NAU8825_REG_INTERRUPT_MASK, 0x7ff, 0x7ff);
 
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index f6074c618569..3f41897ed3f6 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -171,6 +171,8 @@
 #define NAU8825_JACK_POLARITY	(1 << 1) /* 0 - active low, 1 - active high */
 
 /* INTERRUPT_MASK (0xf) */
+#define NAU8825_IRQ_PIN_PULLUP (1 << 14)
+#define NAU8825_IRQ_PIN_PULL_EN (1 << 13)
 #define NAU8825_IRQ_OUTPUT_EN (1 << 11)
 #define NAU8825_IRQ_HEADSET_COMPLETE_EN (1 << 10)
 #define NAU8825_IRQ_RMS_EN (1 << 8)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
