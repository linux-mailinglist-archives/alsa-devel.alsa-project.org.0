Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B48B7845
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:06:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86200B71;
	Tue, 30 Apr 2024 16:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86200B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714486016;
	bh=74+WER8rBVNChp8T011lJzusbjvdwfTeUc05vWQCtnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KV5i1r6cW0hQx/+5VbUxVM9MYzdmJ/ihY3EdU8hgNFtO+CeRn3VDsXSmkaGPXBcNV
	 2g8RR2jmhpebdRu4tKF9iJZJ89MjCTo29DgcYvFmCBnSq8SdzvhaPG2Co73a10xHzB
	 vGctY48FVPiNzI8Qxh3jRjRtnGUgm+f+o1c3/BJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BAEAF805E2; Tue, 30 Apr 2024 16:04:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C7FF805F4;
	Tue, 30 Apr 2024 16:04:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 406A3F805C0; Tue, 30 Apr 2024 16:03:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60BAAF806AF
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60BAAF806AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NQgIcZYP
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2db2f6cb312so89783571fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485794; x=1715090594;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlReh/uKfKGykX7vYGkVx56/1oeqm3j6UBVK+Qmhu9k=;
        b=NQgIcZYPU6r0ZiL8ymUzukWMdmRdzHy/nDnKlzsrZZGsxu3kclU0lS0IFeRo4xJEm2
         EDa8fl3BD74aGgBx2HxJP+vUbTL82tT6JdvtSFYe+UgpiC/9kNialHRQ11RmscTC+xYW
         id8pjCVkOmWVB0u50ErU5K5ohLdyR14lWRCC6ktMr6zi5M16pIfHagK/SVYh+Gbn2exx
         RM6ygFeHA+TYqllxVcsBwt8qnwtbT1jvxUD4DHG3sBcRK7So43efu2IUNrKOT1CwT1uU
         gk22rh/n1sYJgGXpVzORz6ic0mAzmbSe77pO6+FmUV1Ic3RqVDRVUMpvT9p+Y/l3/roF
         q7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485794; x=1715090594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlReh/uKfKGykX7vYGkVx56/1oeqm3j6UBVK+Qmhu9k=;
        b=kwmmdrjzkRZGpMcw36bPMQlPU8xKjQIjZyIQs9UyDgpTj4tJTvnJqoXw7VTNA04+ef
         GnfzE/2x3xVyndhpgftQ+3pV60KuergFmeF6taApkSDvaMmLguZL+B6CcIrPBCNm25UH
         o+NPvyW+pHsbb8qRkO+HRwM9qKmH7KCtHs8AKl8p0r0O+kqzunnAMuH5CD95wqNYhtkM
         FH7okaj90odxWR/bM+cxGybb7wAIg3Lr4Dl0Y4LSkWyUxkxYA8iVBLWSoAyzDkPoFhYX
         YIqniwczj9yoXOVcovAEqJr1Rd0h7w0rTAGSpkXPAqLGzlZ8JPPQxEaPmAdp1u9NZqbc
         a5rA==
X-Gm-Message-State: AOJu0YyNdwxUXyDbT7pkS/ftiF8zy1FiyrMD6EO+EO0IjZB+YiVPNTCl
	9qn7byFZDH4X0BAu2W1yijhg8TM2uyrBdy/OhAWMgMbMbccwHmUy4Zg4BJam9ew=
X-Google-Smtp-Source: 
 AGHT+IEjPyu9X1615THrmlgihVBnJj6snuJyIqe3VYMH9bOXPEPLADlqYnOlMYNNwswyFzCxSlW3hA==
X-Received: by 2002:a2e:9145:0:b0:2df:b2d5:5935 with SMTP id
 q5-20020a2e9145000000b002dfb2d55935mr8668895ljg.28.1714485792538;
        Tue, 30 Apr 2024 07:03:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:19 +0200
