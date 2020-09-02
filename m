Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A925A445
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 06:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F5621740;
	Wed,  2 Sep 2020 06:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F5621740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599019709;
	bh=p8sv6kqImDY5NVcFwe8mJIagzkq3LIFPLui3Nr+zTME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1CcUzYcp1zheYPMHOSKQhCBZ8AcGV9y1/JYTK9suUJ8alvpUOkIyFnoLRu9BJydZ
	 OJw35VUvANKNbR9glWZvco2FWfrF6oRAAqN5xht5WKxbXf+DkwIYBZWmbK5lPTLatF
	 rK0AstOW8RysozyWGhAln2PSP9h/B7CNBAJMzVH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA912F8031A;
	Wed,  2 Sep 2020 06:03:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3768DF802FE; Wed,  2 Sep 2020 06:03:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0109CF802F9
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 06:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0109CF802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TQ7doj9I"
Received: by mail-pl1-x644.google.com with SMTP id z15so1652724plo.7
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0GnVK/bRT0aDvxdkx//PUkfpDKNzaBGv8SVt3ojD/8=;
 b=TQ7doj9I44t0sRzxnzhn0hapcozhgffluKOPJd3QpRDFo22WFPipnr9xKkMyiBO3RQ
 j4Z9soMSX8e7IuvhciBox0cZD70N6Z6VZ4mtAuqhKfzP3EFS1cw28wKl/nixj279jlmL
 +lUC0mtE6X5vrdddMWd9h72XDRpiIyWWhy/47TfDS48umoBouugnR+qhHLaJ/axcl8Sb
 2NqDcetmYPU8n9o0GYPCGnwUrpihIHpAhQjNhczxp/zd8IZOaGJl5YSrV2OwnAkcJ6gQ
 lfDSOk+As8gm9joUnPHd2w9nhKgXpeTaL2k4cmXrO18yrElWhyuCZ4TRFDzd90MtvtyB
 qEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0GnVK/bRT0aDvxdkx//PUkfpDKNzaBGv8SVt3ojD/8=;
 b=sL9SWB40hOHDdjX7DF01mmqgybFCw+BZDsAEs32XKI0gkPN5WPVIG5IWEAP7PrcwXw
 sUSMwBPJrRGMPcnX6m1cqv/B4Ro3iiuj6jn7tPJbQVwLP2O0pPfLvLknX08qTmbmp+4c
 jnAluxgNgt7W1aHYOqJo3HVjJEPJb4PdSUy33m7nRh1N5sn1H+nJqyEcNBzraRqvVBfI
 1wSjOe3Mvb52pokHo0nI2O4j4XQyvxiy2yXD6c8kQMbe0zFv5+4+25nSGWB9mmQEk5HN
 jV24O+T55qE4CrULfJyKmtluSCMBvRaqkpgqlUX8/QcDJl2QqwGF+kuhbYxe6HwXDOJc
 CmQQ==
X-Gm-Message-State: AOAM532C1I2HGXBlLKPbGgK49eGtPswEJhXo++deZF666I1Po4ImxSVV
 NwsbuOBmLUrBtnPGkrd/zRA=
X-Google-Smtp-Source: ABdhPJzLGH4+1YM/vJshxTESb6/GURbIA6mgHUWGzcUKqVenwrAS+Ge8bi5y7J0UTp65dF9FW2wvAw==
X-Received: by 2002:a17:902:56a:: with SMTP id 97mr450045plf.130.1599019374003; 
 Tue, 01 Sep 2020 21:02:54 -0700 (PDT)
Received: from localhost.localdomain ([49.207.196.170])
 by smtp.gmail.com with ESMTPSA id q71sm3058350pjq.7.2020.09.01.21.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 21:02:53 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org
Subject: [PATCH v2 06/10] ASoc: fsl_esai: convert tasklets to use new
 tasklet_setup() API
Date: Wed,  2 Sep 2020 09:32:17 +0530
Message-Id: <20200902040221.354941-7-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902040221.354941-1-allen.lkml@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, Allen Pais <allen.lkml@gmail.com>, nicoleotsuka@gmail.com,
 Romain Perier <romain.perier@gmail.com>
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

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 sound/soc/fsl/fsl_esai.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 4ae36099ae82..79b861afd986 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -708,9 +708,9 @@ static void fsl_esai_trigger_stop(struct fsl_esai *esai_priv, bool tx)
 			   ESAI_xFCR_xFR, 0);
 }
 
-static void fsl_esai_hw_reset(unsigned long arg)
+static void fsl_esai_hw_reset(struct tasklet_struct *t)
 {
-	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
+	struct fsl_esai *esai_priv = from_tasklet(esai_priv, t, task);
 	bool tx = true, rx = false, enabled[2];
 	unsigned long lock_flags;
 	u32 tfcr, rfcr;
@@ -1070,8 +1070,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	tasklet_init(&esai_priv->task, fsl_esai_hw_reset,
-		     (unsigned long)esai_priv);
+	tasklet_setup(&esai_priv->task, fsl_esai_hw_reset);
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.25.1

