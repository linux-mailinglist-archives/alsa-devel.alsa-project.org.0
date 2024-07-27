Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DE94299A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9AAA2C16;
	Wed, 31 Jul 2024 10:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9AAA2C16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415872;
	bh=5zVSTCeiMxOBFFg5PrNZbHTDjaRaeLpoeIwBE9Am3N4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9Ze6yQuRPSEIC9WsCKqq2wghLpY1FPj1VYOdLNfilx1MRzejyXne8m3OAlz1x4Ql
	 tVrPtfi+qNW0B3XunsN0RKysGqXma7fMx/GZKJoo0c1yg7omev0pAMkz4BSauE9mYz
	 xxTn5H+XAAL9FbgBMKdDB8uU15n1m6umXfWMnBGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A236F805D8; Wed, 31 Jul 2024 10:49:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B1BF80686;
	Wed, 31 Jul 2024 10:49:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7699EF8026D; Sat, 27 Jul 2024 20:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A1B4F80482
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 20:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1B4F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A4KVxWqJ
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so34922331fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 11:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104458; x=1722709258;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqaxMQ0ue5RjoXRCR/HykfXlaIjq8MZY6Aig5hFF/Rw=;
        b=A4KVxWqJ6QoyGPN4sgUBPqN1A/NX+T9NRQWTapT0s2XLE+p3rMv1Us/loa1mNP9Phl
         bHpZ3eQ6vxZfX9yzeRJr2MHkxGcf3t8ZwgkvGPpAZ8x9jIdGL3XP+QGmBZ6RPEUh53Ig
         hhoqzEVzHwpNDdz+5f+DkIlUYiHtds6xQDt0jrNUriPnZMh94uZn2wy4G3jfcdFTDDir
         HlVlEzqaC/QtH3qRnLxiKF7ouP9kUN3hmBujdbowted90MN4kQSAPxBPqaB46J5tySTC
         rjgffrzEZXm7fE2X5w+9c9+/10PKGCLl6fcfn41Cj3W69sstnMBNOB4Jbf6fvddJRtTt
         mkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104458; x=1722709258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqaxMQ0ue5RjoXRCR/HykfXlaIjq8MZY6Aig5hFF/Rw=;
        b=v/RLx4C3twaLjI5mNIKibKoIaQcLIJ+9joXq1Ty0nmh4BRFoHQgUSpGneVF6jd3f9J
         XkRSDO3kU9YlJVFRsVUj2DMlBuPdTIN4cocLUBa/g6JVvz/M7MiQ67C4jn4ncGWs5BTm
         2JLpiddtvNG2qAaimUvjuCqT2swFkaMS5ABNxdYwqw6GcsJczeBm66uhtJHwxzT69epA
         2BQ+9qPZd5f3XX0zklS/g8K3XzeOJoL3ERoj0QODXZAqIEUxcR4l+47ObvE3xzRfz0zH
         1O//4u89y94cilUPBX5I93schiVxitwceWmJT8umVzdh5WiBwGi6p3q8yJFOnHylnR/M
         iFlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfswz4+npfyKojQwecXwtBuSIvI7s0/8AVVVKhd+KPpjxEjbAsF1osvkwGABjL2kMV35UNpkusKPNlNt1dT5uTtHtxNQBHQCWpTqE=
X-Gm-Message-State: AOJu0YxLNtn395dyYVCYgX9lPDER7kDpoee1nk/3N1h08YbvV9Nxq1Hi
	Dvcj9aHlOLTSB/i7MSmV4adHER5zzoYqniH8BouikDuvfbukZ+C+
X-Google-Smtp-Source: 
 AGHT+IGbBdJtk3eIEo/RH3d6bKcSiI0SsWpJ+V+kkSG9Ok71l+0sMc9Cw5SGvtCbjRPh+gvKYM/Y9Q==
X-Received: by 2002:a2e:990e:0:b0:2ef:24e0:633b with SMTP id
 38308e7fff4ca-2f12ecd42d4mr19809041fa.19.1722104458102;
        Sat, 27 Jul 2024 11:20:58 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl.
 [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:57 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: qcom: apq8016_sbc: Add support for
 msm8953/msm8976 SoC
Date: Sat, 27 Jul 2024 20:20:27 +0200
Message-ID: <20240727182031.35069-5-a39.skl@gmail.com>
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
Message-ID-Hash: OYIJMN44YZED7HOYIYRXPPAJC2OTN2X6
X-Message-ID-Hash: OYIJMN44YZED7HOYIYRXPPAJC2OTN2X6
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:48:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYIJMN44YZED7HOYIYRXPPAJC2OTN2X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Introduce support for audio card on MSM8953/MSM8976 platform.
Main difference between those two is Q6AFE CLK API supported by firmware
which influence way we enable digital codec clock.
Either inside machine driver or outside via q6afe-clocks driver.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add MSM8976, rename functions, add mclk setting,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 68 ++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 303dd88206b1..453ca4795603 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -22,6 +22,11 @@
 
 #define MI2S_COUNT  (MI2S_QUINARY + 1)
 
+enum afe_clk_api {
+	Q6AFE_CLK_V1,
+	Q6AFE_CLK_V2
+};
+
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
@@ -29,6 +34,8 @@ struct apq8016_sbc_data {
 	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	enum afe_clk_api q6afe_clk_ver;
+	bool dig_cdc_mclk_en;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -192,6 +199,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	}
 }
 
+static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
+{
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
+		switch (mi2s_id) {
+		case MI2S_PRIMARY:
+			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+		case MI2S_SECONDARY:
+			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+		case MI2S_TERTIARY:
+			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+		case MI2S_QUATERNARY:
+			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
+		case MI2S_QUINARY:
+			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+		default:
+			break;
+		}
+	}
+	/* If AFE CLK isn't V2 return V1 */
+	return LPAIF_BIT_CLK;
+}
+
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -214,8 +243,17 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
+	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,9 +274,16 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+	}
+
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -279,6 +324,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
+static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
+	msm8916_qdsp6_add_ops(card);
+}
+
+static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
+	pdata->dig_cdc_mclk_en = true;
+	msm8916_qdsp6_add_ops(card);
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -343,6 +405,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
-- 
2.45.2

