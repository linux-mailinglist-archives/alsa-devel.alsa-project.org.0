Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DF8BDFC8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 12:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04096208;
	Tue,  7 May 2024 12:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04096208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715077907;
	bh=Yd5y0XTCc1hyaa/GdghPWKfW395tAOrPQ+3gt73tVPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kUv7x4nhpmQHip8RJsT9yT3oEA+fJlkhSgHEV7QLG3L0HfL8a75t2Z3+B5eUfZEkz
	 b4fq6+7FxA+P4N/94eoz1hQaDTYX4ySAdQtNEu3f1kglb42UsnY7+zIx8CO5uCLmwx
	 GudDz/JmlWNPKpbSLfrOjQ6Mp1Im5Vi8gXug38XI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8CAFF805E4; Tue,  7 May 2024 12:30:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30144F805E3;
	Tue,  7 May 2024 12:30:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F9B4F8049C; Tue,  7 May 2024 12:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF5EBF80423
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 12:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF5EBF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CfSkDnrh
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5210684cee6so1224420e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715077665; x=1715682465;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3ijywAq87DR82i6I0xJ7qUn776Qu12Oxhv6aBLe9MI=;
        b=CfSkDnrhSmMUbWg/RC1ZJ8TGzm52XGqU+yD0KsAlyaEHpauYuYRhPtB8q/Jm7Lf3/R
         jVmwcRuaTojIa9qtvdKylU8NYjLjM8Xjm4MSPws2ZrkGv9/5HpRKUM4dcj5QdGYfs3Mo
         CZ64DXuIg/MBylm69+L2eHfA3ZR2p6KD+clDjGqMRAO7aGVW77uINVbbbNfnpfJ5VNe7
         WJpXh7/ngRqNcw/9WcAh18XCL3VFe6GNX/hEQ6JG9Lt9l/8uAjRPglywLMhwQyfBv5Zv
         Oh7z9a7FewmK30gxEaBsXvwtw0XCJ1od7agHTHCeejJOcenqhXzQinxwRfG2QIX5zFKu
         ffRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715077665; x=1715682465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3ijywAq87DR82i6I0xJ7qUn776Qu12Oxhv6aBLe9MI=;
        b=mNC4A11XaIecsyR50RIA5dPJJ+SfaQ3QVM2k7+24JdViXTEIcDT1gXyowJ2bcWZ8PA
         OMTNjsKhxfrjUsN/uOsPJaqMhQPP+UxdFwsNGq6VzabQ25f3GzRe9vuAe6Zhnay1n/He
         gjPu6mAfK16yMV29p7fSXmfYyjDyed4zQdCHvBQQKSxP2r6mTh/2xujIQEu4LcjGGk6H
         FyOhgC04aF4MQZHxYOGR38utpPs9skOaHWXVYCjOFY/eJQgaDR98bYWB9OgVNbLK82M9
         eYiYlOAc7LMiIwKm5iMFUtXxE2zqithYCKldh8H0+pmcp3fUkDHePWfIMmlJh4ZS7Xgm
         kbQg==
X-Gm-Message-State: AOJu0YyrpHANaoR+PKZVmZSMbpfk5W6uH5N4rA4UnRBMD7Wc94b3N5za
	m8sIAE/BrGwNBV9Hgamh77YMsQ2klSwbu7x05Q+3FWp03MPbkjMdsnVp6vCv30Q=
X-Google-Smtp-Source: 
 AGHT+IFyRrIkyKNovHNJaD44VkmQvzSWnGl9GuIzIVGcT3FmHg9oNUq+xd4XDCn3zqRxUQ4eg1wHmA==
X-Received: by 2002:ac2:5a07:0:b0:51f:601f:cbae with SMTP id
 q7-20020ac25a07000000b0051f601fcbaemr6825817lfn.56.1715077664695;
        Tue, 07 May 2024 03:27:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 bo15-20020a170906d04f00b00a59b87dd0bbsm3370093ejb.161.2024.05.07.03.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 03:27:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 07 May 2024 12:27:30 +0200
Subject: [PATCH 1/4] ASoC: Constify channel mapping array arguments in
 set_channel_map()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-1-b12c13e0a55d@linaro.org>
