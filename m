Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D8B4AD3D7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 09:44:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B84C17A2;
	Tue,  8 Feb 2022 09:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B84C17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644309868;
	bh=29N6VXZ7rRK66m4yFLQoUflxBh+GsBaMa+FCFcGDhSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyktH7ZXKUw2wd8qajW9o2Qu2kNXL5IWHtHsHftJh+2QmKG2dblcMcM/VH/iFBvkG
	 0YerLXCiQ18ROueDm3dNShEYoadSUhF9GdNORlpaUN5WezihKN4zXFftIxIXyHW5Uf
	 kmaWwns4RQcTVSQeNUdOAlDI2i4+Z9woZJ3/5dto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 283A8F8051A;
	Tue,  8 Feb 2022 09:42:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8676F800EB; Tue,  8 Feb 2022 09:42:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B49F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 09:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B49F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20210112.gappssmtp.com
 header.i=@cogentembedded-com.20210112.gappssmtp.com header.b="GBxw4kKR"
Received: by mail-lj1-x22e.google.com with SMTP id o17so23412166ljp.1
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 00:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SqcXIt39hShtKj54ZerZJEIaFZk+FrZV1s2XWCXxyw=;
 b=GBxw4kKR0joqbiZYz79uUSB9b2Zp2Zq+1eMvhtf1Ac1BmvTGd6BsEvmwkCkvocSnsS
 9xvM6rXbEpDJHmHhuYFQK8iGxjYyygD7x58gMbrhhBdIEUDi7xoX5w/4l4kc6UCnU05S
 MZ8a2vzicDPPC4w9i0Ugy135JxLJwWR3ZBgpiOhYb8GAcxj3AvUtv4ZMb874OvgabLw+
 +7hEEum8vy4INAKgeHb8aaQ/E/F41kVT4jvgClVu/0xFPGiZ8aYiVfTkpoxVPTxo3Nd0
 aoynGWCm1BCwlnmvUskt8F5g2EE8uFrUUychYlknnDwWzPQMxWAXRPQIezuBo/ifrD7U
 NbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SqcXIt39hShtKj54ZerZJEIaFZk+FrZV1s2XWCXxyw=;
 b=feRCpLte6vwvaZrhBS7pBExi+aUmsZePV7mkt9Wn6O5VDU5YvsnfGvcHPhxYeezjG6
 +VLxpmtnKpyFMtLYynmMeZ1jIpZS3zpctjEupesBG4brSyKku9Rjyc889qBfxytpJOAE
 4cHiKUpxcmjJdCLusxAFEz1E5kqVxH0Rvy0UtjkLi5nKAg/WLA3WSQZDkwXjlct3XKgA
 6Bf5cTVAIigmuvEn8h641TIlzB7SSoVAl6t6Vt4Wb9ktAyUeIh+K4GC29Jrtd/PEPVVQ
 SZhntCtj5e3GCWcYsuNZkIkxGYpS1sO6xWnTK1648Jawy0AWTDncS7OaweZyY9RA7h6V
 Gawg==
X-Gm-Message-State: AOAM533u3haHzoimI9XC3yHQtnYB0ha2tqwSAtopAyx4jemrjNlbf8l5
 zl3Aga5VEptX2JbbR4T4uFE9o5AahvkT+AVh
X-Google-Smtp-Source: ABdhPJz4lF2QXG+jryZwq6Ylmt24RIWtcNM+ZFjykyOOoX1MQeeQeKh9mmcRvwrBb5iaC7ORnycxEw==
X-Received: by 2002:a2e:a5c3:: with SMTP id n3mr2173139ljp.212.1644309762594; 
 Tue, 08 Feb 2022 00:42:42 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id o12sm1830361lfu.96.2022.02.08.00.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:42 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: pcm3168a: refactor hw_params routine
Date: Tue,  8 Feb 2022 11:42:18 +0300
Message-Id: <20220208084220.1289836-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
References: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

- group together code lines that calculate value for msad/msda field

- rename variables to better match their meaning:
    val -> ms,
    max_ratio -> num_scki_ratios

