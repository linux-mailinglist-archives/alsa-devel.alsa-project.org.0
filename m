Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D1847389
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 16:42:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D61DEA4D;
	Fri,  2 Feb 2024 16:42:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D61DEA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706888548;
	bh=zlLIb0qKsjq730g/1cSkyRa9Pks3D7J4TqPjUvmN+gU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CGPeIwuY5PCD0gce7gObhXpFkNFvTDGbgML6h9ePMUiirAusEMphy0faULfs+eUwL
	 QsNzQkXFP6AzlP35erfQfgaLWgM3R35MQe677buW/0OuXTvdn7K5bx+01/fi1hvt7k
	 VTObpoCsqUy30pGewOt8BklEQ8HOxvICQ5H1eoGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87C6AF805A1; Fri,  2 Feb 2024 16:41:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA55F8055C;
	Fri,  2 Feb 2024 16:41:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84B10F80567; Fri,  2 Feb 2024 16:41:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC30AF8055B
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 16:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC30AF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O6SrXSt9
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5113303e664so1691714e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Feb 2024 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706888499; x=1707493299;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4wtSxCTFL8J3xb+0hRT7NhxX/uKEWkZYK0/+CsMczk=;
        b=O6SrXSt95MOgqppRHZXRpjhE3JsbZXPJ8/vTnyEP/FSDssFZRB7nmel2fy/E+fk/tu
         MkgngNjbfwyjAApJ5m72XeuHJ9JJjXPjIs/xlOcF1iUEaPPepK5b5NZQvsZQnD0YdvkL
         Vl2zba54zELo/nXjifPdUZ7Mc1xa11L8YbUmApAuKKA30BSk1u0JwngLYph6pU2NDCj9
         l/flAQwS4Uvi7DaiKcsY4Dt5fYcn/PZuUsmcOBBhshszuI0u5OwGIDIc6WjN7Pn/xKQF
         WtwxsBFnIlZT+x8xTT9M/hghj6/fh8Y4orfSjgEffSdsUtD5yV1cn3fIvVqM3s2lAG/k
         4hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888499; x=1707493299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4wtSxCTFL8J3xb+0hRT7NhxX/uKEWkZYK0/+CsMczk=;
        b=RLAEP4/jdCMOuFoVpt6XIKYg0ll4B0iOK8IzMo8zRN01Lg+pIC3qJBg1R70pQfR9Qe
         /+6iyQk5eSnx1x8bf0q9tYtMUwX82pQ8IdY9BGxA5PjQYR5qFZe0D2Pd1vQjTEOZMxtZ
         sRRivudEREplD7W+VtiYOhc9BHm63RtNWbcjpimNaAKvDTFYygM6q+i4/iswLH7JNai7
         iS1FzghMpszx4Lb0F/saUY+M+0d4LN7xFDlS8j70WP626WLniZRB2OpNDNaDPv0lTfp0
         DYVjle3oOe7ceJ/8WwfSFte8aXnsArHCQHNNllXT93BYZCgQqB/+bxa4+zVUtgEO9DAY
         V9Jw==
X-Gm-Message-State: AOJu0Yx65gzYnsmOtriuE0W8qdByPvMBR7/SfNJewEyNanEbBuOu/aLm
	JP9s9kT3830AqOp5xKwP/nv5Utf2BS1CrcAoidYz9Ul8M2T94nydbXaGOakkyfg=
X-Google-Smtp-Source: 
 AGHT+IGvZgNljdQJeXEnx1Bcsyc/p36FoHZO0vYXUyxE28XL740l3VgIeyf1ign+KzPUYPjVCMqyKg==
X-Received: by 2002:ac2:5969:0:b0:50e:9f5f:a78e with SMTP id
 h9-20020ac25969000000b0050e9f5fa78emr4073298lfp.5.1706888499418;
        Fri, 02 Feb 2024 07:41:39 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVdCsvT7bvaPBStGioEEtBDj7FwEfmLDYxyWNjLHFW21Nw1QSXeO9h8VrqoxGPwvciCqCBqmjK6SMXjJBFfE4g9884EinjfNx8XYvNK5o9Pf8z9ZQDWvMtK6s1gwdWJE5Ic8BFpG+DO/QhK7JLRHQQ2M89fiOQuvAPrjHpsoFzRrQiqrTYNzCsTlONBkUT6DXmPqKh2DKqWh+b0AfiRyXbXlj690POw9IRh/iz2ybEDyYJqFUujU3j6DC/ETDPdjfqYFtsDvxIXt700oIq7MbrnDBCa+aaUwl1dQ/aqDvj2bVjAcVNd
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a37116e2885sm624819ejd.84.2024.02.02.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:41:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ASoC: codecs: tx-macro: Drop unimplemented DMIC clock
 divider
Date: Fri,  2 Feb 2024 16:41:32 +0100
Message-Id: <20240202154134.66967-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
References: <20240202154134.66967-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6XW7ZEH6MO7PVG5H2OKSCO6KMYL5HHLB
X-Message-ID-Hash: 6XW7ZEH6MO7PVG5H2OKSCO6KMYL5HHLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XW7ZEH6MO7PVG5H2OKSCO6KMYL5HHLB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Downstream driver configures DMIC clock rate through the divider
register but only parts of this code ended up in the upstream driver: we
always write the same value 0, so DIV2.  Same default value is used also
for the AMIC rate control.

Let's make it obvious and drop unneeded parts of the code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 124c2e144f33..cdceccf64ac8 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -38,6 +38,8 @@
 #define CDC_TX_TOP_CSR_I2S_RESET	(0x00AC)
 #define CDC_TX_TOP_CSR_SWR_DMICn_CTL(n)	(0x00C0 + n * 0x4)
 #define CDC_TX_TOP_CSR_SWR_DMIC0_CTL	(0x00C0)
+/* Default divider for AMIC and DMIC clock: DIV2 */
+#define CDC_TX_SWR_MIC_CLK_DEFAULT	0
 #define CDC_TX_SWR_DMIC_CLK_SEL_MASK	GENMASK(3, 1)
 #define CDC_TX_TOP_CSR_SWR_DMIC1_CTL	(0x00C4)
 #define CDC_TX_TOP_CSR_SWR_DMIC2_CTL	(0x00C8)
@@ -270,7 +272,6 @@ struct tx_macro {
 	struct clk_hw hw;
 	bool dec_active[NUM_DECIMATORS];
 	int tx_mclk_users;
-	u16 dmic_clk_div;
 	bool bcs_enable;
 	int dec_mode[NUM_DECIMATORS];
 	struct lpass_macro *pds;
@@ -743,7 +744,6 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	unsigned int val, dmic;
 	u16 mic_sel_reg;
 	u16 dmic_clk_reg;
-	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	val = ucontrol->value.enumerated.item[0];
 	if (val >= e->items)
@@ -793,7 +793,7 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 			dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
 			snd_soc_component_write_field(component, dmic_clk_reg,
 						CDC_TX_SWR_DMIC_CLK_SEL_MASK,
-						tx->dmic_clk_div);
+						CDC_TX_SWR_MIC_CLK_DEFAULT);
 		}
 	}
 
@@ -882,7 +882,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 
 				snd_soc_component_write_field(component, dmic_clk_reg,
 							CDC_TX_SWR_DMIC_CLK_SEL_MASK,
-							tx->dmic_clk_div);
+							CDC_TX_SWR_MIC_CLK_DEFAULT);
 			}
 		}
 		snd_soc_component_write_field(component, dec_cfg_reg,
-- 
2.34.1

