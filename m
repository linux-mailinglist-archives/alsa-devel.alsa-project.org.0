Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF87F7D2F4A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 11:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182F8DFA;
	Mon, 23 Oct 2023 11:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182F8DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698055128;
	bh=BRGQviPY0dp0vMs4AWcB7zw63p+K1lbbftfuwHtRsHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RRtdTX4xptk74kGf5u9E9N9NTpwJSQ3Q2Lo+SdJcicbVFHq+MVHRUrJtlRsaJNc9R
	 G5TAboRdfhpz/J1WUuyl+4vfvouQNYD1PPFD0HzFdDuq4RRRejfPirqnxOADrWRS5w
	 xiiWvDzOusTYnt5VLimbduQbzp7nCVOudlHLgOQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59E8BF805F0; Mon, 23 Oct 2023 11:55:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46900F805F2;
	Mon, 23 Oct 2023 11:55:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CCD8F805BD; Mon, 23 Oct 2023 11:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A060AF8057B
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A060AF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J9saV5Z4
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so2282064f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054896; x=1698659696;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkUvzAZAFAxBUpUecaFOI7DumC3gwDv4zZE7XoEdjuk=;
        b=J9saV5Z4bsscgHrlYQHUGv7BN7LBiKmFBYYt4B70oDolKAaxExDjhXZPl5rPz3aiJJ
         IYdThdy9EORY5MWloXX4sojUGBrcL6+34SbGhbYaS5f5nnoKoPPMQwkzgjQpL4ZsLBXg
         eqXvX5IroW66eMIb5nklWxuRJznfrgqiqXbfdGzPAKYaLV8x5Mp/ucdyVwhSNSkaLwD7
         Qx9X1rwsFeMOiuFY1WsAyAj+0/5iDI66RxkiGQScRfi0xjtMsUmVkdigUzfiARY7qzKP
         p4gzQYfil3xbCdRnnd8r0WpF00gweD8c4p5P+Cw8uhfgG93VF2Q7HcT7xirORQ0gZsRC
         dAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054896; x=1698659696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkUvzAZAFAxBUpUecaFOI7DumC3gwDv4zZE7XoEdjuk=;
        b=hMTWw0CaQIb8gj2CXGY/SeW//DAycJAvNgnmwn5YRSCMa2R8/rw1QfnqoigFbJAVND
         LrhEFqWMHEisbQKHusWUJPdlM1AZXH82vDdFqHiqaMFg8plvvpPXTejyJIUbHhH5wLk0
         dJDNw9YXSAaa94yMq4Y8ToYFplRnp5oVe2Gwwj+PbAVHxCX7cMGctSzDFGjxC8jQO6u2
         J/RrsFhMaP26DB/HSkR26JFhpzRI6FRPD2KF1Ducvc9reX5uOzvMyJ9tagvlQZrGwIOW
         fJU+fVxU7luDZlfASOrS/kn5Y4SGudBqmgpQy1E+AvqMLgEorcjLddmm/5p8Vasb//qX
         12Tw==
X-Gm-Message-State: AOJu0YyY1vyq0MMzfXBBow1Zf69m3JBneO0JZgdyPfjk4F1jFrsHIGXU
	18gHTb8WJ9nAmLPLMrMcc+ja5g==
X-Google-Smtp-Source: 
 AGHT+IHWg8SLe3xjPrj28tLTDiymcbd03RUAChA7SD3rg/2FeMGUhVv6IRTOZLXoX6FA5TVWxviBfw==
X-Received: by 2002:a5d:6804:0:b0:32d:8907:4528 with SMTP id
 w4-20020a5d6804000000b0032d89074528mr5681524wru.28.1698054895793;
        Mon, 23 Oct 2023 02:54:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:55 -0700 (PDT)
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
Subject: [RFT PATCH 10/17] ASoC: codecs: wm8994: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:21 +0200
Message-Id: <20231023095428.166563-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOV6IF7KOL6DU7KTE2D5G3JQEDULUY33
X-Message-ID-Hash: HOV6IF7KOL6DU7KTE2D5G3JQEDULUY33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOV6IF7KOL6DU7KTE2D5G3JQEDULUY33/>
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
 sound/soc/codecs/wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a48e904a9740..fc9894975a1d 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -262,7 +262,7 @@ static int check_clk_sys(struct snd_soc_dapm_widget *source,
 	else
 		clk = "AIF1CLK";
 
-	return strcmp(source->name, clk) == 0;
+	return snd_soc_dapm_widget_name_cmp(source, clk) == 0;
 }
 
 static const char *sidetone_hpf_text[] = {
-- 
2.34.1

