Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7C96DB60
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84402846;
	Thu,  5 Sep 2024 16:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84402846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545705;
	bh=JlFXCBTD6wmPGs3Xc+eBXJCnNEzFsRasRZacDAmL1po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=enalRdUE0wHzLfKAa57UzJOsPVp+u2aRmzMux2mF0ZmpdBRSkBapAY90XgASvGvsF
	 5w2HdNhomBca1qNyi0aewBxcLGgEHnZ76/W15fvofT3U97+6DdmRLDmWwagibA8qBJ
	 lxINvJy5mbMUa81e+G4OfCBmHlVfyxnYqVMbUhnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71FD9F8062D; Thu,  5 Sep 2024 16:13:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37EE5F805AE;
	Thu,  5 Sep 2024 16:13:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B86AF80199; Thu,  5 Sep 2024 16:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44158F80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44158F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GJkNpzz2
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so6816165e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545615;
 x=1726150415; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZ4OWj1M1ZpMsgNdFCjWDSBf4jaOw7GENdrNyJWLeh4=;
        b=GJkNpzz2ArurBk6YSqLrkb5cwl7Cr4A+PhR2VK7SqxQeE3GD17BGSmBLYCWQTpJTBr
         vpm5yjbHW/I4vrjm29l4O6ZjKKGV74LmYUOL8NQTo6sHaK056kJHrqTfEFlJA9REBrvU
         DaXPFe47r0RRdXX3ZobyY5t3fYwfx0pAOpCrbZ7PTH4kGaWjWqoAzQi4F5Bk+1yeYbvz
         B+wMtxjXv48L0n2duW9JgWo9N+MZDIddDozXgENhOZCpIA9/ngsh/z5cZ9rvKiEGw0lQ
         HL6ATbKm9a1G3A04Jse1LDGxMG4jrGtBEaC8PHiRxPXzz+IibECIV9CVGe+NvxZj8YBU
         mm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545615; x=1726150415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZ4OWj1M1ZpMsgNdFCjWDSBf4jaOw7GENdrNyJWLeh4=;
        b=jreOsvCRaGGFZsmPFKpAhX5kV/zsBNIlRJ7zxdtsDig748o6AskIJnikwfOZ188Hus
         2FrBOxip238LLe5KrhH9+Soe1IxJV9JxEm/Xhvg4nxJLyyiJW7kSegStqDcoh5H3bBXK
         MRqCNP8rtkGbCHQcqn25sp6NPNkBbBVA+NEnWAnDu/Vafdswook4H69q9jC9ECtgCkmy
         3+5AkNqgjhvTR4Y/YaJYjbfxh2PbyqOJPh4eBWZjfxanBPx0LLIesckOeeMa4jNrSPAA
         PP7E+PVUyUc1iykBOh985lY7mwvsNXyCqvWi+YfLG7L2x2KJfL1AjzLMtT9qBh4kXlqI
         dpPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnV2Nhq7/umCgh2WNV63wkCFkR/M87KkocXqmohj4PRx35AC2UZ3a3/pNRNrXeruwKIpcEAHMMw8kp@alsa-project.org
X-Gm-Message-State: AOJu0YyVmt83jpsVdRenPS/EKjmNOQF9XepNVPViY9ppHpL6tr1vqKwP
	rnVaRY8dVaqpjAAdlDgxmifT1SwaWpwV6Z9OEdWqKB+2jEMJCTl4NuuGLtBOMZk=
X-Google-Smtp-Source: 
 AGHT+IFQfpi2p18CVl/s3bTmgrKQh6HdDCkB/ZnyhlaiBCzX95JZK0PtErVMddC8kBx8lcb0js+0/g==
X-Received: by 2002:adf:9b86:0:b0:374:becb:d9de with SMTP id
 ffacd0b85a97d-374bf1c7963mr11972286f8f.44.1725545614620;
        Thu, 05 Sep 2024 07:13:34 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:54 +0200
