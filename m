Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144990AEAE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD9FF84D;
	Mon, 17 Jun 2024 15:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD9FF84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629573;
	bh=6t3ZkqcNeoQQb/+n2YWFMbCwguXnWksaQugNhpxF2Qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DdCqnMP88R59nZvceid7zg+Jdf9TFk/iZOQtiIRXw4+1rCV9F5UZgweUIcO+Uwh9o
	 Hok5v37UtR4xrR3eRLEPi6zVf2KlCOT4OE7oMcQ/I2DOo1GQ2ERvOcMxl0yuZz3zHP
	 aKwBhBIPGF07a7m8pq3XeWzwg+atp5gyuZRKaN+k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E77EF805BD; Mon, 17 Jun 2024 15:04:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0B0F80688;
	Mon, 17 Jun 2024 15:04:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0150F805E8; Mon, 17 Jun 2024 15:04:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8062F804D6
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8062F804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rfxCpRfq
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111b0so1162583a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629421; x=1719234221;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTDFr+Cm8nDhokWGI5gZCj0FJzBUQBkkvhzHWESthf0=;
        b=rfxCpRfqHK1T8OcJWZd14Ast8Z2aUIwk+bbtAk4YQLjIlwpxjCa2xHTrT86dfbncrE
         eNpQU4v28rkMQuAJI0lm8+JSRFCS1Yf+rY8gCDowyNN4B83mWXs7xbEfqwrFepdAho9P
         uqu7l+wz4hcFUFoQlkoqVLn1M6Y/xrS53vagJg7Gyf1LonKyRixK6ZSss6JpWMB2wQQA
         Hpu+zluMeTjld6i8pO//ybGw+CIoS8AUoZ4gIL1i4pdS7ViN8XCcQhBZnUCnrGmweWxh
         Gnfy7GFv0z3FR9ZH0+kcgr87rIxxhSAIucb6yqK3XlZeYfTWwOkEydrKEFpxHoefCZpl
         cVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629421; x=1719234221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTDFr+Cm8nDhokWGI5gZCj0FJzBUQBkkvhzHWESthf0=;
        b=aBbqWnLJmCnCFNez7TlpKXlnBLDyRhmdMbDHOxhseW0M1H77DAqAENMXaKyJCfgzTk
         j1+AO/ZGdW+q+4Mz80q3f4ODb8kQD6h5KQxc+WNaUKNQ3A1NCwofZgIDyvOf67lDSXJf
         TZq143DCn6KgjLOJcm8d0kzc0PLjerGXx7jCA9V/yiVT8XxQZTrEJF8gN5LxMjSszqeE
         F5e6sOweeAVkH78UtX5JyjfEM+qR8kzUoM9wxa2jGcaUU008oVnkPLzHgL3JUByK8T9V
         dK2yVruABd0Xblqol/Y+cYIDD29tAsee7NpzmWIdSrbv4NGZM569oHp2vYygkeOACrIg
         MZgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfDZqBXyuedUHNDtxPMw+NTRx8KcXQ3HqTq26p6SWSHLv5ZBYA+Uw2bwMELoCZkZGZEjQRJq6YsWIXmjmmj8e/vsssv5EIMB8QCIk=
X-Gm-Message-State: AOJu0YzVX9OxYtaxVNh20cf4iZZWDTL5saVAYWjCIAotxxOlLmkokQKL
	XyLS9fuq2FSLtbgfBm1ffTSnC55uWqt2JU3uRjjXfRz7QGPeF+pbcJZnVrFgYb4=
X-Google-Smtp-Source: 
 AGHT+IG0uo6xbwCVLGemxh8QyVdwKLSreFz59C2NpY1GizeXqWOynGBerO7GobcCbP+4hBGajbjtkQ==
X-Received: by 2002:a50:d48e:0:b0:57c:8e57:c3f0 with SMTP id
 4fb4d7f45d1cf-57cbd685122mr7587945a12.16.1718629420843;
        Mon, 17 Jun 2024 06:03:40 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:23 +0200
Subject: [PATCH 5/6] ASoC: Constify return of snd_soc_dai_get_pcm_stream()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-5-8004f346ee38@linaro.org>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6826;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6t3ZkqcNeoQQb/+n2YWFMbCwguXnWksaQugNhpxF2Qo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQi7eqb6NCoOY1F4T3SR0rHmp1JLBzjzFZAV
 RyLBDlw2vCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IgAKCRDBN2bmhouD
 10zJD/0f8jAVU8xwRZB3dmHz6NbBZYEs6J97frvD4lszp15M1r2Nj9ltmNlVz2SkyA91uxRE6tQ
 JqLUjxdsx1ZT4mGBkH+kKn8+3b2U9KHa94WwoxU8f1qzlqiZH5J6Gnf43vheTlJlBHjRPHpswrH
 WSm0AT5yrsNHWqcL0GOcqU6M/PosUm9E8GisLC9VyAv2rj9mmGyECBu1pmbrPmLII9SpqRUfoTx
 pJNFAvbxwArTES3/2q/uhU1xNfk87XjEB6B8VCgf4gfvtXCjJ6sOwS6sOUcWYe1sl4iY1e1tqqQ
 67FniMGKICaYNQR2Y8qtpGNRIGxRsMPI7cu1aJaGUirPxRfAI9KBl3GoJeNj4EWDm7E7SFFSSWj
 5Jllwk6HVm/7eeQAqRMahY/aR2mIKOvEDGOn/s4dUppyFeniXbShPtb0UrdjZHWSjSaOB7d7vTd
 lVMJHm8naCLbYnIC9irS7xN+LJ/mxEdeRmwwnfW1CgZ78YPJRe20a9c7YUXBwCiDL0lHlk6I8XB
 62uEI5KyNlpB+hZ9PO2Dv4gaxAGK1g+iCyqm9aNeoRzfaghDQrIZg5gm8ifWqSjBLMEeHQXWANF
 FRvxsaQSCGLLBfQh3bsgNCC8XzlXuzeeX2aMgQIoFNr23B5q6N2VtMCNOallLX8LFk9BIk9euNi
 scz/N+b7Bn3Z/zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 2EDLULTI2ME2BX36NKLLIFS7SSQOK5NC
