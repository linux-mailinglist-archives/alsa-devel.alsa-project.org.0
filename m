Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EC07D2F4C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84657E80;
	Mon, 23 Oct 2023 11:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84657E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055139;
	bh=he4FjFlxeR2KKvVorHVhGK5pixL7ZmRHco1OiNRxlNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qLbizHfYA4mSwoOoxk0Z65wGL2SYaQJDG7sU6AFrNeM/aQNl9ZOAPC/Ks7TE+c/DV
	 j7Z74lK/l9WZ9h6+XBf7YfYinwiEON1uNoBGaXBZmMSiyl6gRlx5kgZLYiETJNGpLW
	 hL12qf/79t4EQtfw5ueUaNLfz87EzzPIFQqCn8Ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED0BF805EC; Mon, 23 Oct 2023 11:55:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DD1F805FA;
	Mon, 23 Oct 2023 11:55:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F77F805C4; Mon, 23 Oct 2023 11:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 450ECF80587
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 450ECF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hIEemEU+
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so25697495e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054898; x=1698659698;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOdWx51KZzcP4yPFkM05Libt2LPoTXL1hZ7dHc5xIDc=;
        b=hIEemEU+YSdPaF1ETtgRg4/zQb85bmy/vRya7g7/n2DNEcJRJueqUqgMjlHC6namzl
         CjLy1szDL2X/dRoy/XveMwOzE2ZxyDvBOWdskmGCl1zXsjX8a44X74LlkNDSSgAU64YW
         2wIE21WLBksYNqw5Hkr2EvZ18ErMOcldjZvgS51Um65MUeIhKlN4BccxQLJFpHJTbNbc
         FDPn2twvTluT8mi/92c1gBqxn/sGjFg4JOCjp0MwAH6XlyKXJp4AVg8eLSU4oTQyqzdX
         A+tp2UsiZwrJF0yhRz+yN8sVn0Waq3jGV8kxTePLbeRruzz6z66ACF0MlL5QO86zR1rH
         yjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054898; x=1698659698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOdWx51KZzcP4yPFkM05Libt2LPoTXL1hZ7dHc5xIDc=;
        b=DaBiNfcAtTDZuPddzVtqq6wOkALxAaAOEZk4HEtOGUfpG5tNKKDRNg1+AeFkoJeKM0
         7g04CTOFE70p5ltkK1qRq7T7jawELp8I6gcaCdkdEDYHK8TjPdVNzFFn1na+y3MfK18J
         NWtSMsq+dld+TQavGUbeNnh/GoLTUXN8WmPqUYrzIExVT0I0cR2jTHy+6N4yxxyeKN4r
         FhZx8O0exah10D2pZQaCbkUV37Olzwyz4ofS79RYboIPouo7d+z57HIaUGpu2GFjS2Bl
         Eat+VGdVZEVDOwjydJ/Gg5lBn5DTudaAZTk/+x4Y75sJGeUVRw5y8H5mFyIHr6Jsec5p
         EuHQ==
X-Gm-Message-State: AOJu0YwX7cvy1WytL13JB3eRX82AJ171BF7omHjxMfdfYMlHCZrgTKwW
	xdy1sFUdiF/xj19jDphUVg7wBg==
X-Google-Smtp-Source: 
 AGHT+IHEVLDPnEUrrX/PY+GOmXCghoQi2Q5x3tEYdDkzUdmjkSVDumB20aWrVD4RN64ThYu9YeLKpg==
X-Received: by 2002:a5d:6941:0:b0:32d:a022:855a with SMTP id
 r1-20020a5d6941000000b0032da022855amr5924003wrw.20.1698054898321;
        Mon, 23 Oct 2023 02:54:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:57 -0700 (PDT)
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
Subject: [RFT PATCH 11/17] ASoC: codecs: wm8995: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:22 +0200
Message-Id: <20231023095428.166563-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D3GHFOSBPS4N5HIDJEKCMGCKB5M6AVDS
X-Message-ID-Hash: D3GHFOSBPS4N5HIDJEKCMGCKB5M6AVDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3GHFOSBPS4N5HIDJEKCMGCKB5M6AVDS/>
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
 sound/soc/codecs/wm8995.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 4ffa1896faab..59ef2ef8ce00 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -541,7 +541,7 @@ static int check_clk_sys(struct snd_soc_dapm_widget *source,
 		clk = "AIF2CLK";
 	else
 		clk = "AIF1CLK";
-	return !strcmp(source->name, clk);
+	return !snd_soc_dapm_widget_name_cmp(source, clk);
 }
 
 static int wm8995_put_class_w(struct snd_kcontrol *kcontrol,
-- 
2.34.1

