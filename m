Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B190AEA5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9EC847;
	Mon, 17 Jun 2024 15:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9EC847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629519;
	bh=VX3jXIVo7OD/d5slhyQ2JOKwHTUTWscqWdeqAmuzMjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQpqGwrgoQPnOyYzoKeoizT9surcIYhnnaY8YodeSokxI96DOVQzxqgg+8hYNvvJ9
	 GbQeOHBfebiuFi/ZI7dR/VHkMhJUjeRDrIxQCR69vhSoYosuRkLqeGC0/7L3/Co6sk
	 jDFH0HZ3k763AzMspPmoRpI0uzSMU3In7qJ5bbGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93207F805D3; Mon, 17 Jun 2024 15:04:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61074F805C8;
	Mon, 17 Jun 2024 15:04:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C280CF80578; Mon, 17 Jun 2024 15:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08F0CF80269
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08F0CF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TGjt4F2H
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so3391884a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629418; x=1719234218;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwNKttZIaknYU/p94hFjfo07QErQbfojBQEzYo9fbrg=;
        b=TGjt4F2Ho+SlIHaP99h3jPjTg4bjiu8nHqsBsBTOLtb0BsidyMZMYZX/vA9hQ17iIR
         aGOFjcVIne3+RR3jaLh2+5DXVeaG8DwtTvDn12JunpLqxP+4vDjLZJOv/VSTE7Ftr18X
         r5dPmdCENyd4m5f5qTcaE72Xy32yG0Fkb6nXiQhfp5Y41jh37y0cE/bUAaee9BtWzw3y
         1s0sdtDdmuKjf/a1g76NdSWQCokxjst8s+pZ9F5e2pG1zoXHpWMp9OFRiZB4X+J1PVU3
         73caW1sOQKwI++cCPLUv/MsETVPc2SXGbn7NucS/rs3g+Kz4Z5sKkWzxQQVR0DARvn3e
         FkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629418; x=1719234218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwNKttZIaknYU/p94hFjfo07QErQbfojBQEzYo9fbrg=;
        b=CiEdx/+wE7vi7qwZk7oIpGBbVUJlYlOMkt5PUtVjmzm9Mia4/IveJaXUJWyeoDtszc
         kZPHBNrjRn3c4fArZpBnfh9GyLZVHB26XB9wRPNwWpTSrJ3bhdNMB49GNEk1Lz73j9MW
         F5OlpAWSJp0vDxN6j1YUtrEkVf2vZfkH12BBOTJ4MMoXjtaxx56BV7Y+la7zvBaAaAQr
         G+fFW2IegiNHRJEeq7rWklR0iEcWC0bxfo6xVE7vEr3ACvljHg8IbF4+RnaQ6BdvnWnK
         9IjcE9nLQVGgf+ug7kV8f9TFJwz/7LTJHT1W5fXZNYzuZ2MWOdE0E58q0OpgydYeVXY7
         fGTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlAQ9Xdsvg4XtQtoscRUyzL5eVksagBOtKDuKnKc9u9zGXh0Cq9h26c7IlzC43ztoiP5gPAWKUvKqEwEcax48j9XYEpbDBySYIV1o=
X-Gm-Message-State: AOJu0YyTJnE7M7jcm+zpjE4XPuBa7IPRE9RDcLwpjT8/eCTKC5kCg4By
	KlBDlwxXR3rB1EN+9Gfj1yGk/aOOCNfqan2/KS98Y9A7uCXNQOfrNXHbvlggTHQ=
X-Google-Smtp-Source: 
 AGHT+IGgIBqh4uX9KfwxMcqwBDu9/iljNkN52lahHkwBIMERJ+qxU+nzE6Q+fwxKPK6bcXLvEdngQw==
X-Received: by 2002:a05:6402:520d:b0:57c:c166:ba6 with SMTP id
 4fb4d7f45d1cf-57cc1660fc5mr8196252a12.19.1718629417877;
        Mon, 17 Jun 2024 06:03:37 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:21 +0200
