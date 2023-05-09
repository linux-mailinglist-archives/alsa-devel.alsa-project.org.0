Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AD6FC717
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 14:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C503810D8;
	Tue,  9 May 2023 14:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C503810D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683636758;
	bh=1AAgnbSgEoFeikRlXnIvhL2jIvewgSaZ5d8xRJyHvMQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s2wCFE9Zilyc6OxxVZOqwvFPRqiyOLVcKH3/Y4w40WG6RhnC1T0Wlv0rBf5tsGcOf
	 1gSBlY42Z5ttgDQlZPDFaPN4jkdqoWMc3V82NN1bd6Xtac+CVOi5GwwpMKigYmUMHj
	 VUtSSkGqLeDkHpgDNfI0ACz71GWBril8uU/3gF1g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10FABF8014C;
	Tue,  9 May 2023 14:51:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B81FF8032D; Tue,  9 May 2023 14:51:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F33F8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 14:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F33F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=eFnLKpkN
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so3761244f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683636698; x=1686228698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1/XE53ZAzVzbWxt1L6Fngf/VAFFM7pHgdppOQGD8ZQ=;
        b=eFnLKpkN/MCUppT/fEZ7DQBH2Rr2kQRkkDgWCcXgKfAL2wSTwu2N7c6D1g6kiylfaq
         i6SSb/WA0cL+9AHuFkMNOy/Y3tewLZgcp0G8u1BDIPHRjxPRikBc8nlcULr4JeistBnn
         N0h1hYUFosD/LcZ0n1Odj68K0ppOjTW8ihDvENFpW6zg+bKdVAhGG9c6zNCz+W/PPqDL
         jT6+EqEYFdPrL3U8A6dRP0s45ggv25Fhrm0wkrCozbxn2qjSB492UcPIQmx51V9Jn55c
         fE28+r3NROLHAvARCZLiUZvOtPAcNs+RyImn1AmTqfl96c6lSiqky7eaChsZcxCDINiD
         6SNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683636698; x=1686228698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1/XE53ZAzVzbWxt1L6Fngf/VAFFM7pHgdppOQGD8ZQ=;
        b=D6plHNLAn02iP3wQA/00p1dADqlB6BYaNWGtdZjWEbtreiMz/ZGUPuc/7ViC3ZoB+a
         VIBvOM0AfLix7cgrCAVcK8blEXu6EDrMMGNf85EEiHPk0OA9tB6vJbw0syWodPzeETNn
         6TTjASEUbQIkYNchjAFnKq7y3t8B7/MTLUl/5Qfb/i68TRQofLIAaHOMkD8VC5jTuql3
         2dszKvvjNXekurZC4sSLp8NPGYVX090MDR0cZ7Gtcr75tUiXtTJlGQ7WHpGcT6tXx0GS
         djBJrn9uN+1BGZet54Iw5dxUHXOEovyapC2rywyqDo7BrA+zaVt4hGdynGnX8q3XGSF+
         PDfw==
X-Gm-Message-State: AC+VfDw+zzYVdXi1rLj5ArpgCzcRUpsdxpLXwzk6r44n7LYQpqNWPN/+
	EAFARClI90BdoLOlwQJXqQY=
X-Google-Smtp-Source: 
 ACHHUZ50PgWu8QVhLMHOqfsQn+1urSHwnstxa95vNIKo9GS/JNUp0jqI1TRGORpE/pRnnpVdY2NPWA==
X-Received: by 2002:a5d:61ce:0:b0:306:30ea:a072 with SMTP id
 q14-20020a5d61ce000000b0030630eaa072mr10446235wrv.53.1683636697736;
        Tue, 09 May 2023 05:51:37 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b003078cd719ffsm9340948wrr.95.2023.05.09.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 05:51:37 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net,
	broonie@kernel.org
Subject: [PATCH v1] ASoC: jz4740-i2s: Make I2S divider calculations more
 robust
Date: Tue,  9 May 2023 13:51:34 +0100
Message-Id: <20230509125134.208129-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IUKFS54JZXMP42KX4YAFQQGUSESJSXYV
X-Message-ID-Hash: IUKFS54JZXMP42KX4YAFQQGUSESJSXYV
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, linux-mips@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUKFS54JZXMP42KX4YAFQQGUSESJSXYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 54 ++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 6d9cfe0a5041..d0f6c945d9ae 100644
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

