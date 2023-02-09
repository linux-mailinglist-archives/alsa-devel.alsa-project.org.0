Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2706908DB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6388FE97;
	Thu,  9 Feb 2023 13:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6388FE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945927;
	bh=GDYrp64JdZdy6KVdvtFwslyAfzmOEtyOw3Pz2sqQlc8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oo6T/eHz4ma9owYnRcC9ypq5FrAzMfBknMzM4MlKPZHKqQTRuzDSrUaytnIiXXEqG
	 5xh2ZHSLNE7VjsYSVQZxiHvnJ92/KKHBT+osnFt4x1DsH60SwqTPKjSRthC9riiyoI
	 u54kcxA0jZ71FGdfp/pUamxdEdVnm+nj718mwcvs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C97F8057F;
	Thu,  9 Feb 2023 13:29:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6665F80553; Thu,  9 Feb 2023 13:28:57 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 70451F8051F
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70451F8051F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PCfXqvb3
Received: by mail-wr1-x435.google.com with SMTP id a2so1590319wrd.6
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J51vgEiaGDFuktVhqlKRRMFvlVjeM/+eUZ5W699kLE=;
        b=PCfXqvb3MXz9ybFoUWSj+AwWp6shrqNt6lrisz1CJ06Pu1nc06PNM6j7c1p3el6waP
         DRep5qrA1ntjZjOdNZQnprm6kQxDwh0y94km9LhmJM1RO0ZogRWTiV804fSD2xG0RClk
         KzrORVI0GK1tr4aT0hCXze+8h+VB8TDSB7XPJNXHw5GYU2NCFB4yhznTupkujEafaMfU
         f8GzjGIdgr1aidZBrvgEUA+5dlFtRTcEodCRa9H7KBGTQFESbeyCoyWdNsDxqqUu0zDr
         s740OJiPuhnvOgv/ezTuYpdKiq3vlgfjhEdoTf8j5h3IGUF1S/Je0XqnHmM9opsTmq1c
         llag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J51vgEiaGDFuktVhqlKRRMFvlVjeM/+eUZ5W699kLE=;
        b=3cLl1mMdzzRle/e0Nb6xUyoy1EdInIh4h3lZYUkiE512pZANLe+O1VcUNRRKrH17jw
         +aEDd6+MHT6tpNZ9RZVRvFdAOjYKZmfDvS/QfZcjpqIGudvIych1lrReqcOteLgoIJX4
         YNQDq5yGmVmH54+WDHYyUjs2skxpzvhN9tuVHZab5WDg8XGGTxNS6aitSyvqyiNciKuJ
         6AZIeHD7kJljX++PPYaX6aRdjM6QAgsAz1sDZF4sdCaedV/KjjcWfs/Ed1huoUIoubLi
         gQjKJEfaRaq1qpVUiEBziAvMyPS9TDhM8fdwtqS37BzchClzUhJ6kF7aOOU+bivOoF7E
         7+Jg==
X-Gm-Message-State: AO0yUKVUvc+i7q+lqtfzkeCZ9SQzwi5RLJNA0oTkLf4pHLFebvbvvebV
	oe6anmwopzS+2luFfWt64YhS2Q==
X-Google-Smtp-Source: 
 AK7set9QM8rbKi5vOkMNBtMwGWLwHFGtB8wtqa0h5tKacfZJtbjGLCCwmC2fxY1Wk+DKhMpVLsp5ZQ==
X-Received: by 2002:adf:f18a:0:b0:2c3:24f3:8b47 with SMTP id
 h10-20020adff18a000000b002c324f38b47mr11669836wro.31.1675945704133;
        Thu, 09 Feb 2023 04:28:24 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 7/8] ASoC: codecs: lpass: do not reset soundwire block on clk
 enable
Date: Thu,  9 Feb 2023 12:28:05 +0000
Message-Id: <20230209122806.18923-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UYRMG5RX3MZFCADWW24WIHOMVLJOQNQX
X-Message-ID-Hash: UYRMG5RX3MZFCADWW24WIHOMVLJOQNQX
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYRMG5RX3MZFCADWW24WIHOMVLJOQNQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

