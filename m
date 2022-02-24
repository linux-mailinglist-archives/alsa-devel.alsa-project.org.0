Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED344C2AB4
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E70B184E;
	Thu, 24 Feb 2022 12:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E70B184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701613;
	bh=9wkrz4c2ZeMGZZ7uOSVLK3VHlbFmzGRJpYkctDHwYOo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hKwRHsVpTQe6pju/bCFCfgFXGpkcTksMkQGkpVSkQV2+rzLum7AIZTWD+ySb5oApk
	 LxBx0w9SROPqiSKPpX8uqbX3WYXJhySm/STdhHFhljLIS1gj6DF7LRRxymk6gZqqSh
	 5WHj+/0B81jLcUvU5VptjUFP2CJ7HvaqteHMDUCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4153AF80536;
	Thu, 24 Feb 2022 12:17:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3845F8051F; Thu, 24 Feb 2022 12:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC5D9F804FD
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5D9F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NpUHOi8O"
Received: by mail-wr1-x433.google.com with SMTP id d28so2455072wra.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8veggn84WTDPG1EzzuuowEnBUzJbPrvW+5/W0Ult+cg=;
 b=NpUHOi8Obu4FUugi29GayDY/BGYAT6n6DPvbj68hPa0y/lkD0LmhRybNRPTyKjS6I4
 kCob7oaYOr8zNOk/y+b40DUFGtMqAnRgPFPJYH3G88zh13zD9zvNvMCMxkUyV+/8FTbm
 aefSjdGmOZJR23tmid51Uz5YoY9kGuuxrnlGstgnLQJuxTGyn6v4rQQhwQQa1PVaIctv
 pMbq6bsZoC5/hzxTmYykE7F4B/9l5qpqy+WOv/JLEngGa/b3UNpZrrOjYkBXA5ShN2bh
 5pj/6ZdLV4CxYkv2X8Q7ray6R+WYyNJ2FdUTp2r0xeKlkR1qTfEjNzbXtt5YEcLzg6Rs
 cVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8veggn84WTDPG1EzzuuowEnBUzJbPrvW+5/W0Ult+cg=;
 b=X51BZ715Gq25OwQs+nGQEyCZ+1nufFC4amc+9sDU9irT2vXqw3kNJKRXZcctfBZdYq
 596q/u4+L58jo6MhObcyapujRq3P2XLjUbDX1O8PZzvenyWtg4/oUpFULtAc0QH96ZmQ
 IUr5zltfbwRzPtI/u6RPKkBubZZT2CXaQuoy6ejIZpH1PrSPZtmXyAo7CLcQ+5/oebAP
 LETU36j5cJW/jqnknZWEsq0ZB6L8fpHD9F7HIl/nqcksOvvHWb+BX84IQ2z3b+d0k78l
 f1XqKEpDKu8mUesjO7EScsgAD5ZaNv9IRGHHX/6UinVv5iI6Brm5bpz4nWp1MI/84U8U
 TidA==
X-Gm-Message-State: AOAM531zpD95XFl78Tf7iXE5r71+Lwh/COCJqO3XBGKxJdI3MooLqymO
 /RjLD0eCrV+Wf+ZBfXVtZXGspQ==
X-Google-Smtp-Source: ABdhPJxKj97YqBBS+rvtIhUx243DLI4rxm9/PBcoPfDt8qdKLDowWWEZ8Pr+d5o7uGgTXgoB2rLhhQ==
X-Received: by 2002:a05:6000:2c4:b0:1ea:910c:151c with SMTP id
 o4-20020a05600002c400b001ea910c151cmr1797216wry.92.1645701451345; 
 Thu, 24 Feb 2022 03:17:31 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 08/16] ASoC: codecs: tx-macro: setup soundwire clks
 correctly
Date: Thu, 24 Feb 2022 11:17:10 +0000
Message-Id: <20220224111718.6264-9-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-tx-macro.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 920b6e93fbaa..b32235a9e1e5 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1696,6 +1696,13 @@ static int swclk_gate_enable(struct clk_hw *hw)
 {
 	struct tx_macro *tx = to_tx_macro(hw);
 	struct regmap *regmap = tx->regmap;
+	int ret;
+
+	ret = clk_prepare_enable(tx->mclk);
+	if (ret) {
+		dev_err(tx->dev, "failed to enable mclk\n");
+		return ret;
+	}
 
 	tx_macro_mclk_enable(tx, true);
 	if (tx->reset_swr)
@@ -1723,6 +1730,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
+	clk_disable_unprepare(tx->mclk);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -1759,7 +1767,7 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->mclk);
+	parent_clk_name = __clk_get_name(tx->npl);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
-- 
2.21.0

