Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E02FA030
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 13:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DACD1833;
	Mon, 18 Jan 2021 13:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DACD1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610973843;
	bh=5+VSSL7E7s8nfraB6MAXlFT043R6DEISbnvI7eVIHvE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L+iPnSyXxs+ssfUTCHpyAC7ck5l2fkXE9GqTNgorx7A7FEfdklf3LFlp0Q4nDa248
	 LuBh2T5dVFsQmhdiZiClHTHs6/kdO/1wRpeAUCzkgy5vsTUVS/2tGbGmmaBdCifIrC
	 6s+t91S9YmfGb3s0cyARD46yasnZih5eTQ4ZpSL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B461CF804E4;
	Mon, 18 Jan 2021 13:40:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73EA1F804E3; Mon, 18 Jan 2021 13:40:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67114F804D8
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67114F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cGrdPsah"
Received: by mail-qk1-x736.google.com with SMTP id z11so18458127qkj.7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 04:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVMiEioA7w3i8Gm+/v1dG2o2kJb5f/Py056tr8Ni5fk=;
 b=cGrdPsahLc2fv5+75uubp3CAhB07L/YfIuCmsyN3HbP3r+XBiQ69UrzslLSo9AhPMx
 WTd5G0eazdzqQ62W8ptRC1AYS5muzempZo5opdXrvz+20STlyk2aWX7EGouPsg3Aw+8i
 n/SZNQC3nY4az/GrhPEnvzXfB+xYLnTAMLXfG0juXqIR0PSb2kJddne2me/WCo+/Ng+y
 4pqNDiRWwmB0OqqMXpqQn0U92AIjkBJqBBEA/O6+70nJiAnAq8yu7EltQmD3qyj5mM1R
 6tj021Cz76kGGveElxUT+HHQOarzWYCiX5ZWQ6f2NkoPKLLH11i8SLI3LGMxLmgyaqqw
 kCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EVMiEioA7w3i8Gm+/v1dG2o2kJb5f/Py056tr8Ni5fk=;
 b=c4li/BqK/wNi6N0zaytaJW8OFFH9HamyGcUugOYjspkg5janX12ZvwUTFkzoTvlF4b
 K4h7PKi6ww9poffCzrPyvPM6V88bc1YgXfPlAprHPkoR2k5dpBQgEo40eJeJsa40/Zfa
 9VmLss7OTKv5EAG01U7O/cHEaQqF5xGt3q2xnfMp72oHriCsPEKnpHXBiOmi7w0C4PdV
 fGN1IWEeKWLcg9QDYcYSNoFD2celeD/bA9frOkGXkaFi9rksLmuaXr3tupGykQbplSrH
 iIDYtCjPEBuEWzJEpJaZsyw9OIi+B8xop0/T2fW3WazwOwZRL9ouE1R6VLLC5q28VA7z
 IURg==
X-Gm-Message-State: AOAM532GwxnaXmoEU04OjTEne8vaREhxCeD1O13xTO/Q9WBeL/VprXtt
 Cj4z1jX2IS6MDUeX18lUfqOvlr5CrRQ=
X-Google-Smtp-Source: ABdhPJz3ZqTeH7RGTAPGCH1U/2xF1L+iq843AmnV4xeEQL/kV0t9NAhtgLwbkg0fEeV3982P4c9+Ug==
X-Received: by 2002:a37:57c7:: with SMTP id
 l190mr24329862qkb.487.1610973640429; 
 Mon, 18 Jan 2021 04:40:40 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id q92sm10022654qtd.48.2021.01.18.04.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:40:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 6/6] ASoC: fsl_spdif: Remove of_device_get_match_data() error
 check
Date: Mon, 18 Jan 2021 09:38:15 -0300
Message-Id: <20210118123815.1630882-6-festevam@gmail.com>
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
 sound/soc/fsl/fsl_spdif.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 5fa178f3f497..b4d3b04694bf 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1305,10 +1305,6 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	spdif_priv->pdev = pdev;
 
 	spdif_priv->soc = of_device_get_match_data(&pdev->dev);
-	if (!spdif_priv->soc) {
-		dev_err(&pdev->dev, "failed to get soc data\n");
-		return -ENODEV;
-	}
 
 	/* Initialize this copy of the CPU DAI driver structure */
 	memcpy(&spdif_priv->cpu_dai_drv, &fsl_spdif_dai, sizeof(fsl_spdif_dai));
-- 
2.17.1

