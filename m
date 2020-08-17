Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633A246330
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 11:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC7D1690;
	Mon, 17 Aug 2020 11:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC7D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597656184;
	bh=/WXq8IVpsBdnW4bg9Eq19WJ8CdD/EQinHJUFxxbyHR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxmezdcbEwvkYRHknRXJZ+zZEPWUXPJTtJQi6Wmw1MhCZunVlCHPu0M8ustmIqSCB
	 T5zDHGsYebPaWEpdH+6GoujULQt459jemHKtH90nIYKznAELp9RTCWligcaAVzFDSD
	 YqpbmlRCIgZhebWfSesSSF9z5S9HH+hLF9I6Wdwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D017BF802F9;
	Mon, 17 Aug 2020 11:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 307E2F80218; Mon, 17 Aug 2020 10:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B033BF800D3
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B033BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G/fB+QTq"
Received: by mail-pl1-x644.google.com with SMTP id s14so1200227plp.4
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BUyJfA7GFxP9WYsjCnnZ5mhqqCfe8H9sguy9Hytfvfg=;
 b=G/fB+QTqCm8k7mhRijwIxwba+mTQode2Jl/2UU6gOPC0JsAFH/fIL8evc9I3tbrOyU
 cCqDbaJvuDHO40b6W/et7LZulgTWe+MXBEldXqlH9kbb0hJFj88uGimDxS1dTXO3N3sY
 YSMFtlclh4VZbFzrvqQL5ZcMHKl8JLRHqaKPtTK45jYZq61Vr+giBnUA7uGzZO8WwNqf
 Cy0dO0sXHnJ6g9HJp8InvVgcQbjh297hWRiwD9bR1lm2kN+X1wfCave1/wQyoCg2+v6W
 kDqd8EPX/VIG/qkduURrSkBgjlaSZ2HE1ihEUUUaxtHVNF5Tcv3kug/7chOYpLpi56BT
 x/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BUyJfA7GFxP9WYsjCnnZ5mhqqCfe8H9sguy9Hytfvfg=;
 b=JRCPtE3FE8ZpZDgQQsqtd1lt2mAIhbxlVB7J16DO0tn3xr9CwSt4ZT5MxgpGH2BmlJ
 63TOVS3gKsMm1KtnMJQLvwLocpMk7La+aZq1RJ5TaGZu31bFb8GLv4MKu2iPi6sBgPIh
 XS+9t7akKkU8NwFdi4kXIQaTxof+/8rU9lxkiojNOGfxlSALgPG8zIacPBdhibfFVWSl
 K8NryNqQKulBPywN2VbHlEj+FkGAqaXwJiWgf+SIY8ST2QdhS5Blfl72D2xvBu+kGDrj
 AglTHlCf0NLglUHY3qGwWTJBteonO+X1JJOCRjgjZ04JkaCOlSxvd/ICnRS3OIdTE3Ja
 eDnQ==
X-Gm-Message-State: AOAM533gS3uOr3hSyap8LCcr7yZ3TCDsxsxF2KWyqOs5eDknKfWWFvG/
 6kwrj3R1c20hfKFt/oPvIok=
X-Google-Smtp-Source: ABdhPJw7/y8A/avyYJkiysQnBIdqxOnFQJNr9WEE5nQtoVqyG0Vhc3lJVXthcnXO0rCAGGIqhorW3w==
X-Received: by 2002:a17:90a:13c7:: with SMTP id
 s7mr8101561pjf.233.1597654672671; 
 Mon, 17 Aug 2020 01:57:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:52 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 06/10] sound/soc: fsl_esai: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 14:26:59 +0530
Message-Id: <20200817085703.25732-7-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817085703.25732-1-allen.cryptic@gmail.com>
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 11:17:21 +0200
Cc: alsa-devel@alsa-project.org, keescook@chromium.org,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Perier <romain.perier@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

From: Allen Pais <allen.lkml@gmail.com>

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
2.17.1

