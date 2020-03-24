Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F319176C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 18:19:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC931612;
	Tue, 24 Mar 2020 18:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC931612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585070345;
	bh=phdX10EbQs8XHpNHIWm7HtuHu+ZagE7py/+TI7E//N0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RN0b0kwl00o3j/dC4TnPNSVK9tf5EaO13SPvOl9OyD/Pp1QjfFMWfxPsX0ebhUx6/
	 8rkU4kIYZTOCFg8jaXGJWy6bJiV54Y2daowmZRfegdUG8CepjSNl+H/wHrWNPvy9CP
	 PnGRZIv3kYc9GT92vUVtwdKhL4zqP1/JAuopRpoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C4D5F80272;
	Tue, 24 Mar 2020 18:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37022F80249; Tue, 24 Mar 2020 18:16:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 20D36F801F9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 18:16:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20D36F801F9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B19B1FB;
 Tue, 24 Mar 2020 10:16:22 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A1B53F71F;
 Tue, 24 Mar 2020 10:16:21 -0700 (PDT)
Date: Tue, 24 Mar 2020 17:16:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Applied "ASoC: jz4740-i2s: Add support for the JZ4760" to the asoc
 tree
In-Reply-To: <20200306222931.39664-5-paul@crapouillou.net>
Message-Id: <applied-20200306222931.39664-5-paul@crapouillou.net>
X-Patchwork-Hint: ignore
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me,
 Zhou Yanjie <zhouyanjie@wanyeetech.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: jz4740-i2s: Add support for the JZ4760

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

From bde8ca7c87d4388e24195f6c84cd9ac775344d2b Mon Sep 17 00:00:00 2001
From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 6 Mar 2020 23:29:30 +0100
Subject: [PATCH] ASoC: jz4740-i2s: Add support for the JZ4760

The change of offset for the {rx,tx}_threshold fields in the conf
register predates the JZ4780, and was first introduced in the JZ4760.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Link: https://lore.kernel.org/r/20200306222931.39664-5-paul@crapouillou.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/jz4740/jz4740-i2s.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 3f9b2e1b4747..253f8d8ba273 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -49,12 +49,8 @@
 
 #define JZ_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 12
 #define JZ_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 8
-#define JZ4780_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
-#define JZ4780_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
-#define JZ4780_AIC_CONF_FIFO_RX_THRESHOLD_MASK \
-			(0xf << JZ4780_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET)
-#define JZ4780_AIC_CONF_FIFO_TX_THRESHOLD_MASK \
-			(0x1f <<  JZ4780_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET)
+#define JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET 24
+#define JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET 16
 
 #define JZ_AIC_CTRL_OUTPUT_SAMPLE_SIZE_MASK (0x7 << 19)
 #define JZ_AIC_CTRL_INPUT_SAMPLE_SIZE_MASK (0x7 << 16)
@@ -90,6 +86,7 @@
 
 enum jz47xx_i2s_version {
 	JZ_I2S_JZ4740,
+	JZ_I2S_JZ4760,
 	JZ_I2S_JZ4780,
 };
 
@@ -403,9 +400,9 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
 		&i2s->capture_dma_data);
 
-	if (i2s->soc_info->version >= JZ_I2S_JZ4780) {
-		conf = (7 << JZ4780_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
-			(8 << JZ4780_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
+	if (i2s->soc_info->version >= JZ_I2S_JZ4760) {
+		conf = (7 << JZ4760_AIC_CONF_FIFO_RX_THRESHOLD_OFFSET) |
+			(8 << JZ4760_AIC_CONF_FIFO_TX_THRESHOLD_OFFSET) |
 			JZ_AIC_CONF_OVERFLOW_PLAY_LAST |
 			JZ_AIC_CONF_I2S |
 			JZ_AIC_CONF_INTERNAL_CODEC;
@@ -467,6 +464,11 @@ static const struct i2s_soc_info jz4740_i2s_soc_info = {
 	.dai = &jz4740_i2s_dai,
 };
 
+static const struct i2s_soc_info jz4760_i2s_soc_info = {
+	.version = JZ_I2S_JZ4760,
+	.dai = &jz4740_i2s_dai,
+};
+
 static struct snd_soc_dai_driver jz4780_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
 	.remove = jz4740_i2s_dai_remove,
@@ -499,6 +501,7 @@ static const struct snd_soc_component_driver jz4740_i2s_component = {
 #ifdef CONFIG_OF
 static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4740-i2s", .data = &jz4740_i2s_soc_info },
+	{ .compatible = "ingenic,jz4760-i2s", .data = &jz4760_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
 	{ /* sentinel */ }
 };
-- 
2.20.1

