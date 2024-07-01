Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770991D930
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BE522CE;
	Mon,  1 Jul 2024 09:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BE522CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819668;
	bh=czPn/CM/13NiJAbbrT7HCu/fRfwdImlVtdxXFtiZJ1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LqoGMbJRaaVIBqztjIs/Oz7gKgxB67/BVwWED/BSeJr6x9xYxj+ZmuRM3j9fEjk2Z
	 2NHaYVBbEqSF3wmxOS4eum3E8W8ZZO96MpgUlvpKYmUjUXnK7jlz8PF0Lp9g5FOREV
	 wDBrVMCclFrDPagB8C1/kVk7Z5pREAa3Kbxc05BA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0516F80602; Mon,  1 Jul 2024 09:40:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD528F805EA;
	Mon,  1 Jul 2024 09:40:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CC9DF805C5; Mon,  1 Jul 2024 09:40:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C2FEF8042F
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2FEF8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HhYtwk9c
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3636c572257so2047638f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819590; x=1720424390;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGvHzxmQKKMhIxfo+E0orJJbLqAKfrzT9/+PYfiLJl4=;
        b=HhYtwk9cTHLz8fc3BMuJdHpTIW9QlTYKhKf/t5LFlSRGE6HYKtYduaDJkWP+uTMpqZ
         Ngb8JTRrXPoVDvqFJDUx5xgW9a0GyBBD3lTFI402SGMmZM+ah//kbVBEgBsRlgcNX8Ln
         4i64khWoppdUSosbvuLnnLN/BOzi1F6Lp3StX8k+52jRDMLKYWyyDpFRJUGWrAgdxw6p
         kKdginMkBorPT7CNDBCv2ihA1k8p6wzcRa8MJFW1y9eErjf+r3NwVHv7ZBmKlvXo2Afo
         z4lnek53MaBJj0kuRPbAndl2IIQdtVNjfYffby4zNEDkHW9EWX8bjsQMwYlXbOiYfP8C
         D+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819590; x=1720424390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGvHzxmQKKMhIxfo+E0orJJbLqAKfrzT9/+PYfiLJl4=;
        b=KCJynao8ZiJg8L3zokaN3H+BaUj3aQ+xPBSsWbbpsllPBPUBtfm1oqn4f9ZUNDA0Ct
         AgA0Wu6wRhoKfc8iyjceysWNkk10P8UwHYyHvYoSggSOqFiUg57BeKVxJpYrRU76OjiM
         ummxUAjRjz0v1uN2CiOLJB2Pp6AWnVDKUgMAtIG/ameZnkQ19P2mV5TRD4rBJOLE73er
         ZZSFzdEt0toV6zDwwQL8kMiWhd2Oab11YzIMa0S72K/Rmn3VNFOXyniIqqlY9rQtLm24
         SAfbUrpE5MMNo008z9sFFXXwpX7lKcCZcs3zkbuuRlbD0v6L0riMxoF6J4jxrpjpNiTD
         Z03g==
X-Gm-Message-State: AOJu0YyrQtRCio/llTSK4lxmfXul4pHP5v0UpmiQVe0gYgdLcIrwOCdR
	aMIA903lGzTPR4qv/c7awn05bKBoJYVDfhG3uHya/DS5VGIzUjMUZVPNymFg9Fc=
X-Google-Smtp-Source: 
 AGHT+IEFUHmMK/zO4EhXYonANzhb1VC398eAUKhzg9PoG26Tmg8Yf/8gaFSAOmXzJqc3on/yu1St1w==
X-Received: by 2002:a5d:4d48:0:b0:35f:1d5e:e2ca with SMTP id
 ffacd0b85a97d-367756bc8c8mr3497048f8f.39.1719819590156;
        Mon, 01 Jul 2024 00:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:35 +0200
Subject: [PATCH v3 3/6] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-3-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=czPn/CM/13NiJAbbrT7HCu/fRfwdImlVtdxXFtiZJ1I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl0911QVEpEmn3e4yxo9c43S/NXMWVmdZzHgw
 lt+1KTUZOiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPQAKCRDBN2bmhouD
 1314D/9pLEdlN9cv+0mx85JAB9c8ARYBd9ncY+xyUMR4nDwAUg8uSIfnylTdfdRAGD87pVN0XYl
 tcp0+uQ9I23yWSoyjsdM1Bs8UIV8L6EKCAt38pvfyVJFdeaTHj8AndJXDl7Ki1O+7gWNpP/zVXC
 u2Wq+LHhgfgcZHbV/nD671ndzIiENpNGp6slZAWkqhqNAEC4brOpHkVEjpb13U/1ZwQilSPFIaw
 3t0HtgVQjpysrCQMNKeLRN59D1NBVwFsC43Cq7AUbobNF4t9FOTEdJx/kHymxASTdfDTydIJdjP
 +a8vq6KgBXcGN9LAqALmZsYapi6I4bTWzOM6oKmLjnOWqFNMwTuFcTeXI2Yd3eEORH4UbgLbnH9
 cIZRfYAVfpClqLXZaoYnPhNv5r5Qt1FhIIuPdI//MmfXBqzuEJyxc5NgRI+pDQReRO+/mViDe8p
 ffO1bz+KJyWHesgrS/vPT9zyOEFzSYOdSqYJjz8LQ3NJrnl164MLsbmM2owu6LzvL9Izbt8dgrs
 yciOwnj9Jsg6bYoSOn4FrYloVNh6NomNlB8Rr3PhE984sxSPkFu48TAf8/BqUi6z6pctBWC+E7L
 ZouoM3qZCjG1CkL3aBYn6RxoDun3XM0wycmP7USHs+slfdHRRNmTN6Jk1wrodDv0PR8qwkj1616
 Jdl+13eWO4IMv0Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: L75THNPJFK2PK37UFEF6SO73H5ID7N3K
X-Message-ID-Hash: L75THNPJFK2PK37UFEF6SO73H5ID7N3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L75THNPJFK2PK37UFEF6SO73H5ID7N3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has static 'struct regmap_config', which is then customized
depending on device version.  This works fine, because there should not
be two devices in a system simultaneously and even less likely that such
two devices would have different versions, thus different regmap config.
However code is cleaner and more obvious when static data in the driver
is also const - it serves as a template.

Mark the 'struct regmap_config' as const and duplicate it in the probe()
with kmemdup to allow customizing per detected device variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 638f3995a364..d4d7e02db83f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1663,7 +1663,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static struct regmap_config rx_regmap_config = {
+static const struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
@@ -3847,10 +3847,16 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rx_regmap_config.reg_defaults = reg_defaults;
-	rx_regmap_config.num_reg_defaults = def_count;
+	struct regmap_config *reg_config __free(kfree) = kmemdup(&rx_regmap_config,
+								 sizeof(*reg_config),
+								 GFP_KERNEL);
+	if (!reg_config)
+		return -ENOMEM;
 
-	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+	reg_config->reg_defaults = reg_defaults;
+	reg_config->num_reg_defaults = def_count;
+
+	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
 	if (IS_ERR(rx->regmap))
 		return PTR_ERR(rx->regmap);
 

-- 
2.43.0

