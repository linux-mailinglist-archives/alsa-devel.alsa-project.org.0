Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FA1D87BA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 20:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1E81792;
	Mon, 18 May 2020 20:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1E81792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589828344;
	bh=TWYEtptr4tbJ4TkUF6S5C+wsp6xzyYuTx9j4EOgrydo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFmfciGBYozRXX6zzMB//h4m0RyNnldfmPmDIJqfnIyBow6v4lcqAgrTpKXKIGsZy
	 nMtE/JAKs0D+WR3drPd5Xh/DHUmp20XZGCQT8uDg3sgLMpJgVgjou5H002gXxlGbMr
	 T53wGXiFgJu1wD7Vp6m06TE+A2f+ZGxTD3P3FDXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32BE5F8026F;
	Mon, 18 May 2020 20:56:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5923CF801DA; Mon, 18 May 2020 20:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB57DF80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 20:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB57DF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MTQPtufS"
Received: by mail-qt1-x844.google.com with SMTP id c24so9028346qtw.7
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kkPmHDM6lPrQmd1eFqwAKBCn0O3Oqdax7ohsEkmNUlo=;
 b=MTQPtufSbxR2WjsfL/ODLqDadbxWORH7uiY920YkZtdL/6O1k1k3bZzgggqtGNrSCq
 K5zUFHiaqjjQMVPRDRDdKYh1dYsqdM08dU8KPm+LL0dR6X6XgXfubBUMS4KohYBu/cAZ
 fUULDzMRxChsTRzab1RfaM7it4anX/CMZBvFmQi9uUP7y8wHXshVeFvqDeK+iG/eqjjf
 /63gApOJ3CzZPwVOYtFtEXq7n5qZxUHHp+vrs0OnOMCoV2t0EbLBI382Sp+wz2u8Znp/
 rSvIGCpIuYRzylbKgAAwW6atEXOHaqlhnanAtNXhPi7WGhqpWSDAGVz1azobgCvGcgjQ
 /z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kkPmHDM6lPrQmd1eFqwAKBCn0O3Oqdax7ohsEkmNUlo=;
 b=KWLR5cZMlLYimG+21YaaLJdIjua7WFhpKx8pD+5S9Sal9N8VYEvQ1suTG/CcMw09HG
 0x3qhno690e4MRW7wj9+DUf/jY/Lno6+B8qSipXt8hcPGB/pRKdVQYOzm7BH/OcRdUtB
 EfXfBDtoN9fCiTFr/7Z+IAh0dE6hOsTZQwXcwiT2appyXhuOWbik6Nq9CjZAWYao6kAX
 AZULIDz2nTn3k3VD4iDMUMyozwH6h+CCwsSrGH9di5MOl2P8NSPkmPn3LOOXBY8SOqQo
 PJAcs1Ieav9Jm8uRNL5t2xveq0/JNtJjgg207Qbnfnl2utuSxNaPkE+dplyUTyY1TgR8
 zA3w==
X-Gm-Message-State: AOAM532jI6C+LHkBy0n0NGeKX3rOEMgLBMSApWmrcGNC/HuwVxtL+clW
 7EoMAX8YWe7hixhhdIoCVn0=
X-Google-Smtp-Source: ABdhPJz5iWV9niEHNJbT/Ssc4punhZon2ginSENfYHSaAAl/Az7RJS0VeCyocyQzKgOX53f3XGewfw==
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr17902665qtu.329.1589828186127; 
 Mon, 18 May 2020 11:56:26 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id u39sm6040770qtc.8.2020.05.18.11.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:56:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: fsl_micfil: Do not pass irq numbers in comments
Date: Mon, 18 May 2020 15:54:48 -0300
Message-Id: <20200518185448.6116-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518185448.6116-1-festevam@gmail.com>
References: <20200518185448.6116-1-festevam@gmail.com>
Cc: cosmin.samoila@nxp.com, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>
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

The IRQ numbers may change depending on the SoC, so do not pass the IRQ
numbers in the comments.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 1c51bd720e6b..c62cc8b41ff0 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -709,7 +709,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	if (of_property_read_bool(np, "fsl,shared-interrupt"))
 		irqflag = IRQF_SHARED;
 
-	/* Digital Microphone interface interrupt - IRQ 109 */
+	/* Digital Microphone interface interrupt */
 	ret = devm_request_irq(&pdev->dev, micfil->irq[0],
 			       micfil_isr, irqflag,
 			       micfil->name, micfil);
@@ -719,7 +719,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Digital Microphone interface error interrupt - IRQ 110 */
+	/* Digital Microphone interface error interrupt */
 	ret = devm_request_irq(&pdev->dev, micfil->irq[1],
 			       micfil_err_isr, irqflag,
 			       micfil->name, micfil);
-- 
2.17.1

