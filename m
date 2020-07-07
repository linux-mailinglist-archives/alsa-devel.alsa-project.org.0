Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C7D216A04
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4441B74C;
	Tue,  7 Jul 2020 12:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4441B74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117303;
	bh=mw95CkI5w7XqTqMPoY7XATVIUvRfIyizz0DHyD272so=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fAorTvVvYXHpmrdTdrfikaejqvrpw5NJ4la/TDOmwk2XvJ7hxj8qiyHS8Y1TdKv/x
	 pIoJKo/oTXU4xO58oIHXv2B8xposgC7dceT88inDBha/yyAWLifmAO59w13ILQfltj
	 11TdrhF/C+6a5fvjHpqP/78lYCB5GoRHm6qbyv2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73CA4F80305;
	Tue,  7 Jul 2020 12:17:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B28DF802E8; Tue,  7 Jul 2020 12:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A67D5F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67D5F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WAOUaxcv"
Received: by mail-wr1-x441.google.com with SMTP id z15so33266782wrl.8
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bZAeFSvmpf6EGc1Rrn0+wIXui3QoI3bJ6wz54zb8+8=;
 b=WAOUaxcvTIM+kgWqOPLkQO4t70ks1L8rcPeDMg8pQrArTyQIPJe3qJ2b6X9yfmIOtN
 FoVH/1sxUaBU+lLS1q0NXqVn5rMbuOrXCOjCTVQCkvErCympXu/1zVBbW/R6A5BJVKZo
 ByWRWPmFEchS4xkyIHSzSz9G9RHBo8c+Q+WD5keTRSHptVe9L/hfTEHJnKm14KCr+WfK
 7ld7Tl3ZD7VAdo7qF1vXsXViNmFFwcCzjktzAES9B/Keda+pdD/MBrNHF8hm9AnHEIBF
 p8DUsIDCLdkfuJnhk/kQKKIwxnmabi7l1DNAVoRo6wPW3rjq/h4AOh8/swp1letY5w+p
 v9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3bZAeFSvmpf6EGc1Rrn0+wIXui3QoI3bJ6wz54zb8+8=;
 b=rN8nNHNX9F7tpW7LHmHUsDxIy1uIt27+TEot5SGE1giVgKR9zsfh/ZX/Qr7OVnX4zo
 xoq/Yn0ACuCmhLqrOkmkiBeeXzBN4TVPKCnGJcWcMvbquIpoIBq8bmi2JAxWzTJJbAxo
 c4dUf+Y06DETEuyRZz36WseA/YtJQXegr5WfQea98o+tq1h6iGEFn/GMkXzVbnmLZnGQ
 rFUii7q6dU1Z41/CJyUmr9IG7ydAVCzF4HtxYmqWBXnNbkdknJlzTkSCqCL+VH8YGkQM
 hnbHpUjuYjFT9kmeFib2B63FdJoBAPBUtIDQao6M82H1r/Q1yKiSFRo5tCT8VslsprbE
 5PWA==
X-Gm-Message-State: AOAM5307/DfIzs71DNkzNXKLYBGKs6q4oQn1zzdV3ctnZlpZEOL3WHF/
 rq4u988Kp7LXt1NdFpi3oWoVvQ==
X-Google-Smtp-Source: ABdhPJxe7ZibCsreBnej5nYrQVJiRA2C6Ue1mU4csLgJ2IUwGSMta3Aa6li7Bu4sjMAwkzjp/Id2dQ==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr52181174wrr.325.1594117015828; 
 Tue, 07 Jul 2020 03:16:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 06/28] ASoC: fsl: fsl_ssi_dbg: Demote obvious misuse of
 kerneldoc to standard comment blocks
Date: Tue,  7 Jul 2020 11:16:20 +0100
Message-Id: <20200707101642.1747944-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Markus Pargmann <mpa@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

No attempt has been made to document either of the demoted functions here.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_ssi_dbg.c:90: warning: Function parameter or member 'flag' not described in 'SIER_SHOW'
 sound/soc/fsl/fsl_ssi_dbg.c:90: warning: Function parameter or member 'name' not described in 'SIER_SHOW'
 sound/soc/fsl/fsl_ssi_dbg.c:99: warning: Function parameter or member 's' not described in 'fsl_ssi_stats_show'
 sound/soc/fsl/fsl_ssi_dbg.c:99: warning: Function parameter or member 'unused' not described in 'fsl_ssi_stats_show'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Markus Pargmann <mpa@pengutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_ssi_dbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi_dbg.c b/sound/soc/fsl/fsl_ssi_dbg.c
index 2a20ee23dc52d..2c46c55f0a882 100644
--- a/sound/soc/fsl/fsl_ssi_dbg.c
+++ b/sound/soc/fsl/fsl_ssi_dbg.c
@@ -78,7 +78,7 @@ void fsl_ssi_dbg_isr(struct fsl_ssi_dbg *dbg, u32 sisr)
 		dbg->stats.tfe0++;
 }
 
-/**
+/*
  * Show the statistics of a flag only if its interrupt is enabled
  *
  * Compilers will optimize it to a no-op if the interrupt is disabled
@@ -90,7 +90,7 @@ void fsl_ssi_dbg_isr(struct fsl_ssi_dbg *dbg, u32 sisr)
 	} while (0)
 
 
-/**
+/*
  * Display the statistics for the current SSI device
  *
  * To avoid confusion, only show those counts that are enabled
-- 
2.25.1

