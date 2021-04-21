Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AD366A79
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 14:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29B3167E;
	Wed, 21 Apr 2021 14:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29B3167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619006951;
	bh=00HEu767C/qnCs+HO53u4HT6t0ElgPAPFT66hdkr7Po=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwexi3Q94thTSkmU2Eop+2trQcTsv1lrAAORiZ2CWsfHoIwqs3ui40xT+5bH5f3+J
	 hG1C4GtTsadDySjE6xM4WzVHPBoe63GHxlFgVGA58hsfAxlWtxGMvo6q8EqbQEmHMl
	 mifXvTpc0I8PP31EomHef1xTysJ48b22a1kr/jLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24384F80274;
	Wed, 21 Apr 2021 14:07:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E615F80256; Wed, 21 Apr 2021 14:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB77AF8019B
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 14:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB77AF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="GlEpzyx3"
Received: by mail-ej1-x62d.google.com with SMTP id l4so63098085ejc.10
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q07ykK1ULP/ibg/9n8NoWYiD7j6jQhiXQ7i84QPtE0Y=;
 b=GlEpzyx33lz2gU7/Cbybd7BmusmOb3nqZ5HKZrMSLaEymWqWB8Dlyn46d1wKW+COtJ
 vmDAxQloBKobz/H9kB+oX3FztRh0L4taHYosZPSEl5uncPiXP+fCNkVfOnQFDcoDmnDB
 uk53AfRTecstSOupxjGt9ch0kylNgcscHh2k38A5Th6h4udN78wHeToJzLvB0JEDltdU
 rnJyo39H9Vo0H6j3rSCorI1JUUh1DPwO3u2Lj3vILFK/XvL0Zn6nBap2CItrNcxKHCjt
 vVh13F0llFljsu3UPRCX8oICbcRecrAo7l+ekw+bANViX4OGjobvCTN7FhUxJMijGfXN
 2iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q07ykK1ULP/ibg/9n8NoWYiD7j6jQhiXQ7i84QPtE0Y=;
 b=uTlmelqQYAV+1/7En+r2Nzad2al7hW43/prZ280arGp6tHHOMZb+1TIBxR6MW0S1E+
 QU+2WPOn9U8dJNZrgZZrSufVY3WBZtGQx13NJZk5nosBdJaGM3e7hhv5xQvI7y2cfG2i
 dS5izo54dIhQMldTfzSzTGU4H8AJxmLvwaayw9B873vecMWjHiyLH+tVRT8O74qo6eHV
 iFjuX0hNvAgLcXhtXVmG5N1qxtbloeUR2+PsZ/m5s5ETvwoZKbqHO6OzRovvS8rke1bY
 l8t+aNix5R+pE+h0GDHD5EUlpGLyJc187Q4e1H5hNAbYS/mJE8Y0IXE3EgNLauIZOrBY
 /hBg==
X-Gm-Message-State: AOAM5308ZhFOsmZD0V3RsT9Hcu8RUC2lQm/ScDGkv01h+I2WbDN89fkh
 SDPNbOPDe7VxzteFMBu2oibuaQ==
X-Google-Smtp-Source: ABdhPJz8xMgQctTHmyAVj6SIEVsTVax+NgsmvHwYH7mxMv4oHBE1Oez6RhdvfJn20KsLb9jcdu37Ug==
X-Received: by 2002:a17:906:1749:: with SMTP id
 d9mr31355615eje.12.1619006738497; 
 Wed, 21 Apr 2021 05:05:38 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n2sm3151431edi.32.2021.04.21.05.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:05:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/5] ASoC: wcd934x: use the clock provider API
Date: Wed, 21 Apr 2021 14:05:09 +0200
Message-Id: <20210421120512.413057-3-jbrunet@baylibre.com>
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

Clock providers should use the clk_hw API

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/wcd934x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index cddc49bbb7f6..046874ef490e 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2116,11 +2116,13 @@ static struct clk *wcd934x_register_mclk_output(struct wcd934x_codec *wcd)
 	wcd->hw.init = &init;
 
 	hw = &wcd->hw;
-	ret = clk_hw_register(wcd->dev->parent, hw);
+	ret = devm_clk_hw_register(wcd->dev->parent, hw);
 	if (ret)
 		return ERR_PTR(ret);
 
-	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return NULL;
 }
-- 
2.31.1

