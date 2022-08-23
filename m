Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4759D31E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF61A1638;
	Tue, 23 Aug 2022 10:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF61A1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661242301;
	bh=mbKmZRowxAoxc31E/BR2wJ2GoKyVQIhVY34/zyjGKdk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nr/pT5EHTURiIhNZFh6Vb68fMwNKBA10gkvLf4LGMODG6p6y7NUF2dx8cLpBijGSN
	 BXDpESv52ls7e1eZJFO31KKlpRW3JgSwLJMH3ftYRJ8rbOGV7pfrrb403Bmg5t6ql1
	 xrafCAm6QRSAYwbIwtCWrc4HffofW9Sm1LX+e4BA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4212F80525;
	Tue, 23 Aug 2022 10:10:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA0F7F800C9; Tue, 23 Aug 2022 10:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 440CBF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440CBF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ubVTZK0R"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="I0fu9FZa"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D194B340EC;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661242202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kr3eNmpAI6AChTYaBoIgaGAXXTsGD+8G6RvsGxEXRgI=;
 b=ubVTZK0Rzr2zFz4FR393v0btPKDHvB/uNwSQA29P3069e6AQ0exbyAcjnchUfjJtpBWuyA
 SD2R5c9C4Bu1rDKnKrucGCHliHKGssQBCOEm+NLjKyNow+P8h3CelyI86JL212aoSL1LGz
 meVkBfcnYsmNwmOV6nOuAiTV2+GRKSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661242202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kr3eNmpAI6AChTYaBoIgaGAXXTsGD+8G6RvsGxEXRgI=;
 b=I0fu9FZaVZjcCs/I7lwn+TXKPS1CdyJhQj7M0OPmz1xPN0NnQQqA/IkPOc4HryUa6SSjwr
 sXuJRE6Blz0H5bDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B332013A89;
 Tue, 23 Aug 2022 08:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IAyGKlqLBGMxTgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 08:10:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: nau8540: Implement hw constraint for rates
Date: Tue, 23 Aug 2022 10:10:00 +0200
Message-Id: <20220823081000.2965-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220823081000.2965-1-tiwai@suse.de>
References: <20220823081000.2965-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

nau8540 driver restricts the sample rate with over sampling rate, but
currently it barely bails out at hw_params with -EINVAL error (with a
kernel message); this doesn't help for user-space to recognize which
rate can be actually used.

This patch introduces the proper hw constraint for adjusting the
available range of the sample rate depending on the OSR setup, as well
as some code cleanup, for improving the communication with
user-space.  Now applications can know the valid rate beforehand and
reduces the rate appropriately without errors.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/nau8540.c | 40 +++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 58f70a02f18a..0626d5694c22 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -357,17 +357,32 @@ static const struct snd_soc_dapm_route nau8540_dapm_routes[] = {
 	{"AIFTX", NULL, "Digital CH4 Mux"},
 };
 
-static int nau8540_clock_check(struct nau8540 *nau8540, int rate, int osr)
+static const struct nau8540_osr_attr *
+nau8540_get_osr(struct nau8540 *nau8540)
 {
+	unsigned int osr;
+
+	regmap_read(nau8540->regmap, NAU8540_REG_ADC_SAMPLE_RATE, &osr);
+	osr &= NAU8540_ADC_OSR_MASK;
 	if (osr >= ARRAY_SIZE(osr_adc_sel))
-		return -EINVAL;
+		return NULL;
+	return &osr_adc_sel[osr];
+}
+
+static int nau8540_dai_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
+	const struct nau8540_osr_attr *osr;
 
-	if (rate * osr > CLK_ADC_MAX) {
-		dev_err(nau8540->dev, "exceed the maximum frequency of CLK_ADC\n");
+	osr = nau8540_get_osr(nau8540);
+	if (!osr || !osr->osr)
 		return -EINVAL;
-	}
 
-	return 0;
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_RATE,
+					    0, CLK_ADC_MAX / osr->osr);
 }
 
 static int nau8540_hw_params(struct snd_pcm_substream *substream,
@@ -375,7 +390,8 @@ static int nau8540_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
-	unsigned int val_len = 0, osr;
+	unsigned int val_len = 0;
+	const struct nau8540_osr_attr *osr;
 
 	/* CLK_ADC = OSR * FS
 	 * ADC clock frequency is defined as Over Sampling Rate (OSR)
@@ -383,13 +399,14 @@ static int nau8540_hw_params(struct snd_pcm_substream *substream,
 	 * values must be selected such that the maximum frequency is less
 	 * than 6.144 MHz.
 	 */
-	regmap_read(nau8540->regmap, NAU8540_REG_ADC_SAMPLE_RATE, &osr);
-	osr &= NAU8540_ADC_OSR_MASK;
-	if (nau8540_clock_check(nau8540, params_rate(params), osr))
+	osr = nau8540_get_osr(nau8540);
+	if (!osr || !osr->osr)
+		return -EINVAL;
+	if (params_rate(params) * osr->osr > CLK_ADC_MAX)
 		return -EINVAL;
 	regmap_update_bits(nau8540->regmap, NAU8540_REG_CLOCK_SRC,
 		NAU8540_CLK_ADC_SRC_MASK,
-		osr_adc_sel[osr].clk_src << NAU8540_CLK_ADC_SRC_SFT);
+		osr->clk_src << NAU8540_CLK_ADC_SRC_SFT);
 
 	switch (params_width(params)) {
 	case 16:
@@ -515,6 +532,7 @@ static int nau8540_set_tdm_slot(struct snd_soc_dai *dai,
 
 
 static const struct snd_soc_dai_ops nau8540_dai_ops = {
+	.startup = nau8540_dai_startup,
 	.hw_params = nau8540_hw_params,
 	.set_fmt = nau8540_set_fmt,
 	.set_tdm_slot = nau8540_set_tdm_slot,
-- 
2.35.3

