Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B692596DB76
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369F9A4B;
	Thu,  5 Sep 2024 16:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369F9A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545820;
	bh=XXaaAVjkchY/rqKPr1ocH7WdZ2HyLktu1KzKeahPou8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EV6zadHurMVWkb2w8jCGzzWBngYOI1Ubhym7r6D61SeP1/Ftg2og/gkJhYvtJMeCC
	 BDKrpQFGJhZSva9R7AaJE8qgl78dAmpeEwoOA83/BKPMnmZQRVUagv9AUUbVvvN+ye
	 tLlidU2HJUncWt+pXMmwnvBljC5SQnue+TnlBejw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48CA3F8075B; Thu,  5 Sep 2024 16:14:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D72F8F80750;
	Thu,  5 Sep 2024 16:14:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7926DF8060B; Thu,  5 Sep 2024 16:13:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4970BF805EC
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4970BF805EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GHCP0OaC
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so6845245e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 07:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545623;
 x=1726150423; darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMGhXEw0EMiOdueZyPaJHCVqWqxyBmUIEc+9ejnTuMw=;
        b=GHCP0OaCaI3PgTYDv0Hg9KpmppMK0JU8oYXkCXcfIR+zmBQRYt/X9+d7jXvZf4gaL8
         DSy+dhc0AbRA12wFuTHednocrQ6IOgX32Rg3FhbizIzT6Q2A22xcU6bS0C/hraDOnTpC
         P3z1L4sdfydMlQcqKmMqQ2dcvtfRmmPp0TCl1I0Qgp8jFb0MtDZJYU8zOY74IKDZeuyv
         x6OQfru+IdwQ5+t2zPZXCqTJwAOeI6tj4GzOo0vXpULwlJ1ODynE0WU10z2gSNePYKet
         3WBKDu4CcyjXYtVpyUuJKDO0+4uaj/ew0bM1M7u+rYDnBpjyOBRIHPwiJSD0uEfi/eyU
         XqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545623; x=1726150423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMGhXEw0EMiOdueZyPaJHCVqWqxyBmUIEc+9ejnTuMw=;
        b=Cdvk0cN53uPlN3hZ6O1hmIG7ghJTwgJuJzWTzZMTcGhD+4RKUri+7eOxeUnMj8rCJE
         liIH6u0IEingbbL6nbj3SvbcWQor2DhFf7SBYJLFE4KKVqoulENnvWI87BvSlo+ARGWY
         bxxo2+rUrAGLNywm89EHYMy4mf1I1apBKXahrhRY1e0FLdjfbE/5/S7PAL6DWr5p3Nzs
         VG7bVP1jlVFBKtMArLcRsaO0O34RK3pwctxl2DQStUGRqVJue5kOi86Sa26pR8OZbjDo
         PyUG6rLd81QIeI+Bnm32koFaHTMot8d+7MwFLbj6DlQ1OEkj5YS2qqAJTACVwfIv1mjR
         NULQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkaTSszuInnQWmR/r0t1zdRUFfj2c+NYeBXlU1jXcrGhNz7Ny08oGxEHP29Nh7Nd9/81I0d6rO/wup@alsa-project.org
X-Gm-Message-State: AOJu0YyOc+scIN1tOYlOuxhhrTCIyPd5w0PqtJojzIxpwEL4Fk5OEw4m
	SRz2Rd13KlJ2f2/xcaRXhF3/FIUoVdf0UORakMvk2as+wqV6j8aYv61cXewD8LE=
X-Google-Smtp-Source: 
 AGHT+IHBquwgcDoVsD6UjFSAJZlg+wE5YNTlLR8lb6J1pcatZPhdoPS1oDkj1/VU2ExhbxuANwuKeQ==
X-Received: by 2002:adf:e592:0:b0:34d:ae98:4e7 with SMTP id
 ffacd0b85a97d-374bf1c7b74mr11792893f8f.41.1725545622875;
        Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:01 +0200
