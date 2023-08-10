Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE26077707F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA5D84A;
	Thu, 10 Aug 2023 08:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA5D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649356;
	bh=ZgF1mUl1qugzr3/TM+Fh6+utlHBGKNPaqRqfhKrfJcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NP0HMK7BDwDpSlyAImJbduDtzRCejXqtuEkXU5/KE+ojKtTmVqzrVsXnQ5Z+sZ+I/
	 7im1fs8SzEMFvV+NW/Zv/7RDyikIMKIDUpLD2yI7hZ2fmhbWyRm8oIoj7biF77dmmz
	 jgebm2Tr31/6MKKId/lenzLw0rilv/maU6sJ07dI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53544F805BA; Thu, 10 Aug 2023 08:34:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D766AF805AF;
	Thu, 10 Aug 2023 08:34:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AF25F80570; Thu, 10 Aug 2023 08:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 371DAF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 371DAF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zMl0Q6Wo
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9ab1725bbso8865281fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649198; x=1692253998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=zMl0Q6Wo4VQxBOxQpo1rTcZRIWwM309TN6yCpDr/EeJrTnVpUvCkfew3iUmCwJpBBI
         MChHsatOC+ZhTfU2GaboaU02NCWtGr0R7Gbm/BTk/oo1E7nczfHfoN85tuwbxL0uJTEo
         ZaGHg4nLZ4pbZ5BbBxSkikvWi9RcizQXngjyy4DdN1wBLiBT3TIoW3brijqlQs6hlXHE
         7tuvYU4gYApdVRXh2fRnXMsZxuZb7lmL0XjHsLL+pxGon2FmmwvaKEobyZ3mXvtUv8Wv
         jsl+QYF967v94rD1iOqlmd8WDBTfo7YsOmIQLBuxdeAsQz1qI0dhUFzOtv67ghiWnKzw
         2SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649198; x=1692253998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=jnEx2zqj2d9IxChTCE01YYJpedPbm91772U4hzp0hRdJ7rlWShdDIUYy1d+nT1KwWg
         kTx4dK9Ydre+rIE0gEnftewcSK0+O58DhFuvroTgWn7YdzI2MGF/WpE/9sdANhqthi8V
         lOXfkou682QYIaspK17ZKao5kXxjYu8BUOj4adM/JDXRKhGtLa5jVlnWFuF119NrzQ5i
         /uGwNb903a3odZzNwtr6hOyCK6mWJD66jhx5OWX9I8mJJBQWu+0GuiJuY8C1Bxkmc9in
         ztKmf2WlcPtV/4GHK2BJ5cOCAgTn9v4nJlqe/uzPLyCWr8Cbfif5go770fBQOq0ileUU
         c/Xw==
X-Gm-Message-State: AOJu0YzU78BEWNycZvQPPFUCs6tUjTcRJ+i8T2oLvVcz0cNZ139mZh+B
	/YT+DGlGDpXUB+G+IQG3kjLgJg==
X-Google-Smtp-Source: 
 AGHT+IFqfz82dC6HvQTaxglBx3yT9S64xVlc1ywkXQiWNswPweX3dARtW7q3pPyLGsgAYz8OCa/Z+A==
X-Received: by 2002:a2e:9a84:0:b0:2b6:df71:cff1 with SMTP id
 p4-20020a2e9a84000000b002b6df71cff1mr1059849lji.52.1691649198267;
        Wed, 09 Aug 2023 23:33:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:17 -0700 (PDT)
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
Subject: [PATCH v2 07/11] ASoC: samsung: odroid: use of_property_present to
 check for property
Date: Thu, 10 Aug 2023 08:32:55 +0200
Message-Id: <20230810063300.20151-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P5YUJWTFBXZSAWZFORF4G7XAVQAUQFZR
X-Message-ID-Hash: P5YUJWTFBXZSAWZFORF4G7XAVQAUQFZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5YUJWTFBXZSAWZFORF4G7XAVQAUQFZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"samsung,audio-widgets" and "samsung,audio-routing" are not boolean
properties, thus more appropriate is to use of_property_present() to
check if they are present.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/odroid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index a5442592bde4..1743bd55ba1a 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -223,14 +223,14 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (of_property_read_bool(dev->of_node, "samsung,audio-widgets")) {
+	if (of_property_present(dev->of_node, "samsung,audio-widgets")) {
 		ret = snd_soc_of_parse_audio_simple_widgets(card,
 						"samsung,audio-widgets");
 		if (ret < 0)
 			return ret;
 	}
 
-	if (of_property_read_bool(dev->of_node, "samsung,audio-routing")) {
+	if (of_property_present(dev->of_node, "samsung,audio-routing")) {
 		ret = snd_soc_of_parse_audio_routing(card,
 						"samsung,audio-routing");
 		if (ret < 0)
-- 
2.34.1

