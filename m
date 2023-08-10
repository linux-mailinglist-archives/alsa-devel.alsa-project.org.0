Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD5777084
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2B6A83E;
	Thu, 10 Aug 2023 08:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2B6A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649430;
	bh=7ASYc3FbI9qd4z3PIk2i3qfy9mOzYsm5TqUlOVI1jo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hSpCJsfirsya1uzdbOBD4kYrrkwTkJWtkvHxyv7iJY6iFbpmBwalMVn/ZMxV6J8uz
	 o8es7AcWolow1H+oaEbW+H3BRuEIWf2Gm21b/S6ZvhsxAdNs8SmVyQZAFJEQSfxITZ
	 VOtPmK+TZFwpqwZZBL/RWkQlLuQbHCQ/4veR8czk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AB19F8059F; Thu, 10 Aug 2023 08:35:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A824F8056F;
	Thu, 10 Aug 2023 08:35:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A380EF80508; Thu, 10 Aug 2023 08:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE803F80536
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE803F80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qRwFGkjs
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe2d218eedso4896805e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649200; x=1692254000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=qRwFGkjs7FH05bLZCJETWbxdoViNxeC39FXgvqqlKU61gi57Ql7yy45M1F9AB8/Vnf
         m4mxqNHy7YspE8rZapqbpkWRGZNRknmR0Yw7mWVyCBYFhav+VPIm769MnpWWKLDWK6vD
         vC9kR5dcS6XYThPTkqfm7G3IaFxYAITemSv9pNs25yTxEymWJ1iCR4S+CpNCl/bM8AyP
         mrkj897BIXv6i7FCzrK0Wv2NRScb1bjBumNlC2vJIZeqIGZU5Uqzi7GP1fP1aQdTNOBW
         HBwf/zF4nwCb5TmpvViNmeug8wNpHdz1zKVQBEZuO6N2j7ktVNinkhjQ1eADaGOvVh0w
         T7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649200; x=1692254000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vbXpmjMjw+lKtOoDoBL66la8kJXNdX97D3faoVkRss=;
        b=jNX6oBQWXvZuyacLcugrIhMfyrMxEOtMwG9mW81WYhIj/Xw3WxBJD/yFdYegBP4SRd
         Ev/jM4A5vuRjztYWEy+znarHW8xmVwCcjbOE3RI7MFm81QEFHqcDW/Ne5Gejm4kbaeNS
         RVJXm+bnXkYBtA0UfXXhb0W7gG0/zjQj5TsAchnQx5xKHoWB1djGkYj9H/SQTlR7h7rI
         IaTToYILuBDasu+oLXSPm1kuVEk1+UIZCRoffYhSRTSYFg/Ti8ZpJDg/OjHFuvce0rjM
         sUBvVTOLuI+JGj2Q2wbktYgFZ/DCibQeVoBlhXL5bNgM5/RWpJQCt2OgMoXjUVN5OES6
         qDIw==
X-Gm-Message-State: AOJu0YzS57eaR567sOdANOV16VGUK3RaLMT2EFbfx7qseHOHO8G5Mtgk
	ORAdYwxgPzr2oHs1GVBT5Zk9gw==
X-Google-Smtp-Source: 
 AGHT+IFDBMmqGDMuwzh1dxYq3965kvpNZ6gEY/ZZqIfT2y0gnQEekNtyV10m0SOedP3uEd/zcYBgQw==
X-Received: by 2002:a7b:c398:0:b0:3fe:1820:2434 with SMTP id
 s24-20020a7bc398000000b003fe18202434mr1112564wmj.1.1691649200441;
        Wed, 09 Aug 2023 23:33:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:20 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: samsung: aries_wm8994: parse audio-routing
Date: Thu, 10 Aug 2023 08:32:56 +0200
Message-Id: <20230810063300.20151-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E3OPGFNDUVEC73A7FC3ZI3YVZAE5CFEU
X-Message-ID-Hash: E3OPGFNDUVEC73A7FC3ZI3YVZAE5CFEU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3OPGFNDUVEC73A7FC3ZI3YVZAE5CFEU/>
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