Subject: [PATCH 10/13] ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-10-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2940; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XXaaAVjkchY/rqKPr1ocH7WdZ2HyLktu1KzKeahPou8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byGxo81ExacfBJI81+ntmOih8+z3ldyeNe5p
 14qWKO8BtOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hgAKCRDm/A8cN/La
 hSBoD/9eW7KOYMCCavytluGtMs7KD2nL+UinfgARTNGDbqp5udgQ2B6jgk3T88uxIPdnxYUe3cj
 MjiyvaOUVqBJZlzj4NCJMzBEQY4ADrkc/UCpwYvzKCOaRm5UlDKwXsAnQIPZh/oL3+nc2hAY5dX
 yRLYnghzyXECZkDFTFo/MixLa4LoYMbD/lyKQrPBQzXXQK8UFfL8nQaHpVSiR22tFP9XgDKN2Yd
 /ufhKtaKHzuc1whFPon6rF5tBMwNrGmwJws406yr3+fZIBgIOFJjF/L/Ln6huP832EFvxStoPtD
 UJTiKpTxP4gqIbBCubzoQalXtJ3KIb05Jxdg3kGERNkhtnHxIpAH0UtMuDGLNHnhoXC/AzRGGMw
 Os6aIVYzFvb90va5lQxHbNBbS6h+bWCktz7t1FCiAHZXddfb3GA88MSew6NtAieiq8gba3O6Vu+
 hNtDdt/5IKKYktss2RWYAb6Z3gAJKwWzfWE1edd7fWeo+cphCfD2cpI/Oj7xPECGdDn8xsZKwVM
 dVkosxTnKkC502b3DS64t+8SPm9Y9ZHD5se/X9kna6uaV6ScfLWh3wwFRZXrkB95RukPC/8CH83
 EkPqzT4q1kZgT/oltlSBnTUPkW1BTMPEuEIrfmTi3TlO5b+KTWwHq4lQfDOJnIC9k775yfgUVx4
 UQwYLqEzwD2MhVw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Message-ID-Hash: J5PXTTV37IZ3KXWZ4ZANP3P3TF3TOJJA
X-Message-ID-Hash: J5PXTTV37IZ3KXWZ4ZANP3P3TF3TOJJA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5PXTTV37IZ3KXWZ4ZANP3P3TF3TOJJA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 3913706ccdc5..045100c94352 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -128,8 +128,13 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 #define Q6ASM_FEDAI_DRIVER(num) { \
 		.playback = {						\
 			.stream_name = "MultiMedia"#num" Playback",	\
-			.rates = (SNDRV_PCM_RATE_8000_192000|		\
-					SNDRV_PCM_RATE_KNOT),		\
+			.rates = (SNDRV_PCM_RATE_8000_48000 |		\
+				  SNDRV_PCM_RATE_12000 |		\
+				  SNDRV_PCM_RATE_24000 |		\
+				  SNDRV_PCM_RATE_88200 |		\
+				  SNDRV_PCM_RATE_96000 |		\
+				  SNDRV_PCM_RATE_176400 |		\
+				  SNDRV_PCM_RATE_192000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 					SNDRV_PCM_FMTBIT_S24_LE),	\
 			.channels_min = 1,				\
@@ -139,8 +144,9 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 		},							\
 		.capture = {						\
 			.stream_name = "MultiMedia"#num" Capture",	\
-			.rates = (SNDRV_PCM_RATE_8000_48000|		\
-					SNDRV_PCM_RATE_KNOT),		\
+			.rates = (SNDRV_PCM_RATE_8000_48000 |		\
+				  SNDRV_PCM_RATE_12000 |		\
+				  SNDRV_PCM_RATE_24000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 				    SNDRV_PCM_FMTBIT_S24_LE),		\
 			.channels_min = 1,				\
@@ -152,18 +158,6 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 		.id = MSM_FRONTEND_DAI_MULTIMEDIA##num,			\
 	}
 
-/* Conventional and unconventional sample rate supported */
-static unsigned int supported_sample_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
-	88200, 96000, 176400, 192000
-};
-
-static struct snd_pcm_hw_constraint_list constraints_sample_rates = {
-	.count = ARRAY_SIZE(supported_sample_rates),
-	.list = supported_sample_rates,
-	.mask = 0,
-};
-
 static const struct snd_compr_codec_caps q6asm_compr_caps = {
 	.num_descriptors = 1,
 	.descriptor[0].max_ch = 2,
@@ -390,11 +384,6 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		runtime->hw = q6asm_dai_hardware_capture;
 
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE,
-				&constraints_sample_rates);
-	if (ret < 0)
-		dev_info(dev, "snd_pcm_hw_constraint_list failed\n");
 	/* Ensure that buffer size is a multiple of period size */
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);

-- 
2.45.2

