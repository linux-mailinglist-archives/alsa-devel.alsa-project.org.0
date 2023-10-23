Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B27907D2F4F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12FA1868;
	Mon, 23 Oct 2023 11:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12FA1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055158;
	bh=HSTmfGzATJWrpXNhjrbz54DbKs0jWt+eil0G3pIkme8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aD3b5DDjwCNircbt8NX5GA0Fa90AXJLDcMN7B5r5UK8vYE+QzFQ3kYsAfKQAkAERm
	 SJdjGAEUTK45GTSht/5cmI/ujuTzp1PsEC9ghJ1uM8d3Ahwz59EzfCQnVNL3KE666L
	 KPgepBi9RfEA/bTMjAqCUq7yQjlcAFddSZMk+DQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F9BEF8060B; Mon, 23 Oct 2023 11:55:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F12BF80604;
	Mon, 23 Oct 2023 11:55:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45725F805C4; Mon, 23 Oct 2023 11:55:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 670DCF805BA
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 670DCF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nwjAWXGW
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4083f613275so25527185e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054900; x=1698659700;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=;
        b=nwjAWXGWu9AY0Ct8Pps8w8I2FHQLR2Fqk3aOLHG/GD/Z2Wt/EK0s564DsO/Uo9Sxjz
         biQM2TtYiZ5Vm4poPLxdel1iJnYSGUVew188hK10R0ICxVc87FKOhpaFZWLDH/nGpWsu
         ysBSApUolDvGyvkm+fXbFb8RRzKq8ISInMnPWvEeAidXzUnaucUnOQysU8Xpxu52rWVg
         h529Gyh0yPEWev8CF8U3KzZl5HSw+U4r1t03N7bQeAnn+s5Epp+8e/KgmdZKghG7sq/r
         AKuhPAkPSya1S7N+YUtlmTXHjtJUKIHFsDT1kS8fVYej47AqPVfOYy51rwrpHK+Cw8qb
         +sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054900; x=1698659700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=;
        b=r0lC88ZY0zgZqpr3mG6jTzJZwxrRyJE3QQXNsODPxZds2bu6+4i2We9WEb7atMcPuo
         P6t+un0ceDC7Cb6XbYga11/lmbPdcxXPnCT0cAw8MAipx3nBgIxORjMc5aiiImr6dHUS
         qKIDuLxyCj+gnJAplbmQXs/SiGTdfRS2p3xY44oXo0/IH2U85nyTafvyRhzreavVbjr1
         0vO+psPyxko71UrZrR2/0QMIlOocAP6a4Miirz45BYsLiiyBTFiYlVobiIKASGc2fXkK
         Nmk5n76IO51kVHAfOtyvCyTJPzpl2wIsqqkx9oHXmDPAUXW0+txfOakBP8L7+X2y2/5H
         nuew==
X-Gm-Message-State: AOJu0YxylzskZqetEwWENS9AanzE0npfmk4EHOvyELCI6URZytyl2R31
	hWqPc7MW+1T6ki4fLtn734bbJA==
X-Google-Smtp-Source: 
 AGHT+IGcRnlB4vFMFDgducXrQmS80dOVHAS+aDCp1wKs33+friJEQiADUVo77kFzrMbe1bXLDVGcYA==
X-Received: by 2002:adf:fe48:0:b0:323:15d7:900e with SMTP id
 m8-20020adffe48000000b0032315d7900emr5319691wrs.53.1698054900441;
        Mon, 23 Oct 2023 02:55:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 12/17] ASoC: mediatek: mt8183: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:23 +0200
Message-Id: <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SNLJ5WKINS4P26M7FRRFAR27XUQ4MM7X
X-Message-ID-Hash: SNLJ5WKINS4P26M7FRRFAR27XUQ4MM7X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNLJ5WKINS4P26M7FRRFAR27XUQ4MM7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 8645ab686970..65e46ebe7be6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -276,13 +276,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8183_apll1_enable(afe);
 		else
 			mt8183_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8183_apll1_disable(afe);
 		else
 			mt8183_apll2_disable(afe);
-- 
2.34.1

