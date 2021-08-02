Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF263DD126
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:30:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B368D176B;
	Mon,  2 Aug 2021 09:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B368D176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889406;
	bh=Mqbc3GLPnvN28ClS34vP32ROCsJx5zVH4YSj2bvgI7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxYnJ+qoTEl+d4SFe6vJBIaOcaOFydNIqOcSg326r4ZmGiA6to9dEtDvLAa4zYLrp
	 dSicRrYF9giSUrtftEQ4kb2zt4qU2w3ccH/Qdlvp75C9rreJOayGsF1CONhq4IJAtS
	 L3PaYUVMqMB4jVpv1qLC7hv/PFj/8iaq9ckg5FVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63BDEF804E4;
	Mon,  2 Aug 2021 09:28:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BCA5F804E6; Mon,  2 Aug 2021 09:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E0C9F80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E0C9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="V6kXkwBg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Cr6+mgJa"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C66EC1FF35;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJXqBas6W4m9KctxZ/QVWYzU2IvGP6vgGn2+AeiKQWQ=;
 b=V6kXkwBgD3cbkAWFOMoV/mQjJajRKdk8NsJY2dTGk5BFR6Jb38Tdg9M7xj2bv0V9ZYsq0Q
 u1FdGoretuL0TED1VdOlUhahR1wdS9AwEduWZPKun1nLCqzVmQCJvU+sOY2xU9T5q6I/bv
 Vt+8XXE8xXpcTMhdXx0qarjF9QYIyP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJXqBas6W4m9KctxZ/QVWYzU2IvGP6vgGn2+AeiKQWQ=;
 b=Cr6+mgJadjqaXXffpvJFtAuyCOCQf+eK3K2IWqJBJvYguvqGukY24n09hO+vo/fC9S17+X
 ANp9f4WXcRSVERCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BE657A3B83;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/15] ALSA: memalloc: Correctly name as WC
Date: Mon,  2 Aug 2021 09:28:02 +0200
Message-Id: <20210802072815.13551-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210802072815.13551-1-tiwai@suse.de>
References: <20210802072815.13551-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

SNDRV_DMA_TYPE_DEV_UC and SNDRV_DMA_TYPE_DEV_UC_SG are incorrectly
named as if they were for the uncached memory, while actually we set
the pages as write-combined.  Rename them to reflect the right
attribute.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h       | 6 +++---
 sound/core/memalloc.c          | 8 ++++----
 sound/core/sgbuf.c             | 8 ++++----
 sound/pci/hda/hda_controller.c | 2 +-
 sound/pci/hda/hda_intel.c      | 2 +-
 sound/pci/intel8x0.c           | 2 +-
 sound/x86/intel_hdmi_audio.c   | 2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 44d87775b352..6ec40f9d5456 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -31,13 +31,13 @@ struct snd_dma_device {
 #define SNDRV_DMA_TYPE_UNKNOWN		0	/* not defined */
 #define SNDRV_DMA_TYPE_CONTINUOUS	1	/* continuous no-DMA memory */
 #define SNDRV_DMA_TYPE_DEV		2	/* generic device continuous */
-#define SNDRV_DMA_TYPE_DEV_UC		5	/* continuous non-cahced */
+#define SNDRV_DMA_TYPE_DEV_WC		5	/* continuous write-combined */
 #ifdef CONFIG_SND_DMA_SGBUF
 #define SNDRV_DMA_TYPE_DEV_SG		3	/* generic device SG-buffer */
-#define SNDRV_DMA_TYPE_DEV_UC_SG	6	/* SG non-cached */
+#define SNDRV_DMA_TYPE_DEV_WC_SG	6	/* SG write-combined */
 #else
 #define SNDRV_DMA_TYPE_DEV_SG	SNDRV_DMA_TYPE_DEV /* no SG-buf support */
-#define SNDRV_DMA_TYPE_DEV_UC_SG	SNDRV_DMA_TYPE_DEV_UC
+#define SNDRV_DMA_TYPE_DEV_WC_SG	SNDRV_DMA_TYPE_DEV_WC
 #endif
 #ifdef CONFIG_GENERIC_ALLOCATOR
 #define SNDRV_DMA_TYPE_DEV_IRAM		4	/* generic device iram-buffer */
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index cb56414c0955..fe8d834e9206 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -341,7 +341,7 @@ static void *snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
 		| __GFP_NOWARN; /* no stack trace print - this call is non-critical */
 	p = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, gfp_flags);
 #ifdef CONFIG_X86
