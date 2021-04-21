Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495D366A73
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 14:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE4D168A;
	Wed, 21 Apr 2021 14:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE4D168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619006929;
	bh=hw/RmRvvXPsdKCq3Xbnq8bfzeZ5PtXx0kGKUopsA0Y8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=plGdKf5o3SEKl9jyzthYBSn4xsmcweTnhAz8gXffu9RXhI3Mv53JEBLtKEd8pigWj
	 xbjFBbBiYVf+4S3hKNO6I77ei7ArxOK6SivUDM8ZM83/9uJC1Dufvzw3oFO4OtfnKs
	 p0WJdqNvsBDkn4FbzMK+Oc+QByraFAjUrKVGCGW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C75F8049C;
	Wed, 21 Apr 2021 14:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9A70F8042F; Wed, 21 Apr 2021 14:06:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09AC5F8028B
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 14:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09AC5F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="bZvUjjNL"
Received: by mail-ej1-x634.google.com with SMTP id n2so63112219ejy.7
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikxfjDLYuq4kmVi2M+ovf7fio+tFDbJkofoad8Wbu0g=;
 b=bZvUjjNLNycuXvipWLEzb+IRDabF3NqVkumB+urNNTl1cXvQ2tbDoeaNQ+PV5jhBNb
 GOvF3LjcGgB2+6qQxDUg0dNiPQE2ty6uqGkRF8xa0G4M9wpqV/H2yG5fCngolCGOo0WJ
 rd00FfT39Ifgw26+2uofxT58NA9nGLilcFP+CL0jDI5LmCEmi+bTsQ2cvZfkZlAe+3ZN
 hjJZLJtXl7mU0cH4gGwf43urBY68qMCCK///rYWYaqeOIJCUhD17TEunZVjX9MWDhdc5
 3CpvuPAMLadNQ87jHpKdxLDhWKilWpHc6QiKBEe9Lg4CEhPvwBic+zkAgU6aCm//X8RO
 gazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikxfjDLYuq4kmVi2M+ovf7fio+tFDbJkofoad8Wbu0g=;
 b=dps8QU3RaEhEwC73oU0vx8UuiHbbM3m6acBTBP+2hveN+Hm+T+MkKhrxljRursK7wB
 XWKJ/6lc4PtJf9FBC7/48rZTRLI3Zx1zDl7fJ/5QMIC9uWiP3i5mO6gLigl3hKu6vm9Y
 gdp3XmEPBMVDdqBciaNwj+haMSIHj1mwuWO2mxnzbbl8AgbDKvGsWlhVC2VuusvgA7l8
 rHe2jnOLcPLfIWVUs5jDhCrLdxMIsqtegUcIOWURkLg19qrfEAhPoaf+ccc2zFhSUCEm
 KBnjIJd5P36iVWCG6zfHTJYHNhqLu0vl3d2PJkYmpbHTJErNGCDiO4tnaTpcO7+/QRwO
 S4WQ==
X-Gm-Message-State: AOAM5308OveMe6tFBJFzDh98NDd/2ZitWcdj5q+zmGdHUsd7e+f+wG7G
 KGV5C7cY0Z4JLCPhBjmjYczMCA==
X-Google-Smtp-Source: ABdhPJy+yR5RdrEp9RuiwBCe5WB4EkVI5Wk0TTahYh4a4mJGaGvyiF6KNG2gJb5W7XsSeHzL/Eoyzw==
X-Received: by 2002:a17:907:d06:: with SMTP id
 gn6mr30014894ejc.449.1619006737773; 
 Wed, 21 Apr 2021 05:05:37 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n2sm3151431edi.32.2021.04.21.05.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:05:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/5] ASoC: stm32: properly get clk from the provider
Date: Wed, 21 Apr 2021 14:05:08 +0200
Message-Id: <20210421120512.413057-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421120512.413057-1-jbrunet@baylibre.com>
References: <20210421120512.413057-1-jbrunet@baylibre.com>
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

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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
2.31.1

