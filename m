Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF75AF181
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570F2F3;
	Tue,  6 Sep 2022 19:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570F2F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483835;
	bh=w8MlgKN856+AzG2hQZVFfgmaQ74UnbMhdDV8nNSmHlI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpTEHzKhNV8PQaCe+WF6P7/oDQCmCR7/je7UcFQbnQHwyQqEExE8RYd5OZWshOElK
	 5Wi9BoSQPnWENcgae3F5rpfl2NixtPYvYAAJLoQoFcvWdjP3mFFS9+BWAIeYGeF72i
	 V+KIDV3U0VaVgUCuw3lHj/X+xUGGZbmrUW1UCvuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1596F8053D;
	Tue,  6 Sep 2022 19:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C1DF800E9; Tue,  6 Sep 2022 19:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0022F800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0022F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DSQDRNxR"
Received: by mail-wm1-x330.google.com with SMTP id ay12so7225723wmb.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cKtafl0UjnCIX3Puy9AAJwH+bYrDR15RnaqOt29dt7k=;
 b=DSQDRNxRDpSC0Y2GH8Yr7Qglq0JVaFmbUxckXOzXqDg1GSVXNvnDnKZIBcEfmz2v4D
 51QsgOKkarGZt2odOQIEJW38dnqxWk4W8lTk4WpfurC1baxWfz56suyQqy5XoBuxATHI
 M68ENoPYJObsFYwRKeKNHIJeKtmnvkqoCOSgks6r1LpZm9i+uzWvQUkn9IsGDWUB6v/Q
 jQ5PIhzfdJ5WG/IQSwHbkMz1yjavPj57XB/TtB4A+OEPZbR38s6/cfRUh+fOV5oXk4Of
 lkqmCMwsDuR67iL+Nvx9f/lJrCy4Iqi7aAhmsY9sYLhI8QdO3TYNoE8SRaJTk7fV4R3u
 uq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cKtafl0UjnCIX3Puy9AAJwH+bYrDR15RnaqOt29dt7k=;
 b=1ZzNq3SxauJetVj9t4fQPSugUO3Fmvr2k3AuimRQF4J6aGJO+Pp2IlTpDE4dpZp2do
 lyR6/qSL+1/m4b/VqCHl0kT3WNXtfoWdrkzbGKa6A27+vgMEpP4tvW+zuxPwNVo42IN6
 NoBRnDk6phYo4wfnPwz/h6dr9nkLeAkCNoUwMqoX9QP6p8WouCC9qm5+RAZWhkCAZ+a8
 PfTBziDblIC3U/R42IylDWZ5E5A/Bd07tcPtx2Ad57uzOck1iZLzL+UrDoaGA9ZCBYpz
 tYZa+5KJlrAmhxH83HJUq5vg9kqULxh7NuKdEFDlTP70LqjWUu1fsJc6gzPyCdoHqYw3
 e5cQ==
X-Gm-Message-State: ACgBeo0NBwzs22AyatHKj8QZLd1Wvz7jes71QstXxBvXZ9uYzO8wOTjD
 adJugpOc/iZMORtFBUW0E98r6Q==
X-Google-Smtp-Source: AA6agR7GvICXzJ7qO2wadJGXTUzi4eSPQqWx0ip8nmGBuJcGV1178cRrIrUJDO6x5Vpu8T8sm2sjZA==
X-Received: by 2002:a05:600c:600c:b0:3a5:abdc:8ce4 with SMTP id
 az12-20020a05600c600c00b003a5abdc8ce4mr14130312wmb.144.1662483729018; 
 Tue, 06 Sep 2022 10:02:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 02/12] ASoC: codecs: rx-macro: handle swr_reset correctly
Date: Tue,  6 Sep 2022 18:01:02 +0100
Message-Id: <20220906170112.1984-3-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-rx-macro.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3143f9cd7277..338e3f0cad12 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -596,7 +596,6 @@ struct rx_macro {
 	int rx_port_value[RX_MACRO_PORTS_MAX];
 	u16 prim_int_users[INTERP_MAX];
 	int rx_mclk_users;
-	bool reset_swr;
 	int clsh_users;
 	int rx_mclk_cnt;
 	bool is_ear_mode_on;
@@ -3442,18 +3441,15 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	}
 
 	rx_macro_mclk_enable(rx, true);
-	if (rx->reset_swr)
-		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_RX_SWR_RESET_MASK,
-				   CDC_RX_SWR_RESET);
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_RESET_MASK,
+			   CDC_RX_SWR_RESET);
 
 	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_RX_SWR_CLK_EN_MASK, 1);
 
-	if (rx->reset_swr)
-		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_RX_SWR_RESET_MASK, 0);
-	rx->reset_swr = false;
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_RESET_MASK, 0);
 
 	return 0;
 }
@@ -3579,7 +3575,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rx);
 
-	rx->reset_swr = true;
 	rx->dev = dev;
 
 	/* set MCLK and NPL rates */
@@ -3701,7 +3696,6 @@ static int __maybe_unused rx_macro_runtime_resume(struct device *dev)
 	}
 	regcache_cache_only(rx->regmap, false);
 	regcache_sync(rx->regmap);
-	rx->reset_swr = true;
 
 	return 0;
 err_fsgen:
-- 
2.21.0

