Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42B1F6246
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 09:28:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6568615E5;
	Thu, 11 Jun 2020 09:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6568615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591860521;
	bh=lROraxNCddROyZKCrFPgLlmXKpl6vfzsr9pBucd6rlk=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vnEbLH4w66jAzgaXBD0s1d0jTtmC5xU0nuUbanm6AmOlp/dyi7qzSLReP5Wg2tHsR
	 3osfc21D9fCIakby2EPfQBtYOD8XZWZPtF+oNBQRy7HRlWPQdTtAaDZO0IMgKG3Ir7
	 bfweVeqADUs8lmkTCoz2z+AEdI90+ByU2YDtcEqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD9D7F800CC;
	Thu, 11 Jun 2020 09:26:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08613F8028C; Thu, 11 Jun 2020 09:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C10DF80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 09:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C10DF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="tpdQc/yd"
Received: by mail-pg1-x543.google.com with SMTP id r18so2167801pgk.11
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 00:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=vewiDiSb1cN3kydqT+BXtXjpJ6GL0Th4yHgmJZ519bc=;
 b=tpdQc/ydcGLOP2OMknw/h0JOLqRFK+EpzRW18q9vdrzjQnf+z2k+sNMwNT5QjbF5/F
 bvOdfkwWF49Lj49PKrC4aiMXWG6O8C9Y4kjrn1G+9GNV6NLlfGX0kMeMqBCya1skey1V
 phEL7SWRJCBra7Pfvnm0BPdM4tGgIYI0dtp00g+YQVhEZaXurhzfe6yGbyTMdMUmYAhc
 eIJx8TDKo8KShNL6aX4r/6xTBX+mWjF0FYfUIgxh0WMWrpsfo/V2PtQE1gdpNRBf+DMV
 7BUbvRal9LSMwakMrDkdA1BiHZG5J+2B8DAjJ3yr79RyorWZXFR5h3morG2JQ1XcKZs+
 G6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=vewiDiSb1cN3kydqT+BXtXjpJ6GL0Th4yHgmJZ519bc=;
 b=dQjy7yOUCRIMVrkV39bkMuVxBHUWaDj55lZXXWlNMHTGDMZ+2e2k7xZ7omC8vkaXwI
 5yCEZwNJweaXzM3UOPwh2yuxTFEEvBnpEArgCSEfRL6eunMiQk5Nb4+ilqOkhAFUMuxi
 YCJhyi/NV6ZDGFvou8qY9PDcXAlhsujI8P5Gu23LtAF15n/U2ewmHvPJ8Y/mk9oUbdmW
 syVKCQbpceaXXQ/U46bClrPOKutHFFCJvEJv08TquI/3KmxomsPQTzhxp/UEHpOO37DE
 BQf0f1CdlxTIvAhtA2FViik4Og+BMyLu8Z7GmmOETIBxSFwq2Orsle/WEGullySc9UMC
 vNjg==
X-Gm-Message-State: AOAM531zTpjT+TWMJME/LyqZpqDe/1uHBjoTKg6Nf8SaVBofKCwOE6W5
 lkbi1+/Ox4WG8WXSCtgntHY9AQ==
X-Google-Smtp-Source: ABdhPJz5oiGalV0Wv/ay+vh7ryKRoZ7rmBDmwQrlg8qLzu3l21DNVxpaXrRO9H45unGZuaGGCgjDdQ==
X-Received: by 2002:a05:6a00:7c8:: with SMTP id
 n8mr5897765pfu.116.1591860358499; 
 Thu, 11 Jun 2020 00:25:58 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id q65sm2181477pfc.155.2020.06.11.00.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 00:25:57 -0700 (PDT)
Date: Thu, 11 Jun 2020 00:25:57 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>
Subject: [patch for-5.8] dma-pool: decouple DMA_REMAP from
 DMA_COHERENT_POOL
Message-ID: <alpine.DEB.2.22.394.2006110025250.13899@chino.kir.corp.google.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, x86@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 hpa@zytor.com, tglx@linutronix.de
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

DMA_REMAP is an unnecessary requirement for AMD SEV, which requires 
DMA_COHERENT_POOL, so avoid selecting it when it is otherwise unnecessary.  

The only other requirement for DMA coherent pools is DMA_DIRECT_REMAP, so 
ensure that properly selects the config option when needed.

Fixes: 82fef0ad811f ("x86/mm: unencrypted non-blocking DMA allocations use 
coherent pools")
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: David Rientjes <rientjes@google.com>
---
 kernel/dma/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -73,18 +73,18 @@ config SWIOTLB
 config DMA_NONCOHERENT_MMAP
 	bool
 
+config DMA_COHERENT_POOL
+	bool
+
 config DMA_REMAP
+	bool
 	depends on MMU
 	select GENERIC_ALLOCATOR
 	select DMA_NONCOHERENT_MMAP
-	bool
-
-config DMA_COHERENT_POOL
-	bool
-	select DMA_REMAP
 
 config DMA_DIRECT_REMAP
 	bool
+	select DMA_REMAP
 	select DMA_COHERENT_POOL
 
 config DMA_CMA
