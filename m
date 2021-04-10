Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B535ACDF
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 13:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AFE015E0;
	Sat, 10 Apr 2021 13:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AFE015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618053429;
	bh=gBMZYdDyIZosK032lR69LBu+F6QBR3jIiOX2E9ZKQvk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JfypMYALJ2nLsDETHQo/jIE5EEkMyRjWuO5ssc7CIckeWPT8+UIFnc7yq2gJxKWDY
	 gfoVLHAO20pSafSUP9ugw50SHMaJdd9Ld62+RUC2anMIaAK7+drGfuARM98yyGmm5B
	 YxEzj+k7pZykIK6rA35P7R4/Batc5VaWI1bgAgL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5096CF80482;
	Sat, 10 Apr 2021 13:14:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3F94F8032C; Sat, 10 Apr 2021 13:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21593F80246
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 13:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21593F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="cTxE100E"
Received: by mail-wm1-x336.google.com with SMTP id k128so4172228wmk.4
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uz/XMPMDwu/USy5yxTKfqvGGy1RjhUNSpCmU6fo9xwM=;
 b=cTxE100ExRKHnpQ1JKrCRUOQl5hvHud03dZ1qSIKDgRRCd9kMJ+Qqp6Nh3sjBmuZh1
 +ULWzAk2ZXw5RuS3EGilrJViITuxIr21e0PfKmdoDqGd2wm2AJCacOmOF8zF86A5fWXu
 XcjyS22+fvxmPtG1ouWIXKc/c2mfnMrvu0qp8DCtKQw6VvMiO5OOUM545q/+MYH4fBdg
 ugNenDSHk75mGuHoz2rsn+PEUTp/mrlVcgT0VZEsAU5q++kNXlHdOPnHTfB1cqd53ywL
 HitZFWTj8XMCNWCBpWPAVqMoqSATL9U82a6q8a8h6yQAgLSx/CxKCPcjCxeHs18M6hkW
 Eodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uz/XMPMDwu/USy5yxTKfqvGGy1RjhUNSpCmU6fo9xwM=;
 b=neAEOEcwdUHf2ETnvoVY5qkstArNM5hmDeLZ4StRpCc8j0ErpIdaI1BwF6xzK7TOcK
 mHzCcVVylhYsgQhYvNaUs1rpunjpx8ohq8Tt1t7Jn+jAMXkQBNiDYQfMUna7wQX70Ose
 g+eolYQ4zynx3hvp3NMK6h+j+hNldydPt7ugIgdL3ibBRlWF+SKtn41ZIEHzW/5FlBSa
 7ZjfAouqIlDI+sNjfz0+ifHFO5maXz9GGSYrLr7aJKPE6OUlhyV1K1wEFzEid9mPsLaN
 yl263L2o+ZCgyJcGoj3TAMhLNC+iSOcNV/CSSp/COF0oOYfpZR7G7OGZEWKNTA9oP3Ny
 n+Cg==
X-Gm-Message-State: AOAM5307j6UBjs9WWgf2vydrihKjQjEBu6qkDkF+s8ivn9KvvqztWPyE
 J5r9FBnHrDY+r3uh1Y9iI16dww==
X-Google-Smtp-Source: ABdhPJweBCqlynJKqrELKofDcADCJIyh3r50EE1Req4qnVkQmoilKGiFcjGHxPxV43o/n0PNcP0MEQ==
X-Received: by 2002:a7b:c34a:: with SMTP id l10mr17823837wmj.46.1618053243078; 
 Sat, 10 Apr 2021 04:14:03 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id s8sm8370117wrn.97.2021.04.10.04.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:14:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/5] ASoC: stm32: properly get clk from the provider
Date: Sat, 10 Apr 2021 13:13:52 +0200
Message-Id: <20210410111356.467340-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210410111356.467340-1-jbrunet@baylibre.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Instead of using the clk embedded in the clk_hw (which is meant to go
away), a clock provider which need to interact with its own clock should
request clk reference through the clock provider API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/stm/stm32_sai_sub.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3aa1cf262402..c1561237ee24 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -484,7 +484,10 @@ static int stm32_sai_add_mclk_provider(struct stm32_sai_sub_data *sai)
 		dev_err(dev, "mclk register returned %d\n", ret);
 		return ret;
 	}
-	sai->sai_mclk = hw->clk;
+
+	sai->sai_mclk = devm_clk_hw_get_clk(dev, hw, NULL);
+	if (IS_ERR(sai->sai_mclk))
+		return PTR_ERR(sai->sai_mclk);
 
 	/* register mclk provider */
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
-- 
2.30.2

