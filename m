Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A78B7825
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6015BEC7;
	Tue, 30 Apr 2024 16:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6015BEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485899;
	bh=ucjMMVrCkGueEU7NLLh2sAE4bDhfGS2t9ibvgfiZuqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t5Fd+478BggaK96eY/d/lTAx2qikzGXMgWaSFWyqpa0mWfRn72NHoPCyWyZvDEwpT
	 2oD8hnhHSjskdnTM0guKqVYvVaGsasGGlIkIJjatDaoqBEVwKtqQYjqVBCg2pXxsIl
	 J7htVK+tQazrq9ExpL3i+JGaty5Jf/d84Gld15lE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A165F8067C; Tue, 30 Apr 2024 16:03:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26F81F80656;
	Tue, 30 Apr 2024 16:03:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4DE7F8062D; Tue, 30 Apr 2024 16:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6237FF805D3
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6237FF805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SzvYUD+H
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2db2f6cb312so89778491fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485778; x=1715090578;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=;
        b=SzvYUD+HRqSCq8wM7HTK8KcsxztAq3ul3/eXxgqFa9IgMluvOJ+UPGNguhMi9kqbxh
         KbDtz7ZoRKzFbB0QiLUzenShczGa8RjPUvaA9TrvWmGrf46LaO2mGGKUiSrUvqhZIP9Q
         1g2PoT7KItxAenjUlhqfpoM2gpa+1bSN1rAnQ1RbCzcL88zMjVMGjZR0AEF9IGECPFWt
         M4yfG9ejEKa0r+fc4p8M46MWWao04P4k4PfHvY9hNxz7PysSkJgoYrEeiIoZ5vVdx/zX
         FjXjEtUkDtpDaRFx8uKBPfMaLRo0WF18QUZksUPRb8/yWZy/L6B5DBIxejOQ1l2CazZF
         VjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485778; x=1715090578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=;
        b=Ov12SMoGnpwJPow6HZq13yGL8uC6BlzFWPj7c4fyt5RxYzbQMHe5hUO6O5JZVhx+s+
         Jp+19l3QSKut/6+Qrm81EDElyA9qHsd1fPuYyUgi0rwLuJD4K41d9MQLka3cSpSL0aGj
         jMCvsasy26YSkkTE2QrbmS7MzGTwWqsbsxaSOiIk3D+SntugwD2UfIZr6SOfMFi8oZMc
         gnwNXY87VmCyWPFRXifqsAyf+M/siM0JlY2J6/8mVF9pgxKVD8rKpUnJoNUEtyquF3FZ
         eo8Ggejzzbj6SFoiMtRiqOoPdDDckx23IB5F7kfOGLyeFpixUbwiKQC6817hgi30AL7E
         qHww==
X-Gm-Message-State: AOJu0YwL6h4b67VwPChGog2uOChX32FW/m+WMWDQrwuMmVw5V9JWHl1H
	CVo5arKoI92Q1mgj0nmmUsV/0pqoQ2jDZgFB/Qg9MDXyHHwc7+VodohDTgThpj0=
X-Google-Smtp-Source: 
 AGHT+IFjpnpTp49C7eNXISEFR7RNPga2jXB5JGxKI22M+Sgkavx0dXEQC64nAv94ubWY9cbPtavVlQ==
X-Received: by 2002:a2e:9d88:0:b0:2dd:da86:ee38 with SMTP id
 c8-20020a2e9d88000000b002ddda86ee38mr10711122ljj.8.1714485777680;
        Tue, 30 Apr 2024 07:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:15 +0200
Subject: [PATCH 06/13] ASoC: fsl: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-6-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5066;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ucjMMVrCkGueEU7NLLh2sAE4bDhfGS2t9ibvgfiZuqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnyVTX4VSForeLiGua7AKa1bycRXXidVTl9D
 CaOooFdBBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58gAKCRDBN2bmhouD
 1x+nD/9L3QfdqNvflH7gpARtP03tnjdskVjY9BZshvK55BYu/8uL8qeQ8m7grVZgtdnFSp17jzg
 psAIaY2iZ3XjkhL1Wm9i2Bco6fY+REaa9ipQVksNn10h2zoFp4l3tKiNz9T6HIW+tr9LB4YJ0ez
 95oxVwwR3mmgoGnOTgoBhBquIQotbSGxNdua1owIxI4ynwBEDk9aSuLzFvyZaK+a5pQqlk8sFHE
 1Zk4N9BanSfRWtR7ZmuLxcDMQFw+f9cLlfnQjEF7qbDegbSaNYOR4VuwuAPVTQgmhL2FDZ9ZZBZ
 VS8nH1w1VupmUXyDCQM9+Ord+ux+JRHtepLks0LWYAmaEYSn0maBsInTR79T6/Z5BTnHY5o05cb
 17XjcuRdjm0E9YceHUg/H7Cu+qPpavOo45i3peulA/Kw8Bmz/UrCoPzgKCZECARmZhBwtFfXKFi
 BFBqwmlfaJ5mO+BUYtGOK0mi8QL8IJGpqneIw6WuwxG8gcximwl6XUtbhpG9dUMulPUId44Q4Lx
 6MRqlOL82xSEpJjTLh5Q1IVtCafvXHdADF0e5NcyPGZeB3xciZX49dPUqRv/agS7rPISpGBqP+3
 2uMcyxscGa3WWW9aQmkwpKw3L4QuI/OgOw5ddiu+DS7516wv6HU8Om/sxKJq6Fm9j1OTCD6HkT0
 JghFY64qvYvldfw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: YZHXVTNYOZDDITE5IEGDMA53F3SWOUCK
X-Message-ID-Hash: YZHXVTNYOZDDITE5IEGDMA53F3SWOUCK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZHXVTNYOZDDITE5IEGDMA53F3SWOUCK/>
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
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 sound/soc/fsl/imx-card.c      | 6 +++---
 sound/soc/fsl/imx-hdmi.c      | 2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6d2564864c6..5ddc0c2fe53f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -242,7 +242,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 
 static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct codec_priv *codec_priv = &priv->codec_priv;
 	struct device *dev = rtd->card->dev;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..0e18ccabe28c 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -252,7 +252,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params,
 					   int slots, int slot_width)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_card_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct imx_card_plat_data *plat_data = data->plat_data;
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
@@ -289,7 +289,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
@@ -405,7 +405,7 @@ static int ak5558_hw_rule_rate(struct snd_pcm_hw_params *p, struct snd_pcm_hw_ru
 static int imx_aif_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index e454085c6e5c..fe47b439a818 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -32,7 +32,7 @@ struct imx_hdmi_data {
 static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b84d1dfddba2..ba491cbb9930 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -316,7 +316,7 @@ static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 
@@ -461,7 +461,7 @@ static int imx_rpmsg_pcm_trigger(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	int ret = 0;
@@ -515,7 +515,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);

-- 
2.43.0

