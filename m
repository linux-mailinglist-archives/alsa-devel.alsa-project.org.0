Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED0C56B767
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFC1F84C;
	Fri,  8 Jul 2022 12:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFC1F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277046;
	bh=8d7/aWqk5RWSqkgw5Yecd80iXqzgfGdxN8jxX9lweHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULEUTWqDsDEoxIQd7Tq4zGdTg2Cevlf45nsj3zS0nGKDw3x9T0pLX+UqdfAxkZJcz
	 KuECcv+ZuPJDpoqZwRT8b/tGrWC2N6mOD6JuPA+VfONvu/dRFEX58wTcm9NaX1SKKV
	 Ay9HqOpXAo5UMw+zC3+UMBjkaQB1VP76UcgbPqrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F20BF80538;
	Fri,  8 Jul 2022 12:42:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A66EAF8053B; Fri,  8 Jul 2022 12:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 565ADF800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 565ADF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hNAlF244"
Received: by mail-wr1-x434.google.com with SMTP id q9so29971355wrd.8
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNLK2rDLllywqVSRYR5bhiW0euJmRmqXRdRAao8DCak=;
 b=hNAlF244GSZTujP2eVPybCkbb6vohkncV87L8NOv0gg1xt+UCrMJIcl4Ov97BPJrHE
 QIySBdjZPDvE41kXki8bZiZUEEwu6bwpg1+mDOcwyWb55VlPwjH+S9LjurjkdqQ86WV5
 CTPVmo1lndtXxro61uo530WATKGF9/B9Z/3jTnn+55IbeFwNAZLtYj36CVV7l72wiQvv
 wvMEAWSuDCHAX1CG9qTwiFRcdeb8lM+MRKE00a7rjS0DHQ+hKmocBcFFtMwNkVwLYD2K
 P+jt5L4OtKwrswNHIYRXnjbSc+J9KSfzd6JK64FpP21KCYBDi4yxU5ZbHbGbGQendhiT
 zSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNLK2rDLllywqVSRYR5bhiW0euJmRmqXRdRAao8DCak=;
 b=FP3dW3plfc/Bc5whq9JPcBTFIpXX+1JXNegIyN+Ew+9CcI8OKq1Kf98jybSNaXYKq7
 zm97cLvymtnMqok+0TlAlTwh7xT0Ry+c3S5gOo55dG4STpLIpoTcE3XM1lBFl00iZdgY
 p2uoVvTo1quVrUdtr84RuiOyTWlfAhavNiyHybvO6ntjKgAnxVdDXEkmLoLV/bWWOAKK
 LlUTjzarsr3RqClEe+Wum+0Ve6YYCfQ609RrDU7T3ObSHZSll95hjiqQb4Ul90vQ4vSL
 bCykH/y0ZdNrDQVHgsBdi5PTkMgL083gbEJMijUNX0f60227YpbW7b0PaYax5Nbcewau
 wG4w==
X-Gm-Message-State: AJIora9h/w8vgTRQgUsX8h59KgR0oypy18uxADXtCZXpn7U1D2iRKLyI
 FUExb10qwMYFGeraui2sniIaRJNpIVw=
X-Google-Smtp-Source: AGRyM1t8n+yXqdXi4Z0qUnAyHliZ8oHhKlMiBBcwPTRakdev7E/nceSPKxhKk0l2w3v6C5FKiE4+4w==
X-Received: by 2002:a5d:4649:0:b0:21b:c48e:3ce2 with SMTP id
 j9-20020a5d4649000000b0021bc48e3ce2mr2726765wrs.312.1657276940772; 
 Fri, 08 Jul 2022 03:42:20 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a1c7509000000b003a050a391e8sm1594074wmc.38.2022.07.08.03.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:20 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 01/11] ASoC: jz4740-i2s: Remove unused 'mem' resource
Date: Fri,  8 Jul 2022 11:42:54 +0100
Message-Id: <20220708104304.51415-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
References: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
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

Acked-by: Paul Cercueil <paul@crapouillou.net>
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

