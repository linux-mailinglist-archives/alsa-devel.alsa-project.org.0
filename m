Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79EF0184
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:33:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614A816F8;
	Tue,  5 Nov 2019 16:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614A816F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572968019;
	bh=H3nZLvFTuLTi0DDlFJg0JIxdbzyrQdkocmlzxhtpj84=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/eGROVSScJTUTe+vpdSUwRRrVbLL4q0udgqnLHGYdlwOgtT9oeYIyZNJ1YGLp0pX
	 6lZTy467CzBDvZEz+U12BAGFLEo3BUz3O8292nTtort0xGEdtYidlfUskBV+YZwTDe
	 mBiA47YlMacrftzBa5S8xcX92viD4hT+F95vQxP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544D3F80787;
	Tue,  5 Nov 2019 16:19:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0356F80638; Tue,  5 Nov 2019 16:19:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B43BDF80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B43BDF80271
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7610B435
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:53 +0100
Message-Id: <20191105151856.10785-22-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 21/24] ALSA: es1968: Avoid non-standard macro
	usage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Pass the device pointer from the PCI pointer directly, instead of a
non-standard macro.  The macro didn't give any better readability.

Along with it, the unneeded assignment before snd_dma_alloc_pages*()
call is dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 974142535a25..7017ca9dea4a 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -1422,10 +1422,8 @@ snd_es1968_init_dmabuf(struct es1968 *chip)
 	int err;
 	struct esm_memory *chunk;
 
-	chip->dma.dev.type = SNDRV_DMA_TYPE_DEV;
-	chip->dma.dev.dev = snd_dma_pci_data(chip->pci);
 	err = snd_dma_alloc_pages_fallback(SNDRV_DMA_TYPE_DEV,
-					   snd_dma_pci_data(chip->pci),
+					   &chip->pci->dev,
 					   chip->total_bufsize, &chip->dma);
 	if (err < 0 || ! chip->dma.area) {
 		dev_err(chip->card->dev,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
