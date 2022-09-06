Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F05AF17F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD7886E;
	Tue,  6 Sep 2022 19:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD7886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483823;
	bh=KMDiayVjd2Og9ZYVfkRNvQH5T/X5qtwKJOdvmjmJszw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=frLCck5PGA+uKpRfrruBjWcDkg0Ia6JKd4py/+xyA+gvaItGTRadYE7Y53OBGFgiB
	 6iFi1pO3cTCbOJzt1RLBCEzmGF9fmNA3BcNhdU8030QI5tHNSQiJHe8b0v40B0zS+O
	 bE5R46vvyGs963NWJ40xAADviCiJSspX9IfSAPb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 271FBF80536;
	Tue,  6 Sep 2022 19:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63418F8019B; Tue,  6 Sep 2022 19:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E70AF8019B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E70AF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CDZiTQMg"
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso7822656wmr.3
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=o0P1+3onPALss8FANURKxZf2V/C5gu77caRyuTxUF1M=;
 b=CDZiTQMg7oOWT2r9wR7w87/5OMpP1or67RAL2mG41wRRa44pSsvbtsWh1JUCARAf/h
 Cpja7ZiJm4/KYQ+LNPbu31hQkZdp4qWuV1LaO6qw0LYvQ4V0pYj1Tm7ajDGOoK1lJBL/
 dPOzf7HSRYI3GOwQNDrvdUgRSPpcsUh2LrO8k9VYSAdjgSKyAnVvQs2FableUt/G2lCa
 R9/QXSxQB13nTQnTvYwAbFs4Hu+Cq/iNGfyOWqgeOMRUkUQ6u10Ek7br3zgz75HiRZxa
 5OvgLo7aryroEgQu/K3YWYYDJtgLXG99de+iwY0xzjfknL+dDOR4TnpMsnbKaGIEaDrJ
 VIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=o0P1+3onPALss8FANURKxZf2V/C5gu77caRyuTxUF1M=;
 b=TTvKIEFFKRb7MhuRIqU8ocUSMSWtPv6EDEDjLuR+X0GvEZix5lMkIG36NUdd5rxJps
 RRwUrCE6ZwACII2zcUPlQtXwp3tEVxoN07gmD0H/9d2uyYN73HqP4g88ZxLM13hvRAXj
 mtxn+wXdpv3dBVypJI/ibiTAL+I29EyrrHK+JPVDgmBQ7SNIXkQjn8GXS0+16g70tGGi
 mrZ26D9bnLjFkSjfngOsz4n0JJqVg7o/vCAge75fHiWYxXhBaEsKY6+IkK/NtG3UFes0
 06qsitGf6mjKFnE9itqfv/Tw8rZIzORH/1sfygLbU/QyfqMT7QGHj49hgW7/fL3RhCUU
 /RQw==
X-Gm-Message-State: ACgBeo0dNt74lr1x2jVNsX1IGetVHBHK9Mh9gfg+dz6DNp+VZYwWtY6S
 Vs43U47IUzVThqFVWNdHTqQScw==
X-Google-Smtp-Source: AA6agR6VpOzB0Itr+rg5xE7PPQuRZomvY8IgzkLTzCP1+j+vvOz+tkUL1ogAUVmyHNfkbseryXgsfQ==
X-Received: by 2002:a05:600c:1d89:b0:3a5:c1db:21c6 with SMTP id
 p9-20020a05600c1d8900b003a5c1db21c6mr13786582wms.174.1662483727802; 
 Tue, 06 Sep 2022 10:02:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 01/12] ASoC: codecs: wsa-macro: handle swr_reset correctly
Date: Tue,  6 Sep 2022 18:01:01 +0100
Message-Id: <20220906170112.1984-2-srinivas.kandagatla@linaro.org>
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
runtime pm.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 27da6c6c3c5a..130d25b334ff 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -338,7 +338,6 @@ struct wsa_macro {
 	int ec_hq[WSA_MACRO_RX1 + 1];
 	u16 prim_int_users[WSA_MACRO_RX1 + 1];
 	u16 wsa_mclk_users;
-	bool reset_swr;
 	unsigned long active_ch_mask[WSA_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[WSA_MACRO_MAX_DAIS];
 	int rx_port_value[WSA_MACRO_RX_MAX];
@@ -2271,23 +2270,16 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		wsa_macro_mclk_enable(wsa, true);
 
 		/* reset swr ip */
-		if (wsa->reset_swr)
-			regmap_update_bits(regmap,
-					   CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
-					   CDC_WSA_SWR_RST_EN_MASK,
-					   CDC_WSA_SWR_RST_ENABLE);
+		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_ENABLE);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK,
 				   CDC_WSA_SWR_CLK_ENABLE);
 
 		/* Bring out of reset */
-		if (wsa->reset_swr)
-			regmap_update_bits(regmap,
-					   CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
-					   CDC_WSA_SWR_RST_EN_MASK,
-					   CDC_WSA_SWR_RST_DISABLE);
-		wsa->reset_swr = false;
+		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_WSA_SWR_RST_EN_MASK, CDC_WSA_SWR_RST_DISABLE);
 	} else {
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
@@ -2431,7 +2423,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, wsa);
 
-	wsa->reset_swr = true;
 	wsa->dev = dev;
 
 	/* set MCLK and NPL rates */
-- 
2.21.0