resetting soundwire block will put the slaves out of sync and result
in re-enumeration during fsgen disable/enable path this is totally
unnecessary and resulting fifo overflows.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c  | 17 +++++++++++------
 sound/soc/codecs/lpass-tx-macro.c  | 15 ++++++++++-----
 sound/soc/codecs/lpass-va-macro.c  | 23 ++++++++++++-----------
 sound/soc/codecs/lpass-wsa-macro.c | 18 +++++++++++-------
 4 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 8621cfabcf5b..e0d891a67a12 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3441,16 +3441,10 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	}
 
 	rx_macro_mclk_enable(rx, true);
-	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_RX_SWR_RESET_MASK,
-			   CDC_RX_SWR_RESET);
 
 	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_RX_SWR_CLK_EN_MASK, 1);
 
-	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_RX_SWR_RESET_MASK, 0);
-
 	return 0;
 }
 
@@ -3601,6 +3595,17 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
+	/* reset swr block  */
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_RESET_MASK,
+			   CDC_RX_SWR_RESET);
+
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_CLK_EN_MASK, 1);
+
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_RESET_MASK, 0);
+
 	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
 					      rx_macro_dai,
 					      ARRAY_SIZE(rx_macro_dai));
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 2449a2df66df..bf27bdd5be20 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1861,15 +1861,10 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	}
 
 	tx_macro_mclk_enable(tx, true);
-	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_TX_SWR_RESET_MASK, CDC_TX_SWR_RESET_ENABLE);
 
 	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_TX_SWR_CLK_EN_MASK,
 			   CDC_TX_SWR_CLK_ENABLE);
-	regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_TX_SWR_RESET_MASK, 0x0);
-
 	return 0;
 }
 
@@ -2036,6 +2031,16 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
+	/* reset soundwire block */
+	regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_TX_SWR_RESET_MASK, CDC_TX_SWR_RESET_ENABLE);
+
+	regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_TX_SWR_CLK_EN_MASK,
+			   CDC_TX_SWR_CLK_ENABLE);
+	regmap_update_bits(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_TX_SWR_RESET_MASK, 0x0);
+
 	ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
 					      tx_macro_dai,
 					      ARRAY_SIZE(tx_macro_dai));
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 1623ba78ddb3..fd62817d29a0 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1333,17 +1333,9 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 	int ret;
 
 	ret = va_macro_mclk_enable(va, true);
-	if (!va->has_swr_master)
-		return ret;
-
-	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_VA_SWR_RESET_MASK,  CDC_VA_SWR_RESET_ENABLE);
-
-	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_VA_SWR_CLK_EN_MASK,
-			   CDC_VA_SWR_CLK_ENABLE);
-	regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
-			   CDC_VA_SWR_RESET_MASK, 0x0);
+	if (va->has_swr_master)
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
 
 	return ret;
 }
@@ -1538,6 +1530,15 @@ static int va_macro_probe(struct platform_device *pdev)
 
 	}
 
+	if (va->has_swr_master) {
+		regmap_update_bits(va->regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_VA_SWR_RESET_MASK,  CDC_VA_SWR_RESET_ENABLE);
+		regmap_update_bits(va->regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
+		regmap_update_bits(va->regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_VA_SWR_RESET_MASK, 0x0);
+	}
+
 	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c0b86d69c72e..e6b85f3692ac 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2270,17 +2270,10 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		}
 		wsa_macro_mclk_enable(wsa, true);
 
-		/* reset swr ip */
-		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_ENABLE);
-
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK,
 				   CDC_WSA_SWR_CLK_ENABLE);
 
-		/* Bring out of reset */
-		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_DISABLE);
 	} else {
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
@@ -2451,6 +2444,17 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_fsgen;
 
+	/* reset swr ip */
+	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_ENABLE);
+
+	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_WSA_SWR_CLK_EN_MASK, CDC_WSA_SWR_CLK_ENABLE);
+
+	/* Bring out of reset */
+	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_DISABLE);
+
 	ret = devm_snd_soc_register_component(dev, &wsa_macro_component_drv,
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
-- 
2.21.0

