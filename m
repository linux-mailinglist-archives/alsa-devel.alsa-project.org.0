Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B414BF79A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:01:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03C2A1798;
	Tue, 22 Feb 2022 13:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03C2A1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531297;
	bh=Asi3U5OBQYoCEq4Se6NRdPEVRqZ5au0PL+t5nkXVE1k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LrlAh6SUW3RZ+wOszguJmiTwID/eUE0yctyNLBiQ4Zchsbht8MARNO+YBqkg+t43b
	 5C+kDEViq9tiqkJOxaxNTmYU7kc2hK6t9kQi417+EJ0n2rgVqEnRU4JqQN58KsZObm
	 pbxN9g4YTiB0SNaC74nnZLUooqx69O/EdWwPP3QE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0AAF80515;
	Tue, 22 Feb 2022 13:00:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA7D1F8012C; Tue, 22 Feb 2022 12:59:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FCD8F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FCD8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RX6X4lmj"
Received: by mail-wm1-x330.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1614931wme.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYM5KhvV8cAY2xeJWd0M65Y2tn1Q2u3N1GUicP98cl8=;
 b=RX6X4lmjUY/h74tOHBTweptlgfLuFmBZXV8kDh2RmGzLeHzQ1u8tX6ZCvYEtccu4xQ
 HDE9G6MNBk9HNR+SajG7pQzZdjFm0r67Nunqg/UVJnUCN2CbZpLjLDUlDFZtZnYjNzfq
 Z3zwno2Ykj4Sld3+FXEO0uOwjcVctBiD0cvjfm+O/+WywJgfmbAUvej5JRLmwvqJ7EN4
 S2oaW8N4IX+XJtROIFJSlARsVfqzcBW/5U0cHVTULCTgfbDMCB6hJt54sDFM+Z4ws3WN
 4fY5UycCJvCdpNSsRatWPKCJ/qwZILJzH9jmJPjjVdWjuXBA7FDNZsZ8FLGwGLK3M9E+
 mzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYM5KhvV8cAY2xeJWd0M65Y2tn1Q2u3N1GUicP98cl8=;
 b=i+DgG828xu8E4C1akhvAHuq/5bAvWto3/dvfCkmT9pUm+k3Mi1RBuI1c8Oz6OAh6Vi
 639j93t+gSkx2jKnEtLPDRQsfSrXW5fRduUiCV1ppUzVewW5BUblf5i0U+xY9T1NtOoV
 SOUhXY8twLmfzhYnbJRoq+mbUsCDLkiCfkFD1GaYebvaGZ3nJk37OcrHCrX2HpIzSpW0
 L/UGfGCkm7Kg2/GxbGTqDkC6ZGV63jBBLwgdeHnB9+avFztWspmH2MlHa7YWeJYyt56X
 O5uQcuaQdBWj7XIlrYeieRowdgpJ+fqub3Mltx3V2kmvCJdnuCjTIwhBG3/wV/qocgIT
 Xh4A==
X-Gm-Message-State: AOAM533he78bJFSK2QG6Uhvm/g/QA7t+Cl0Jg9qhDmGZWXLxDzm8J6+T
 gVH6oc50zpuL9/n+RwtlBMbz66BeKmhabA==
X-Google-Smtp-Source: ABdhPJzLhrz3DxbtX9yGvLu3mqXzHXSgCBONoNArMwvkRmF9SNZLw5cuOed4dssa5O1/3S/74GG3Aw==
X-Received: by 2002:a05:600c:2e02:b0:380:d7dc:5530 with SMTP id
 o2-20020a05600c2e0200b00380d7dc5530mr1856598wmf.115.1645531188467; 
 Tue, 22 Feb 2022 03:59:48 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 01/16] ASoC: codecs: rx-macro: fix accessing compander for aux
Date: Tue, 22 Feb 2022 11:59:18 +0000
Message-Id: <20220222115933.9114-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
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

AUX interpolator does not have compander, so check before accessing
compander data for this.

Without this checkan array of out bounds access will be made in
comp_enabled[] array.

Fixes: 4f692926f562 ("ASoC: codecs: lpass-rx-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index fadf3c99c89d..a7f86b094a4f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2040,6 +2040,10 @@ static int rx_macro_load_compander_coeff(struct snd_soc_component *component,
 	int i;
 	int hph_pwr_mode;
 
+	/* AUX does not have compander */
+	if (comp == INTERP_AUX)
+		return 0;
+
 	if (!rx->comp_enabled[comp])
 		return 0;
 
-- 
2.21.0