References: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10004;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Yd5y0XTCc1hyaa/GdghPWKfW395tAOrPQ+3gt73tVPA=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGY6AhqjPjPYMuBMBQmWEKYRtlETMg2edTTBzYwajHo269E+m
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmOgIaAAoJEME3ZuaGi4PXx7YP/ik6
 YYkvFP7txSD3qyRPfcYSysD73XwMxoha2BQR2w5rpCwjn0XOzLCmLXUVYYPk38GCJX/WnACOCNV
 jU9DCCvuUDbX1fAFkzL7ZUY2m5TwP/rl5d0hyQyqGLvqZqjU9H6arlCiqtfJewZlbtCq/q5wkYJ
 L7d2yYvM9zPsDNircjnKYhQutsNHjCNx+9dHLe80riOCsSW8K7nEM2pCAdBKFsfWlN/1fy5tpCN
 gT/C5qnY0dx70ATHEkx125PCs92MA/DeJNNO+1A6sgdWZYrgRa7qZL2lsaHKxT2u8JYhgZYmZxK
 TcL28FDky7lKGZByHWyAZcdZzPCTW3I7M9w7K2Vh/sK4LT8lkOjsPIqES6oG0N3DKzoslWaPWpN
 PWePIikrRIg17SYRvegSEgTSYRg+KhAlRkD1T5n0tTytuQa5quJ7/YX6h68+F3i5n/DmpnPKqdw
 G+uYu6qdz7rgsIpU7PNc/+fMISMN5br7AaJBO+LJyv5o+gXhi4AUoc8vYoXMdFhZ/GdKRezfEky
 +2qyT3Vwn/thTwjaQZz4oo7FWJjxR7zWDHKWGPvPkPfyBsxhnW10JyXMvF18nruH33oFJl9M4fC
 xTPnEXETfosHV2r7Zh+q27FuaCRw6dSRWeH9aJmuZPRffvTioEYkzjmV5m3oz7G9XaRzdKzghZE
 qnqJY
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 5N3BIJGC247R5ECYFJ5RBVMJIYWKS2BY
X-Message-ID-Hash: 5N3BIJGC247R5ECYFJ5RBVMJIYWKS2BY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5N3BIJGC247R5ECYFJ5RBVMJIYWKS2BY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no need for implementations of DAI set_channel_map() to modify
contents of passed arrays with actual channel mapping.  Additionally,
the caller keeps full ownership of the array.

Constify these pointer arguments so the code will be safer and easier to
read (documenting the caller's ownership).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/cs35l41.h                 |  4 ++--
 include/sound/soc-dai.h                 |  8 ++++----
 sound/soc/codecs/adau7118.c             |  6 ++++--
 sound/soc/codecs/cs35l41-lib.c          |  4 ++--
 sound/soc/codecs/cs35l41.c              |  3 ++-
 sound/soc/codecs/max98504.c             |  6 ++++--
 sound/soc/codecs/wcd9335.c              |  6 ++++--
 sound/soc/codecs/wcd934x.c              |  6 ++++--
 sound/soc/qcom/qdsp6/q6afe-dai.c        | 16 ++++++++++------
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  6 ++++--
 sound/soc/soc-dai.c                     |  4 ++--
 11 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index bb70782d15d0..43c6a9ef8d9f 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -896,8 +896,8 @@ int cs35l41_test_key_lock(struct device *dev, struct regmap *regmap);
 int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap);
 int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsigned int reg_revid);
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
-			 unsigned int tx_num, unsigned int *tx_slot,
-			 unsigned int rx_num, unsigned int *rx_slot);
+			 unsigned int tx_num, const unsigned int *tx_slot,
+			 unsigned int rx_num, const unsigned int *rx_slot);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
 void cs35l41_configure_cs_dsp(struct device *dev, struct regmap *reg, struct cs_dsp *dsp);
 int cs35l41_set_cspl_mbox_cmd(struct device *dev, struct regmap *regmap,
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index adcd8719d343..15ef268c9845 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -188,8 +188,8 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
-	unsigned int tx_num, unsigned int *tx_slot,
-	unsigned int rx_num, unsigned int *rx_slot);
+	unsigned int tx_num, const unsigned int *tx_slot,
+	unsigned int rx_num, const unsigned int *rx_slot);
 
 int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
 
@@ -305,8 +305,8 @@ struct snd_soc_dai_ops {
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
-		unsigned int tx_num, unsigned int *tx_slot,
-		unsigned int rx_num, unsigned int *rx_slot);
+		unsigned int tx_num, const unsigned int *tx_slot,
+		unsigned int rx_num, const unsigned int *rx_slot);
 	int (*get_channel_map)(struct snd_soc_dai *dai,
 			unsigned int *tx_num, unsigned int *tx_slot,
 			unsigned int *rx_num, unsigned int *rx_slot);
diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index a663d37e5776..abc4764697a5 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -121,8 +121,10 @@ static const struct snd_soc_dapm_widget adau7118_widgets[] = {
 };
 
 static int adau7118_set_channel_map(struct snd_soc_dai *dai,
-				    unsigned int tx_num, unsigned int *tx_slot,
-				    unsigned int rx_num, unsigned int *rx_slot)
+				    unsigned int tx_num,
+				    const unsigned int *tx_slot,
+				    unsigned int rx_num,
+				    const unsigned int *rx_slot)
 {
 	struct adau7118_data *st =
 		snd_soc_component_get_drvdata(dai->component);
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index e9993a39f7d0..1702f26049d3 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -936,8 +936,8 @@ int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsign
 EXPORT_SYMBOL_GPL(cs35l41_register_errata_patch);
 
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
-			 unsigned int tx_num, unsigned int *tx_slot,
-			 unsigned int rx_num, unsigned int *rx_slot)
+			 unsigned int tx_num, const unsigned int *tx_slot,
+			 unsigned int rx_num, const unsigned int *rx_slot)
 {
 	unsigned int val, mask;
 	int i;
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index cb25c33cc9b9..1688c2c688f0 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -673,7 +673,8 @@ static const struct snd_soc_dapm_route cs35l41_audio_map[] = {
 };
 
 static int cs35l41_set_channel_map(struct snd_soc_dai *dai, unsigned int tx_n,
-				   unsigned int *tx_slot, unsigned int rx_n, unsigned int *rx_slot)
+				   const unsigned int *tx_slot,
+				   unsigned int rx_n, const unsigned int *rx_slot)
 {
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(dai->component);
 
diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
index 93412b966b33..6b6a7ece4cec 100644
--- a/sound/soc/codecs/max98504.c
+++ b/sound/soc/codecs/max98504.c
@@ -220,8 +220,10 @@ static int max98504_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 static int max98504_set_channel_map(struct snd_soc_dai *dai,
-		unsigned int tx_num, unsigned int *tx_slot,
-		unsigned int rx_num, unsigned int *rx_slot)
+				    unsigned int tx_num,
+				    const unsigned int *tx_slot,
+				    unsigned int rx_num,
+				    const unsigned int *rx_slot)
 {
 	struct max98504_priv *max98504 = snd_soc_dai_get_drvdata(dai);
 	struct regmap *map = max98504->regmap;
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index deb15b95992d..42a99978fe5a 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1983,8 +1983,10 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static int wcd9335_set_channel_map(struct snd_soc_dai *dai,
-				   unsigned int tx_num, unsigned int *tx_slot,
-				   unsigned int rx_num, unsigned int *rx_slot)
+				   unsigned int tx_num,
+				   const unsigned int *tx_slot,
+				   unsigned int rx_num,
+				   const unsigned int *rx_slot)
 {
 	struct wcd9335_codec *wcd;
 	int i;
diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index de870c7819ca..fcad2c9fba55 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1923,8 +1923,10 @@ static int wcd934x_trigger(struct snd_pcm_substream *substream, int cmd,
 }
 
 static int wcd934x_set_channel_map(struct snd_soc_dai *dai,
-				   unsigned int tx_num, unsigned int *tx_slot,
-				   unsigned int rx_num, unsigned int *rx_slot)
+				   unsigned int tx_num,
+				   const unsigned int *tx_slot,
+				   unsigned int rx_num,
+				   const unsigned int *rx_slot)
 {
 	struct wcd934x_codec *wcd;
 	int i;
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a9c4f896a7df..7d9628cda875 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -172,8 +172,8 @@ static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
 }
 
 static int q6tdm_set_channel_map(struct snd_soc_dai *dai,
-				unsigned int tx_num, unsigned int *tx_slot,
-				unsigned int rx_num, unsigned int *rx_slot)
+				unsigned int tx_num, const unsigned int *tx_slot,
+				unsigned int rx_num, const unsigned int *rx_slot)
 {
 
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -250,8 +250,10 @@ static int q6tdm_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
-				 unsigned int tx_num, unsigned int *tx_ch_mask,
-				 unsigned int rx_num, unsigned int *rx_ch_mask)
+				 unsigned int tx_num,
+				 const unsigned int *tx_ch_mask,
+				 unsigned int rx_num,
+				 const unsigned int *rx_ch_mask)
 {
 
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -407,8 +409,10 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 }
 
 static int q6slim_set_channel_map(struct snd_soc_dai *dai,
-				unsigned int tx_num, unsigned int *tx_slot,
-				unsigned int rx_num, unsigned int *rx_slot)
+				  unsigned int tx_num,
+				  const unsigned int *tx_slot,
+				  unsigned int rx_num,
+				  const unsigned int *rx_slot)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct q6afe_port_config *pcfg = &dai_data->port_config[dai->id];
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 68a38f63a2db..6bfbb52345e1 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -25,8 +25,10 @@ struct q6apm_lpass_dai_data {
 };
 
 static int q6dma_set_channel_map(struct snd_soc_dai *dai,
-				 unsigned int tx_num, unsigned int *tx_ch_mask,
-				 unsigned int rx_num, unsigned int *rx_ch_mask)
+				 unsigned int tx_num,
+				 const unsigned int *tx_ch_mask,
+				 unsigned int rx_num,
+				 const unsigned int *rx_ch_mask)
 {
 
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index fefe394dce72..03afd5efb24c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -304,8 +304,8 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
  * configure the relationship between channel number and TDM slot number.
  */
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
-				unsigned int tx_num, unsigned int *tx_slot,
-				unsigned int rx_num, unsigned int *rx_slot)
+				unsigned int tx_num, const unsigned int *tx_slot,
+				unsigned int rx_num, const unsigned int *rx_slot)
 {
 	int ret = -ENOTSUPP;
 

-- 
2.43.0

