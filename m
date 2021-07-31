Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF043DC51F
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Jul 2021 10:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881A71FD7;
	Sat, 31 Jul 2021 10:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881A71FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627721114;
	bh=bqEbAJlKxAUDDXFJV8MtdNx4vaB+w1lcVRVrII6Cd7M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E8U+IWrRBUTU7A+oNUCRBP2aWW01Q7XRDhwB8aVbqt0GxOL//IefNOsrPTaFthgfy
	 +ncdKQscCurEjNlVgT/zPnpz6rquMh/c+f/93tKz/gcipOCLaMGh1YicUBSfa9z3tu
	 4aGSe+8CAiO6/4NxMgkzQWuKF0FERSGnncV4xwo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 012AAF80258;
	Sat, 31 Jul 2021 10:43:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF5AEF80276; Sat, 31 Jul 2021 10:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B502FF8014D
 for <alsa-devel@alsa-project.org>; Sat, 31 Jul 2021 10:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B502FF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QUmAM/wX"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8eSouS9y"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6A86E22439;
 Sat, 31 Jul 2021 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627721013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5dfpf6REV+bUJraisuNGMQOks348AyJguT2Y+z7IZBk=;
 b=QUmAM/wXNUP0SwsLe+LkmmhKuEksSCljMiNCFJyJF8yLpuOyU4nNHORCtEy3KnFNABFdvL
 cAJKxqlAMs4UvLIDCfBVSwx5InBwMnTTA2s3E1f1itgVs+7VC0QW2uz6mZVzfCMWpsG95L
 3JL8kRFop86FUfLd2CFkV/4nu9PfDss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627721013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5dfpf6REV+bUJraisuNGMQOks348AyJguT2Y+z7IZBk=;
 b=8eSouS9ysFr/8w+oqhFqwrPA3vLNfVb7trxF3MyJ+7NCqf6Yz3jA584hfpjwqXxF3J6Dr3
 8Fyrcn+qJx0Ba/BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 554D7A3B89;
 Sat, 31 Jul 2021 08:43:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: amd: Fix reference to PCM buffer address
Date: Sat, 31 Jul 2021 10:43:31 +0200
Message-Id: <20210731084331.32225-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

PCM buffers might be allocated dynamically when the buffer
preallocation failed or a larger buffer is requested, and it's not
guaranteed that substream->dma_buffer points to the actually used
buffer.  The driver needs to refer to substream->runtime->dma_addr
instead for the buffer address.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix build error of renoir driver

 sound/soc/amd/acp-pcm-dma.c          | 2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c  | 2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 143155a840ac..cc1ce6f22caa 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -969,7 +969,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 
 	acp_set_sram_bank_state(rtd->acp_mmio, 0, true);
 	/* Save for runtime private data */
-	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->dma_addr = runtime->dma_addr;
 	rtd->order = get_order(size);
 
 	/* Fill the page table entries in ACP SRAM */
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 8148b0d22e88..597d7c4b2a6b 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -286,7 +286,7 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 		pr_err("pinfo failed\n");
 	}
 	size = params_buffer_bytes(params);
-	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->dma_addr = substream->runtime->dma_addr;
 	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 	config_acp3x_dma(rtd, substream->stream);
 	return 0;
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index bd20622b0933..0391c28dd078 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -242,7 +242,7 @@ static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	size = params_buffer_bytes(params);
 	period_bytes = params_period_bytes(params);
-	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->dma_addr = substream->runtime->dma_addr;
 	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 	config_acp_dma(rtd, substream->stream);
 	init_pdm_ring_buffer(MEM_WINDOW_START, size, period_bytes,
-- 
2.26.2

