Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 673AF35ACDD
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 13:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FF7C15E2;
	Sat, 10 Apr 2021 13:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FF7C15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618053403;
	bh=p932I4kYOrGf2dFNEWq2zkjWF3ouBS2knhY8Ph1Gev4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikGfb2jpzrW+wX4x/2X24SsWoEDnb7lycevqodU+cGilRKf6TgmWzLyvQhy0/mx56
	 IgUfVjuhzfzAcKJLhjIBZJTfNkwyeVjhS5LixLnzuoJJ5+LDllhWhXDZdCR4kx2hKL
	 Qv7FaA4YWWCLT8qFfPq+BwlsE2LPu7pPBAORZD7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868BAF80423;
	Sat, 10 Apr 2021 13:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBE74F8032C; Sat, 10 Apr 2021 13:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CD04F800BC
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 13:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CD04F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="cXylEKo+"
Received: by mail-wm1-x32c.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so6060270wmk.4
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/A1ey0fLWzt4WfgOVIBJQ6OOA/NjG5WdKypO2QtjLjk=;
 b=cXylEKo+G+FGoGWw/Pc7EvcipCQMgdCwsCVSuOn0lNMElci4Uwgw6QgfFeBTzpxfv9
 EtSFvasQCMjEjVFW/9G2U7CsPYrf5PfziFhGF3dNFZMr3uMkU82tc6C1Wwbv7VA0KHc8
 ojOqmLZSFhtzbh6iDgmLFjhW/LiWXjoubdAIO0mu6YJGyBTKNHA8a0ldQsuPeAQrhqDN
 ozDkZ2wc/vJzx52g7FMIIU9DsjeYj/hlKPMGLvGLGNjPKrdUbdRQbNWuqfl2G08X56/L
 l2oehw6RUsJc9un73dH43V3lZTAbXU6OThn4MWGYBzBt2C5qKNd7ydWlTgpGS4bAYyk0
 KBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/A1ey0fLWzt4WfgOVIBJQ6OOA/NjG5WdKypO2QtjLjk=;
 b=uP0MjlK8MdP0VOTHvtOn48bqeKKhwOi9MGXghzJLjGn0JJJSCvAx0jRwbvqGLonomE
 sL7elHTStBMnmr6Z6R1ptADuomlAksODsUwYbuKfy66AYAwFqIlsWGIv6k/PywEaLAIb
 ZOfmEVJb0poSAmj/K2H4CtJab4yVL05LdTwt6aM/oA62ibh62GIrSZBcJ3eKR+JLAZ7+
 /yFrLZ6UbfQfRuA/J5zLFAL4tnK7wlzm3fY6bXjHrMA50yWqKBpw8DEoGyMxTgt7UOnI
 iodg3MlBfsdVf0DVUtij+c5VUt6up5AkglOkqG2nFZ5wXTFlI+bKOIzvMcdIUHKVujBY
 8Iiw==
X-Gm-Message-State: AOAM530fpz9y4TKLPUNmwh6UnbOo/qjL20tBMZAZSxvbpZ0waCcXgnC0
 RzH1erxMRtuzxVKDxfW/DkX4UMkKZn5Qlq8T
X-Google-Smtp-Source: ABdhPJxnYmdRljzrAfTykkmUmv8lKocSDXkd37oY600OclPmJY0gM661zX+6NBdKcwz/FMnSFZ4huA==
X-Received: by 2002:a1c:6446:: with SMTP id y67mr255983wmb.145.1618053243628; 
 Sat, 10 Apr 2021 04:14:03 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id s8sm8370117wrn.97.2021.04.10.04.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:14:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/5] ASoC: wcd934x: use the clock provider API
Date: Sat, 10 Apr 2021 13:13:53 +0200
Message-Id: <20210410111356.467340-3-jbrunet@baylibre.com>
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

Clock providers should use the clk_hw API

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/wcd934x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 5fe403307b72..ae3ea136a9f8 100644
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
2.30.2