-	if (p && dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
+	if (p && dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
 		set_memory_wc((unsigned long)p, PAGE_ALIGN(size) >> PAGE_SHIFT);
 #endif
 	return p;
@@ -350,7 +350,7 @@ static void *snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
 static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
 {
 #ifdef CONFIG_X86
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
 		set_memory_wb((unsigned long)dmab->area,
 			      PAGE_ALIGN(dmab->bytes) >> PAGE_SHIFT);
 #endif
@@ -379,14 +379,14 @@ static const struct snd_malloc_ops *dma_ops[] = {
 	[SNDRV_DMA_TYPE_VMALLOC] = &snd_dma_vmalloc_ops,
 #ifdef CONFIG_HAS_DMA
 	[SNDRV_DMA_TYPE_DEV] = &snd_dma_dev_ops,
-	[SNDRV_DMA_TYPE_DEV_UC] = &snd_dma_dev_ops,
+	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_dev_ops,
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
 #endif /* CONFIG_HAS_DMA */
 #ifdef CONFIG_SND_DMA_SGBUF
 	[SNDRV_DMA_TYPE_DEV_SG] = &snd_dma_sg_ops,
-	[SNDRV_DMA_TYPE_DEV_UC_SG] = &snd_dma_sg_ops,
+	[SNDRV_DMA_TYPE_DEV_WC_SG] = &snd_dma_sg_ops,
 #endif
 };
 
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
index a46129f3de12..9666a95f5a5c 100644
--- a/sound/core/sgbuf.c
+++ b/sound/core/sgbuf.c
@@ -43,8 +43,8 @@ static void snd_dma_sg_free(struct snd_dma_buffer *dmab)
 	dmab->area = NULL;
 
 	tmpb.dev.type = SNDRV_DMA_TYPE_DEV;
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC_SG)
-		tmpb.dev.type = SNDRV_DMA_TYPE_DEV_UC;
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+		tmpb.dev.type = SNDRV_DMA_TYPE_DEV_WC;
 	tmpb.dev.dev = sgbuf->dev;
 	for (i = 0; i < sgbuf->pages; i++) {
 		if (!(sgbuf->table[i].addr & ~PAGE_MASK))
@@ -77,8 +77,8 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 	dmab->private_data = sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
 		return NULL;
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC_SG) {
-		type = SNDRV_DMA_TYPE_DEV_UC;
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG) {
+		type = SNDRV_DMA_TYPE_DEV_WC;
 #ifdef pgprot_noncached
 		prot = pgprot_noncached(PAGE_KERNEL);
 #endif
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index ca2f2ecd1488..ea85c714d1cf 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -753,7 +753,7 @@ int snd_hda_attach_pcm_stream(struct hda_bus *_bus, struct hda_codec *codec,
 	if (size > MAX_PREALLOC_SIZE)
 		size = MAX_PREALLOC_SIZE;
 	if (chip->uc_buffer)
-		type = SNDRV_DMA_TYPE_DEV_UC_SG;
+		type = SNDRV_DMA_TYPE_DEV_WC_SG;
 	snd_pcm_set_managed_buffer_all(pcm, type, chip->card->dev,
 				       size, MAX_PREALLOC_SIZE);
 	return 0;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0322b289505e..f1165b491581 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1818,7 +1818,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
-		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_UC;
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_WC;
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index df3ba5c70de9..a239af05d77d 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -1427,7 +1427,7 @@ struct ich_pcm_table {
 };
 
 #define intel8x0_dma_type(chip) \
-	((chip)->fix_nocache ? SNDRV_DMA_TYPE_DEV_UC : SNDRV_DMA_TYPE_DEV)
+	((chip)->fix_nocache ? SNDRV_DMA_TYPE_DEV_WC : SNDRV_DMA_TYPE_DEV)
 
 static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
 			     const struct ich_pcm_table *rec)
diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index a34d7d9c2a57..bf174c913f83 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1796,7 +1796,7 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 		/* allocate dma pages;
 		 * try to allocate 600k buffer as default which is large enough
 		 */
-		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_UC,
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
 					       card->dev, HAD_DEFAULT_BUFFER,
 					       HAD_MAX_BUFFER);
 
-- 
2.26.2

