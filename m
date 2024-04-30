Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 358948B7819
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F64E0F;
	Tue, 30 Apr 2024 16:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F64E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485862;
	bh=NWayqZgMTQyhrridkNgCIJtQs25nYri5VnM17XYp3Mo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XD7kNMITq+wvtjCFK5hZJ6aWGVpUSpfvmZf0D5I/GxivQgIvv8lSGB4ed5FnrShZ5
	 Km8uSjG+uJZWeVIP+gA9UzpCBajbycrAZEldUHGI9bs+maavxd8EFhQDo5jTcHfvui
	 sO4J0HTKI29N2/q9EnMacvjl38rX80ipaWYUSIg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDD5BF8061E; Tue, 30 Apr 2024 16:03:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC4A9F80610;
	Tue, 30 Apr 2024 16:03:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15D53F8060A; Tue, 30 Apr 2024 16:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE420F8003A
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE420F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RMrwrnf2
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso758681266b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485762; x=1715090562;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=;
        b=RMrwrnf2eu/NC1eQgcOYhNvZQZ8KH4ubBPEw6uvP8FymKxBcgrrQbFMHYNP9i+opoa
         MIytzjFVmO8HpBzQCm6+QN2YXXS86l0W2l4sq15Mvz2bu2eM2IbANFOc5Nt31hp+JKoA
         sN6tn25kkSf3OtM+WCIZjiI6u2sBtxCyZ+8DHNYHwXXh4QvMGqhSqr2v9cQd6gmh7xLb
         4PpiuwCLTZEVBWP23li5KTEUGye2+3t4J51H6vWgezbDR+TWkgFrOWg4br1YZgisM8gw
         AX3HjkRXv+mObke+XFvpX+SlmuEvmNdKFOhYvg/QN3dT0FRuPBPwc4WchZmX8rrZRjb6
         +gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485762; x=1715090562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=;
        b=jwsYCOMruSj3R9Yt+Oh7UfVRknPfU0Anw9uf4Y/NxE1NCILOVmWDy5YI11eeWjU4C/
         iaXEdg/JghV7Hluj55MTfAVFIXJsoi6hkAAkiYLdBv/nik3N3UAbeN/Djndp0cHwPcIG
         0FSjsW6k48rG2a9su3uUyUz19U7UE2NropNxxVMWb4aIOZgiAQMElH6tr6+FFiq77vcd
         Cqj73Lb8i+0AgFeO1QTXuCM/PKuKh/MyjsOnRjN9wdL7Y6UZhJKNKaTjQk2/i9uqY4+p
         LabMW60yQrbk+ZvACYzLOY2rzNt7dDhqdBu2f9TN46ezorJreE+fzBuLCqkLhXCCW9Jv
         BKVA==
X-Gm-Message-State: AOJu0YyDUDYfWFKnwjT+wARpcdPCXtuSY3KNjK8OPgfZJ5WQPLqSpGU9
	N0dQEx5E/polFRXmEH880NpbH88dRAcg7ZJ3ieDIj8Fd1+9W3niahD35tW5n+0o=
X-Google-Smtp-Source: 
 AGHT+IHiryIlMBuC9NM2KOjVX/FiEZN10FwJJA8ZsqNvWyktK2eDEXsG0W+ylaSuA6HZE7/EUxYrVw==
X-Received: by 2002:a17:906:5851:b0:a52:54d8:6d21 with SMTP id
 h17-20020a170906585100b00a5254d86d21mr10321769ejs.7.1714485761837;
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:11 +0200
Subject: [PATCH 02/13] ASoC: tegra: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-2-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NWayqZgMTQyhrridkNgCIJtQs25nYri5VnM17XYp3Mo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnuu9RjFk0ZahGK7moh34+XMb8y5IAinmHhw
 3VHDPhugCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57gAKCRDBN2bmhouD
 1zWOD/4+tyzs1xgp6ykzyyJogYehC2MKqc9o7BAwaYhBihjzf+kvS/a49wjR8gzDJ7Vh3y3/hwL
 aLdHFckj8wwv4l0ss9+e4sAMLoHDo7uUPKc+rfA+yOS8XjuXoRm8FI6LehOSZcU8NK5w+LQWJ3U
 ceuoYZ1qz1qlNuzBLWh3xpsoRbk5sjR2sakihrnAleKyfoasgq6+XdUIQ0VJqWO3MEUcYPC/eXU
 h0snq64j4az27aiyUMbwLNSs6H3gn3+qoBo7CHTzJnJ0JDyk11jeRzxeQyznlPWuSUIqCMkCeft
 uT+ECq9fYZbdwFZIupds9jdP/39elefh2kxAnzlm5ROlK2Z/TDTgDQeaEvraSuji6ucd/CTWMOv
 VkU3vwo2GtZi3mVhPPnkMo6Nz5ObAvyQbuIY180agGlUo1VC1+m9LeJ98LBIPAdLIkbp6biPcfM
 6AHQapXJgPIkZGgszpxcOMdIHIf7X4eaVUkr12gdIijUr7p/VilIGXBzL7mADqRC3+Pzk5Q590A
 8MyHOr4aKOGAWSWyPRn1clfTUJnmOg92ZBgTm7yfpzUeQRED96dVL+70aCGXXlCP1V+EwhgZecx
 m2VLP4rPyvCJT3suEVLW0aKsOrnHxRm5mvO2RcJ5U/k/EfE5uCaHFZFgyQE+iEqtAyQa0sQ1Vex
 ffzIPP9MiKJu/1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: KJSHXKO7KKVBATQT7W6PAWAYHNLDDOV6
X-Message-ID-Hash: KJSHXKO7KKVBATQT7W6PAWAYHNLDDOV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJSHXKO7KKVBATQT7W6PAWAYHNLDDOV6/>
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
 sound/soc/tegra/tegra_asoc_machine.c | 2 +-
 sound/soc/tegra/tegra_pcm.c          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 192e9692bdf2..775ce433fdbf 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -290,7 +290,7 @@ static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
 static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 42acb56543db..4bdbcd2635ef 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -76,7 +76,7 @@ EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
 int tegra_pcm_open(struct snd_soc_component *component,
 		   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_chan *chan;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -127,7 +127,7 @@ EXPORT_SYMBOL_GPL(tegra_pcm_open);
 int tegra_pcm_close(struct snd_soc_component *component,
 		    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rtd->dai_link->no_pcm)
 		return 0;
@@ -142,7 +142,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_slave_config slave_config;
 	struct dma_chan *chan;

-- 
2.43.0

