Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D385769228
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72ECE4E;
	Mon, 31 Jul 2023 11:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72ECE4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796810;
	bh=ZgF1mUl1qugzr3/TM+Fh6+utlHBGKNPaqRqfhKrfJcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vSnxEXT8XD9t/T3s3kIS65bUWR8jqApgq1ngRJg80QKPq4jaWFKGjlWFMTAPThEZ2
	 +j45OBE1R4+7D69xTJ0NKDUL6lI5vgEzZOyn+QRSduSsiAqWsFTbKWrSnFjGr1DxRd
	 yk+Z5gyptqR3WQ7+UaxzvoPcQE4F5b7Qw/zxqt+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C587CF805E1; Mon, 31 Jul 2023 11:43:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 153FEF805D8;
	Mon, 31 Jul 2023 11:43:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F2AAF805B1; Mon, 31 Jul 2023 11:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56B2DF80587
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B2DF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vGH2+Bfy
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0e23a4b1so6674048e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796614; x=1691401414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=vGH2+BfyMZGVx2Mz2PghzNpH2Lq5fZhfgnQWWX6qIyUW7F+xe7yVIUgCvVGyO2jckw
         IhVxKo6jzyu9LgUCN+ZkGVOY3UHU4c4kbWcOCmwgeznYnO1nOX9iM1Y3SavG9vo56r1f
         nn7SRqa4w7Ohzz1EhhcN7Yn4waZCQTbIO24AlLB/qebcEymJ5BDEAUtGPxbKWlpvi1WV
         PPsNZXmmo8fZyOp4mM3g+ki5WCAgos85P6XQHdI3mYj/xUUWdl8B4HGsKc4k8TrR3JXv
         cgvoMuxzaih01U5doR1E2cYbIexG8RsB0ECGoC4deTSNRX89YVXAOyf5eX+pNR9Kz+7X
         dYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796614; x=1691401414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYK3gBdbZNa0sNOQK67Ss/5e2crqIr7FWYCpvQqQW+g=;
        b=juTb5G5EBjvRQCi5iiVgyuon0tVb60MP0AVfbP0k4szvFmbsH/b2R/Emqcxf4hPdKD
         K670Rpgu5hF8ndELsRY4EjfCb0RunyVBfB+VyGVvxAlKCyyAaL90cHcI9Vr0AXGL9GHS
         maDbu4KLEmuNHMEpZMlQDDyQHwU4l9WeODEq1UDAuAiSQN2PeO36PP/6gOUjrfjgkVFj
         SFrmx9PGCMdhpkJLur1k9Xd0ZccaLuQZ5HDvmh6qloPbs+NpzzamXczJZJ5eYxmVt+T2
         NtO0/RXSRZbhq4bBX3nuaOWmXgB3vcVIB/WYyokVOaSUXYFVHF6bee9Z/PlAT+3KxqqD
         xr+A==
X-Gm-Message-State: ABy/qLZuWU/zz6RAzNqx6H3cYheptZdhLVzyiC7wkgz1OyzdqGJR9uP7
	OSdDf1PwhjD7VNM3ZlSV//XRnA==
X-Google-Smtp-Source: 
 APBJJlFi4tF2DDSDAGSo3/0U9Umv+lZh1Ow6pAepScqbXZ2BXO/rwOwioy/FJVCRSkz8wfIlGQX0uQ==
X-Received: by 2002:a05:6512:2399:b0:4f8:77f1:299a with SMTP id
 c25-20020a056512239900b004f877f1299amr6925105lfv.42.1690796613836;
        Mon, 31 Jul 2023 02:43:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:33 -0700 (PDT)
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
Subject: [PATCH 08/12] ASoC: samsung: odroid: use of_property_present to check
 for property
Date: Mon, 31 Jul 2023 11:42:59 +0200
Message-Id: <20230731094303.185067-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YFFLPSQR6OXQ555PZDOK36K6LRPIOSRR
X-Message-ID-Hash: YFFLPSQR6OXQ555PZDOK36K6LRPIOSRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFFLPSQR6OXQ555PZDOK36K6LRPIOSRR/>
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

