Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224673201DA
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:34:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAF001668;
	Sat, 20 Feb 2021 00:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAF001668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777668;
	bh=e+ClrHF6i6gxR0cOOjHIqEaDrDt1kNwlUiSgqtJ9j+8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cPGhwI1wxi+tx48egokDQqM7GAWwdI4K6UF5x/5KDKa4ytHW5TZxuqnhvgwJN9iM1
	 KTLPpt1GqG31pE+/l7MQAlzHqAjLA1h6JlwgSxvKVjUqeLrDrQtWxnBUmIDCt7SsK8
	 4JLsh3TKlAgCbLiR4VgvZmTKYfScNzfUUqFQ6tIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 798E1F80424;
	Sat, 20 Feb 2021 00:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73716F802D2; Sat, 20 Feb 2021 00:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7A2BF8020B
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7A2BF8020B
IronPort-SDR: 2oQ4LyyyWebKRPL/Ep0OEW5MzVZ6U+exmaFc//aMMa/sDd7jri9VWT3XBBIQSeZHGjGLrQOumK
 YZOmGyIbnCxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293775"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:40 -0800
IronPort-SDR: E97+6RVLmSFY7B2BFYjvIXXtCfMqKqZUW0oXdHO8WN6gGLkI0B7R7jrKnJX9hMHKJh4fDfnM+2
 /4ULNxZsfQGg==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662850"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/9] ASoC: fsl: mpc5200: signed parameter in snprintf format
Date: Fri, 19 Feb 2021 17:29:35 -0600
Message-Id: <20210219232937.6440-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
References: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

cppcheck warning:

sound/soc/fsl/mpc5200_dma.c:414:2: warning: %u in format
string (no. 1) requires 'unsigned int' but the argument type is
'signed int'. [invalidPrintfArgType_uint]
 snprintf(psc_dma->name, sizeof psc_dma->name, "PSC%u", psc_dma->id);
 ^

Also fix sizeof use, missing parentheses reported by checkpatch.pl

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/mpc5200_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 231984882176..6c65cd858b0b 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -411,7 +411,7 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 	psc_dma->dev = &op->dev;
 	psc_dma->playback.psc_dma = psc_dma;
 	psc_dma->capture.psc_dma = psc_dma;
-	snprintf(psc_dma->name, sizeof psc_dma->name, "PSC%u", psc_dma->id);
+	snprintf(psc_dma->name, sizeof(psc_dma->name), "PSC%d", psc_dma->id);
 
 	/* Find the address of the fifo data registers and setup the
 	 * DMA tasks */
-- 
2.25.1

