Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D25BAE1F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB11D1ABD;
	Fri, 16 Sep 2022 15:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB11D1ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663334796;
	bh=q0rxgL/NIlO3wt+Tuuy9jiZmt3JL4p1OWDjp6NPfQT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pu0dbQLzW2urYFmC7tnWc05rByQlLpZ1cE1q1mA8Dlue3tv0DWCyOffALFGz8VbIO
	 Eb2pVvXiwQ8MavbtqnFFKLkpXaovqkYn7nu2P0RnIQ67+i0yMTgJt/hlcV4htS6On2
	 Q77Wr/k/BHNTs4fTEgzPkxki2xFFYH+R6SNzMG34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3CEF8053C;
	Fri, 16 Sep 2022 15:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF4CF8053A; Fri, 16 Sep 2022 15:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCD70F80533
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD70F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jYtg6/mJ"
Received: by mail-wr1-x42e.google.com with SMTP id e16so36001485wrx.7
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lGIzKCCzT9Z91pOhcVsZGKjotZcXBUNtgUUXIg8kGbo=;
 b=jYtg6/mJRPsHpWerRPXAXDrZns01WqbBzMrstF5f9SmWFzNRjtwf7mPRxTboENGqgs
 Mk2qfOGO0vHw42sq4hlfIyt00rHusd6vCrG1r4cr+IvF9LjEKr/SpBCr6EYdSW1LWG40
 FxFqFDLXgPZYy9v4gOxgPY90tDRUYZdnolHS1Bjq8qcZpyH6izPWhiSy3u0Fi/PbCNpX
 vGx8C413GepqlLZs2oeyM7Z8GqhuaWuBjjzG3NjHm1xM5ppSlRmEhkNJq4zKRQuQeEBu
 kuV64FdhtnnGp9kgZNea11FiL1CAhdQ/xbMHcZqRfw2gyX7jl7g9ozXFZsQnxgr3CK1F
 6o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lGIzKCCzT9Z91pOhcVsZGKjotZcXBUNtgUUXIg8kGbo=;
 b=R+futjVlc3cRI8/GOmMIMIYFKpC6nEBtkq12CyBQE7lo+Fnqh3ZMG7ifjXbVgHEKVI
 FpxQnmU0jSZiY2puO947ElPwmn++nA3wenIkTdz7HpDwUKXYkTxNBz9p+GB7WCg5WU7f
 BQ4l4AyRaJop9F+9GXivcqK9aHIrK9w4oRhEcXAbQLzaVUReThD10Lu9Ues17y8VccuK
 fXqVecFH/zuPsd//t+nnyszC5Xdsj4R9EelIZ251u4ej3XGDcGE1Bm+6H/bRfMmgtldo
 gx5WFHSJDqezv5dsAzAnvbvdL8vntpEk7VLOQBh6cHZQZVzz0i10KtkvKFwbi9BM8aXA
 BMFA==
X-Gm-Message-State: ACrzQf1DetHatOI7dLX4GD68y4Zs2yz5gy4qEKUqAuOXO9qkQZUri/3A
 Ur8upoDqXddE6YTiBpuO1etFrg==
X-Google-Smtp-Source: AMsMyM7o0ljWelmEHySCByBq5ilh+1KD65ObHLXkmzd1QE1nONf5ejt92ifAmjxnVdcfkt1jcsA6/A==
X-Received: by 2002:adf:d1e4:0:b0:22a:34a4:79ab with SMTP id
 g4-20020adfd1e4000000b0022a34a479abmr2756020wrd.188.1663334679968; 
 Fri, 16 Sep 2022 06:24:39 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:24:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 1/5] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
Date: Fri, 16 Sep 2022 14:24:23 +0100
Message-Id: <20220916132427.1845-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
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

qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c407684ce1a2..e53ad84f8ff5 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -175,6 +175,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(np);
 	return ret;
 }
-EXPORT_SYMBOL(qcom_snd_parse_of);
+EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

