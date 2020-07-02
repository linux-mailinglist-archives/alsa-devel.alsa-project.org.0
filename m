Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B1212D26
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C37C16D3;
	Thu,  2 Jul 2020 21:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C37C16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718396;
	bh=FfT68UzlljOkkPPKgPtW2l8NS/C3cxrRZpB9T2N/N8o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=etSwPkkVoxPT85DUTb98TR0/OBLHCrzkOteGz6PDw64oAMTBhDnoyoeBc323PU0iL
	 +GCI0230Jau6bhGIQwazUxxLsvO3BXB4HcRCfoJkwCiOR4tKN1OuKmxKZ80Fe2X/Wv
	 3R0SS5VMPaEBdOOplSjJZFtyUysb/yqgyE1R0CoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C5FBF8022B;
	Thu,  2 Jul 2020 21:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08D3DF8022D; Thu,  2 Jul 2020 21:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_98,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 301E5F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 301E5F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vMukI+8Y"
Received: by mail-pl1-x641.google.com with SMTP id u9so8077628pls.13
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OGY4T8Zcs1wcon8HLlPhq3ExfaPukK8uw6n/UEszhf8=;
 b=vMukI+8Yv8X+JxDkvnM5hqEvcXbDyO4isuhU2PoyffLpuGKnfl2sXMKAEAK180NxbE
 vDFj55MDco7WU2fFqrEk42iWq2F+virb1m6p3rDPERupGTxifDdqE9Y5NU2G22V/1KkT
 yKpZPbFjw1X9l0nJ1p72s7jp9M65suzdx8q+nRxbfAiZtYj9s3zbF3aTS1+s5OvO3eJz
 tjtEMVxV8gXCg+McmXhFbBclhFf8Ylr86FiEVpqSmL3wq902s59FD5qMB9pD9qWc/wap
 VfVRtxTkTpb/bb1j3lscTUwiMx9NlrcWonpuhi+7wnyu+iBu8mad38gtGNM4lCvR3hEN
 TPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OGY4T8Zcs1wcon8HLlPhq3ExfaPukK8uw6n/UEszhf8=;
 b=d1F0N1+uFiRVkn8cGC0kut/oIi5f6fJJTl//erriBBGBBR7RevV8RBFrQgvq2DZDQa
 rO1GuWfuuicGjgsM1OwcqMtEDBUM6VkgFBEdX+k9fNYfdwmgKn9Cdly/Ugpxdv18GAc8
 FPypS4sqrrQo+c465qJWSRhZFzj9teYUn9xYwcQ5cIgTQmP452h21Op5c3FROsf0qyFG
 sDZ23IPOgLbcdGxrVZcgkSt/fWWilH4cY0d57ejaUrWfXJ/nAwGxjYlJFdIbL+C00Zd9
 J8qA34v0DviviN8FUJCPXV2AVf/PiysOxrYe7eX9fWiyNK426PTQJ4lm13uo2aee5Z/8
 GJVA==
X-Gm-Message-State: AOAM531cRM+gvDnYXEMd2ZvgxmdeNTou3izRWmm1hxXPnlK+WHcbtQV+
 W/rqaPAy5JWXMKYCCzwSBlnajJlF05BDwg==
X-Google-Smtp-Source: ABdhPJzMUcvdYtFO3zsputaplxh/6FPWCjBX+jSLUSWbLPvXQRFShaLna9JWCkpgdfDYCFe1M5jHRA==
X-Received: by 2002:a17:902:c408:: with SMTP id
 k8mr28530471plk.279.1593718282774; 
 Thu, 02 Jul 2020 12:31:22 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (searspoint.nvidia.com.
 [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n63sm9735707pfd.209.2020.07.02.12.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 12:31:22 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] MAINTAINERS: Add Shengjiu to reviewer list of sound/soc/fsl
Date: Thu,  2 Jul 2020 12:31:02 -0700
Message-Id: <20200702193102.25282-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, festevam@gmail.com, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, timur@tabi.org, Li.Xiubo@freescale.com,
 linuxppc-dev@lists.ozlabs.org
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

Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
---
To Shengjiu, please ack if you feel okay with this (your email address too).

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68..54aab083bb88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6956,6 +6956,7 @@ M:	Timur Tabi <timur@kernel.org>
 M:	Nicolin Chen <nicoleotsuka@gmail.com>
 M:	Xiubo Li <Xiubo.Lee@gmail.com>
 R:	Fabio Estevam <festevam@gmail.com>
+R:	Shengjiu Wang <shengjiu.wang@nxp.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
-- 
2.17.1

