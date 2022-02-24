Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7874C2AC1
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:21:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44683187B;
	Thu, 24 Feb 2022 12:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44683187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701677;
	bh=OaBHCimOLNaQGF5VAf0VI2zcJT2E3VuptCg0gSGr6Ew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCWGnq2Iz3/GAx1rIfD4Ac+vceUc0mhaV3nYxB7b7SEBodVRZTAmNok9vOgOcipuL
	 kFPzLBN8+87+w4vuLBfFdz633+Z+XJBRWJRgjW/0pU4IJxqwI39ggPj5FQdYpge98W
	 0YJkyTSwPNyyvvHbGb6Iuglc6g8kPnFbXiNDTCAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A6FF80535;
	Thu, 24 Feb 2022 12:17:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DEF5F80537; Thu, 24 Feb 2022 12:17:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC878F800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC878F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="y0wC2iSa"
Received: by mail-wr1-x434.google.com with SMTP id j22so2402646wrb.13
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zE6/nZIDlJdrpc8fSPwZfEWaQMFLh+eWf0SbooVP2Cs=;
 b=y0wC2iSaTfuMnX+xZjLGomf6N3YABPJaIUbLdMN9PI7FX2tlh9OC9gex041qeCWkbE
 tkveBABwMnZVwGABeOznGoCqZv58ce7PD3oaDmsf9SX3QmE2it0VbRyMxID1sCLM7YSF
 PenArZceaij7jQy2DdwKAaQGbPqplbjWiSQb5QzQ/x4CERjEaG1TSzJn5dsJohZT11rv
 sgcZtn1mTdI3gUFuUJSUlGusNXqjl456Nnc1iRA5iq7AzR1cnxCh7pkjFue/Yj4A/Ux6
 Kfk7OxE0R/ReiW34BRYX4Uds99Sn7KSPy1ZA5EKxGk9/IyDAxwG4O7JJfGypS8JMTLw+
 tLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zE6/nZIDlJdrpc8fSPwZfEWaQMFLh+eWf0SbooVP2Cs=;
 b=TlLNIExBSyXtlSV3cF/rc4XPQJC7r+WKeQqF4WUPdu4G+EtQGsxqRl/4alNF0Yso8w
 BemONrpM9/o4eq6YjL8c1WXQXOkK+pnHdx/DAvLnk/zKBcTv6ZKduDOb4DPQl9VhC/KU
 H/PShJFIyYGWv8DeXtF+3ZE2hBkO4RNJ1aVruIoM0OeHrd6AAHCIlBPaBndN9m+f+iGh
 mksD8QRAjYOTwYcjXVX6Hm/rQC4Xu+r5qstuJ7oaUkzZPIQea+eY4TIalPNPx//k7Y/L
 9yolmUF2KUsAS4GFYOsDsNNKQKwgzb9G0KMZYLyAoJ+TDMn/uiOGBjugMMiebiv29q4x
 8AKg==
X-Gm-Message-State: AOAM533PZXwrcKE2ukHgQTx63ekFCDnNaLWcCH7fYgO0EMcd1j2NKBr4
 Nj/yiKidP3OYOChcGIagYFMLVQ==
X-Google-Smtp-Source: ABdhPJw3NfB3x04KEBXGRKtfaIopOFoSnpJaNQZBGPeNyhHXjJQxGlGlxdY1AzUUWu4ZgFrUhRwcgQ==
X-Received: by 2002:adf:fb06:0:b0:1e6:8b27:f1ea with SMTP id
 c6-20020adffb06000000b001e68b27f1eamr1803259wrr.353.1645701452462; 
 Thu, 24 Feb 2022 03:17:32 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:31 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 09/16] ASoC: codecs: rx-macro: setup soundwire clks
 correctly
Date: Thu, 24 Feb 2022 11:17:11 +0000
Message-Id: <20220224111718.6264-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

For SoundWire Frame sync to be generated correctly we need both MCLK
and MCLKx2 (npl). Without pm runtime enabled these two clocks will remain on,
however after adding pm runtime support its possible that NPl clock could be
turned off even when SoundWire controller is active.

Fix this by enabling mclk and npl clk when SoundWire clks are enabled.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 83b570403c59..a2f49a21678b 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3430,6 +3430,13 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 static int swclk_gate_enable(struct clk_hw *hw)
 {
 	struct rx_macro *rx = to_rx_macro(hw);
+	int ret;
+
+	ret = clk_prepare_enable(rx->mclk);
+	if (ret) {
+		dev_err(rx->dev, "unable to prepare mclk\n");
+		return ret;
+	}
 
 	rx_macro_mclk_enable(rx, true);
 	if (rx->reset_swr)
@@ -3456,6 +3463,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_RX_SWR_CLK_EN_MASK, 0);
 
 	rx_macro_mclk_enable(rx, false);
+	clk_disable_unprepare(rx->mclk);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -3492,7 +3500,7 @@ static int rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(rx->mclk);
+	parent_clk_name = __clk_get_name(rx->npl);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
-- 
2.21.0

