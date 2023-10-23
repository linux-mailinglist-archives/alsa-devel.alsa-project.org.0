Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ECA7D2F5B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 12:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412FFE7C;
	Mon, 23 Oct 2023 11:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412FFE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055219;
	bh=pykBYUeyGmLpMLya3KYa/eooDqdhJ2+KUocu953QcuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HfFFS6X+6di/Pb4qHvJDHOtqzUIXoYjic7gyXqNZtaIeEk8SussOCtFU7j325I1Fb
	 Kswvtdaq0etO5Me/xTqCwJw1X2fWO4N+wuPoAka4Y+3fyHaHh+/+cxhthU8683aXgp
	 6aVJlef5rBul3L/tdmF8YBNGofnaJkLku0PYU0lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1311CF80616; Mon, 23 Oct 2023 11:55:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD38F80616;
	Mon, 23 Oct 2023 11:55:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C010F805E9; Mon, 23 Oct 2023 11:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4474EF805D9
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4474EF805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GWf7H9uf
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32db188e254so2253435f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054909; x=1698659709;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=;
        b=GWf7H9ufoDe9b6wFLyDN7FhHhcO6FxQ7QZxhSqSIRR4Vbzv/EK3IummkQ2WcYcAkYA
         NNZWE7PFsHtlUXGErgDkUpaMdssDvm456N0cd1D6BSTVjVmHuP92ExvqSXCJSKo9jtN5
         bp8FxTLi2mm6/mq9t1nuWg9Y4+dFeiGQ9n+yR458zG/rgJMdeeAU/mSIkcKmCjdHtiGk
         sjsDliTyUTRlswkSX28jO3mAAZgYH9d2m5r14dZnjYSNV1HcfgO1DtcI4tOz1+GkZ9VI
         SxIUxrZf/i5YCfrOQYLy/ehtvL1NImyGEtwwKLjcJKtYTFUjEQ2Zd0e3MVUyhYUS5GM3
         ZRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054909; x=1698659709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=;
        b=qMS+VTzgYyuUxm3fIkiQ8V9FE5fde5rnC/iuA2leUU7RrZ4yud/DkQBAQ4J4REkOm4
         6CTX4PVkOxDtgWzmmLVeH1WBd8y38nLU8NgNuNC4ykuWEkUn+LdPWFdayTDLLVZRgKcS
         Nb3ra1HTAuFIGwLnzKGVU3ZPGF7IXIt4QTB5EosUR9QzzxWoZ5qBU86DDN7cMx2WlnBA
         fWF4q4KZkUD10E6scch95tcdHWFbZvqxPB8cERMvN3oClhzkhsHk4Alnrr19hNBMMxHs
         IsIZEKiAVR1aUS5GuAg904TYuDv26jgKx/se1kHe17h5/4wYh6aDtsz+835y+IO4p42T
         UkIg==
X-Gm-Message-State: AOJu0YzIuLuR9GJRFuF0FJYOHgPn2y8cByD8oVbfijSRL8Rw6PtcO8/E
	7vwj5hgVZljtCELy2YmSxv4IsQ==
X-Google-Smtp-Source: 
 AGHT+IEj7uxeA3nMNUo9sdq2wgfqK3o3A7RdYb9gMk09HGqmRvuI7EP8mG67nJpViU+BpTyEwFeWzQ==
X-Received: by 2002:adf:e80a:0:b0:32d:8c6d:cda4 with SMTP id
 o10-20020adfe80a000000b0032d8c6dcda4mr6419354wrm.43.1698054909354;
        Mon, 23 Oct 2023 02:55:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:08 -0700 (PDT)
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
Subject: [RFT PATCH 16/17] ASoC: samsung: speyside: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:27 +0200
Message-Id: <20231023095428.166563-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JQEBYESTB5KFJ2IBFAMZBVL7CTCAPAX4
X-Message-ID-Hash: JQEBYESTB5KFJ2IBFAMZBVL7CTCAPAX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQEBYESTB5KFJ2IBFAMZBVL7CTCAPAX4/>
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
 sound/soc/samsung/speyside.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 43519572dc69..79476e8eb680 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -111,9 +111,9 @@ static int speyside_jack_polarity;
 static int speyside_get_micbias(struct snd_soc_dapm_widget *source,
 				struct snd_soc_dapm_widget *sink)
 {
-	if (speyside_jack_polarity && (strcmp(source->name, "MICB1") == 0))
+	if (speyside_jack_polarity && (snd_soc_dapm_widget_name_cmp(source, "MICB1") == 0))
 		return 1;
-	if (!speyside_jack_polarity && (strcmp(source->name, "MICB2") == 0))
+	if (!speyside_jack_polarity && (snd_soc_dapm_widget_name_cmp(source, "MICB2") == 0))
 		return 1;
 
 	return 0;
-- 
2.34.1

