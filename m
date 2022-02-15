Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5C4B6D6C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 14:29:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE8FE1899;
	Tue, 15 Feb 2022 14:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE8FE1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644931793;
	bh=6d5SNBgxQtPJrBrT8LK0hWepNSx3p+SntidjU2Z4W9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYw7VLNgxPKX4NoY+dPOi+lTysexLxYv0JdZeg72HU5UM4hGceyF7qH1bMwAtOrOz
	 YSUaiXc2RqzdTbBcNhF2O99TW29myvf60qLPnoWZH4fVnhfRso2eclIyvI2iwAEtxy
	 KvHTqz5jmaJHkdRetLKTr8UM6npuEW16QVgoR5QM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 438DAF804CA;
	Tue, 15 Feb 2022 14:28:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDE0F8032B; Tue, 15 Feb 2022 14:28:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9FEF800C0
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 14:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9FEF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tTi7BrRW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lucRdLVJ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A34781F393;
 Tue, 15 Feb 2022 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644931679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiBPXntsQVrnHF1LhQZAwtlogP++hq9mCuBueWXtD/M=;
 b=tTi7BrRWzMmNzhD0+e1MMTaPDHLFFwP1eGMcQ+y4IJL6j/fS2kH4i1hvM1JKcMS9XlIfYb
 uQzKrYxRaQ4Bxa2NJAcdhh38doPdswnsHbUqGf4hfKv0wBSwrhxz7D5CkORrWeJ43UX/4G
 /RbrOcgxnM+tb/QrMNreuwzauklFB6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644931679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiBPXntsQVrnHF1LhQZAwtlogP++hq9mCuBueWXtD/M=;
 b=lucRdLVJQRZKa/rjD+Nb2m2xh9FH4fNoIjNcGl3G7h7X58Djf/nhwrJdflsCq40NN9kk1F
 gMWSrb8T56gXPqAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 92540A3B87;
 Tue, 15 Feb 2022 13:27:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: hda: Set max DMA segment size
Date: Tue, 15 Feb 2022 14:27:54 +0100
Message-Id: <20220215132756.31236-2-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220215132756.31236-1-tiwai@suse.de>
References: <20220215132756.31236-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The recent code refactoring to use the standard DMA helper requires
the max	DMA segment size setup for SG list management.	Without	it,
the kernel may spew warnings when a large buffer is allocated.

This patch sets	up dma_set_max_seg_size() for avoiding spurious
warnings.

Fixes: 2c95b92ecd92 ("ALSA: memalloc: Unify x86 SG-buffer handling (take#3)")
Cc: <stable@vger.kernel.org>
BugLink: https://github.com/thesofproject/linux/issues/3430
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 917ad9d375b1..572ff0d1fafe 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1941,6 +1941,7 @@ static int azx_first_init(struct azx *chip)
 		dma_bits = 32;
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(dma_bits)))
 		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pci->dev, UINT_MAX);
 
 	/* read number of streams from GCAP register instead of using
 	 * hardcoded value
-- 
2.31.1

