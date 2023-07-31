Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2A769229
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF1083B;
	Mon, 31 Jul 2023 11:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF1083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796821;
	bh=7ASYc3FbI9qd4z3PIk2i3qfy9mOzYsm5TqUlOVI1jo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HaJueicclLqupMoNzaILV7EmyEWOae4I8QOTHTohawuSjTnZClL6GuidMkbWU8XbS
	 Z5rXSQZ4i0KJmwWCK89DfiyWhQaJu4u1JmsUHeoI6YIRQ9Z72GoSKxgRbI66pOuS68
	 YHb+PGQKLGByQu7qSWz87GW5nJaWVjDzUt4b8/IY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9361FF805EB; Mon, 31 Jul 2023 11:43:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1F1F805E5;
	Mon, 31 Jul 2023 11:43:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0DAFF805BD; Mon, 31 Jul 2023 11:43:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB441F805B4
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB441F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h0U8orN3
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5221c6a2d3dso6316112a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796616; x=1691401416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=h0U8orN3P8YFW+0Ac69J0BgBO4B5tO/PrgUCdrR26HbMX7htpegZrJu+ZNW2PA6CQ3
         OqweKqo09CAaM3sAN1p3n+aIIDDOjktrgs3LE2WhF29mggUMc17XPGZ7U5aNN/O8glwo
         ZMOPQKFLs5rfQ1lTijtCibzI/9SwgQvdH7jz3Hwdcr9dv1DhuwhEAAuSJqLyFrfOnTdK
         0w90tdeYVvtHbJ16IGl8k1HRk+thSstWj24w0hG5AL/PFBPI5Cvay2JjO6HxW9Q7Gqs4
         K4+DO5Wz9tHY5sdFrJWPVNX/dMrUbFMZocazfiGWyUv5dis5MD9MCcPV08OPXyC3X+01
         /M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796616; x=1691401416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=dDe+K3L31H2FMJOqwwwaW1KA54sM+GE+Q/fx+N5rbSMegm404PIAMvoA9WPy7nQ2W5
         5nd240Z05pSe7oOHhIY09y/sVihFCFrFR4hHsOcGfAHtaa/DBbI7wquqSjh9FFS5FG6m
         tYdhYkpytSfbmwtO4XcJi1JKdFqylotVPmLx7hTSpjJGW8cioWmkOkfdmJieKMXQKeNN
         MZTMT4rPX1M6gAzLfAldKnORXmJzG2B09sT52XLiiH+R//VkA8M+W0OwV5G3FMEu2RId
         Yj9TkFVJCKllcLsLOyyuDc16BZTphe3JDy0J2vTNWf7bPFFM66ay6PdN0u/DnDH1kdPB
         9Ejw==
X-Gm-Message-State: ABy/qLYs6tTz2NCN66tq73hEKVc9OS1qZjyvwx7uqc8XMqJuGPXQNf5d
	o6NPpJvZcdwGY6KVHnG0qc7Gvg==
X-Google-Smtp-Source: 
 APBJJlH95qguXBDd28tv5zYfROsmG2YCNzdEPQjZ/n9M5l2bQqmUAM/BlIg2lNBRwJKlhNLMIYYX6w==
X-Received: by 2002:a17:906:77d0:b0:99b:ef9c:e634 with SMTP id
 m16-20020a17090677d000b0099bef9ce634mr6065950ejn.65.1690796616598;
        Mon, 31 Jul 2023 02:43:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:36 -0700 (PDT)
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
Subject: [PATCH 09/12] ASoC: samsung: aries_wm8994: parse audio-routing
Date: Mon, 31 Jul 2023 11:43:00 +0200
Message-Id: <20230731094303.185067-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z5WNHZVSPPOPOUEVFPPCQKT6ICEGVHBD
X-Message-ID-Hash: Z5WNHZVSPPOPOUEVFPPCQKT6ICEGVHBD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5WNHZVSPPOPOUEVFPPCQKT6ICEGVHBD/>
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
 sound/soc/samsung/aries_wm8994.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 7492bb41456c..dd3cd2c9644a 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -620,10 +620,14 @@ static int aries_audio_probe(struct platform_device *pdev)
 	/* Update card-name if provided through DT, else use default name */
 	snd_soc_of_parse_card_name(card, "model");
 
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
 
 	aries_dai[1].dai_fmt = priv->variant->modem_dai_fmt;
-- 
2.34.1

