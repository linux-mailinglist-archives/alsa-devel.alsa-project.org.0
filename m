Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFD47113EE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02EBC208;
	Thu, 25 May 2023 20:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02EBC208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039667;
	bh=hVtHiV4tktYdS6kpiViux1Z237vpIMuTIER+JWq5JNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f7DaEuDP4hLZrzIsmAPLx/GcNCJYcRcmFmReWhrmmWAJtiRWXL/hnrQ55mp8mmEhA
	 mkf7cBbPJsfdUpjrClqz96u9CgJwTO29wlUzzY16tNJHK5oDBA+qjdMfXVm8P9FYXj
	 seuSI4zdOe1e4hK1A64RpL7c3/uTZf8d2J/pRxdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A59B4F8053D; Thu, 25 May 2023 20:33:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1695CF80249;
	Thu, 25 May 2023 20:33:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DA74F80578; Thu, 25 May 2023 20:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3401F8026A
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 20:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3401F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O34o7PTg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98F7A6489D;
	Thu, 25 May 2023 18:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05BFC4339E;
	Thu, 25 May 2023 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039572;
	bh=hVtHiV4tktYdS6kpiViux1Z237vpIMuTIER+JWq5JNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O34o7PTglcAe3fnagvllV8HFxv+pygfcGErrEjMd91XTSITE/laSOLEuSzBdWGRFx
	 EEu9FVWThihX/ExydEgd87KJU+1voW57jDjtdGJr3Ds0M/Jvp/+6q4gVr2QiO4a6GN
	 RxYqJ4ywqveCMx0/jOLKKzFSgYgaOi59xeP5oXkmZJBlpvw/qt0/UeVV/IAUH6OZaZ
	 Tp8A6XsWMlzhJklXav6i8xGwZTEdSLcUQPtm53fmZ+MuNXNBB45M1+fDg5xOwHELIJ
	 iKnZpekz5rgdEI3gJxFNLVhwoVojbW4/gxjmqEa3EAkkZH95rx957bQEkFDcp6A84y
	 9ucIKokBJaaKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	paul@crapouillou.net,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 11/67] ASoC: jz4740-i2s: Make I2S divider
 calculations more robust
Date: Thu, 25 May 2023 14:30:48 -0400
Message-Id: <20230525183144.1717540-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5JZE5PQO3JDZWKEUKMMK2JJANHFFHCYP
X-Message-ID-Hash: 5JZE5PQO3JDZWKEUKMMK2JJANHFFHCYP
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JZE5PQO3JDZWKEUKMMK2JJANHFFHCYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>

[ Upstream commit ad721bc919edfd8b4b06977458a412011e2f0c50 ]

When the CPU supplies bit/frame clocks, the system clock (clk_i2s)
is divided to produce the bit clock. This is a simple 1/N divider
with a fairly limited range, so for a given system clock frequency
only a few sample rates can be produced. Usually a wider range of
sample rates is supported by varying the system clock frequency.

The old calculation method was not very robust and could easily
produce the wrong clock rate, especially with non-standard rates.
For example, if the system clock is 1.99x the target bit clock
rate, the divider would be calculated as 1 instead of the more
accurate 2.

Instead, use a more accurate method that considers two adjacent
divider settings and selects the one that produces the least error
versus the requested rate. If the error is 5% or higher then the
rate setting is rejected to prevent garbled audio.

Skip divider calculation when the codec is supplying both the bit
and frame clock; in that case, the divider outputs are unused and
we don't want to constrain the sample rate.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com
Link: https://lore.kernel.org/r/20230509125134.208129-1-aidanmacdonald.0x0@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/jz4740/jz4740-i2s.c | 54 ++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 6d9cfe0a50411..d0f6c945d9aee 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -218,18 +218,48 @@ static int jz4740_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int jz4740_i2s_get_i2sdiv(unsigned long mclk, unsigned long rate,
+				 unsigned long i2sdiv_max)
+{
+	unsigned long div, rate1, rate2, err1, err2;
+
+	div = mclk / (64 * rate);
+	if (div == 0)
+		div = 1;
+
+	rate1 = mclk / (64 * div);
+	rate2 = mclk / (64 * (div + 1));
+
+	err1 = abs(rate1 - rate);
+	err2 = abs(rate2 - rate);
+
+	/*
+	 * Choose the divider that produces the smallest error in the
+	 * output rate and reject dividers with a 5% or higher error.
+	 * In the event that both dividers are outside the acceptable
+	 * error margin, reject the rate to prevent distorted audio.
+	 * (The number 5% is arbitrary.)
+	 */
+	if (div <= i2sdiv_max && err1 <= err2 && err1 < rate/20)
+		return div;
+	if (div < i2sdiv_max && err2 < rate/20)
+		return div + 1;
+
+	return -EINVAL;
+}
+
 static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct jz4740_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	struct regmap_field *div_field;
+	unsigned long i2sdiv_max;
 	unsigned int sample_size;
-	uint32_t ctrl;
-	int div;
+	uint32_t ctrl, conf;
+	int div = 1;
 
 	regmap_read(i2s->regmap, JZ_REG_AIC_CTRL, &ctrl);
-
-	div = clk_get_rate(i2s->clk_i2s) / (64 * params_rate(params));
+	regmap_read(i2s->regmap, JZ_REG_AIC_CONF, &conf);
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S8:
@@ -258,11 +288,27 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 			ctrl &= ~JZ_AIC_CTRL_MONO_TO_STEREO;
 
 		div_field = i2s->field_i2sdiv_playback;
+		i2sdiv_max = GENMASK(i2s->soc_info->field_i2sdiv_playback.msb,
+				     i2s->soc_info->field_i2sdiv_playback.lsb);
 	} else {
 		ctrl &= ~JZ_AIC_CTRL_INPUT_SAMPLE_SIZE;
 		ctrl |= FIELD_PREP(JZ_AIC_CTRL_INPUT_SAMPLE_SIZE, sample_size);
 
 		div_field = i2s->field_i2sdiv_capture;
+		i2sdiv_max = GENMASK(i2s->soc_info->field_i2sdiv_capture.msb,
+				     i2s->soc_info->field_i2sdiv_capture.lsb);
+	}
+
+	/*
+	 * Only calculate I2SDIV if we're supplying the bit or frame clock.
+	 * If the codec is supplying both clocks then the divider output is
+	 * unused, and we don't want it to limit the allowed sample rates.
+	 */
+	if (conf & (JZ_AIC_CONF_BIT_CLK_MASTER | JZ_AIC_CONF_SYNC_CLK_MASTER)) {
+		div = jz4740_i2s_get_i2sdiv(clk_get_rate(i2s->clk_i2s),
+					    params_rate(params), i2sdiv_max);
+		if (div < 0)
+			return div;
 	}
 
 	regmap_write(i2s->regmap, JZ_REG_AIC_CTRL, ctrl);
-- 
2.39.2

