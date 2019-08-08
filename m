Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7385F19
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 11:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B161A1612;
	Thu,  8 Aug 2019 11:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B161A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565258352;
	bh=uC9YW1W/1E68O7TT/osIakQ/NimW5DTSso9eJ2RwGGQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3OhZJBma6gGPGfM+jYA+jXlGkGgomjD90cvQntQX7FaqEr06SEPNoO539+hiDUiY
	 vOIThSsj37Oh9e1qJhiSD9M9iC4qxod8yAjnalaoUcs5BsQqaAK2IM/3dNQBqNTI//
	 HCHoTE5dJ4kSdJwTyEsBY+4+2CYGaxfkb/yFbfYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B33F803F3;
	Thu,  8 Aug 2019 11:57:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BFFAF8053B; Thu,  8 Aug 2019 11:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 117F4F804FF
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 11:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 117F4F804FF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BBEC5AFF0;
 Thu,  8 Aug 2019 09:57:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 11:57:13 +0200
Message-Id: <20190808095715.29713-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190808095715.29713-1-tiwai@suse.de>
References: <20190808095715.29713-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [alsa-devel] [PATCH 1/3] ALSA: hda: Remove page allocation
	redirection
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

The HD-audio core allocates and release pages via driver's specific
dma_alloc_pages and dma_free_pages ops defined in bus->io_ops.  This
was because some platforms require the uncached pages and the handling
of page flags had to be done locally in the driver code.

Since the recent change in ALSA core memory allocator, we can simply
pass SNDRV_DMA_TYPE_DEV_UC for the uncached pages, and the only
difference became about this type to be passed to the core allocator.
That is, it's good time for cleaning up the mess.

This patch changes the allocation code in HD-audio core to call the
core allocator directly so that we get rid of dma_alloc_pages and
dma_free_pages io_ops.  If a driver needs the uncached pages, it has
to set bus->dma_type right after the bus initialization.

This is merely a code refactoring and shouldn't bring any behavior
changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h                |  6 +-----
 sound/hda/ext/hdac_ext_bus.c           | 13 -------------
 sound/hda/hdac_bus.c                   |  1 +
 sound/hda/hdac_controller.c            | 18 +++++++++---------
 sound/hda/hdac_stream.c                |  8 ++++----
 sound/pci/hda/hda_intel.c              | 24 ++++--------------------
 sound/pci/hda/hda_tegra.c              | 16 ----------------
 sound/soc/intel/skylake/skl-messages.c | 15 ++-------------
 sound/soc/sof/intel/hda-bus.c          | 14 --------------
 9 files changed, 21 insertions(+), 94 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 612a17e375d0..20549def0a27 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -264,11 +264,6 @@ struct hdac_io_ops {
 	u16 (*reg_readw)(u16 __iomem *addr);
 	void (*reg_writeb)(u8 value, u8 __iomem *addr);
 	u8 (*reg_readb)(u8 __iomem *addr);
-	/* Allocation ops */
-	int (*dma_alloc_pages)(struct hdac_bus *bus, int type, size_t size,
-			       struct snd_dma_buffer *buf);
-	void (*dma_free_pages)(struct hdac_bus *bus,
-			       struct snd_dma_buffer *buf);
 };
 
 #define HDA_UNSOL_QUEUE_SIZE	64
@@ -344,6 +339,7 @@ struct hdac_bus {
 	/* CORB/RIRB and position buffers */
 	struct snd_dma_buffer rb;
 	struct snd_dma_buffer posbuf;
+	int dma_type;			/* SNDRV_DMA_TYPE_XXX for CORB/RIRB */
 
 	/* hdac_stream linked list */
 	struct list_head stream_list;
diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index 4f9f1d2a2ec5..7825b74068f4 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -47,17 +47,6 @@ static u8 hdac_ext_readb(u8 __iomem *addr)
 	return readb(addr);
 }
 
