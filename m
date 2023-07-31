Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A680769230
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17032DEE;
	Mon, 31 Jul 2023 11:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17032DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796859;
	bh=bjiwc0x9O1YzA9o/dItr8qU6qZLmxbdOglUh+/ntFCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WZfJ1QZ/83xGAa/G2rKR8QmlsaH3Ske61yHv+RwK+Xi/+0D28OZvIqdtXQheK+mci
	 Je0rsA+LFlrZkM9i30gUfSMQC7ByJ3E7mS2AAigfB8FrEbZxzHBEx8QLon2xYDfvDX
	 9hyaGAS3EAmzf2YbV+x8ZxsvTk8A6oBkZ3lgyuME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB221F805FB; Mon, 31 Jul 2023 11:44:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6008EF805F4;
	Mon, 31 Jul 2023 11:44:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34224F805D9; Mon, 31 Jul 2023 11:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99F30F805C6
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F30F805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IqwvSfnb
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bd1d0cf2fso681167966b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796625; x=1691401425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=IqwvSfnbNwyimbDjB6LihmC2Gx61tK+naB8QvwHsvXO0AagHSPzWbJRjaS2O7lbNTS
         uKHpeI8ENVUlZNRnDzoAFPLNU3WruTMI9ZxeHtzJ7g+Sn+eDliooYYCqXXpQDwHnf+Vx
         O7zTBYGCz6v48/D4pyTbpPaKFrSLQi3kVi6IxhcF/uRSp7Vw01eHsF2IgPUt+YlBU7Sl
         aCP7bNORn2LuJEnVpcO66BiixqFuMFSKjtmJ4LuMYuhaA9a+bAm5eZq3nhk8AQ1A9gT+
         vm8xlf/Bek/HsVv5bZgvjDupHFPhLOIx6ZAVd3EpcNTdx/7l/Ix904GX8IT2gN15vj5s
         eb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796625; x=1691401425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=A4XoZZLHT7scgAZFW/V/OyCMHoP+whsylo0pZ0iRmKmqHEgac9kzbu886SUBwjHBaE
         xBLroFjtbTNtfJ2F2BPxwrrw5IuokTSdGw97s/4UwCPvONdPIZjAJI0VKDS54mZaMnhL
         EvA5Bm7KCDNRgH8UP36DpSWE3RaVfL3K/cOV50mtp+NlQuS9vYu3ExCETzecP712eKmJ
         msbWXnIvyo6NTv+NoSLqCBMTfQ/YclwwUfBpfjDMO/4vU9P0a2NIcvCVUP/R7P8fz9pM
         kI645cdaoC/Kr27/a/ckESPqaSQpnQl64ywj4lVr0WyZ5biwEHv8lXOdAPSDSwTHJ+so
         FRcg==
X-Gm-Message-State: ABy/qLbBK7UPS8ujJNz7v/3OtVzCSA2aixcx/yGMhBe4QL6gPdSFOYqy
	h+ypSYm4EmRwYCiy32moefQHrg==
X-Google-Smtp-Source: 
 APBJJlEzcZhVwa+DwMhnuY0DXZuVupN88Qe/elc0l1P9fP7li1a276oj6YH6VCXWzAUfClUX6fMbBw==
X-Received: by 2002:a17:906:1d7:b0:992:3897:1985 with SMTP id
 23-20020a17090601d700b0099238971985mr6746185ejj.43.1690796625086;
        Mon, 31 Jul 2023 02:43:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/12] ASoC: samsung: tm2_wm5110: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:03 +0200
Message-Id: <20230731094303.185067-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PXCST2M3L7QERXYD6KHC7NFYAAJIJOAY
X-Message-ID-Hash: PXCST2M3L7QERXYD6KHC7NFYAAJIJOAY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXCST2M3L7QERXYD6KHC7NFYAAJIJOAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Parse generic sound card "audio-routing" property and fallback to
"samsung,audio-routing" if it is missing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index d611ec9e5325..5ebf17f3de1e 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -523,10 +523,14 @@ static int tm2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
-		dev_err(dev, "Audio routing is not specified or invalid\n");
-		return ret;
+		/* Backwards compatible way */
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+		if (ret < 0) {
+			dev_err(dev, "Audio routing is not specified or invalid\n");
+			return ret;
+		}
 	}
 
 	card->aux_dev[0].dlc.of_node = of_parse_phandle(dev->of_node,
-- 
2.34.1

