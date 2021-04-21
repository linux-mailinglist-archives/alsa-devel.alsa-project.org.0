Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA33366A6F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 14:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5387F1696;
	Wed, 21 Apr 2021 14:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5387F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619006852;
	bh=ZY4yGYgTdCze3juMQjrmVSfuqcjhzaQvmNuCo5yEzMo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZcLhpPC68+mDztXY5LQi9OhmvfBd9D8avNQfm4gUEgLdPLCxL2NTLB84H2GhrEAuK
	 TKUfTl7Y9mZGHhdMgFPeUK5zaEUt7+kXFb6xhtnr7ju+mHc4LB63/2eYtTSdd6Z84M
	 49f5CV5mBljK2YQfbH1C3RWZjVcHd8jM6fmr2H5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168F3F8032C;
	Wed, 21 Apr 2021 14:05:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F08AF8032C; Wed, 21 Apr 2021 14:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7878CF80256
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 14:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7878CF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZQiDoc4I"
Received: by mail-ej1-x62c.google.com with SMTP id v6so61830948ejo.6
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WBvDDO3AKgp6HTsSIcTOIT+KCHK50v2vbG7h5wPnh6A=;
 b=ZQiDoc4IpWNOVnVThvEFhumSPBLHtbewiHEKSIHIOSx5I8x7cZt/mJ6PjBZ4zA0WHH
 MKDdn7s1SFlQHMRAkYerAo60U+rde7gj2KqAYDNb9OtSKpFiqZysc4v6MfwAkWJxRuaq
 cjNKPpbR/eoyvxrPd9blBLTfJgoNiTPLh9i/NAo/4qljDRN3GFX/KXdHHnMAPap7KaGJ
 x1Pky1d0iB++nNFBuNsjs9Ny7Nr74NyL+gg3plySGVVtLAAJCjyXgmflkF9WHteXUTKv
 qpLHYdBIUFKN1lmM3/LgeoZGhnILl5TcaxkJybIf2GpZvSbuOlYIF1Td6GNaRgSSmYfK
 aVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WBvDDO3AKgp6HTsSIcTOIT+KCHK50v2vbG7h5wPnh6A=;
 b=LgO8nKN2QmMbKXHALQw9GD5vFY4jWBFvWLyRnssdQrEGFBS8K5ZcuXMA/Vh1yHskdl
 YizlEMoDhP9hoQLdrG5T0gcS5fLHxfGZCNYFebUxA05cGdR48GmQ64W28Yb0mXMCEcBD
 rXgFcDTMzQ9LAgt54biA/4rURGXYK2hMO3BYVQXTfPiFFJSjeao8BkMmRnINzaqp9G+b
 rkRyifPvDRC3aJ+qk8rrgHnYLsVOEo91nlsYJC4e+Twxsod1w5a0MxzvV+cgDrcSd7XA
 fIEbS6/jxVIwYMi+726L8KOz8xUOg4L9cEoEnEhCTGqc42+9+BKW6wLu2fm9AbrBxNW5
 2E5g==
X-Gm-Message-State: AOAM532Rimvcy9eccQmGhGbBA8rjEO6JQ6IW49UXLOUoDnvtWqsX/UPW
 hKoJfEX+YotGeVc9o3UHuaS4aA==
X-Google-Smtp-Source: ABdhPJw7RBl39HDAf6162Lb+vNNYdFWkpn3xny4FcphRHCsNTHcKKiqoBS6LkEYz3O0d7GgbAK6fvw==
X-Received: by 2002:a17:906:2818:: with SMTP id
 r24mr32281084ejc.502.1619006739211; 
 Wed, 21 Apr 2021 05:05:39 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n2sm3151431edi.32.2021.04.21.05.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:05:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/5] ASoC: rt5682: clock driver must use the clock provider
 API
Date: Wed, 21 Apr 2021 14:05:10 +0200
Message-Id: <20210421120512.413057-4-jbrunet@baylibre.com>
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

Clock drivers ops should not call the clk API but the clock provider
(clk_hw) instead.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/rt5682.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index a5aacfe01a0d..e4c91571abae 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2634,7 +2634,7 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
 	struct snd_soc_component *component = rt5682->component;
-	struct clk *parent_clk;
+	struct clk_hw *parent_hw;
 	const char * const clk_name = clk_hw_get_name(hw);
 	int pre_div;
 	unsigned int clk_pll2_out;
@@ -2649,8 +2649,8 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 *
 	 * It will set the codec anyway by assuming mclk is 48MHz.
 	 */
-	parent_clk = clk_get_parent(hw->clk);
-	if (!parent_clk)
+	parent_hw = clk_hw_get_parent(hw);
+	if (!parent_hw)
 		dev_warn(component->dev,
 			"Parent mclk of wclk not acquired in driver. Please ensure mclk was provided as %d Hz.\n",
 			CLK_PLL2_FIN);
-- 
2.31.1