-static int hdac_ext_dma_alloc_pages(struct hdac_bus *bus, int type,
-			   size_t size, struct snd_dma_buffer *buf)
-{
-	return snd_dma_alloc_pages(type, bus->dev, size, buf);
-}
-
-static void hdac_ext_dma_free_pages(struct hdac_bus *bus, struct snd_dma_buffer *buf)
-{
-	snd_dma_free_pages(buf);
-}
-
 static const struct hdac_io_ops hdac_ext_default_io = {
 	.reg_writel = hdac_ext_writel,
 	.reg_readl = hdac_ext_readl,
@@ -65,8 +54,6 @@ static const struct hdac_io_ops hdac_ext_default_io = {
 	.reg_readw = hdac_ext_readw,
 	.reg_writeb = hdac_ext_writeb,
 	.reg_readb = hdac_ext_readb,
-	.dma_alloc_pages = hdac_ext_dma_alloc_pages,
-	.dma_free_pages = hdac_ext_dma_free_pages,
 };
 
 /**
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 14e57ffd5bc1..00ea12e67dc8 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -34,6 +34,7 @@ int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 	else
 		bus->ops = &default_ops;
 	bus->io_ops = io_ops;
+	bus->dma_type = SNDRV_DMA_TYPE_DEV;
 	INIT_LIST_HEAD(&bus->stream_list);
 	INIT_LIST_HEAD(&bus->codec_list);
 	INIT_WORK(&bus->unsol_work, snd_hdac_bus_process_unsol_events);
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 3b0110545070..7e7be8e4dcf9 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -575,12 +575,13 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 {
 	struct hdac_stream *s;
 	int num_streams = 0;
+	int dma_type = bus->dma_type ? bus->dma_type : SNDRV_DMA_TYPE_DEV;
 	int err;
 
 	list_for_each_entry(s, &bus->stream_list, list) {
 		/* allocate memory for the BDL for each stream */
-		err = bus->io_ops->dma_alloc_pages(bus, SNDRV_DMA_TYPE_DEV,
-						   BDL_SIZE, &s->bdl);
+		err = snd_dma_alloc_pages(dma_type, bus->dev,
+					  BDL_SIZE, &s->bdl);
 		num_streams++;
 		if (err < 0)
 			return -ENOMEM;
@@ -589,16 +590,15 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 	if (WARN_ON(!num_streams))
 		return -EINVAL;
 	/* allocate memory for the position buffer */
-	err = bus->io_ops->dma_alloc_pages(bus, SNDRV_DMA_TYPE_DEV,
-					   num_streams * 8, &bus->posbuf);
+	err = snd_dma_alloc_pages(dma_type, bus->dev,
+				  num_streams * 8, &bus->posbuf);
 	if (err < 0)
 		return -ENOMEM;
 	list_for_each_entry(s, &bus->stream_list, list)
 		s->posbuf = (__le32 *)(bus->posbuf.area + s->index * 8);
 
 	/* single page (at least 4096 bytes) must suffice for both ringbuffes */
-	return bus->io_ops->dma_alloc_pages(bus, SNDRV_DMA_TYPE_DEV,
-					    PAGE_SIZE, &bus->rb);
+	return snd_dma_alloc_pages(dma_type, bus->dev, PAGE_SIZE, &bus->rb);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_alloc_stream_pages);
 
@@ -612,12 +612,12 @@ void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus)
 
 	list_for_each_entry(s, &bus->stream_list, list) {
 		if (s->bdl.area)
-			bus->io_ops->dma_free_pages(bus, &s->bdl);
+			snd_dma_free_pages(&s->bdl);
 	}
 
 	if (bus->rb.area)
-		bus->io_ops->dma_free_pages(bus, &bus->rb);
+		snd_dma_free_pages(&bus->rb);
 	if (bus->posbuf.area)
-		bus->io_ops->dma_free_pages(bus, &bus->posbuf);
+		snd_dma_free_pages(&bus->posbuf);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_free_stream_pages);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 55d53b89ac21..fc68d4ce0a37 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -680,8 +680,8 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 	azx_dev->locked = true;
 	spin_unlock_irq(&bus->reg_lock);
 
-	err = bus->io_ops->dma_alloc_pages(bus, SNDRV_DMA_TYPE_DEV_SG,
-					   byte_size, bufp);
+	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, bus->dev,
+				  byte_size, bufp);
 	if (err < 0)
 		goto err_alloc;
 
@@ -707,7 +707,7 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 	return azx_dev->stream_tag;
 
  error:
-	bus->io_ops->dma_free_pages(bus, bufp);
+	snd_dma_free_pages(bufp);
  err_alloc:
 	spin_lock_irq(&bus->reg_lock);
 	azx_dev->locked = false;
@@ -754,7 +754,7 @@ void snd_hdac_dsp_cleanup(struct hdac_stream *azx_dev,
 	azx_dev->period_bytes = 0;
 	azx_dev->format_val = 0;
 
-	bus->io_ops->dma_free_pages(bus, dmab);
+	snd_dma_free_pages(dmab);
 	dmab->area = NULL;
 
 	spin_lock_irq(&bus->reg_lock);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index cb8b0945547c..3bb4c26f2799 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1694,6 +1694,10 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 		return err;
 	}
 
+	/* use the non-cached pages in non-snoop mode */
+	if (!azx_snoop(chip))
+		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_UC;
+
 	/* Workaround for a communication error on CFL (bko#199007) and CNL */
 	if (IS_CFL(pci) || IS_CNL(pci))
 		azx_bus(chip)->polling_mode = 1;
