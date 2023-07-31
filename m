Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA0769232
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3772183A;
	Mon, 31 Jul 2023 11:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3772183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796872;
	bh=4ysxaoQFB8nEupVjghFlT1AKWoz8nkJRatdN58BopKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jf84hs/Vvu4f7xFe/V5IsTrLB5Qv1tandjUD+NbXiEQClfux/rkixkOJIfuyafi0N
	 jp+FUYQR1dyusTk1G/+ywpBROGR5+yMGntdn/2Nw12GyHYRXmOnAxFInXco1t9Hvvd
	 1WydlBfGSNrqWxNLPCR6L8d9gWzRn1Vg9KpS84sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D849AF80608; Mon, 31 Jul 2023 11:44:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D81AF80603;
	Mon, 31 Jul 2023 11:44:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A15FF80604; Mon, 31 Jul 2023 11:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D957F805F7
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D957F805F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bu5mBV64
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe2048c910so7001955e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796639; x=1691401439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=;
        b=bu5mBV64WxKsljZ8islLLohkT7qq3ayllHEHIaQ72yKGkRWTG86xkcWlWIgRSdQW2K
         RXomzGGFe+mzvU6UuMioq+LJTbZvxMQ06wEviaRAgOcrXV8a58c0mfY83D6xeKpW0Tyj
         qi0UsW0TNVUFsDI9sY4E9hJbaTN5+azWPBujMxHs5CpQIJwUmNJOevHh8eNB6wzbQzAr
         Wt55hHpwWUWbhlkwEr+utuhvqHLTghrJHiLZI+x845gNczYBcdAV3uqq+VhfmxFMB/O1
         BYX4JtId8682J+8zHe/ALz3BHQtSSHzsjQVVCGh2nu758pi7xdani7lxQNTokIkBoQLI
         ybAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796639; x=1691401439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNOB2kSBm/ZCjLUQLsGBk0BsOPSn2yUKgs+5rBFTqgc=;
        b=W88SQvFDSnytJ3ykUTct+uUD5ToSKRib6/O3GyhFrHE3N8zmLAu07VBJ3LOyMu6mWv
         xcBKCXrwKNWZCT+/dBpeeObY8AasBWIwf5jzeIClk4tURX84qoFsqFJwXJPt94w1HooB
         KnIVzkX3dZ1QtInX7FVBlGxh3nIt+f3UGZ492awslgFvMQpaNsZ7MRvvwUMAWpbVl8Fx
         7TZMHr/9JYD8KICq+IYQuzRGGotC5enz6wV/FAZ2fykh7/pT3DDqxZKy3WxL+GCmv1CP
         iQY9GGdQvUCLCUKzmPO3yrTvkUK21GZMhwExK8UTYHdzr3woZWBICOFtsL+jFvuXcMjh
         QEgg==
X-Gm-Message-State: ABy/qLaHNHNqrkxI2/j3Yu21Ol4tq2KS665+yi9lFGmkAQrHsaVCr2uZ
	2hbXqMNMVp6B9g6GGF70Of5iz/e6NS3mfuRHfV0=
X-Google-Smtp-Source: 
 APBJJlHUrPvgQI+LUCrK+fMQO4ZN6R1lD9qdc/qBN0woqpQl49xLOblAvsdV3IiwHKgyrdrveuwFBA==
X-Received: by 2002:a2e:9557:0:b0:2b9:eeaa:1072 with SMTP id
 t23-20020a2e9557000000b002b9eeaa1072mr1013157ljh.18.1690796619353;
        Mon, 31 Jul 2023 02:43:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:38 -0700 (PDT)
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
Subject: [PATCH 10/12] ASoC: samsung: midas_wm1811: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:01 +0200
Message-Id: <20230731094303.185067-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22TXWL4SZS4K5WQ2M2OSYW2OJOROGD3K
X-Message-ID-Hash: 22TXWL4SZS4K5WQ2M2OSYW2OJOROGD3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22TXWL4SZS4K5WQ2M2OSYW2OJOROGD3K/>
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
 sound/soc/samsung/midas_wm1811.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 6931b9a45b3e..9e83ed071f39 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -462,10 +462,14 @@ static int midas_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
-		dev_err(dev, "Audio routing invalid/unspecified\n");
-		return ret;
+		/* Backwards compatible way */
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+		if (ret < 0) {
+			dev_err(dev, "Audio routing invalid/unspecified\n");
+			return ret;
+		}
 	}
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
-- 
2.34.1