Subject: [PATCH 3/6] ASoC: Constify passed data to core function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-3-8004f346ee38@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10634;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VX3jXIVo7OD/d5slhyQ2JOKwHTUTWscqWdeqAmuzMjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQgQXTMvfUT6nWM0gX6VPGbU5CLT5yZyfavk
 4fmzmaMEliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IAAKCRDBN2bmhouD
 18PsD/9tVUjfZHP3IfXinCHf2bRIh89VoXu9w0uu7NTZ8tbgj5oZZCsUT6Wt4qA1ldHiAqDp/67
 w4T8cnfgDK93AqWEwXmYjH/7JpvT9CQJXMGBvlcdp76fozDvCTlr9EN09YvUpJKXbqRk3CXAMni
 lyT7i8Qa+pPyLtEBQi9wLuoybRHWO+65WG8BtUalzqvZnynl5EW9Qa6LpkcRFwWabCnIaCcKaw7
 KbgPnXYuFlFIeR2U92Qq+B0xsoWi2sudv5S4YhZlui2LDVQ4eyFb3CZLvnSrXlyRUG4HfLbe0FZ
 SIPHoQmcjs3D/o2XmscYqh4SZGWjNCArktO+iEtAak0ACEwGTUczkyh+pafDnxExhdrYSLoEY1W
 uhQ8YsYujHplkcZKifqm2tTaWaFAKo+KAzGHEJbrgkB44iv7a5WCGR7FQFD+TNr9CO2LWuaajTr
 Tw87FYfyitME6BkAwLlTkEPEXl3D51tlht4zwyrP0A8+JNvJ2SdX2YVDV/Sn4m59Jg5ftB4yVgE
 oczn0b4AkKft9vRi/DRALGxyKam7tP+hWE+yWgCzIEI7gt56YiZsSD7kcvONaGv/I6UzgSgD0V5
 FE1hBpcsSjDyPV9RDSL13gPXiI/coFR9Y0qVJXutxooSSpbp5VR0WIy0g6xAeqLKHRZB+mqZA+A
 MXEAVzUUjPNbjPQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: A4UM2CUAR5YOU4VRKXA5QKI7AZBXXJJL
X-Message-ID-Hash: A4UM2CUAR5YOU4VRKXA5QKI7AZBXXJJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4UM2CUAR5YOU4VRKXA5QKI7AZBXXJJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several ASoC functions receive pointers to data which is not modified,
e.g. pointers to 'snd_soc_dai', 'snd_soc_pcm_runtime',
'snd_pcm_hw_params' and 'snd_soc_dai_link'.

All these pointers can be made as a pointer to const.  This makes code
safer, serves as clear annotation of function's intentions (no ownership
passed to the function, no modifications) and allows putting pointed
structures in rodata (if ever applicable).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc-dai.h | 18 ++++++++++--------
 include/sound/soc.h     | 17 +++++++++--------
 sound/soc/soc-core.c    |  4 ++--
 sound/soc/soc-dai.c     |  8 ++++----
 sound/soc/soc-utils.c   |  8 ++++----
 5 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 8b2ae7b71965..dccda9f1b160 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -180,8 +180,8 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
 /* Digital Audio interface formatting */
-int snd_soc_dai_get_fmt_max_priority(struct snd_soc_pcm_runtime *rtd);
-u64 snd_soc_dai_get_fmt(struct snd_soc_dai *dai, int priority);
+int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
+u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
 int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
@@ -202,7 +202,7 @@ int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
 		unsigned int *tx_num, unsigned int *tx_slot,
 		unsigned int *rx_num, unsigned int *rx_slot);
 
-int snd_soc_dai_is_dummy(struct snd_soc_dai *dai);
+int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai);
 
 int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream,
@@ -218,7 +218,7 @@ void snd_soc_dai_suspend(struct snd_soc_dai *dai);
 void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
-bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
+bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
 void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
