Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB6A8B5741
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 13:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB537825;
	Mon, 29 Apr 2024 13:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB537825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714391947;
	bh=siprCfRQtWpQCCCk/EgBvG4/nMgpZ/i2CNSROadlb+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SGCZpErroH0A2y7+YTkHTgtXvy+dJUJnHGOsJslCLmM6lLn5qssGcRu6zQUx0Zo0w
	 M5MzlU8cn0s8KcuxrMqr8zc0aUQMp4JjfHHusYChvxX7gyuF7LV4bA1/1B1uteUDVD
	 mEAJ+Yl/0gYSIshdMKAjo3Xh/9HqyUbal/XxYVoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 298FCF805F3; Mon, 29 Apr 2024 13:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CEC7F805F3;
	Mon, 29 Apr 2024 13:58:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27EAF804CC; Mon, 29 Apr 2024 13:51:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 275E3F8028D
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 13:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275E3F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JauKFeNP
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso6525833a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391348; x=1714996148;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFY2BJrqfoEw33ApHVjLKezetKZA4dvDEs7pqAJegiw=;
        b=JauKFeNPvzoytAZuXGOFzGWeGxUP91j+UUFcZD2OZDrBEu6ekaG77YiZJ0sCaa1Wvz
         evTH6vU/YgS3ZB5Yc1rD6ZInex/4KHi+VEJDjJ0exJbTvLXx9NvvfErSXW4/8lqVJsDP
         ZlxtpmGlcnnijN+2ckeeYSb1tc6fWivuPI+rT9ppESx4PWWhN3vDhHEc6xyqXoc/zm6x
         KtfwBudZDJmnBHhohuWH5GATVZqjEvi8L2vqTR1a39YaukyJGuf+xCTfDJ7V9TrMSPS6
         P0quHVQXlP6BtyrGBhEcZitqd2KCkFP+0KlUIPnKhZdub+kfyneOGSOpddbVmpDXbzIk
         bl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391348; x=1714996148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFY2BJrqfoEw33ApHVjLKezetKZA4dvDEs7pqAJegiw=;
        b=SCjoe1JsMETUOnmEZuOrKJLc7itha+LDtyOM8ihWN1U4Ypd+wl7T8caKMWyBDLxR40
         UrJlb8ehDK/A9X88/Ud/OJ1FngeArPuphl2m9a6oIHMoCNMZIbW/q+gac+XIyClQGEng
         Qri/o9tggXG+agZ0yh1YvTJTDAmCYzRbHBhjYRuj8ho2ZK1LQDeZ9U+3zT3FvJqnngLp
         kXbF2nY9AEpPww9WFf1GrTPe5vsVopK68m1OO7qSCv9VKg3yMi1RS2t/vhTZ8j+Nk/7T
         Z0dX9+xsl4ryXz2x9paBtGOqr0IZXuIl6zPNDD2Kga+9d4Phu9xdF8wE7iAtqf6wtmxE
         fLfg==
X-Gm-Message-State: AOJu0YzohRZYy/B7HmH+WRxrm8ka9ZnlsCjLYGA6XgG+N1hI71JRmLXk
	NF84nq6f+e6eICM5vIYZlOwQSxb7IvIHuG+ogbZ7sAf/VNjQm88pvhTi5bkxmRw=
X-Google-Smtp-Source: 
 AGHT+IHr1i+P/yQq8bNC4hXAKz0hI9Zk8EupFlwsHF2uyxSdfVH1X92jPdRxN/6FjGHLuxgVDiSE9g==
X-Received: by 2002:a05:6402:1a4d:b0:572:8aab:4420 with SMTP id
 bf13-20020a0564021a4d00b005728aab4420mr504841edb.39.1714391348231;
        Mon, 29 Apr 2024 04:49:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:48 +0200
Subject: [PATCH 3/4] ASoC: meson: Constify static snd_pcm_hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-3-c6ce60989834@linaro.org>
References: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
In-Reply-To: 
 <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=siprCfRQtWpQCCCk/EgBvG4/nMgpZ/i2CNSROadlb+k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4klip7kMQMnb9G4Un51jC6C4Sy6sBF7+x0fz
 ZtOzlrSQNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJQAKCRDBN2bmhouD
 1zwfD/oCx8UsThy03fZQjvfzPPcHgd0sRjY0kzWjofPTFWoZrVbUl44+srODgATNkHSmXju076H
 /8V0+7FBomIBsrL/34jm+W7Ws2vae7j5TdY5WuquXO2P6hR5pry/+g8stMlQ0a09eWKWwOTUvuP
 09V4EzktH6rje90J1+lyxp9U0H0ROUA7LVYvj/uipaB/xhKtMk8CIuMIhpmkwPBBLfK11iXpjLk
 E2RvbOBGvGQd81MNYefDVd9DRbqfqcuLEmqjm/9yx7fLKq/A0AmAYbBQr66grnffuPOmoQD0Brz
 448EDhEzJcawBxb1rCp46MqUN8IYEMZMLsXXCkcpJIdJzUYeQunzaZp0Neu+haV/pZc02pOr3qN
 uEzMnAOOP0ZVoPyPOvWaJ19G/tlxIvOmLxPuG9WktTK3F5n5Kn0GaxpWvLth5zXWj+OITLwkfZo
 Ki3HsUbdVtdhPM3Vx4gW6BHI5l3UzxqQK3slZQnatydFdONKuXuKKIa0uNvspzVB+Jes2wZoKE8
 Bg05N8617xn/CcWWHYg/Rheq+bxja9iY5ZXhfmpUAQLsyebOXkfmxY8DB891GxnCFDOuuUtipbA
 xZDgKdZ6MAMWj2eZYZCzPwcML4hWxnH6sG4b8Ep0QD2u46DE4BM/yuRcaanbojeZz3UktdT8/ou
 SUnWJYvw0bJJVAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QMLXU75DP2AA75IEI3SDTRKIAISTSUGH
X-Message-ID-Hash: QMLXU75DP2AA75IEI3SDTRKIAISTSUGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMLXU75DP2AA75IEI3SDTRKIAISTSUGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/meson/aiu-fifo-i2s.c   | 2 +-
 sound/soc/meson/aiu-fifo-spdif.c | 2 +-
 sound/soc/meson/aiu-fifo.h       | 2 +-
 sound/soc/meson/axg-fifo.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 7d833500c799..eccbc16b293a 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -25,7 +25,7 @@
 
 #define AIU_FIFO_I2S_BLOCK		256
 
-static struct snd_pcm_hardware fifo_i2s_pcm = {
+static const struct snd_pcm_hardware fifo_i2s_pcm = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index fa91f3c53fa4..e0e00ec026dc 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -27,7 +27,7 @@
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
-static struct snd_pcm_hardware fifo_spdif_pcm = {
+static const struct snd_pcm_hardware fifo_spdif_pcm = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
index 42ce266677cc..84ab4577815a 100644
--- a/sound/soc/meson/aiu-fifo.h
+++ b/sound/soc/meson/aiu-fifo.h
@@ -18,7 +18,7 @@ struct snd_pcm_hw_params;
 struct platform_device;
 
 struct aiu_fifo {
-	struct snd_pcm_hardware *pcm;
+	const struct snd_pcm_hardware *pcm;
 	unsigned int mem_offset;
 	unsigned int fifo_block;
 	struct clk *pclk;
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..633fd971b444 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -23,7 +23,7 @@
  * These differences are handled in the respective DAI drivers
  */
 
-static struct snd_pcm_hardware axg_fifo_hw = {
+static const struct snd_pcm_hardware axg_fifo_hw = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0

