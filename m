Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF238B7849
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDA70B71;
	Tue, 30 Apr 2024 16:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDA70B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714486035;
	bh=s6T6qKBmGyM2bmAZfxmnWfBAOCON5ixd+eIprC5zOI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q8FlEN8eHGVmPJHMgHNq2mHM7cUEDE5tm+Ia2PjZuYcf8BYu1A4bqs4mSUTqz12eL
	 K7+c8yCX7k0b0Cc6u40q4YtonRSdW2TUfIphARVDAZtERPqiEsiJXD50rtoVIiFHwD
	 /8xzjNbvqapRPNjPSdm3fYlN+xe6/Cq7I7N+6e0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02B48F805B4; Tue, 30 Apr 2024 16:06:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97822F805A0;
	Tue, 30 Apr 2024 16:06:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4135CF80730; Tue, 30 Apr 2024 16:03:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3D45F8025D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D45F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LolEYYU1
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51ae315bb20so7085198e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485800; x=1715090600;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=;
        b=LolEYYU1TjxHi4n9lq8ozqPoFMRN4/hFCak1B2fuBiqoHExOhd0EPNuiUVRXz6KsgI
         LM66Gn+BqOID80WgyDLIgyQKARg/LO1LYbGRVvqDf6gNb5P2kp/VuKLkq4x3jKuAcQhJ
         acOK/dBTXQPaj+Dw3OJogqdTCCc7d2AUHnLHehejt0uBzPQSgltVCTYZiz6l+f5ckwyc
         jpJY4XZ9smPTensirGk/46aGxfnZF0hsPitpGslsIxwuWHLj3D22E4i0hzfIuRpVaES+
         waiEL4azoaRZxD0rs1QI3Df+U2YQYyOWECJDsXueGZnvT+YTpg6bLLObmQJRWPIar/wp
         saSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485800; x=1715090600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=;
        b=OaeW6Ssm1WK+TOdY8THvPQSUPj1eJArBEV+t3N5fROadmLg+NAK74DdPtxNhifY9Rq
         C+viL6O/OPXJXEhlUhOeD00dGz2ZQH0ya6AqkrF36s44kGSsNJdX07Jx0os7WeAhIAQw
         kINWvvif7jVmkX4EQtLnDHEcAaydsPdyv6X0fHQvX1ymiYuFDwaTaPXLJUkgQ05Rl/cu
         joeSLj6XqrSablpv1reb+vtWxXMnRQtkQW7COyOyEfRt46BG/NaEwhOHVVFfGjPHTGxx
         ZosahjxTYak6U8jE4hrsb8REjmjtk5y3LNwT6awdakFIZfyaxG2JUwby9AYAtRjL0GWN
         2aXQ==
X-Gm-Message-State: AOJu0YxF5V/4ub0qwVMnqG3el0Artgh+sVQUwvbnxl2drmSPJHyYU7S6
	tLosdXusLpSvcFFlI7I/ybs/h+sEx5vZFFNO9i6StX4/lgcSyysOz3xN/qVG/fQ=
X-Google-Smtp-Source: 
 AGHT+IGh5m+2saezt4d4/Xj30jwjHn2HaB5/1wzlPXeDMAywvUMwy38mdPMQn/OqpOvF0tN4moRDWA==
X-Received: by 2002:ac2:4342:0:b0:516:d0c2:755 with SMTP id
 o2-20020ac24342000000b00516d0c20755mr1936131lfl.63.1714485799614;
        Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:21 +0200
Subject: [PATCH 12/13] ASoC: samsung: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-12-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=s6T6qKBmGyM2bmAZfxmnWfBAOCON5ixd+eIprC5zOI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn3jE3Jqd/FGkciqXRI8lqVudz+blh1rLunh
 DAPo4JfRZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59wAKCRDBN2bmhouD
 167MD/9WOiPSu4HFniDht9/iDlJgx4fouuoHImJ/CM8XXopNUpo7cqRR15JqKSLsDj6vLCZnDjI
 XJH4l92Ge2WRJcz0/XCKWm3Oj9AtC7ODuCsB3t2mfhBJxD0iuojyzEbOdRvzU55KzY/Jm2DElBe
 AVz2VKMPgF1zFr4pkhx3dxiMHbLe6UGPzibytjl5whdT2xAoImo+S2NZTWCKOe4+N7Zrs5X4MKN
 nksx0kWoenkduh9GxKCpr++Kokx/YYpvDE8obQfhLY80Z4tPSY6cX4vv9sfrzB9vGeLAU9yTvAc
 Wxh0WUV5cT2zuYc4pUkyqV+EX/Y3tPEE5xSP136C9a7FWO+Rd52ezaWXED2BY3hXspNrTrKXXTD
 nFQfKJ3M0bszW7Tctw01tKYZUa9Qf0bz/0oVbI6rpDgM3+PPLaVWT1D47FaKzfKQ9jnjaZWzOoF
 1F53c9Pv5Cdt+RLqjXfD1JfrGJRJ7hUbPzMQ/arruJidb9QiloV9Dp70EuGD0VudxXWXtwRzztI
 eIzKDw49c8QYUITfwxYEr1QsvBeQMeOGj/PlXQl1p6vj/Y4oFGW1SjDTITGrfjGFfmKEABGvYP6
 yK41SS5+akvGSPouciQ7r2EIqpAZMYxIFkaCVPRLm6VL/jKT9HDivO012DCh8z7Q3NuvimCGlwg
 o5bO2V6wsqvDkUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: NWBJTIHLKRL5UUIFFWGU7Y2SVHZGGLNC
X-Message-ID-Hash: NWBJTIHLKRL5UUIFFWGU7Y2SVHZGGLNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWBJTIHLKRL5UUIFFWGU7Y2SVHZGGLNC/>
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
 sound/soc/samsung/midas_wm1811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..0841e2e6f8ce 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -127,7 +127,7 @@ static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
 static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd	= substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int pll_out;
 
 	/* AIF1CLK should be at least 3MHz for "optimal performance" */

-- 
2.43.0