Subject: [PATCH 03/13] ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-3-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2791; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JlFXCBTD6wmPGs3Xc+eBXJCnNEzFsRasRZacDAmL1po=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx/F8WSx9SFo+Mm9aAwm5w5LTGeCtAOKiZNf
 Pbdd3RViiaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fwAKCRDm/A8cN/La
 hTO8EACfpShxFfUfKBhcVOFgGnGLNcUrNcxHpvHeMT6YKdbtHho2dcF4RxIgzZdG3+MPzTgKCsW
 qKwzGfpKhAFRS6wz5tGK2UDhdk9tmZbGfUuW6KsvzNurvkxqxjpLh6jkrxbwhOlIIj+gSeIsihV
 1RzUbnyNg04AeMAF12l3PCpFSDVgbG/0/gxVUZJx36yb1cvmXRleVELUnsz+i8WZls+5AtDZkE9
 jtQsHRZyN5VXTEqPk7THy7bb6rstqW6VdH0/jPmShDW6iTIvQCj5p8a0HpoQd+/K9aiYYjlqOdm
 aqK+TDzCsgimu0ca4dqsAkGaSZty17/RfWigRs9LBY5l20spNTAO/JIrXatmZqYlarMJjKNKPqO
 CEF4exBkSiDErgJkF6us0XqfEr+iNGXQ87/u8K8uN5+WbFHv4ynZDkpkXALb6BQFlB0aCCW4cAb
 oOiDds2ZlszM5mDHqjnYAO5vk3Sme/eAsXFMp6UlcqgJ8cq03VUPPJncB3iDzZrp/84D+/wzsZc
 9AQkvBpyzPJyMenwxVTwPk9xpACxwpyZXwcgBdQ1xynVrzwLyUe38AV6DW3kPzeky8TxBY/eZ1i
 OV1dJqvbu8GAQ8b0IjB7E9YlEFZq0QpqCANP9bBuHv0scQAgZlA615zxiwoWpWzpc5DHYUDAnZp
 LIBw1U57xD093jg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: YHVKTGWUO7LBZ6GGVHYZ5QPE7ZS5AGHJ
X-Message-ID-Hash: YHVKTGWUO7LBZ6GGVHYZ5QPE7ZS5AGHJ
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHVKTGWUO7LBZ6GGVHYZ5QPE7ZS5AGHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint lists were necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rules.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/emu10k1/emupcm.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 7f4c1b38d6ec..1bf6e3d652f8 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -147,16 +147,6 @@ static const struct snd_pcm_hw_constraint_list hw_constraints_capture_buffer_siz
 	.mask = 0
 };
 
-static const unsigned int capture_rates[8] = {
-	8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list hw_constraints_capture_rates = {
-	.count = 8,
-	.list = capture_rates,
-	.mask = 0
-};
-
 static unsigned int snd_emu10k1_capture_rate_reg(unsigned int rate)
 {
 	switch (rate) {
@@ -174,16 +164,6 @@ static unsigned int snd_emu10k1_capture_rate_reg(unsigned int rate)
 	}
 }
 
-static const unsigned int audigy_capture_rates[9] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list hw_constraints_audigy_capture_rates = {
-	.count = 9,
-	.list = audigy_capture_rates,
-	.mask = 0
-};
-
 static unsigned int snd_emu10k1_audigy_capture_rate_reg(unsigned int rate)
 {
 	switch (rate) {
@@ -207,17 +187,16 @@ static void snd_emu10k1_constrain_capture_rates(struct snd_emu10k1 *emu,
 {
 	if (emu->card_capabilities->emu_model &&
 	    emu->emu1010.word_clock == 44100) {
-		// This also sets the rate constraint by deleting SNDRV_PCM_RATE_KNOT
 		runtime->hw.rates = SNDRV_PCM_RATE_11025 | \
 				    SNDRV_PCM_RATE_22050 | \
 				    SNDRV_PCM_RATE_44100;
 		runtime->hw.rate_min = 11025;
 		runtime->hw.rate_max = 44100;
-		return;
+	} else if (emu->audigy) {
+		runtime->hw.rates = SNDRV_PCM_RATE_8000_48000 |
+				    SNDRV_PCM_RATE_12000 |
+				    SNDRV_PCM_RATE_24000;
 	}
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				   emu->audigy ? &hw_constraints_audigy_capture_rates :
-						 &hw_constraints_capture_rates);
 }
 
 static void snd_emu1010_constrain_efx_rate(struct snd_emu10k1 *emu,
@@ -1053,7 +1032,7 @@ static const struct snd_pcm_hardware snd_emu10k1_capture =
 				 SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_MMAP_VALID),
 	.formats =		SNDRV_PCM_FMTBIT_S16_LE,
-	.rates =		SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT,
+	.rates =		SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_24000,
 	.rate_min =		8000,
 	.rate_max =		48000,
 	.channels_min =		1,

-- 
2.45.2