@@ -1979,24 +1983,6 @@ static int disable_msi_reset_irq(struct azx *chip)
 	return 0;
 }
 
-/* DMA page allocation helpers.  */
-static int dma_alloc_pages(struct hdac_bus *bus,
-			   int type,
-			   size_t size,
-			   struct snd_dma_buffer *buf)
-{
-	struct azx *chip = bus_to_azx(bus);
-
-	if (!azx_snoop(chip) && type == SNDRV_DMA_TYPE_DEV)
-		type = SNDRV_DMA_TYPE_DEV_UC;
-	return snd_dma_alloc_pages(type, bus->dev, size, buf);
-}
-
-static void dma_free_pages(struct hdac_bus *bus, struct snd_dma_buffer *buf)
-{
-	snd_dma_free_pages(buf);
-}
-
 static void pcm_mmap_prepare(struct snd_pcm_substream *substream,
 			     struct vm_area_struct *area)
 {
@@ -2015,8 +2001,6 @@ static const struct hdac_io_ops pci_hda_io_ops = {
 	.reg_readw = pci_azx_readw,
 	.reg_writeb = pci_azx_writeb,
 	.reg_readb = pci_azx_readb,
-	.dma_alloc_pages = dma_alloc_pages,
-	.dma_free_pages = dma_free_pages,
 };
 
 static const struct hda_controller_ops pci_hda_ops = {
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 7dbe9f39fc79..ba414cc639f1 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -75,20 +75,6 @@ MODULE_PARM_DESC(power_save,
 #define power_save	0
 #endif
 
-/*
- * DMA page allocation ops.
- */
-static int dma_alloc_pages(struct hdac_bus *bus, int type, size_t size,
-			   struct snd_dma_buffer *buf)
-{
-	return snd_dma_alloc_pages(type, bus->dev, size, buf);
-}
-
-static void dma_free_pages(struct hdac_bus *bus, struct snd_dma_buffer *buf)
-{
-	snd_dma_free_pages(buf);
-}
-
 /*
  * Register access ops. Tegra HDA register access is DWORD only.
  */
@@ -153,8 +139,6 @@ static const struct hdac_io_ops hda_tegra_io_ops = {
 	.reg_readw = hda_tegra_readw,
 	.reg_writeb = hda_tegra_writeb,
 	.reg_readb = hda_tegra_readb,
-	.dma_alloc_pages = dma_alloc_pages,
-	.dma_free_pages = dma_free_pages,
 };
 
 static const struct hda_controller_ops hda_tegra_ops; /* nothing special */
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index febc070839e0..c6f9e05c929e 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -25,23 +25,12 @@
 static int skl_alloc_dma_buf(struct device *dev,
 		struct snd_dma_buffer *dmab, size_t size)
 {
-	struct hdac_bus *bus = dev_get_drvdata(dev);
-
-	if (!bus)
-		return -ENODEV;
-
-	return  bus->io_ops->dma_alloc_pages(bus, SNDRV_DMA_TYPE_DEV, size, dmab);
+	return snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, dmab);
 }
 
 static int skl_free_dma_buf(struct device *dev, struct snd_dma_buffer *dmab)
 {
-	struct hdac_bus *bus = dev_get_drvdata(dev);
-
-	if (!bus)
-		return -ENODEV;
-
-	bus->io_ops->dma_free_pages(bus, dmab);
-
+	snd_dma_free_pages(dmab);
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index a7e6d8227df6..0bc93fa06b5b 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -51,18 +51,6 @@ static u8 sof_hda_readb(u8 __iomem *addr)
 	return readb(addr);
 }
 
-static int sof_hda_dma_alloc_pages(struct hdac_bus *bus, int type,
-				   size_t size, struct snd_dma_buffer *buf)
-{
-	return snd_dma_alloc_pages(type, bus->dev, size, buf);
-}
-
-static void sof_hda_dma_free_pages(struct hdac_bus *bus,
-				   struct snd_dma_buffer *buf)
-{
-	snd_dma_free_pages(buf);
-}
-
 static const struct hdac_io_ops io_ops = {
 	.reg_writel = sof_hda_writel,
 	.reg_readl = sof_hda_readl,
@@ -70,8 +58,6 @@ static const struct hdac_io_ops io_ops = {
 	.reg_readw = sof_hda_readw,
 	.reg_writeb = sof_hda_writeb,
 	.reg_readb = sof_hda_readb,
-	.dma_alloc_pages = sof_hda_dma_alloc_pages,
-	.dma_free_pages = sof_hda_dma_free_pages,
 };
 
 /*
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
