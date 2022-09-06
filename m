Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9835AF186
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BA2886;
	Tue,  6 Sep 2022 19:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BA2886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483895;
	bh=FPfDNQBkqVt/TVQXkpnnTjuHggrUY8ZVDL4cXZWIkH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9wdMcV1Qk19t0zdwC98Hy+9zv6yYvG3PvQL1BtUk34Gj9iNGHfWxw/MhKxemzmkz
	 nzf10w/uJpuBFq2+aXVVMkDtf81OG1NUrOiq0AQ3goE9IllL/5l3ifazJtne4tLnC+
	 Bkf4YtHSTkbYXRwWKwQwpwEKQZDD1Z4GGra3T9BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DACB6F80559;
	Tue,  6 Sep 2022 19:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B3EF80249; Tue,  6 Sep 2022 19:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C97BCF8024C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C97BCF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lJXdlhxW"
Received: by mail-wr1-x432.google.com with SMTP id t7so11383888wrm.10
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RfjWKWch3TZGRYF8XV8JAlQ9Ww6so5roY5L+ZndATM4=;
 b=lJXdlhxW6U93FVDeXa8RVIjHuMH1turQUkNrRzWT2pYQUDBESyhOhPIxYZhghDyYWc
 zkDdLJyh25loRAME81bpbH/arwYWnVBPD2Bk3/Rpv+pLBzEqrmAak7Gfx2fT+f4gd0+/
 UeBjE5rSvFLN4vftUXVyFLhxUg+ffJgnnsMjRDYFTh4+n059vo7AXHjuMUZmj+GT36fE
 xhrrmTWxS+nNiV3OhOry6SNkB5Q0cKSo5vYmEXlu2Azyrm/Ek0oygBCa2fL/S4seXnGH
 mD9koNPhjkydkWBj1aEvS5ANZL+xK/cnrzoqQ7wm5006j8x9ZQa/d5r5xwZEfUJTk6WK
 OYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RfjWKWch3TZGRYF8XV8JAlQ9Ww6so5roY5L+ZndATM4=;
 b=q12H2xGoXG1gk/ZokM+ele+OTRt5AFCfmxxwb5yRUa0q8P++MZhoiyrmbQl1FMkIVa
 WIfggwdAqM+CxlshOBgHevtcbAv4Ec7rrxJLChZEtc8/vEi8XqO7Db+zJ6y6Trj0ZjL2
 zm/W80+v06kEnexvUxDdNwya8z5knMYj0jVgoYQsS0VTtJolGE8tDkjH1oeZVypyeA9t
 vZKk7EGmWiIsx5eb21s1jBu9rt/EwsSQXwCdXG8bsBypyEEDqg4kgAf5Z2snX1s0i23j
 i1iPjtphh+dl8kSZU5uXsbyHmn32SusQpFxkf5Xc0QI0hR79z0FywsIIyiJUnCkRK3LH
 1mlA==
X-Gm-Message-State: ACgBeo3HOt1rSl/6ciFvMq/RLbY+mo3/VDASQ/DbkAZw58vV1ZFWPrdi
 ToSeObjsNfB0GYpNSQGIa40BVWJaGKxaGg==
X-Google-Smtp-Source: AA6agR7eQSNeL8sIxTrhMkrtcHCIRn1KrjURhDxY7bHZ7/kV0XSo6UDMgCiFpULXqE3e622OcReYag==
X-Received: by 2002:a05:6000:81e:b0:228:a17f:92f0 with SMTP id
 bt30-20020a056000081e00b00228a17f92f0mr5749091wrb.31.1662483731026; 
 Tue, 06 Sep 2022 10:02:11 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 04/12] ASoC: codecs: tx-macro: fix active_decimator array
Date: Tue,  6 Sep 2022 18:01:04 +0100
Message-Id: <20220906170112.1984-5-srinivas.kandagatla@linaro.org>
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

currently active_decimator[] is unsigned long however we store negative
values when there is no decimator setup -1.

This is first bug, and the second bug is that we do not check if the decimator
is valid before writing to register using decimator as offset in
CDC_TXn_TX_PATH_CTL()

Fix these both by making active_decimator as integer array and adding check
in tx_macro_digital_mute() before accessing CDC_TXn_TX_PATH_CTL() register.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index c19bb19b717b..5c03ef8d88b3 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -259,7 +259,7 @@ struct tx_macro {
 	struct tx_mute_work tx_mute_dwork[NUM_DECIMATORS];
 	unsigned long active_ch_mask[TX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[TX_MACRO_MAX_DAIS];
-	unsigned long active_decimator[TX_MACRO_MAX_DAIS];
+	int active_decimator[TX_MACRO_MAX_DAIS];
 	struct regmap *regmap;
 	struct clk *mclk;
 	struct clk *npl;
@@ -1117,6 +1117,10 @@ static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 	u16 decimator;
 
+	/* active decimator not set yet */
+	if (tx->active_decimator[dai->id] == -1)
+		return 0;
+
 	decimator = tx->active_decimator[dai->id];
 
 	if (mute)
-- 
2.21.0

