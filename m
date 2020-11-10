Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211D42AEAC2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A311750;
	Wed, 11 Nov 2020 09:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A311750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081813;
	bh=v87MWPCyqFz1A5ZtW6iw1NMTwHtBJkPty3SNLJDEtmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qj5PDIqV/emIHkfIeiP+Xc7gthMzPsCHE7yIPJhra9+yW1UU24f6cXyQK0WfD1fWi
	 WczbTl2HjitGl9MHZhwPDiEGFin6yxd7dzbfDue0Jg1u/b07pmMOnDoiiYDsxkS3bK
	 7YVrnlTJBTF5ng9ee1m58kzjPtiOLczn0LIyP+tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E83BF804E0;
	Wed, 11 Nov 2020 09:00:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38801F801EC; Tue, 10 Nov 2020 21:40:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C672F80161
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 21:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C672F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FN48rflG"
Received: by mail-qt1-x841.google.com with SMTP id i7so9608346qti.6
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3FzbtsnN/POt+bT5HXCT14+UZCmaT8YLiJoBCKftBP4=;
 b=FN48rflGzkzexreqWN2DnCgcXdGSE4+qhE95tmcHMBWTkjUfLGKpL2CuoKrVGzm9hk
 j/pgIH+8Hc8hTPI95AvTFIchAm64yWZQaA7FS2D5NENMLxVJ5C8fiw2Md17rObd0XYQ6
 AiJB3MwfdohaGShb76RTzpkDP7ppzXTgaDazsIn9tRrLZW9YmIDAOdXauOlRVsuycGB9
 8zd5lBatOsDSnHLBO/pNRwzzlbV8QYdQ+ctADWzIvXZQwJD3FgXcr+nlArUI8L76hxtO
 2+H03CTgb6qjbizh3N4Dcq9tIfmbtj8Je16uFahDC3BD2rag7Grhy38KWQXYMeDp+OcH
 l7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3FzbtsnN/POt+bT5HXCT14+UZCmaT8YLiJoBCKftBP4=;
 b=RNjrTm5FEaPB6D6X0EeNRg1x0EUf/7H/d+NK+HfgTdBSkjcHVAfqs1qGK+AcZmfjtb
 /B5j96x7VcBLu8uQCJ9VCpitIlnTc0wz5LW+H6pdUGnwIQS3UbmGX9Uk1w4yUhjZfTYG
 9yxQj3mL6m0iNtj0OePMwFc57JcTsqHE4kJCgc9ZQhXn54fKi9d64fOMomFUiwwQPpRy
 KWHGNfT5OatRPDnbVewE0tFX/hhyBvls4z8NzqeRvtZra5EU6GQNkMdFND96UvM4H3uv
 mgnwsp/oUDgqObbwDB4Q6BgRYDakBOJJvi41L81JPWe7XUxlkilnraWEoVBdqCF6H6yC
 lMLg==
X-Gm-Message-State: AOAM533jWHTKl9oFYlexTtwZtOJMCdFyQHtcvF5ZVxVa/IAQn0HWvEu3
 c3JjxDvTwG9BsID2XDCb6dg=
X-Google-Smtp-Source: ABdhPJzZhQXdptop/w6izv1DPfe2DpPSK0gqIOjNk8X/xhK3x9itT9VjsRxwvM0GrZh56Dbt1JuF6A==
X-Received: by 2002:aed:3fb7:: with SMTP id s52mr20646864qth.100.1605040803199; 
 Tue, 10 Nov 2020 12:40:03 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 a85sm6247719qkg.3.2020.11.10.12.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:40:02 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 5/6] ASoC: fsl: eukrea: Remove the SND_SOC_IMX_SSI selection
Date: Tue, 10 Nov 2020 17:39:36 -0300
Message-Id: <20201110203937.25684-5-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110203937.25684-1-festevam@gmail.com>
References: <20201110203937.25684-1-festevam@gmail.com>
X-Mailman-Approved-At: Wed, 11 Nov 2020 09:00:11 +0100
Cc: nicoleotsuka@gmail.com, shengjiu.wang@nxp.com,
 Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org
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

SND_SOC_IMX_SSI was only used by i.MX non-DT platforms.

SND_SOC_EUKREA_TLV320 already selects the SND_SOC_FSL_SSI symbol,
which is enough.

Remove the unneeded SND_SOC_IMX_SSI selection.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 1536c6d411fa..31897fff6c71 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -244,7 +244,6 @@ config SND_SOC_EUKREA_TLV320
 	depends on ARCH_MXC && !ARM64 && I2C
 	select SND_SOC_TLV320AIC23_I2C
 	select SND_SOC_IMX_AUDMUX
-	select SND_SOC_IMX_SSI
 	select SND_SOC_FSL_SSI
 	select SND_SOC_IMX_PCM_DMA
 	help
-- 
2.17.1

