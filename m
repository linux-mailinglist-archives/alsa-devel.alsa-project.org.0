Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157943DFB57
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 08:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 442681705;
	Wed,  4 Aug 2021 08:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 442681705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628057712;
	bh=whQjExGbLdoapYKY4YkOoOn4MTVwzNE4HinApSyE7CM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mujwUPF2qX175VD507Z1xCWPBoF9RJzHsKwcACheYievWL+hqIJu11KP2W8X+DWfX
	 FntuuNaf0uIOWBLRGfOkasfGayq7kDTJARkF6IB/gR64vlKUYX3qcuZuUaYak818VO
	 4DIvCzRRj0JGnj33ong0hzxxxV7wI0LALBiIVVoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F055FF8010A;
	Wed,  4 Aug 2021 08:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3E3BF8025F; Wed,  4 Aug 2021 08:13:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59FB4F8016C
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 08:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FB4F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wS1Wb60V"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="vO790p8P"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 28E5B1FDA8
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 06:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628057612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=67iu6msttzjOGr5ZR3+p0rAZVgmCKU3Qd1HN40RfuYk=;
 b=wS1Wb60VztflNVVJ76X+kI8v7aDCrHouZmarKAH4XoSlI1BL6LiOVsoWyjOlLJuM0isRJE
 oJ3n6wXz5S8pnPpNmJ6lAJ35z8gHdcYG5qjnPUL4CQ5vykoOXhYUuDN9ZkWRimsTjoDKFG
 rcc3FARPDtBcV3u/gWrG5q2ADu2deA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628057612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=67iu6msttzjOGr5ZR3+p0rAZVgmCKU3Qd1HN40RfuYk=;
 b=vO790p8PvcZqoV/CZAl2ULnKe34giVBO7EVgAzZyG9RGFubH+rBL8cZS55JYrlyA091uOt
 eruaTFy4UCWk0yAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 18E5FA3B84;
 Wed,  4 Aug 2021 06:13:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Fix pgprot for WC mmap on x86
Date: Wed,  4 Aug 2021 08:13:29 +0200
Message-Id: <20210804061329.29265-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

We have a special handling of WC pages on x86, and it's currently
specific to HD-audio.  The last forgotten piece was the pgprot setup
for the mmap with WC pages.

This patch moves the pgprot setup for WC pages from HD-audio-specific
mmap callback to the common helper code.  It allows us to remove the
superfluous mmap callback in HD-audio and its prepare_mmap
redirection.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c          |  4 ++++
 sound/pci/hda/hda_controller.c | 11 -----------
 sound/pci/hda/hda_controller.h |  2 --
 sound/pci/hda/hda_intel.c      | 12 ------------
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 58bab2cfdb87..084b2600a423 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -407,6 +407,10 @@ static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
 static int snd_dma_dev_mmap(struct snd_dma_buffer *dmab,
 			    struct vm_area_struct *area)
 {
+#ifdef CONFIG_X86
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
+		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+#endif
 	return dma_mmap_coherent(dmab->dev.dev, area,
 				 dmab->area, dmab->addr, dmab->bytes);
 }
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index ea85c714d1cf..7cd452831fd3 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -669,16 +669,6 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 	return err;
 }
 
-static int azx_pcm_mmap(struct snd_pcm_substream *substream,
-			struct vm_area_struct *area)
-{
-	struct azx_pcm *apcm = snd_pcm_substream_chip(substream);
-	struct azx *chip = apcm->chip;
-	if (chip->ops->pcm_mmap_prepare)
-		chip->ops->pcm_mmap_prepare(substream, area);
-	return snd_pcm_lib_default_mmap(substream, area);
-}
-
 static const struct snd_pcm_ops azx_pcm_ops = {
 	.open = azx_pcm_open,
 	.close = azx_pcm_close,
@@ -688,7 +678,6 @@ static const struct snd_pcm_ops azx_pcm_ops = {
 	.trigger = azx_pcm_trigger,
 	.pointer = azx_pcm_pointer,
 	.get_time_info =  azx_get_time_info,
-	.mmap = azx_pcm_mmap,
 };
 
 static void azx_pcm_free(struct snd_pcm *pcm)
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index e4b290de81de..3062f87380b1 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -74,8 +74,6 @@ struct azx;
 struct hda_controller_ops {
 	/* Disable msi if supported, PCI only */
 	int (*disable_msi_reset_irq)(struct azx *);
-	void (*pcm_mmap_prepare)(struct snd_pcm_substream *substream,
-				 struct vm_area_struct *area);
 	/* Check if current position is acceptable */
 	int (*position_check)(struct azx *chip, struct azx_dev *azx_dev);
 	/* enable/disable the link power */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9771996e2ef5..3aa432d814a2 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2037,17 +2037,6 @@ static int disable_msi_reset_irq(struct azx *chip)
 	return 0;
 }
 
-static void pcm_mmap_prepare(struct snd_pcm_substream *substream,
-			     struct vm_area_struct *area)
-{
-#ifdef CONFIG_X86
-	struct azx_pcm *apcm = snd_pcm_substream_chip(substream);
-	struct azx *chip = apcm->chip;
-	if (chip->uc_buffer)
-		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-#endif
-}
-
 /* Denylist for skipping the whole probe:
  * some HD-audio PCI entries are exposed without any codecs, and such devices
  * should be ignored from the beginning.
@@ -2061,7 +2050,6 @@ static const struct pci_device_id driver_denylist[] = {
 
 static const struct hda_controller_ops pci_hda_ops = {
 	.disable_msi_reset_irq = disable_msi_reset_irq,
-	.pcm_mmap_prepare = pcm_mmap_prepare,
 	.position_check = azx_position_check,
 };
 
-- 
2.26.2

