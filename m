Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B06B391C0
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 18:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B540E165F;
	Fri,  7 Jun 2019 18:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B540E165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559924304;
	bh=rpoThw+CjnzZmWB1vd92dGFYQ8L3yJuXV7FmjqFovTc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFzOx/AZRvU0ZJ0ntvXkFxXk/2Fc+2ADNnyWlp03ru2g3j0iim1DQHfW2DD8TY8lG
	 rI+kJOuhV/GcQQHwi5Y8OJ4NAeRogdIn/ievN6ghS2+mI7KwCbCNjBCFVztoHxYZDI
	 P01sE8S8FbIAdBTuu22I6tIwn6czAsCWlznu3xH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83C34F89734;
	Fri,  7 Jun 2019 18:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27423F896DB; Fri,  7 Jun 2019 18:15:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BFB6F896DE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 18:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BFB6F896DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="frky9jDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1559924109; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doKixQ7W0O1D5yIB0/xlxEE1qSMkwghu0cqqt9JXGok=;
 b=frky9jDcJVgbnbbm9pGfN8fmnoOcJwhU8U2XmVkgGPqBOWNUF699DMPM+fckGPglNpqt4x
 +QHPzDFwIjmBhC0oSq0QoqbEOo+HuDcGcklRNNB7BB5u6IXrEGiR73ZgmK/wNq7c8m1Cte
 jvbLwe3O5D6TYKLZl6VvkQ9aIk6HI/A=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Fri,  7 Jun 2019 18:15:00 +0200
Message-Id: <20190607161500.17379-3-paul@crapouillou.net>
In-Reply-To: <20190607161500.17379-1-paul@crapouillou.net>
References: <20190607161500.17379-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: Paul Cercueil <paul@crapouillou.net>, alsa-devel@alsa-project.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 3/3] ASoC/codecs: jz4725b: Make probe function
	__init_or_module
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This allows the probe function to be dropped after the kernel finished
its initialization, in the case where the driver was not compiled as a
module.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/jz4725b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 766354c73076..eef7221e4acd 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -541,7 +541,7 @@ static const struct regmap_config jz4725b_codec_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
-static int jz4725b_codec_probe(struct platform_device *pdev)
+static int __init_or_module jz4725b_codec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct jz_icdc *icdc;
-- 
2.21.0.593.g511ec345e18

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
