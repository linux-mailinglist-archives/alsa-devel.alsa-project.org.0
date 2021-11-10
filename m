Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8882844BAAC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 04:47:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0958B1673;
	Wed, 10 Nov 2021 04:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0958B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636516048;
	bh=pxFrsHk731+mqoXnGD8v3utTwwo7aoZw7wojuI+vE4g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VytVQMMmTfGSUqMYJ1NXM0oSwjqicJOlrEXndWDzt6m/JXX4s0e5tanGZxAXC9zuA
	 0V2rZdByOSN+6Hx3Cb8u2nmUFj7b/cJxfwLNYyzjrOQ9gecjhYdOuiImz0p3yggENo
	 b4bBOOVmpqZwYxR8bnAJe27ScDGFbv7VsUCXwUjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA66F800C9;
	Wed, 10 Nov 2021 04:45:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0810CF804B3; Wed, 10 Nov 2021 04:45:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89415F80227
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 04:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89415F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bbUCgCTU"
Received: by mail-pl1-x635.google.com with SMTP id b11so1813072pld.12
 for <alsa-devel@alsa-project.org>; Tue, 09 Nov 2021 19:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j+UNDzr76YtRYOgnj1yrFAUu6jSMEmlYMYsY1vhmpWg=;
 b=bbUCgCTUXdoC6/CIRW9kpIEIUXDm9r8asWvPrXn1jBH8vkY0wbbeVlnLLOA8kQLr5T
 czQLBLZf3wdbsyBaitNPs06rU9KSX0TUEBWw0b7S1oJGtYMgOZ+eABk2j2Ngvfpen3Z1
 G0pnZA/GaZqgc4CGyj3QhUdRC9EZWWAUDSGXr5RzZwPd/fBS9HbjU70nMlX631v23IFz
 ANV0jn21wJXlfCYEV12qScMW76bD7Tfbg+S2kDFMKfnEtIJZkNk9dFeNHDINTQx2bDu6
 4fhy21YDLMNDI/pdtvlwxlvyuixcDtMZ2ObWma4VfQow7vRZp7mTAVDWQ13cIwZwDAqp
 b5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j+UNDzr76YtRYOgnj1yrFAUu6jSMEmlYMYsY1vhmpWg=;
 b=uJWx8jMnmq2AEg0oVvowKIIoNYE46erWMTlK8ASIlUFXXUsEGj+QhXP7ZJb3eTjcHL
 KVgyy1wFj1JuJjjWWUVSLrskEAz1zAwSzIOp/BvC7+7L+ZUWWz03d61jSYD6Gp+kHXGP
 OCjO91bB9jDo9OgCrE7P0stq/3q7FL0gUwytvHiGuDRWJWixS4g8QWKcfS1VNzd2UP8t
 NNYoI6R0Nbt1uhhg+MGVUCEx5RRgcZiQpyGhG8r1pXYVNjZJQ4i6a84Zpa53jAujDf5S
 YXtGR7l5c2kKHPr829yQ/Riv6hNKoQ8iURFWw/IODP9rNIm80TfspL3OSiqM5aTaiNCV
 fMyA==
X-Gm-Message-State: AOAM533c3GJqiyIfT7K550IpYdAsHd04pT5z4V2ZXgltBaTOyz2YFCSM
 Pgqz0kCtQTConkVEO3M54QM=
X-Google-Smtp-Source: ABdhPJzoaSe0uLk6oAeUh0bwrbZj1a2WnpanO6XwD0mtnjcCQ2Zmzop9I5F0PKtmQof2Zq9T/kB27A==
X-Received: by 2002:a17:903:2348:b0:141:d60b:ee90 with SMTP id
 c8-20020a170903234800b00141d60bee90mr12175007plh.15.1636515931421; 
 Tue, 09 Nov 2021 19:45:31 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:46a:f117:d5ee:c3e5:104f:c135])
 by smtp.gmail.com with ESMTPSA id q6sm5995293pgn.42.2021.11.09.19.45.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 19:45:30 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2 1/3] ASoC: rt9120: Update internal ocp level to the correct
 value
Date: Wed, 10 Nov 2021 11:45:19 +0800
Message-Id: <1636515921-31694-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636515921-31694-1-git-send-email-u0084500@gmail.com>
References: <1636515921-31694-1-git-send-email-u0084500@gmail.com>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

Update internal ocp level to correct value.

Even the wrong ocp setting can also make the sound output, but the power
cannot match the IC capability.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9120.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index f957498..032c520 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -149,8 +149,7 @@ static int rt9120_codec_probe(struct snd_soc_component *comp)
 	snd_soc_component_init_regmap(comp, data->regmap);
 
 	/* Internal setting */
-	snd_soc_component_write(comp, RT9120_REG_INTERNAL1, 0x03);
-	snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x69);
+	snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x04);
 	return 0;
 }
 
-- 
2.7.4

