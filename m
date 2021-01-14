Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF02F614D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 13:56:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88BCA16A8;
	Thu, 14 Jan 2021 13:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88BCA16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610628962;
	bh=XolWcmizzq73sJwG04CYeP/J4ohfmnAPj5wdChQWJbw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GIy3H1C1cmRso+RfmAYdx07n5RAVcGFEGb0aPiS/TtyudfQo/PGlebfhBExov/L9T
	 cWiTg90QLPl6O661g744udS0RnsIJnY0H5mXR/8oSknrsUrLu+YxdwXjw+m5lB91bX
	 V4e4oUT/2FsLNUpp/AzxoJ9so6Dy9JrciKBWgmF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C4CF8025E;
	Thu, 14 Jan 2021 13:54:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14A4DF80475; Thu, 14 Jan 2021 13:54:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1492F80249
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 13:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1492F80249
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFE8BB818
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 12:54:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: x86: Simplify with dma_set_mask_and_coherent()
Date: Thu, 14 Jan 2021 13:54:12 +0100
Message-Id: <20210114125412.993-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114125412.993-1-tiwai@suse.de>
References: <20210114125412.993-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

LPE driver still has explicit calls of dma_set_mask() and
dma_set_coherent_mask().

Let's simplify with dma_set_mask_and_coherent().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 5b351f4ca543..1d66c3a4fb10 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1770,8 +1770,7 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 	card_ctx->irq = irq;
 
 	/* only 32bit addressable */
-	dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
-	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 
 	init_channel_allocations();
 
-- 
2.26.2

