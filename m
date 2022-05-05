Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76051B5B9
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 04:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2746D175C;
	Thu,  5 May 2022 04:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2746D175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651717127;
	bh=pDRiol8HdU9MYObE/heLrp0oG11aAs0Md6oT0FLEQEw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zqb8SwS+gHyOlcfFd0+Hf2D3DlTq1gRRWiKCDW4TDu/kJVGReEUIL/Pz+agm1s0d7
	 d1LlUJHAOxQQ79qIds0iDg/M9pWa2oMVB/Ciq3EutXp5HAqZ1rTazEZvLe0BZJvEao
	 shpEhVducv7FPF0NkuwgW3g9cZZ+9QIu9uk8LCH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 904D9F8049C;
	Thu,  5 May 2022 04:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8621F8016B; Thu,  5 May 2022 04:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9412DF800F0
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 04:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9412DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GC3/Rj8I"
Received: by mail-pl1-x631.google.com with SMTP id j14so3119239plx.3
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 19:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F2nk/ssfCB0vTWyS6vaFNqXTpQUVylAvicTxU2kBcY8=;
 b=GC3/Rj8Izk85qe05Uvsum7tPpxVZtjLFcopo+A3fa8s/5loDut8y7iWCNEvjQme2WX
 EnmOc60vVyj8KiLzODlQ6vIc4N7UR5ztYnrnKC9I8VbRAiJLxxdpXtLE606l781T9l20
 5ecROuPBCMlPt4JR4HtdNs0QLHYVKSVgVoXNGT04VLTisI7byfTH4z95mpUs4rapUc9Q
 7aVMqa30ajkIpZ0g8BWQ7GjsJw8TipMOzn8T31rxkIqUD9anJ4X5bjAEbEiwRXyCq0Na
 azH+2woprSkwLESH9c3T2/k+xULIgJgKTh82lSDmEPV4jrXQzQ/iYZ6OFAaITkSOCqnk
 O+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F2nk/ssfCB0vTWyS6vaFNqXTpQUVylAvicTxU2kBcY8=;
 b=LyY93TOI9dSWtyPUxQau0fa4d2mAHTBTwCgWE3Q7UezTkbPGWtYKesV6LFsuTcKHWg
 fMLczjIrI1Vl4QdeANXIajdC2GLpTJ7hUUwTaG5zfMORzsP2hcHHq0Mqdpq+kuk47vH7
 EMJaObV/6DO+3kWfWuCg4+0TcIoCeQ6D8O9N/FVVw7hccC69XCHgzceKPXQD2ZpM8/Sb
 SVo+hZRPmDewIDSERpYwhtxS8A8OqrwGan7AZS0ptDcd+x4z6+PGcttnc4Rd8BdpGWQi
 CMXosQRqdrV0q7FSQ5lgxlvjX1si9De5o0kreWj3QBzm33aGJbKGt3sl88m/Y2NXxkwM
 qsmg==
X-Gm-Message-State: AOAM530Rm1xqJ1QXgBn6XwgABMrnQmSARmShsr6AF1nFxp0sUeDH9YFP
 xl+zs/wQ6cCQPiCbZ2qT9LI=
X-Google-Smtp-Source: ABdhPJxIK9x8R05f9RBILPM4SBRiuoNiqtGSovQy5pR4hh+ZgLz2hy5Ac/8ilHaiMumxaeKAEigllw==
X-Received: by 2002:a17:902:bf45:b0:15c:df47:3d6 with SMTP id
 u5-20020a170902bf4500b0015cdf4703d6mr24385071pls.58.1651717057904; 
 Wed, 04 May 2022 19:17:37 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a63dc53000000b003c14af50631sm60468pgj.73.2022.05.04.19.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:17:37 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: uniphier: simplify the return expression of
 uniphier_aio_compr_set_params()
Date: Thu,  5 May 2022 02:17:33 +0000
Message-Id: <20220505021733.54275-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/uniphier/aio-compress.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index 0f76bc601ca9..7d1492c15b57 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -139,7 +139,6 @@ static int uniphier_aio_compr_set_params(struct snd_soc_component *component,
 	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
-	int ret;
 
 	if (params->codec.id != SND_AUDIOCODEC_IEC61937) {
 		dev_err(dev, "Codec ID is not supported(%d)\n",
@@ -161,11 +160,7 @@ static int uniphier_aio_compr_set_params(struct snd_soc_component *component,
 	aio_port_reset(sub);
 	aio_src_reset(sub);
 
-	ret = uniphier_aio_compr_prepare(component, cstream);
-	if (ret)
-		return ret;
-
-	return 0;
+	return uniphier_aio_compr_prepare(component, cstream);
 }
 
 static int uniphier_aio_compr_hw_free(struct snd_soc_component *component,
-- 
2.25.1


