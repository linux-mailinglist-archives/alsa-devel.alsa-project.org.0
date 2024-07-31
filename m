Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3C944B09
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ABF63F43;
	Thu,  1 Aug 2024 14:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ABF63F43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514365;
	bh=ue+vpUOG4ZnyGYEi2iXto0ytfCqxL7uNzt6OO5tHUHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EbRE/dvLronmuyzAf9g+O9oJdOXBQxi44QNfUpHhg9+kRkaofUQMaOqIYUNPbqfT3
	 ZkkEaT+jp7jdnMeREupmGl8qP/HwAWEXJKlyyJfjIlBSDAMsJwhu9LZ4JO77hnu8H1
	 oAkotgUE/Id7PUp5bKZtyY1uXD8g4iQzeoPM30gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13C1FF8061E; Thu,  1 Aug 2024 14:11:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5378AF8061A;
	Thu,  1 Aug 2024 14:11:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86DBAF80588; Wed, 31 Jul 2024 17:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECD9BF8057A
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD9BF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CvVae2qp
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so49299335e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439574; x=1723044374;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7acxoGv0kNGN7BdTg0LbHlXp+SwEqZuAjJ2EFuphzY=;
        b=CvVae2qp76CSU1enShOqEpv0O/QXAB7SB/qrbDdVuja9lVGJiK0M7GWD0GdOGWf9qi
         kG0aaHmAd+j9e6wO/u3prPEQYJ0z2Apn0dHK87fvhWhQsi8mSOYOOpWi21mT9veCebkn
         JF+vsGYQWwc9wiaayz62UVyfDu4b2muMkC6KNmvklThfLrYATGt2lgaTA0r4oHMp1TyZ
         qc1TLdyUqNnBV5PiRs8Yz/y8ys/BxxncTZeNDCtqlZItPzPYYj0O9U3KzqlWO2PInpjG
         3Tk1t9MR8DjSWYGeufgI8sJzC5h80SqnKrN18Na7+eNfD4EH0LthnDbdmlIVuIK4Aiqb
         I4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439574; x=1723044374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7acxoGv0kNGN7BdTg0LbHlXp+SwEqZuAjJ2EFuphzY=;
        b=C5e2gIpFhfaNX5nlRPF8oOEG3w0hXY7lcnN0aOOGWfiPRVu1bisCEQ+0frtCBw8UvN
         Obl1nHDAwXjqn+ZZznxviRGNJh/1pXynMMS0trn/s/3YUMy9Kgzuiu5Thwh/ewtuWaxA
         F8dCM1MynJ+xburz99B2ZZm3mFJQtt/ue7/5zOgOQK9Pjns2KKPCBeUO2QksOPHtrBsh
         eKeoNUKwNxnyFYMxojXPRIloXKoLGXJZJakmHJBJgANtg8u+yvMZNPcCg30gLntSvqct
         zLPTIbiUEfWqcu7zlreAS6pi3GF0uOuK3dAlOA2XO5jONcL4DP8Lo3/u2XYKQW95a7+F
         gBkw==
X-Gm-Message-State: AOJu0YxEkJfLwS+g5q6ipzIHxPHN2chvvdirfncupuxunnjsJI5tY7/F
	f3AaZipNI3KT030njxLSTPj1JYa2tYYrGE4Qd4psL1Em7gc3cUUY
X-Google-Smtp-Source: 
 AGHT+IEudtEsD9vtF73wmt/UCZjRipmWNhTtdiBDvrtFMRz0YZRF3+kCI0jf70h7wmb2E3E950aO3g==
X-Received: by 2002:a05:600c:198b:b0:426:6b14:1839 with SMTP id
 5b1f17b1804b1-42811a9886fmr139704645e9.0.1722439574189;
        Wed, 31 Jul 2024 08:26:14 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:13 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:30 +0200
Subject: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
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
Message-ID-Hash: XGFPHCXPDDX5HA7JI3W3SHX4WKOKJOSV
X-Message-ID-Hash: XGFPHCXPDDX5HA7JI3W3SHX4WKOKJOSV
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGFPHCXPDDX5HA7JI3W3SHX4WKOKJOSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Introduce support for audio card on MSM8953 platform.
Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
supported by firmware which influence way we set codec clocks.
SoCs shipping on at least msm-3.18 should use v2 clocks.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename functions, add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 5a29adbd3f82..3ed35beb671a 100644
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
@@ -29,6 +34,7 @@ struct apq8016_sbc_data {
 	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	enum afe_clk_api q6afe_clk_ver;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -192,6 +198,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
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
@@ -215,7 +243,7 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,7 +264,7 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
 }
@@ -265,10 +293,12 @@ static int msm8916_qdsp6_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
 	int i;
 
 	/* Make it obvious to userspace that QDSP6 is used */
 	card->components = "qdsp6";
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
 
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm) {
@@ -279,6 +309,14 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
+static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	msm8916_qdsp6_add_ops(card);
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -344,6 +382,7 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);

-- 
2.45.2