- update variable types to match exactly parameters or return types
  of the calls where those variables are used

- write two fields of the same register in a single regmap call

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/pcm3168a.c | 67 ++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 987c5845f769..526e4562ccb5 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -462,40 +462,45 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
 	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
 	bool master_mode;
-	u32 val, mask, shift, reg;
-	unsigned int rate, fmt, ratio, max_ratio;
-	unsigned int tdm_slots;
-	int i, slot_width;
-
-	rate = params_rate(params);
-
-	ratio = pcm3168a->sysclk / rate;
+	unsigned int reg, mask, ms, ms_shift, fmt, fmt_shift, ratio, tdm_slots;
+	int i, num_scki_ratios, slot_width;
 
 	if (dai->id == PCM3168A_DAI_DAC) {
-		max_ratio = PCM3168A_NUM_SCKI_RATIOS_DAC;
+		num_scki_ratios = PCM3168A_NUM_SCKI_RATIOS_DAC;
 		reg = PCM3168A_DAC_PWR_MST_FMT;
-		mask = PCM3168A_DAC_MSDA_MASK;
-		shift = PCM3168A_DAC_MSDA_SHIFT;
+		mask = PCM3168A_DAC_MSDA_MASK | PCM3168A_DAC_FMT_MASK;
+		ms_shift = PCM3168A_DAC_MSDA_SHIFT;
+		fmt_shift = PCM3168A_DAC_FMT_SHIFT;
 	} else {
-		max_ratio = PCM3168A_NUM_SCKI_RATIOS_ADC;
+		num_scki_ratios = PCM3168A_NUM_SCKI_RATIOS_ADC;
 		reg = PCM3168A_ADC_MST_FMT;
-		mask = PCM3168A_ADC_MSAD_MASK;
-		shift = PCM3168A_ADC_MSAD_SHIFT;
+		mask = PCM3168A_ADC_MSAD_MASK | PCM3168A_ADC_FMTAD_MASK;
+		ms_shift = PCM3168A_ADC_MSAD_SHIFT;
+		fmt_shift = PCM3168A_ADC_FMTAD_SHIFT;
 	}
 
 	master_mode = io_params->master_mode;
-	fmt = io_params->fmt;
 
-	for (i = 0; i < max_ratio; i++) {
-		if (pcm3168a_scki_ratios[i] == ratio)
-			break;
-	}
+	if (master_mode) {
+		ratio = pcm3168a->sysclk / params_rate(params);
 
-	if (i == max_ratio) {
-		dev_err(component->dev, "unsupported sysclk ratio\n");
-		return -EINVAL;
+		for (i = 0; i < num_scki_ratios; i++) {
+			if (pcm3168a_scki_ratios[i] == ratio)
+				break;
+		}
+
+		if (i == num_scki_ratios) {
+			dev_err(component->dev, "unsupported sysclk ratio\n");
+			return -EINVAL;
+		}
+
+		ms = (i + 1);
+	} else {
+		ms = 0;
 	}
 
+	fmt = io_params->fmt;
+
 	if (io_params->slot_width)
 		slot_width = io_params->slot_width;
 	else
@@ -553,22 +558,8 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (master_mode)
-		val = ((i + 1) << shift);
-	else
-		val = 0;
-
-	regmap_update_bits(pcm3168a->regmap, reg, mask, val);
-
-	if (dai->id == PCM3168A_DAI_DAC) {
-		mask = PCM3168A_DAC_FMT_MASK;
-		shift = PCM3168A_DAC_FMT_SHIFT;
-	} else {
-		mask = PCM3168A_ADC_FMTAD_MASK;
-		shift = PCM3168A_ADC_FMTAD_SHIFT;
-	}
-
-	regmap_update_bits(pcm3168a->regmap, reg, mask, fmt << shift);
+	regmap_update_bits(pcm3168a->regmap, reg, mask,
+			(ms << ms_shift) | (fmt << fmt_shift));
 
 	return 0;
 }
-- 
2.30.2

