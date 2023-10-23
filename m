Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440207D2F3D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:58:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A637C846;
	Mon, 23 Oct 2023 11:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A637C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055082;
	bh=WwwsqWVst6am8unSVoQoAkBT7G0naqY4SOdWNG5s4bQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tTT5SRf6x07wuXZLiqBTTM+AMWVUGUq/ggA29gGu2JODoooXMzA3uZOhoT9p1ORwm
	 5w8iBjrsBKj/LGklMejxnTbchZqSHqnO7ScvoW+liVMv5jhPAXsPg2Kw1WY2fVxsAH
	 NQ9CYTrgSEds0OqWngAMO7PRgTD6tAgmPzUe2C9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB033F80587; Mon, 23 Oct 2023 11:55:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9932DF805D3;
	Mon, 23 Oct 2023 11:55:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26FDEF80587; Mon, 23 Oct 2023 11:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E08AF8055A
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E08AF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Rpl7Xuut
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so2082523f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054888; x=1698659688;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=;
        b=Rpl7XuutaBYGYwcD/p6HtMyo3PSFSvB93B0hiYYrcsxJpXVdbIpUmfOPSNGLCqJx6l
         r2Nw8cDItFWaCDNInkELPhjP6eh1CVwniIgJCKJ/q2/arYdcTBeWpAufJIfToYErDhRV
         xs79b1zp535msWYknzSty5VpTmCdA/qt5YiqhNXKHm2P6aNgJyeV2PDR+cLEezpPsZfS
         WyxkYph2On19sa6AlV1BA4dHxcG3NPpewA8pIVraXApswhatdw3e5Tw0mxg6o+YaKK8L
         tc9IZHoUfoMJtyR/F5fy2lbGkeda3S81c23xOcp/Kj0bdVV3B2P6atgj4p82uXvcxJSS
         XpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054888; x=1698659688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohG7h5MVOd61zy+5ypL65RpxKjVv+oL8L5RUWwJJdI0=;
        b=e/2hrN5L4hH05geWqYQAmW8OGm8mPdAVmXE1S4OLHOyD9tJA4cf4IKAwDUC1QuJJlr
         yT/1M5wpZEwfv9+MhepUNTuzua/5WSQhlyYPObxBCPJISjmf86HRpnAGZDsZuBQv6pgZ
         duEK3Fv4nbCkErWyFLCa58LttZRh32zaE9muTtwKn3kU6XCnYGRrhGYfYRbNN7BGVP7V
         codsTZXJ6Ha4GklELskRDtjEvKqTGepZ+cCMqBKYkkskUj++veeqvGDwzPtPG4ronSNE
         ClkiOiGknMdEL6d/2PxnTOXnaXNFdws+HHCOyV4t0lURNyN4DnTi/1aaCB9j2EwJpzMK
         L00w==
X-Gm-Message-State: AOJu0YwWFlSQ66C8wTuTFky6TYVmkmxxNshZb7xte4MCo613Dz4wNzuv
	nxhRyMacbhzZDB9g/EObO6h+yA==
X-Google-Smtp-Source: 
 AGHT+IF2XQ2NytyZKfSuKXcxhn8MgqaftjUTA3vcBEY0OG7GzuniO27qe9jeb7abDdumrFZMKzYUnQ==
X-Received: by 2002:adf:fd90:0:b0:32d:8a32:3b2f with SMTP id
 d16-20020adffd90000000b0032d8a323b2fmr5871452wrr.16.1698054888606;
        Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:48 -0700 (PDT)
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
Subject: [RFT PATCH 07/17] ASoC: codecs: rtq9128: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:18 +0200
Message-Id: <20231023095428.166563-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7B5BT4PML45JYBUAHJUHBZVMB6GR2OWK
X-Message-ID-Hash: 7B5BT4PML45JYBUAHJUHBZVMB6GR2OWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7B5BT4PML45JYBUAHJUHBZVMB6GR2OWK/>
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
 sound/soc/codecs/rtq9128.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 371d622c6214..c22b047115cc 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -291,11 +291,11 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
 
 	dev_dbg(comp->dev, "%s: %s event %d\n", __func__, w->name, event);
 
-	if (strcmp(w->name, "DAC1") == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, "DAC1") == 0)
 		shift = 6;
-	else if (strcmp(w->name, "DAC2") == 0)
+	else if (snd_soc_dapm_widget_name_cmp(w, "DAC2") == 0)
 		shift = 4;
-	else if (strcmp(w->name, "DAC3") == 0)
+	else if (snd_soc_dapm_widget_name_cmp(w, "DAC3") == 0)
 		shift = 2;
 	else
 		shift = 0;
-- 
2.34.1

