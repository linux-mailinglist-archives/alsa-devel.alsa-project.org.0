Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54E42BAE
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E7D1789;
	Wed, 12 Jun 2019 18:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E7D1789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560355364;
	bh=LPpXTQfd3NtYQ+3ew67ScPicbLBYs+v8oZficswwYEo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=C8tHFZTwuZC2MRonp71ji33CHS4toK4c2aOYbaD8Xn++JjzUxvDQsJCTrsaGOMnYZ
	 /06gmZM2vDnZrYxEI5UTQpG4LWP5S6REGiISsrgKbqZo4e+OcTeZucj2p2MVa5UdAJ
	 7YzfB+9jzuFGUxkOses3oC7c0SmnhHCXrB/P0BLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B07F89733;
	Wed, 12 Jun 2019 17:59:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B8DFF806F5; Wed, 12 Jun 2019 17:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4008AF806F5
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 17:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4008AF806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ElN8j0z5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SYZDePDU3YZPbmR4xYANRSv7T7jQQpPlVKtgbxQ3uHI=; b=ElN8j0z5Pvrw
 VkNzX7Es9Jmb2Yj50MGe/hqnPP8htiUEa332hujH8ruLEF1AcGS65W/FKEZizpKbPUO75l6/0eTFL
 xFmdKTenoHwEFJyia5qv+7vZToB2RFsZe4+fG+orVDkQ+DTOVj2PBTbI3e7RdpZ7e8TeP2JnICG1G
 zuocI=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hb5eq-00036C-R7; Wed, 12 Jun 2019 15:59:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3C126440046; Wed, 12 Jun 2019 16:59:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20190610030523.12408-1-KCHSU0@nuvoton.com>
X-Patchwork-Hint: ignore
Message-Id: <20190612155928.3C126440046@finisterre.sirena.org.uk>
Date: Wed, 12 Jun 2019 16:59:28 +0100 (BST)
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com,
 John Hsu <KCHSU0@nuvoton.com>, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 Mark Brown <broonie@kernel.org>, CTLIN0@nuvoton.com
Subject: [alsa-devel] Applied "ASoC: nau8822: support master mode" to the
	asoc tree
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

   ASoC: nau8822: support master mode

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 2e927ad7981db6765a2a0e8694371e0154b6e820 Mon Sep 17 00:00:00 2001
From: David Lin <CTLIN0@nuvoton.com>
Date: Mon, 10 Jun 2019 11:05:23 +0800
Subject: [PATCH] ASoC: nau8822: support master mode

The driver selects the proper BCLK divide through the BCLK and FS
at the hardware parameter when the I2S master mode.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/nau8822.c | 18 ++++++++++++++++++
 sound/soc/codecs/nau8822.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index c6152a044416..78db3bd0b3bc 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -828,6 +828,24 @@ static int nau8822_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8822 *nau8822 = snd_soc_component_get_drvdata(component);
 	int val_len = 0, val_rate = 0;
+	unsigned int ctrl_val, bclk_fs, bclk_div;
+
+	/* make BCLK and LRC divide configuration if the codec as master. */
+	snd_soc_component_read(component, NAU8822_REG_CLOCKING, &ctrl_val);
+	if (ctrl_val & NAU8822_CLK_MASTER) {
+		/* get the bclk and fs ratio */
+		bclk_fs = snd_soc_params_to_bclk(params) / params_rate(params);
+		if (bclk_fs <= 32)
+			bclk_div = NAU8822_BCLKDIV_8;
+		else if (bclk_fs <= 64)
+			bclk_div = NAU8822_BCLKDIV_4;
+		else if (bclk_fs <= 128)
+			bclk_div = NAU8822_BCLKDIV_2;
+		else
+			return -EINVAL;
+		snd_soc_component_update_bits(component, NAU8822_REG_CLOCKING,
+				NAU8822_BCLKSEL_MASK, bclk_div);
+	}
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
index 9c552983a293..489191ff187e 100644
--- a/sound/soc/codecs/nau8822.h
+++ b/sound/soc/codecs/nau8822.h
@@ -107,10 +107,17 @@
 
 /* NAU8822_REG_CLOCKING (0x6) */
 #define NAU8822_CLKIOEN_MASK			0x1
+#define NAU8822_CLK_MASTER			0x1
+#define NAU8822_CLK_SLAVE			0x0
 #define NAU8822_MCLKSEL_SFT			5
 #define NAU8822_MCLKSEL_MASK			(0x7 << 5)
 #define NAU8822_BCLKSEL_SFT			2
 #define NAU8822_BCLKSEL_MASK			(0x7 << 2)
+#define NAU8822_BCLKDIV_1			(0x0 << 2)
+#define NAU8822_BCLKDIV_2			(0x1 << 2)
+#define NAU8822_BCLKDIV_4			(0x2 << 2)
+#define NAU8822_BCLKDIV_8			(0x3 << 2)
+#define NAU8822_BCLKDIV_16			(0x4 << 2)
 #define NAU8822_CLKM_MASK			(0x1 << 8)
 #define NAU8822_CLKM_MCLK			(0x0 << 8)
 #define NAU8822_CLKM_PLL			(0x1 << 8)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
