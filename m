Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2312FA02A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 13:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9291822;
	Mon, 18 Jan 2021 13:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9291822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610973790;
	bh=LZn7qqsqPk2XSv6r0cys1yFe/NZJIIhMg01HlkydHuA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTN3Fx2nmC8oDOdEgOQAOVmApzmAB/keSSRgXr99Wx1g39oWi0dsWq1fSyYtPHIxw
	 JZCc+TeRN2nmn2mig7ghHZSrB50ElJShmgQ9bZ/NaQUV3xL8x5heYj7K+GehcJNcJ8
	 ryvuqJNULDcr4qP6b8Xf2C7M4Bn4D1QHdRb5O7tY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2545FF804D6;
	Mon, 18 Jan 2021 13:40:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B46F8026B; Mon, 18 Jan 2021 13:40:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F28CF8026B
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F28CF8026B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yc7VdFXJ"
Received: by mail-qk1-x731.google.com with SMTP id 186so18459177qkj.3
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5U3n8kNssmwRQPCwUYtUeJSgG0vkw7lShI1uTuBirI=;
 b=Yc7VdFXJCOiZqMrprGqvr2VpU0/raLGQDI3J3b+rUq8av28nNh9ypc/10JVJTSTVeL
 zr1Z/m2kDTlZStKAT4dXHNF31bhoCeZF22QqMt/xuD6BTLHvQQUYAevUtKzZrD7ClIa+
 OO0ElZSkU2IfHW7SDg1zIyR5X+ASuozlyVWeYYYrWkUxgbAPV9iD3ZCeszWpZIgFUvu3
 IyQyRkQXGhdh4dOqSZwVe+sBiGctn5PeS+KMxBJQya3iyyypCAX7FtVcfG4SB5yG0H0i
 U0eUKN5FfGij7IySLie/67F3XjYCnPALfiAsMjk3gXlChnRPIPvRCpKBx+uppn+zehZQ
 ISdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5U3n8kNssmwRQPCwUYtUeJSgG0vkw7lShI1uTuBirI=;
 b=ANScb7uftqNSfUXUwSMA8jyp01JM8vqza7ZzwZX/mqyVVD51P+BcJIXTxVqBPYuUpn
 RjSJk/YpQTFWOvwlfrfIG2Rx7r9CS0Nu69VGHWOy37Y1TwxSAjK+iPaGlmzf8e8DFuag
 NNqJqB2c9IeZT7lVX4YmJLif8kaiib+lek+3F1LucdEJfAaRpPTDAWYeB0EJgLkZPLdG
 r9+kcEAn39Nj/klxlG5TJM3GZh6egMsemm3jRkoxLks3JaKJiKGNmxGhvFwcjELaBtAJ
 aTxW0OKhnuhjXMigfIUPEYWg+prjSHNysVnynZbYdtC1DkArEoeY2+GHEft2QqsxxWR0
 7JNw==
X-Gm-Message-State: AOAM532vKjksXHSwQGo7FCpIWDCzJTKwafEsX88Eu5pg6qInYaW4+f/B
 BKuqzRHzuJqo8Wg43she2MQ=
X-Google-Smtp-Source: ABdhPJwIL0SCOctWsTug0ue7r5ar70CH59LN3taG6IG0ZnEHm/9VLpd/AyF2zLFiLkBfg11KOJI15g==
X-Received: by 2002:a05:620a:b0f:: with SMTP id
 t15mr24645531qkg.485.1610973634154; 
 Mon, 18 Jan 2021 04:40:34 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id q92sm10022654qtd.48.2021.01.18.04.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:40:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 4/6] ASoC: fsl_asrc: Remove of_device_get_match_data() error
 check
Date: Mon, 18 Jan 2021 09:38:13 -0300
Message-Id: <20210118123815.1630882-4-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118123815.1630882-1-festevam@gmail.com>
References: <20210118123815.1630882-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, shengjiu.wang@nxp.com, timur@kernel.org
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

The only way this driver can be probed is via devicetree, which always
provides driver data.

Remove the unneeded of_device_get_match_data() error check, as it
can never fail.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 02c81d2e34ad..c325c984d165 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1083,11 +1083,6 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
-	if (!asrc_priv->soc) {
-		dev_err(&pdev->dev, "failed to get soc data\n");
-		return -ENODEV;
-	}
-
 	asrc->use_edma = asrc_priv->soc->use_edma;
 	asrc->get_dma_channel = fsl_asrc_get_dma_channel;
 	asrc->request_pair = fsl_asrc_request_pair;
-- 
2.17.1