Subject: [PATCH 10/13] ASoC: mediatek: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-10-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=74+WER8rBVNChp8T011lJzusbjvdwfTeUc05vWQCtnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2wIAKWRRmb3f+Eu7E/sNsicAIeRJntuzxZ
 SxYr98J11CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 1yOiD/9+no2oO2meu/Ufx9CEy3qSO7oTggEWW3FaqAqFcceuY3ZcL6EMZ2biHC/QRNK4ebDskKU
 3O2P3faEC8XJpoITbkbDIiqXeyFCKlF8xXpOUoqJU2b/1DL8tjHLJ65Dg+xoktZHD2NWmNoQiRg
 eIA9zZjygsEGOywLbr00ulna67FOpbcwyo0pYJ3dQYy1TyOTBy9jFGsl8RxPBCcZfhE2P3xy9Op
 3YJQdjnLIEm0nGjkPUwV/mbyv1dB9guABGSShJm5gvvH+W+/cqmtzgzKa5lD3MLc//md1a3Ju+V
 GYH6YWtUfX7QSYdrf2odSjymVm9iBei+GgTtQW9SfPeVHHo17PilaDoe5GVaygZohC2HM2K33n1
 Po5GQ+qHU9/lDaSYbLMh26vyEayDUXnoxPUHaOgSiNZamo6XG6T07CTTJnF0XA0JoNRQd5eyWJs
 BHmwevPcP6/bP/iV9hjNJnOo7ORDuwBCFPhQlH2IgPI/WGR/3ux6Ozr54ngy6kgQ1l8FYVYJ5zm
 lkr1t63qAutgNeS0JPV+5JJfLfhPY0jPjSPT2oOa93zLB79CYb2OCU4CZNxFUoUZ1ICYyxfXdkz
 vSpyKtJNvE/u0Mzrwu0nPoMZhU+mWKpd1utzIbZX8OCoJLTfC5V20Hpv2quS3imeWDvF5BCURTw
 YI43f977A5OcnvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: CWMQCV36UJK4O4V2VOURGUX2RBZAXX7Q
X-Message-ID-Hash: CWMQCV36UJK4O4V2VOURGUX2RBZAXX7Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWMQCV36UJK4O4V2VOURGUX2RBZAXX7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 14 +++++++-------
 sound/soc/mediatek/mt8186/mt8186-mt6366.c  |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  8 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c  |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  |  4 ++--
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index c1c486e275b9..572ded279b53 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -106,7 +106,7 @@ static const struct snd_pcm_hardware mt7986_afe_hardware = {
 static int mt7986_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
@@ -116,7 +116,7 @@ static int mt7986_memif_fs(struct snd_pcm_substream *substream,
 static int mt7986_irq_fs(struct snd_pcm_substream *substream,
 			 unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index bfcfc68ac64d..bafbef96a42d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -40,7 +40,7 @@ static const struct snd_pcm_hardware mt8186_afe_hardware = {
 static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -82,7 +82,7 @@ static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 static void mt8186_fe_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -104,7 +104,7 @@ static int mt8186_fe_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	unsigned int channels = params_channels(params);
@@ -153,7 +153,7 @@ static int mt8186_fe_hw_free(struct snd_pcm_substream *substream,
 static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
@@ -252,7 +252,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 static int mt8186_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -269,7 +269,7 @@ static int mt8186_get_dai_fs(struct mtk_base_afe *afe,
 
 static int mt8186_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -290,7 +290,7 @@ static int mt8186_get_memif_pbuf_size(struct snd_pcm_substream *substream)
 static int mt8186_fe_prepare(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 8fd31c52b077..771d53611c2a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -297,7 +297,7 @@ static const struct snd_soc_ops mt8186_da7219_i2s_ops = {
 static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 9647fe133dc8..ccb6c1f3adc7 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -91,7 +91,7 @@ int mt8188_afe_fs_timing(unsigned int rate)
 static int mt8188_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = NULL;
 	struct mtk_base_afe *afe = NULL;
 	struct mt8188_afe_private *afe_priv = NULL;
@@ -300,7 +300,7 @@ static int mt8188_afe_enable_cm(struct mtk_base_afe *afe,
 static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -334,7 +334,7 @@ static int mt8188_afe_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
@@ -358,7 +358,7 @@ static int mt8188_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f629fc6bbb53..eba6f4c445ff 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -557,7 +557,7 @@ enum {
 static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -658,7 +658,7 @@ static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int bit_width = params_width(params);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
@@ -821,7 +821,7 @@ static const struct snd_soc_ops mt8188_nau8825_ops = {
 static int mt8188_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 64af9bf363fd..38891d1bd18a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -84,7 +84,7 @@ int mt8195_afe_fs_timing(unsigned int rate)
 static int mt8195_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 			snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -281,7 +281,7 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai,
 				    int enable)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -310,7 +310,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai,
 				   int enable)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -342,7 +342,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -380,7 +380,7 @@ static int mt8195_afe_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 62e4e34cffbb..ca8751190520 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -338,7 +338,7 @@ static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
 static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
@@ -394,7 +394,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);

-- 
2.43.0