X-Message-ID-Hash: 2EDLULTI2ME2BX36NKLLIFS7SSQOK5NC
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EDLULTI2ME2BX36NKLLIFS7SSQOK5NC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Returned 'struct snd_soc_pcm_stream' by snd_soc_dai_get_pcm_stream() is
not modified by the users, so it can be changed as pointer to const.
This is a necessary step towards making the 'dai->driver' a pointer to
const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h   |  2 +-
 sound/soc/intel/avs/pcm.c |  4 ++--
 sound/soc/soc-dai.c       |  2 +-
 sound/soc/soc-pcm.c       | 26 +++++++++++++-------------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e9751cc94f8c..bbb72ad4c951 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -473,7 +473,7 @@ struct snd_soc_dai {
 	unsigned int probed:1;
 };
 
-static inline struct snd_soc_pcm_stream *
+static inline const struct snd_soc_pcm_stream *
 snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 {
 	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 88e711875004..c76b86254a8b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -341,7 +341,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_stream *stream_info;
+	const struct snd_soc_pcm_stream *stream_info;
 	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct avs_dma_data *data;
@@ -637,7 +637,7 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_stream *stream_info;
+	const struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 0c3a834e504d..9e47053419c1 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -473,7 +473,7 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
  */
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 {
-	struct snd_soc_pcm_stream *stream = snd_soc_dai_get_pcm_stream(dai, dir);
+	const struct snd_soc_pcm_stream *stream = snd_soc_dai_get_pcm_stream(dai, dir);
 
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 711b2f49ed88..bad823718ae4 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -504,7 +504,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	unsigned int bits = 0, cpu_bits = 0;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		struct snd_soc_pcm_stream *pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
+		const struct snd_soc_pcm_stream *pcm_codec = snd_soc_dai_get_pcm_stream(codec_dai, stream);
 
 		if (pcm_codec->sig_bits == 0) {
 			bits = 0;
@@ -514,7 +514,7 @@ static void soc_pcm_apply_msb(struct snd_pcm_substream *substream)
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		struct snd_soc_pcm_stream *pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
+		const struct snd_soc_pcm_stream *pcm_cpu = snd_soc_dai_get_pcm_stream(cpu_dai, stream);
 
 		if (pcm_cpu->sig_bits == 0) {
 			cpu_bits = 0;
@@ -538,7 +538,7 @@ static void soc_pcm_hw_init(struct snd_pcm_hardware *hw)
 }
 
 static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
-				   struct snd_soc_pcm_stream *p)
+				   const struct snd_soc_pcm_stream *p)
 {
 	hw->rates = snd_pcm_rate_mask_intersect(hw->rates, p->rates);
 
@@ -551,20 +551,20 @@ static void soc_pcm_hw_update_rate(struct snd_pcm_hardware *hw,
 }
 
 static void soc_pcm_hw_update_chan(struct snd_pcm_hardware *hw,
-				   struct snd_soc_pcm_stream *p)
+				   const struct snd_soc_pcm_stream *p)
 {
 	hw->channels_min = max(hw->channels_min, p->channels_min);
 	hw->channels_max = min(hw->channels_max, p->channels_max);
 }
 
 static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
-				     struct snd_soc_pcm_stream *p)
+				     const struct snd_soc_pcm_stream *p)
 {
 	hw->formats &= p->formats;
 }
 
 static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
-					struct snd_soc_pcm_stream *p)
+					const struct snd_soc_pcm_stream *p)
 {
 	hw->subformats &= p->subformats;
 }
@@ -583,8 +583,8 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_pcm_stream *codec_stream;
-	struct snd_soc_pcm_stream *cpu_stream;
+	const struct snd_soc_pcm_stream *codec_stream;
+	const struct snd_soc_pcm_stream *cpu_stream;
 	unsigned int cpu_chan_min = 0, cpu_chan_max = UINT_MAX;
 	int i;
 
@@ -1712,7 +1712,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		hw->formats &= formats;
 
 	for_each_rtd_cpu_dais(fe, i, dai) {
-		struct snd_soc_pcm_stream *cpu_stream;
+		const struct snd_soc_pcm_stream *cpu_stream;
 
 		/*
 		 * Skip CPUs which don't support the current stream
@@ -1750,7 +1750,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *codec_stream;
+		const struct snd_soc_pcm_stream *codec_stream;
 		int i;
 
 		for_each_rtd_codec_dais(be, i, dai) {
@@ -1787,7 +1787,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *cpu_stream;
+		const struct snd_soc_pcm_stream *cpu_stream;
 		struct snd_soc_dai *dai;
 		int i;
 
@@ -1809,7 +1809,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 		 * DAIs connected to a single CPU DAI, use CPU DAI's directly
 		 */
 		if (be->dai_link->num_codecs == 1) {
-			struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
+			const struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
 				snd_soc_rtd_to_codec(be, 0), stream);
 
 			soc_pcm_hw_update_chan(hw, codec_stream);
@@ -1835,7 +1835,7 @@ static void dpcm_runtime_setup_be_rate(struct snd_pcm_substream *substream)
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_pcm_stream *pcm;
+		const struct snd_soc_pcm_stream *pcm;
 		struct snd_soc_dai *dai;
 		int i;
 

-- 
2.43.0

