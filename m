Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93140944B0A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7033F79;
	Thu,  1 Aug 2024 14:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7033F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514384;
	bh=lyyOSz5mnVlYsXDZyPPBuvrk6tGYt4/xz9ZU1RO5S4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ClrDAB+EB2B+Sh645qmff22Ltelxv094gLxxEm0o1zrzESt6G5pxARR+PGOk7hmUw
	 v13MyGMdSGePBelh/F/aCaNC5kYkA+RNgsUHNLyGqmO6O1C9lgqSm9sTsmX0QSJu0b
	 pLDOXhj6174DKFsluZUeiYgAJ9exWGOBPO8DRs+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26784F8063B; Thu,  1 Aug 2024 14:11:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 670CDF8064F;
	Thu,  1 Aug 2024 14:11:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C148FF802DB; Wed, 31 Jul 2024 17:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DC63F80269
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC63F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fhAa+WYK
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-428243f928fso22700875e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439564; x=1723044364;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FC0xYn/ikx2v85GL/8Br0D4pnaNCpqHqIy3/h9Umxsk=;
        b=fhAa+WYKa0cO1gGarWcWJ+yrLhaSpwk+dm6C6X6ZfFg8F/d8d+xuWyjZzMwbeJpN+a
         DuFa5LEjTyuCbCaaY+dH9dwPq0XhvKxh3OGP0A2jyRUM0hl1JKgQCR4wjbV+UjDvMaNp
         C+kt6Rm1LJPxzj2YG35PS+EiO1vax6vb8Ye3sCsA9ZExV84lB3lTdIwVc0Uv5qO0UY0v
         Bvhwz3jFj0YBZSTlrhw1Y+hEZGutqgIHwPSIffSBYE+BBAUBdaBLA5KIXLnRkqFb6caz
         sgfUghxkFXYTUe+irYrf4GZax+mdSgGs98Vbc+vH0w9UiN0mzC2mh1sSA6vGatiSGbWY
         TwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439564; x=1723044364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC0xYn/ikx2v85GL/8Br0D4pnaNCpqHqIy3/h9Umxsk=;
        b=C0p4qRWItcyqLiyMKMjZemmeJfm3KFHeIuEASo1lHSl44TP49jgpaEA+jLoAXFZ7v+
         FWrtjwK/mOLxMCn67PzVZIwW9maWxb9K6FHQ8IWhWsilzmqFPzj+VCrsEOHUH/eLTvuA
         V1Gf8kIw2n8feMMfmpGtSwfQWmVctBUHiwRW5Crxkau8bqJOlr0i59JUdHDY0gPYUvls
         imhcWd37ayYCiruWuneiihJhXQgoCximJZXJ9pBjSCbZ0UB6QXR4W2oUQmnRLe5xvDpf
         F8qq/WswioAsvX4YYir2h58AvNjlvJKcHhYFtlCOQVkWi0/veIvEaIRyy1eB9Pe7dWyk
         xkNA==
X-Gm-Message-State: AOJu0YzwwmcQ52n6lw8KoKw+o/VxJAOpCSrzo0GngDhYSgadBrsbXgj6
	0ITLgXa6onzjRjmIEF+t1MPOYR20viLSekmilCOeb/pMoNOkHTm5
X-Google-Smtp-Source: 
 AGHT+IGV5Tyg8OIw9jbYm8EISXLPoSoS24RYZm1S5mUY09Ep05QHPxO5cMSJU7Ibzbu5TFy9NWYQ+w==
X-Received: by 2002:a05:600c:3590:b0:426:5c81:2538 with SMTP id
 5b1f17b1804b1-42828544a87mr33856585e9.14.1722439563745;
        Wed, 31 Jul 2024 08:26:03 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:03 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:25 +0200
Subject: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RFTOMY6JAQ537QLQR4L6BMVGCTLVGKNY
X-Message-ID-Hash: RFTOMY6JAQ537QLQR4L6BMVGCTLVGKNY
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFTOMY6JAQ537QLQR4L6BMVGCTLVGKNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for configuring Quinary Mi2S interface
it will be used on MSM8953 and MSM8976 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Split from MSM8953 support patch,add msg]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..5a29adbd3f82 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -20,12 +20,13 @@
 #include "common.h"
 #include "qdsp6/q6afe.h"
 
-#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
+#define MI2S_COUNT  (MI2S_QUINARY + 1)
 
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
 	void __iomem *spkr_iomux;
+	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	int mi2s_clk_count[MI2S_COUNT];
@@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
 			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
 		break;
+	case MI2S_QUINARY:
+		/* Configure Quinary MI2S */
+		if (!pdata->quin_iomux)
+			return -ENOENT;
+		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
@@ -177,6 +184,9 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	case QUATERNARY_MI2S_RX:
 	case QUATERNARY_MI2S_TX:
 		return MI2S_QUATERNARY;
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return MI2S_QUINARY;
 	default:
 		return -EINVAL;
 	}
@@ -290,6 +300,7 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	struct apq8016_sbc_data *data;
+	struct resource *res;
 	int ret;
 
 	add_ops = device_get_match_data(&pdev->dev);
@@ -320,6 +331,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
+	if (res != NULL)
+		data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);

-- 
2.45.2

