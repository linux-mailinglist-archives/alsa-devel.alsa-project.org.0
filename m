Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF3F7D2F1E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DF2DA4A;
	Mon, 23 Oct 2023 11:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DF2DA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698054995;
	bh=Yau92eR7ZXrmGE9XsEl9CS8njSm+0C0QXAWfvfzq1BQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vDEZX9vSyBkrksFuKFHo3Y5dJFxBaidRzrD//myJV7xdxwC3PGkYQlrZvqbPnctHy
	 2NZ4ffQES/AnWRUoHZ2gV8hPpV1hu6hnVSI1SRs+NiyiKFUQWoD1Hncx6v2kUrLXJV
	 E5cWIIToi8TjteXa1HkukeFiAChGu6Hh3ZKSVOJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB943F80578; Mon, 23 Oct 2023 11:54:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 247C0F80578;
	Mon, 23 Oct 2023 11:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85B80F804F3; Mon, 23 Oct 2023 11:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52F52F804F3
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52F52F804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eCP917st
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4083f613272so26740375e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054877; x=1698659677;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJErgU+nUAjpf1N+MX3RFSZtoYrYFdNiReNrVNbPccY=;
        b=eCP917stvvnx3Ke77PTN+0DxABhSW3xbogaLkxW2WFH3cVWjxWE4Vks0DfaeXHvhT2
         UCmfVprKLSTAkG5/m7knSAlHQadSV09HQIe7KGgQrsVboPJ0MlSBL4VTRryQqJCEvI/6
         an8BhHqgGhA+uF7iSwGzdYRcyX+q/r21aUyveiLN0UfpeNEMMlWICy+amS/Trh7Ed59+
         YrJ5sYWEuY3QPisyZYIpcuW4dYnqmFl4l4HOe1lOD5V53F+ulZGzzFyCmdA/SK1DgpuW
         skJ6s40CXfLhAdpM8F3G3/l34erNQq4kXvxznLDIMYxP7K8eQLBUTnsr4h82PmCh0Ssr
         crZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054877; x=1698659677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJErgU+nUAjpf1N+MX3RFSZtoYrYFdNiReNrVNbPccY=;
        b=afC2E3OdMolEmMwUPN5S+F/PV/+09z9MBG3rBajpyoK92cV5r7JupO2TqwbvHHNW4S
         jdXbQzyTLPzOeS0idxSfA9L7rv+hFnMI6tD7RPS+QaB1qnePRjTt8OTg9eY455mb2YIW
         X6Lt7bv7MD1+KDj70QAQm39EECoRrunmyq9hzi270IvyOQ1rG3guGA+Dip4Wv1U/KSN+
         eAipDACEZdoZ+w5VFFzDPEql/7OoSxX+zNei3i90tfV7axAb5Zo4sJXxuglzmHzoyb2J
         Kj5nZSP8NIDskoHMni29YTVRa553igG9hLy1b8wxx3i5r0ifHSELI0zAS9RWp5C8rSF0
         6VIA==
X-Gm-Message-State: AOJu0YyuMhvE4Ry/D7zEo/YXi/lePiSUCfLsxrzM84hogaLIeuZ6sygI
	Fje3kWtVfNam00b9o9wAFMcAug==
X-Google-Smtp-Source: 
 AGHT+IGm+wzbFOSTt4RIIX0gXAgxOLyRHhiU4Y3meUgY+Qffx0kn9EZ6h3swR1er/PSz6I6OP4nsNQ==
X-Received: by 2002:a5d:4483:0:b0:319:8a66:f695 with SMTP id
 j3-20020a5d4483000000b003198a66f695mr6356947wrq.55.1698054877529;
        Mon, 23 Oct 2023 02:54:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:37 -0700 (PDT)
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
Subject: [RFT PATCH 02/17] ASoC: codecs: adau1373: Handle component name
 prefix
Date: Mon, 23 Oct 2023 11:54:13 +0200
Message-Id: <20231023095428.166563-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IPEEC2MDDBHSYCECWMGMRI44GIGA4JLK
X-Message-ID-Hash: IPEEC2MDDBHSYCECWMGMRI44GIGA4JLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPEEC2MDDBHSYCECWMGMRI44GIGA4JLK/>
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
 sound/soc/codecs/adau1373.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index b0ab0a69b207..3582c4b968a0 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -834,7 +834,7 @@ static int adau1373_check_aif_clk(struct snd_soc_dapm_widget *source,
 	else
 		clk = "SYSCLK2";
 
-	return strcmp(source->name, clk) == 0;
+	return snd_soc_dapm_widget_name_cmp(source, clk) == 0;
 }
 
 static int adau1373_check_src(struct snd_soc_dapm_widget *source,
-- 
2.34.1