@@ -232,7 +232,7 @@ static inline void snd_soc_dai_deactivate(struct snd_soc_dai *dai,
 {
 	snd_soc_dai_action(dai, stream, -1);
 }
-int snd_soc_dai_active(struct snd_soc_dai *dai);
+int snd_soc_dai_active(const struct snd_soc_dai *dai);
 
 int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order);
 int snd_soc_pcm_dai_remove(struct snd_soc_pcm_runtime *rtd, int order);
@@ -271,7 +271,7 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
 
-const char *snd_soc_dai_name_get(struct snd_soc_dai *dai);
+const char *snd_soc_dai_name_get(const struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
 	/* DAI driver callbacks */
@@ -518,7 +518,8 @@ static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *play
 	snd_soc_dai_dma_data_set_capture(dai,  capture);
 }
 
-static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
+static inline unsigned int snd_soc_dai_tdm_mask_get(const struct snd_soc_dai *dai,
+						    int stream)
 {
 	return dai->stream[stream].tdm_mask;
 }
@@ -529,7 +530,8 @@ static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
 	dai->stream[stream].tdm_mask = tdm_mask;
 }
 
-static inline unsigned int snd_soc_dai_stream_active(struct snd_soc_dai *dai, int stream)
+static inline unsigned int snd_soc_dai_stream_active(const struct snd_soc_dai *dai,
+						     int stream)
 {
 	/* see snd_soc_dai_action() for setup */
 	return dai->stream[stream].active;
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f02a51694ab4..a8e66bbf932b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -534,10 +534,10 @@ static inline int snd_soc_set_dmi_name(struct snd_soc_card *card,
 
 /* Utility functions to get clock rates from various things */
 int snd_soc_calc_frame_size(int sample_size, int channels, int tdm_slots);
-int snd_soc_params_to_frame_size(struct snd_pcm_hw_params *params);
+int snd_soc_params_to_frame_size(const struct snd_pcm_hw_params *params);
 int snd_soc_calc_bclk(int fs, int sample_size, int channels, int tdm_slots);
-int snd_soc_params_to_bclk(struct snd_pcm_hw_params *parms);
-int snd_soc_tdm_params_to_bclk(struct snd_pcm_hw_params *params,
+int snd_soc_params_to_bclk(const struct snd_pcm_hw_params *parms);
+int snd_soc_tdm_params_to_bclk(const struct snd_pcm_hw_params *params,
 			       int tdm_width, int tdm_slots, int slot_multiple);
 
 /* set runtime hw params */
@@ -837,7 +837,8 @@ struct snd_soc_dai_link {
 #endif
 };
 
-static inline int snd_soc_link_num_ch_map(struct snd_soc_dai_link *link) {
+static inline int snd_soc_link_num_ch_map(const struct snd_soc_dai_link *link)
+{
 	return max(link->num_cpus, link->num_codecs);
 }
 
@@ -1299,7 +1300,7 @@ struct soc_enum {
 #endif
 };
 
-static inline bool snd_soc_volsw_is_stereo(struct soc_mixer_control *mc)
+static inline bool snd_soc_volsw_is_stereo(const struct soc_mixer_control *mc)
 {
 	if (mc->reg == mc->rreg && mc->shift == mc->rshift)
 		return false;
@@ -1311,7 +1312,7 @@ static inline bool snd_soc_volsw_is_stereo(struct soc_mixer_control *mc)
 	return true;
 }
 
-static inline unsigned int snd_soc_enum_val_to_item(struct soc_enum *e,
+static inline unsigned int snd_soc_enum_val_to_item(const struct soc_enum *e,
 	unsigned int val)
 {
 	unsigned int i;
@@ -1326,7 +1327,7 @@ static inline unsigned int snd_soc_enum_val_to_item(struct soc_enum *e,
 	return 0;
 }
 
-static inline unsigned int snd_soc_enum_item_to_val(struct soc_enum *e,
+static inline unsigned int snd_soc_enum_item_to_val(const struct soc_enum *e,
 	unsigned int item)
 {
 	if (!e->values)
@@ -1401,7 +1402,7 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	snd_soc_daifmt_clock_provider_from_bitmap(			\
 		snd_soc_daifmt_parse_clock_provider_as_bitmap(np, prefix))
 
-int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream);
+int snd_soc_get_stream_cpu(const struct snd_soc_dai_link *dai_link, int stream);
 int snd_soc_get_dlc(const struct of_phandle_args *args,
 		    struct snd_soc_dai_link_component *dlc);
 int snd_soc_of_get_dlc(struct device_node *of_node,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3ab6626ad680..724fe1f033b5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -297,7 +297,7 @@ static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
 	return 0;
 }
 
-const char *snd_soc_dai_name_get(struct snd_soc_dai *dai)
+const char *snd_soc_dai_name_get(const struct snd_soc_dai *dai)
 {
 	/* see snd_soc_is_matching_dai() */
 	if (dai->driver->name)
@@ -3430,7 +3430,7 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(snd_soc_daifmt_parse_clock_provider_raw);
 
-int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream)
+int snd_soc_get_stream_cpu(const struct snd_soc_dai_link *dai_link, int stream)
 {
 	/*
 	 * [Normal]
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 03afd5efb24c..55d1a5a099df 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -134,7 +134,7 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
 
-int snd_soc_dai_get_fmt_max_priority(struct snd_soc_pcm_runtime *rtd)
+int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai;
 	int i, max = 0;
@@ -166,7 +166,7 @@ int snd_soc_dai_get_fmt_max_priority(struct snd_soc_pcm_runtime *rtd)
  * modes.  This will mean that sometimes fewer formats
  * are reported here than are supported by set_fmt().
  */
-u64 snd_soc_dai_get_fmt(struct snd_soc_dai *dai, int priority)
+u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority)
 {
 	const struct snd_soc_dai_ops *ops = dai->driver->ops;
 	u64 fmt = 0;
@@ -471,7 +471,7 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
  *
  * Returns true if the DAI supports the indicated stream type.
  */
-bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
+bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 {
 	struct snd_soc_pcm_stream *stream = snd_soc_dai_get_pcm_stream(dai, dir);
 
@@ -528,7 +528,7 @@ void snd_soc_dai_action(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_action);
 
-int snd_soc_dai_active(struct snd_soc_dai *dai)
+int snd_soc_dai_active(const struct snd_soc_dai *dai)
 {
 	int stream, active;
 
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 20135a8359bf..11ba89c6b83c 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -21,7 +21,7 @@ int snd_soc_calc_frame_size(int sample_size, int channels, int tdm_slots)
 }
 EXPORT_SYMBOL_GPL(snd_soc_calc_frame_size);
 
-int snd_soc_params_to_frame_size(struct snd_pcm_hw_params *params)
+int snd_soc_params_to_frame_size(const struct snd_pcm_hw_params *params)
 {
 	int sample_size;
 
@@ -40,7 +40,7 @@ int snd_soc_calc_bclk(int fs, int sample_size, int channels, int tdm_slots)
 }
 EXPORT_SYMBOL_GPL(snd_soc_calc_bclk);
 
-int snd_soc_params_to_bclk(struct snd_pcm_hw_params *params)
+int snd_soc_params_to_bclk(const struct snd_pcm_hw_params *params)
 {
 	int ret;
 
@@ -79,7 +79,7 @@ EXPORT_SYMBOL_GPL(snd_soc_params_to_bclk);
  * Return: bclk frequency in Hz, else a negative error code if params format
  *	   is invalid.
  */
-int snd_soc_tdm_params_to_bclk(struct snd_pcm_hw_params *params,
+int snd_soc_tdm_params_to_bclk(const struct snd_pcm_hw_params *params,
 			       int tdm_width, int tdm_slots, int slot_multiple)
 {
 	if (!tdm_slots)
@@ -211,7 +211,7 @@ static struct snd_soc_dai_driver dummy_dai = {
 	.ops = &dummy_dai_ops,
 };
 
-int snd_soc_dai_is_dummy(struct snd_soc_dai *dai)
+int snd_soc_dai_is_dummy(const struct snd_soc_dai *dai)
 {
 	if (dai->driver == &dummy_dai)
 		return 1;

-- 
2.43.0

