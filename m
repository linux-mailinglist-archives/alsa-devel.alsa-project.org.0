Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC6E5984A4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 15:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6E01651;
	Thu, 18 Aug 2022 15:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6E01651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660830527;
	bh=7RcbnTolhaAdzohevI1zy6gK2b/8iuxSQqT5Ga9E8No=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M62JNVaYD0IZn3/MEF6T3papF6yV0yn2O0b7whi8BNKg4f/0LyexCwcVQcXAEKoOF
	 9Jo/cMOYQblO0LMngGPGQONbUpllzWXln0EX1C5gFtKdSe98I0Q0nnnjNLJHojnoPC
	 fYNyCS20tckPa+TxFrM30kupNHoixVP9+JA/mXIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC5F4F80537;
	Thu, 18 Aug 2022 15:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38165F804DF; Thu, 18 Aug 2022 15:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C42C9F800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 15:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C42C9F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="st0tuLfj"
Received: by mail-wr1-x432.google.com with SMTP id k9so1832638wri.0
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6rZZaOHOvolmccYyL5qbkZM57p/vVPxvzfbkv6kGURE=;
 b=st0tuLfjyZg4OwhWSH6GgD154EBVCs8begrdGXw66Y1wqcN6jG6vXa+K8NfbEtYg3I
 cHMjVPOLJKyvx+O0D/84ISQ2yukD3qKOuE74+kLVOC64t9RnIhNEoBMcpxMtwRX4JzGY
 RgNCqCYO8QYohBdJn2ZKNkg01259d9rfRkbKteUgMD+2F3lse3oF4uMV889ZVXG66QvZ
 QwxTyNwRxY/hcFqwZsQK0jKA9+aAX6U8g8Qt+s3G3j4d6LVBFHJZmakmXaNFyF2YQMlx
 WEnK9npc0xRahj/rWdMDKWHTw454VWiAvILMkxVkgmgjhJ7dGdAYFNjO+6wyr/uSCO/a
 zFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6rZZaOHOvolmccYyL5qbkZM57p/vVPxvzfbkv6kGURE=;
 b=d/zuvUHNH+xOVIiav+LHnDZpYuDb56tyrshHB2hVyKaFAc06AXHjbyUpIW6PK5OZU1
 ossgH+3NptSH3C49fygkcFgjKF1igow6Xv+IrLJ9409nV++cAQnGohntbxzLhqy/VSe+
 v/sl6gqyCXf0IVfDcHLsq34ktzbPItH6sEYNdmMRMCr5jAsB8CNOJtH/9xlxj4XJMH60
 Apy2wVWYsolNeAiyRdKYcVgY3cbYWkHu0uAVE2k6pGOHU0f7Q5J010jqV3o6I+JgQJB0
 A+6q1K+g2FQP7nwT4+Mb4bXclI8iVf188w7q4hz6E3WNI24RvHtPmDHyiGoHP1gZqBdy
 2ftA==
X-Gm-Message-State: ACgBeo1XWUxFlEd7qOpi3uNB90nJGJP5VKz8+mBIe9dH1Dq8K2vyHUCp
 rXNhDeLE92q45YVBrlLkypNhxg==
X-Google-Smtp-Source: AA6agR4xmEGJW0LUvkQoK3lSqIY/p6u2vP1m7hMR0AVYvVbe1XxwyKkiRlTRVtKQx5SY6c6WkmMJGQ==
X-Received: by 2002:a5d:5a9a:0:b0:220:6309:5c87 with SMTP id
 bp26-20020a5d5a9a000000b0022063095c87mr1600521wrb.107.1660830410046; 
 Thu, 18 Aug 2022 06:46:50 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:46:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 5/6] ASoC: codecs: va-macro: clear the frame sync counter
 before enabling
Date: Thu, 18 Aug 2022 14:46:18 +0100
Message-Id: <20220818134619.3432-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

Clear the frame sync counter before enabling it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 1ea10dc70748..a35f684053d2 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -23,6 +23,7 @@
 #define CDC_VA_MCLK_CONTROL_EN			BIT(0)
 #define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
 #define CDC_VA_FS_CONTROL_EN			BIT(0)
+#define CDC_VA_FS_COUNTER_CLR			BIT(1)
 #define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
 #define CDC_VA_TOP_CSR_TOP_CFG0			(0x0080)
 #define CDC_VA_FS_BROADCAST_EN			BIT(1)
@@ -423,9 +424,12 @@ static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
 				   CDC_VA_MCLK_CONTROL_EN,
 				   CDC_VA_MCLK_CONTROL_EN);
-
+		/* clear the fs counter */
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
+				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
-				   CDC_VA_FS_CONTROL_EN,
+				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
 				   CDC_VA_FS_CONTROL_EN);
 
 		regmap_update_bits(regmap, CDC_VA_TOP_CSR_TOP_CFG0,
-- 
2.21.0

