Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138ED942998
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038532BF0;
	Wed, 31 Jul 2024 10:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038532BF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415839;
	bh=PMtw6Te5sj/TrlbW9514sz7eS62gjeUYCJGHpfh1FaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yx+RcDZe37ZEmSkf1usOS89VDIdO9C0mNNSujzfEMei13SZGzwgxwk52TuQlHCs9K
	 +TW3D+ogT94+vrJRksoi/aGSbKQW5yeF4PEP0YpoTAppvtuR/nO8ObTxnzNYH2Tdl/
	 3N9aL2xzgcdWBi1xw/lsVvr2U4IID5zNZ0SV/GNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62CC0F80624; Wed, 31 Jul 2024 10:49:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCEAEF80613;
	Wed, 31 Jul 2024 10:49:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A053F800AE; Sat, 27 Jul 2024 20:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,TIME_LIMIT_EXCEEDED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A247F800AE
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 20:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A247F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EnRgsL+I
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so34920571fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104447; x=1722709247;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zam71Ol4yolcRCdgG2yrrm07LDlzniNh9XTYbPohag=;
        b=EnRgsL+I26QLK6sEPH5MnaAOwljmt1UluO2AHsauYW3GgG82id25Yb5O3skLCTA2ZR
         GEAeJRWzrx2mJCg3AQjrtfAmi7QBJtaEexxWQUEemUoD3TwqodZPq8BrFfp5agJo9aej
         zKLxUrl75bdQcRtlInkqoMFlJR7ChuLnn7Fvq2AzBUtUL/spUSt6wMxpzbwLdtWtW269
         D2G2aCmiXQfLKRtsCFWsqz9vLrQQsY5/DOciXqVSD9Nmf3/g6gOGnzzn0xMqAWbZChHu
         TFEkJqAsf283rxpN/K/WXPOgmW3K8nKBS7rX/hg+Q48g559zQ0dk7+xBQFbfU3+/foV7
         6MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104447; x=1722709247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zam71Ol4yolcRCdgG2yrrm07LDlzniNh9XTYbPohag=;
        b=Jl0LfhPnizbcvcKdtU+wPfOgHJ7VQHrF1RRN/IFBUiSiodiPA6tof6jKJGB5Z25qiV
         uxZljUkk7rw/8WiaS7fyVQrcWdy6/jBakeow5PSUGuuE+t+BBjykTnT+11fyFmRfkTsn
         WBB0IO3Prhc+zDUXIaX9OdH9dWSdMpa0q8vTusmQiHRPpVa2NjxIdVNDTb/hoS9FLLbj
         Zi+IIWBuRTgqG6RMR3lw5EPBQ4HE2de2ra3xrAvvqbLM94b9rrDRombi6RkcxilbpUkK
         9MrSmr3qwqp2qCQUkzaKB0Dkockc+ytXUjkyHq6mCGDRmun+m0NJ+6jQxxoFau4SZ7N3
         LK1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw5m0BTwXvLgjE73XfFPossw2ARXVnWsuO+NyRvaDSmyQTIFXOP4/fs/ciNO1SCXHtd/oTd5ly7ACLjXsqBi0WQXP43eKPHqcrr/M=
X-Gm-Message-State: AOJu0YwSnLnsEUA1O3OtUxTkF+2eMSvRqETrhlbxLaXOX1jZhAVzw6U1
	OZuc/mENnxh8oKFIfAhSgdqn++Ula3r1ywG0jMnzV6xRpIpXSrho
X-Google-Smtp-Source: 
 AGHT+IGvyLQim7JK45a/ba9q00AzQhJejT77FSBr2xSMgFq12bEECWsvmkm1dvXC4saab8Kw2Ycm7g==
X-Received: by 2002:a2e:be8f:0:b0:2ef:228a:1b86 with SMTP id
 38308e7fff4ca-2f12edd5328mr20892951fa.21.1722104446584;
        Sat, 27 Jul 2024 11:20:46 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl.
 [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:46 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Date: Sat, 27 Jul 2024 20:20:24 +0200
Message-ID: <20240727182031.35069-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W2WFI232QN7ARF4466XCVQI24YFS3O2V
X-Message-ID-Hash: W2WFI232QN7ARF4466XCVQI24YFS3O2V
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:48:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2WFI232QN7ARF4466XCVQI24YFS3O2V/>
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
 sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..303dd88206b1 100644
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
@@ -320,6 +331,9 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
+	data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);
-- 
2.45.2

