Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0150253214
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 16:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDED176F;
	Wed, 26 Aug 2020 16:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDED176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598453541;
	bh=Ll4xsfiXa6dFreMGmr8jn0xtDKD1luWEnl5tzrpEESQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NIu+3SqZAa2L2WzT5OKSjWb12BMR1ejNglTLnHEkLjvOLRFK31uUbcgvX5/4eP7e8
	 No+LPvG60fGcZkGzqBgoViJKnFoNbBCAWHggJDdKm+cUw7rQWcikBdLCGbaRGdt9GW
	 28qQwMH1D9SAnYsMlaaDQoFi2uyE6N6uT5PcC35o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67FD6F80257;
	Wed, 26 Aug 2020 16:49:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA9FFF801EC; Wed, 26 Aug 2020 16:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F607F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 16:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F607F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TmkqytJ1"
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52E6B22B3F;
 Wed, 26 Aug 2020 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453386;
 bh=Ll4xsfiXa6dFreMGmr8jn0xtDKD1luWEnl5tzrpEESQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TmkqytJ1uLO963Cue4uNLvLBqkcqbxwCNpO+LlZadCR2QQapaEbddrJcUTfClnrue
 ZbzdsVKMUFNFQTsmFGInc/detcyLH99Z0e9tomw1/7P67wWWT5rz5Q2aE66BP5fbgL
 i1z4oOIkhjMBYuRov1to802Suxp4iT3qfLbV/m3E=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] mfd: wcd934x: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:49:35 +0200
Message-Id: <20200826144935.10067-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826144935.10067-1-krzk@kernel.org>
References: <20200826144935.10067-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/wcd934x.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index da910302d51a..c274d733b656 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -219,12 +219,9 @@ static int wcd934x_slim_probe(struct slim_device *sdev)
 		return	-ENOMEM;
 
 	ddata->irq = of_irq_get(np, 0);
-	if (ddata->irq < 0) {
-		if (ddata->irq != -EPROBE_DEFER)
-			dev_err(ddata->dev, "Failed to get IRQ: err = %d\n",
-				ddata->irq);
-		return ddata->irq;
-	}
+	if (ddata->irq < 0)
+		return dev_err_probe(ddata->dev, ddata->irq,
+				     "Failed to get IRQ\n");
 
 	reset_gpio = of_get_named_gpio(np, "reset-gpios", 0);
 	if (reset_gpio < 0) {
-- 
2.17.1

