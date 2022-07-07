Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3756AC11
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 21:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4DE2162F;
	Thu,  7 Jul 2022 21:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4DE2162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657223298;
	bh=Esf+t464Cxb3G3ZAJD3hHNWKjclI9NCMA2Yww1fWWZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SgX460A+HtN1HE4hCuKRZY2ULl9dCwwQM+MjRQRx2LHZ3pdHouclz4sf/XDJgBD24
	 0USM+RbdJfGiKv67YbQsaClCb468CIPN5dFSzqovmU8eIayUVY90gVtQJ50k+Fv19x
	 z9joHDneszD2A3j8O7hmrvEU2gZDZgz1aw9cNQ80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91763F804FA;
	Thu,  7 Jul 2022 21:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DCC4F8016A; Thu,  7 Jul 2022 21:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E8FF800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 21:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E8FF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IcqaBb2Y"
Received: by mail-ej1-x62b.google.com with SMTP id sb34so34153006ejc.11
 for <alsa-devel@alsa-project.org>; Thu, 07 Jul 2022 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UB7bWLpN76PQbdxMQ5VYzrQ3FPvdWLLOGLWs9LTQXic=;
 b=IcqaBb2YZi0XPrxjT0Sw3FEEa7o2NltgcsxgfJOa6eovx2O0PvWc1ZX3/qRUViniQ2
 6UUqPzsjHacGXQ7IqSY9/Q4UoOEPxTjSyvqlwFfMmIUAsUfuUpaZFnqIuy/2E7+nPBEC
 7tD33Cpqx7bBSosH5S8/2tmKU2xJZed9UMhaQesXyi6xus+1VgjWwyj2Kky3o4eHOGWJ
 XXkTmNxHoboITxJ5b0kmnPGMsvkrO9VynKU8i+UYPnZ9qXbx9ikGzkbu7BxWghaIezjT
 6q137WQVjfxbO/GevLujXIPtjveFeYlhi9N1jU17jH9UY9+yrvLJZGRAbbS7heCLktv0
 YkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UB7bWLpN76PQbdxMQ5VYzrQ3FPvdWLLOGLWs9LTQXic=;
 b=eEvxe3yAXaitN9aUEne9pXyHpdG3iWJFuvuDobjCLrXJs4353EVu2wE5kjCvoEgFPO
 bfWE6yMevWQN8WBuML+xwLRIlSbCKV5Nx/QtL8hft5eaoDr8PNIdMX2pNdLu1jBr2OOS
 0SnbSRPV5MAc7STVGCVn0Rf5DLduyrKOJ3u+YNRWS5UOCdvy1/mfN5Z9RRwvTM00dDCW
 /xYVcrQWd1RrGAe3FYC1gANdKPWspzE1kBN/ewBobdDu9qEFD8jrztxSzVlEpxNN7slJ
 W1lhp6aRvCP6OzsCGPLpXIyjy0Oa9+aP5gkNrql0gx0WLz0frvnE/dQBNDpEeSxdewVm
 uAiA==
X-Gm-Message-State: AJIora+x/MoOh/cdJCA6LKc5MCDVFvVn7Mm6QAi7e6SqeAlXDZ5TEVfO
 81r6hJIxnrtQ3iGnWBYgPj4=
X-Google-Smtp-Source: AGRyM1utMV2zsP5LBNoFrrsq2l4p2TqWZmG7Ipnb3c+GXRect6ryZDKwCot5L1ih/dFNuD8HUw1NPg==
X-Received: by 2002:a17:907:7ba8:b0:72b:1491:c73c with SMTP id
 ne40-20020a1709077ba800b0072b1491c73cmr3123832ejc.415.1657223200530; 
 Thu, 07 Jul 2022 12:46:40 -0700 (PDT)
Received: from localhost (92.40.202.166.threembb.co.uk. [92.40.202.166])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b00726b03f83a0sm15029570ejd.33.2022.07.07.12.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:46:40 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 01/11] ASoC: jz4740-i2s: Remove unused 'mem' resource
Date: Thu,  7 Jul 2022 20:46:45 +0100
Message-Id: <20220707194655.312892-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
References: <20220707194655.312892-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
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

This isn't used and doesn't need to be in the private data struct.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index ecd8df70d39c..c4c1e89b47c1 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -93,7 +93,6 @@ struct i2s_soc_info {
 };
 
 struct jz4740_i2s {
-	struct resource *mem;
 	void __iomem *base;
 
 	struct clk *clk_aic;
-- 
2.35.1

