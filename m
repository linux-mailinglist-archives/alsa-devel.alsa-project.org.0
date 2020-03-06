Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5B17C864
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 23:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDE5166B;
	Fri,  6 Mar 2020 23:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDE5166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583534034;
	bh=GIEV9x/ry4X5v/gcXHDhlevD1U4JS0rwzD10Me7i6lE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QX9EOuj8Enhog3cNRhTNSrQMWHCwoYC6Nnnt4xXYAh02kdtSK4pm8gFa2UXM8DbkX
	 klwOmL79ukQssxYtnQFGuvfcUWfkDuzaH0389HbcZedFjwZ0GxhCHtlxxcCzBkpGwM
	 R5GrsTrPgnKDN8wX39ryvtdLurB4QPan3NLAmgv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65AF7F80292;
	Fri,  6 Mar 2020 23:30:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F0E6F80299; Fri,  6 Mar 2020 23:30:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BFEDF8028E
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:30:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BFEDF8028E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="Zw9tcUpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583533782; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBQZFNwVCKmMQLPO0TvYnTz9bJx9Q4eUUD3tPE6MeUw=;
 b=Zw9tcUpECwokaP/m9pjkdDhRrd2MEgCv0+42Vlyk7V5TD2Ok9JW3PVjHdfzOcCges3SZ2N
 qLkNKOT/UTDa//LjqSEyxNLC2I8UfyeMDi6LU+WOpk4JAWSB6sG5KfjgCnqWJYF6d201u6
 FzSUA+nsXyLilwZ69RNmluypOD35VsI=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/6] ASoC: jz4740-i2s: Add support for the JZ4760
Date: Fri,  6 Mar 2020 23:29:30 +0100
Message-Id: <20200306222931.39664-5-paul@crapouillou.net>
In-Reply-To: <20200306222931.39664-1-paul@crapouillou.net>
References: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
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

The change of offset for the {rx,tx}_threshold fields in the conf
register predates the JZ4780, and was first introduced in the JZ4760.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
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
2.25.1

