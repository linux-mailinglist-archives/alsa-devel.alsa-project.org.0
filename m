Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A725AF1C7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028D486E;
	Tue,  6 Sep 2022 19:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028D486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483979;
	bh=6vAtZDUhBzhzWcbyEDHHtQVO/kmEGrlxrzpY+OSIcxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4cTDfdSd+CjX9U6JZ7nNrKvlxmZH+RwL/qZqqhTcHQ9ceyoWAopfSgQEZDQrIOPJ
	 9klNMwlMnK6SA2lmemxwxjsiYrbAG49I+Tehf+OFxDP8s37HA1ByvgSHzG7nHQBJRx
	 sTU71ZoFqhcKbSFdrIKEM6Sh1JzvHjNq8WEI7X3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC1AF80580;
	Tue,  6 Sep 2022 19:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31FD7F80563; Tue,  6 Sep 2022 19:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C247EF80537
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C247EF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yPFdT/Zl"
Received: by mail-wr1-x434.google.com with SMTP id c11so12186367wrp.11
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=re8Z9fw7pUFDwz5t2E+fC5AN4inVQugZHn4dMfClz40=;
 b=yPFdT/Zllm622SFwnkd64Ui2kruuNrAfFuqcDOrHweA+yvDdrO39YO1EiQwIMDl2ih
 +8LV+TVZGQpbIM0+Va+NdxuOjMhbwnbB0/G7NX42DzUyBMKkhqmiHy5OTDomv1eV1kQp
 HfVYjRS3sJZdolJi10Ql4H0YLkjFEda9kpIis7EiRFCb4jicKJFR6tDTgPrH5hZ/82PS
 FShSosLeXqjdER4vZn4DBlyBXJT4TYSbdVLXgbnfgiCd+KKxH6Z0+8mgjIh7RE1KmuET
 Hf4o4y5jR0nwAFT74MXs/dGBv2ZdtEe9fdaP/o4+CNuhCG52X6JZd19oodsuu3NDJgBV
 kyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=re8Z9fw7pUFDwz5t2E+fC5AN4inVQugZHn4dMfClz40=;
 b=JA/FVD6Gy09E3dntLMLAfYHOHc1lMTuFRQyyQSrMrMABvYXgCYS66mixPS22FVc/hK
 0OmS0uQF/OrVLwW/Ovw4DSMIHQKuvgYJ1eP4nAv5EP9WETUPTvdgW817j2McylfojIbA
 5sDzh0V2xirNALARk5gRoWuxgI1ath26Nvkt3KI2Oh3JePtAdozvhZtgO6VdCmX99Chy
 KOsA5P5TjpB4uhICJ6SB6btRVE8OCWwQ6QIQiCX80zFy3xwzi1S7WHVnduPJxBvHu56W
 TBk6pN8QHN67Z/ApON0Agw41spm0H1OfgW4WEw5I2zQvh4IoiD0jikCKaqs0JP1J+Oqb
 5zNA==
X-Gm-Message-State: ACgBeo0XVmXALuHrECUD4xrUuJL2AgDTlOn7jdhIIiXJhRdn65N3lSax
 Fv19GFBXSoH/n+S7PeIebZIrL9gU0FdtTw==
X-Google-Smtp-Source: AA6agR7zOZdnFhN2Lm6iYdOfoyXNKZSoQYHgG/WRNO3Em3C+1SiStwXoopbjwQyOCd8Gq4bllb3zYQ==
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr1500645wra.617.1662483729998; 
 Tue, 06 Sep 2022 10:02:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 03/12] ASoC: codecs: tx-macro: handle swr_reset correctly
Date: Tue,  6 Sep 2022 18:01:03 +0100
Message-Id: <20220906170112.1984-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Reset soundwire block on frame sync generation clock reset.
Without this we are hitting read/write timeouts randomly during
runtime pm. Along with this remove a swr_reset redundant flag.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 55503ba480bb..c19bb19b717b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -268,7 +268,6 @@ struct tx_macro {
 	struct clk *fsgen;
 	struct clk_hw hw;
 	bool dec_active[NUM_DECIMATORS];
-	bool reset_swr;
 	int tx_mclk_users;
 	u16 dmic_clk_div;
 	bool bcs_enable;
@@ -1702,18 +1701,14 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	}
 
 	tx_macro_mclk_enable(tx, true);
-	if (tx->reset_swr)
-		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_TX_SWR_RESET_MASK,
-				   CDC_TX_SWR_RESET_ENABLE);
+	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_TX_SWR_RESET_MASK, CDC_TX_SWR_RESET_ENABLE);
 
 	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
-	if (tx->reset_swr)
-		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_TX_SWR_RESET_MASK, 0x0);
-	tx->reset_swr = false;
+	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_TX_SWR_RESET_MASK, 0x0);
 
 	return 0;
 }
@@ -1855,7 +1850,6 @@ static int tx_macro_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, tx);
 
-	tx->reset_swr = true;
 	tx->dev = dev;
 
 	/* set MCLK and NPL rates */
@@ -1970,7 +1964,6 @@ static int __maybe_unused tx_macro_runtime_resume(struct device *dev)
 
 	regcache_cache_only(tx->regmap, false);
 	regcache_sync(tx->regmap);
-	tx->reset_swr = true;
 
 	return 0;
 err_fsgen:
-- 
2.21.0

