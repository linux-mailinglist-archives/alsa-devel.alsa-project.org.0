Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E685F1B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:00:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB78A4E;
	Thu,  8 Aug 2019 11:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB78A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565258399;
	bh=mGeQG2IdHWGp0ptjixHpyzPmiCdI90hlDzg0q28xOog=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vU6VAyBTgp9BF2r8r5lHe5oRWsyWf6G7v6NpdKsh9ZOeZhI4udf6ATyZGbLQI0TXe
	 kAyEnjB16Xs2Yb2KfaN/Ank5WbUegxqX3RdiFnIF/uMzIwfF8WWT5WLBKDp6jZEIhI
	 jpQvpoG+hvPUmeTeW/IMRotEGoGJWgJechfdPrJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0ADF805A9;
	Thu,  8 Aug 2019 11:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 752D6F8053A; Thu,  8 Aug 2019 11:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F7F5F800E4
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 11:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7F5F800E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C45F9B077;
 Thu,  8 Aug 2019 09:57:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 11:57:14 +0200
Message-Id: <20190808095715.29713-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190808095715.29713-1-tiwai@suse.de>
References: <20190808095715.29713-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [alsa-devel] [PATCH 2/3] ALSA: hda: Direct MMIO accesses
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

HD-audio drivers access to the mmio registers indirectly via the
corresponding bus->io_ops callbacks.  This is because some platform
(notably Tegra SoC) requires the word-aligned access.  But it's rather
a rare case, and other platforms suffer from the penalties by indirect
calls unnecessarily.

This patch is an attempt to optimize and cleanup for this situation.
Now the special aligned access is used only when a new kconfig
CONFIG_SND_HDA_ALIGNED_MMIO is set.  And the HD-audio core itself
provides the aligned MMIO access helpers instead of the driver side.
If Kconfig isn't set (as default), the standard helpers like readl()
or writel() are used directly.

A couple of places in ASoC Intel drivers have the access via io_ops
reg_writel(), and they are replaced with the direct writel() calls.

And now with this patch, the whole bus->io_ops becomes empty, so it's
dropped completely.  The bus initialization functions are changed
accordingly as well to drop the whole bus->io_ops.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h        | 63 +++++++++++++++++++-------------------
 include/sound/hdaudio_ext.h    |  1 -
 sound/hda/Kconfig              |  3 ++
 sound/hda/ext/hdac_ext_bus.c   | 47 +----------------------------
 sound/hda/hdac_bus.c           | 35 +++++++++++++++++++---
 sound/pci/hda/Kconfig          |  1 +
 sound/pci/hda/hda_controller.c |  6 ++--
 sound/pci/hda/hda_controller.h |  3 +-
 sound/pci/hda/hda_intel.c      | 47 +----------------------------
 sound/pci/hda/hda_tegra.c      | 68 +-----------------------------------------
 sound/soc/intel/skylake/skl.c  |  7 ++---
 sound/soc/sof/intel/hda-bus.c  | 40 -------------------------
 sound/soc/sof/intel/hda-dsp.c  |  2 +-
 13 files changed, 75 insertions(+), 248 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 20549def0a27..4af4af55e854 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -253,19 +253,6 @@ struct hdac_ext_bus_ops {
 	int (*hdev_detach)(struct hdac_device *hdev);
 };
 
-/*
- * Lowlevel I/O operators
- */
-struct hdac_io_ops {
-	/* mapped register accesses */
-	void (*reg_writel)(u32 value, u32 __iomem *addr);
-	u32 (*reg_readl)(u32 __iomem *addr);
-	void (*reg_writew)(u16 value, u16 __iomem *addr);
-	u16 (*reg_readw)(u16 __iomem *addr);
-	void (*reg_writeb)(u8 value, u8 __iomem *addr);
-	u8 (*reg_readb)(u8 __iomem *addr);
-};
-
 #define HDA_UNSOL_QUEUE_SIZE	64
 #define HDA_MAX_CODECS		8	/* limit by controller side */
 
@@ -299,7 +286,6 @@ struct hdac_rb {
 struct hdac_bus {
 	struct device *dev;
 	const struct hdac_bus_ops *ops;
-	const struct hdac_io_ops *io_ops;
 	const struct hdac_ext_bus_ops *ext_ops;
 
 	/* h/w resources */
@@ -380,8 +366,7 @@ struct hdac_bus {
 };
 
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
-		      const struct hdac_bus_ops *ops,
-		      const struct hdac_io_ops *io_ops);
+		      const struct hdac_bus_ops *ops);
 void snd_hdac_bus_exit(struct hdac_bus *bus);
 int snd_hdac_bus_exec_verb(struct hdac_bus *bus, unsigned int addr,
 			   unsigned int cmd, unsigned int *res);
@@ -425,21 +410,38 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
 int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus);
 void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus);
 
+#ifdef CONFIG_SND_HDA_ALIGNED_MMIO
+unsigned int snd_hdac_aligned_read(void __iomem *addr, unsigned int mask);
+void snd_hdac_aligned_write(unsigned int val, void __iomem *addr,
+			    unsigned int mask);
+#define snd_hdac_reg_writeb(v, addr)	snd_hdac_aligned_write(v, addr, 0xff)
+#define snd_hdac_reg_writew(v, addr)	snd_hdac_aligned_write(v, addr, 0xffff)
+#define snd_hdac_reg_readb(addr)	snd_hdac_aligned_read(addr, 0xff)
+#define snd_hdac_reg_readw(addr)	snd_hdac_aligned_read(addr, 0xffff)
+#else /* CONFIG_SND_HDA_ALIGNED_MMIO */
+#define snd_hdac_reg_writeb(val, addr)	writeb(val, addr)
+#define snd_hdac_reg_writew(val, addr)	writew(val, addr)
+#define snd_hdac_reg_readb(addr)	readb(addr)
+#define snd_hdac_reg_readw(addr)	readw(addr)
+#endif /* CONFIG_SND_HDA_ALIGNED_MMIO */
+#define snd_hdac_reg_writel(val, addr)	writel(val, addr)
+#define snd_hdac_reg_readl(addr)	readl(addr)
+
 /*
  * macros for easy use
  */
 #define _snd_hdac_chip_writeb(chip, reg, value) \
-	((chip)->io_ops->reg_writeb(value, (chip)->remap_addr + (reg)))
+	snd_hdac_reg_writeb(value, (chip)->remap_addr + (reg))
 #define _snd_hdac_chip_readb(chip, reg) \
-	((chip)->io_ops->reg_readb((chip)->remap_addr + (reg)))
+	snd_hdac_reg_readb((chip)->remap_addr + (reg))
 #define _snd_hdac_chip_writew(chip, reg, value) \
-	((chip)->io_ops->reg_writew(value, (chip)->remap_addr + (reg)))
+	snd_hdac_reg_writew(value, (chip)->remap_addr + (reg))
 #define _snd_hdac_chip_readw(chip, reg) \
-	((chip)->io_ops->reg_readw((chip)->remap_addr + (reg)))
+	snd_hdac_reg_readw((chip)->remap_addr + (reg))
 #define _snd_hdac_chip_writel(chip, reg, value) \
-	((chip)->io_ops->reg_writel(value, (chip)->remap_addr + (reg)))
+	snd_hdac_reg_writel(value, (chip)->remap_addr + (reg))
 #define _snd_hdac_chip_readl(chip, reg) \
-	((chip)->io_ops->reg_readl((chip)->remap_addr + (reg)))
+	snd_hdac_reg_readl((chip)->remap_addr + (reg))
 
 /* read/write a register, pass without AZX_REG_ prefix */
 #define snd_hdac_chip_writel(chip, reg, value) \
@@ -544,24 +546,19 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
 /*
  * macros for easy use
  */
-#define _snd_hdac_stream_write(type, dev, reg, value)			\
-	((dev)->bus->io_ops->reg_write ## type(value, (dev)->sd_addr + (reg)))
-#define _snd_hdac_stream_read(type, dev, reg)				\
-	((dev)->bus->io_ops->reg_read ## type((dev)->sd_addr + (reg)))
-
 /* read/write a register, pass without AZX_REG_ prefix */
 #define snd_hdac_stream_writel(dev, reg, value) \
-	_snd_hdac_stream_write(l, dev, AZX_REG_ ## reg, value)
+	snd_hdac_reg_writel(value, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_writew(dev, reg, value) \
-	_snd_hdac_stream_write(w, dev, AZX_REG_ ## reg, value)
+	snd_hdac_reg_writew(value, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_writeb(dev, reg, value) \
-	_snd_hdac_stream_write(b, dev, AZX_REG_ ## reg, value)
+	snd_hdac_reg_writeb(value, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readl(dev, reg) \
-	_snd_hdac_stream_read(l, dev, AZX_REG_ ## reg)
+	snd_hdac_reg_readl((dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readw(dev, reg) \
-	_snd_hdac_stream_read(w, dev, AZX_REG_ ## reg)
+	snd_hdac_reg_readw((dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readb(dev, reg) \
-	_snd_hdac_stream_read(b, dev, AZX_REG_ ## reg)
+	snd_hdac_reg_readb((dev)->sd_addr + AZX_REG_ ## reg)
 
 /* update a register, pass without AZX_REG_ prefix */
 #define snd_hdac_stream_updatel(dev, reg, mask, val) \
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index f34aced69ca8..ef88b20c7b0a 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -6,7 +6,6 @@
 
 int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
 		      const struct hdac_bus_ops *ops,
-		      const struct hdac_io_ops *io_ops,
 		      const struct hdac_ext_bus_ops *ext_ops);
 
 void snd_hdac_ext_bus_exit(struct hdac_bus *bus);
diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index f6feced15f17..1d475cf3f754 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -6,6 +6,9 @@ config SND_HDA_CORE
 config SND_HDA_DSP_LOADER
 	bool
 
+config SND_HDA_ALIGNED_MMIO
+	bool
+
 config SND_HDA_COMPONENT
 	bool
 
diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index 7825b74068f4..242306d820ec 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -17,67 +17,22 @@
 MODULE_DESCRIPTION("HDA extended core");
 MODULE_LICENSE("GPL v2");
 
-static void hdac_ext_writel(u32 value, u32 __iomem *addr)
-{
-	writel(value, addr);
-}
-
-static u32 hdac_ext_readl(u32 __iomem *addr)
-{
-	return readl(addr);
-}
-
-static void hdac_ext_writew(u16 value, u16 __iomem *addr)
-{
-	writew(value, addr);
-}
-
-static u16 hdac_ext_readw(u16 __iomem *addr)
-{
-	return readw(addr);
-}
-
-static void hdac_ext_writeb(u8 value, u8 __iomem *addr)
-{
-	writeb(value, addr);
-}
-
-static u8 hdac_ext_readb(u8 __iomem *addr)
-{
-	return readb(addr);
-}
-
-static const struct hdac_io_ops hdac_ext_default_io = {
-	.reg_writel = hdac_ext_writel,
-	.reg_readl = hdac_ext_readl,
-	.reg_writew = hdac_ext_writew,
-	.reg_readw = hdac_ext_readw,
-	.reg_writeb = hdac_ext_writeb,
-	.reg_readb = hdac_ext_readb,
-};
-
 /**
  * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
  * @ebus: the pointer to extended bus object
  * @dev: device pointer
  * @ops: bus verb operators
- * @io_ops: lowlevel I/O operators, can be NULL. If NULL core will use
  * default ops
  *
  * Returns 0 if successful, or a negative error code.
  */
 int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
 			const struct hdac_bus_ops *ops,
-			const struct hdac_io_ops *io_ops,
 			const struct hdac_ext_bus_ops *ext_ops)
 {
 	int ret;
 
-	/* check if io ops are provided, if not load the defaults */
-	if (io_ops == NULL)
-		io_ops = &hdac_ext_default_io;
-
-	ret = snd_hdac_bus_init(bus, dev, ops, io_ops);
+	ret = snd_hdac_bus_init(bus, dev, ops);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 00ea12e67dc8..dc2523ef7d98 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -19,13 +19,11 @@ static const struct hdac_bus_ops default_ops = {
  * snd_hdac_bus_init - initialize a HD-audio bas bus
  * @bus: the pointer to bus object
  * @ops: bus verb operators
- * @io_ops: lowlevel I/O operators
  *
  * Returns 0 if successful, or a negative error code.
  */
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
-		      const struct hdac_bus_ops *ops,
-		      const struct hdac_io_ops *io_ops)
+		      const struct hdac_bus_ops *ops)
 {
 	memset(bus, 0, sizeof(*bus));
 	bus->dev = dev;
@@ -33,7 +31,6 @@ int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
 		bus->ops = ops;
 	else
 		bus->ops = &default_ops;
-	bus->io_ops = io_ops;
 	bus->dma_type = SNDRV_DMA_TYPE_DEV;
 	INIT_LIST_HEAD(&bus->stream_list);
 	INIT_LIST_HEAD(&bus->codec_list);
@@ -218,3 +215,33 @@ void snd_hdac_bus_remove_device(struct hdac_bus *bus,
 	flush_work(&bus->unsol_work);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_remove_device);
+
+#ifdef CONFIG_SND_HDA_ALIGNED_MMIO
+/* Helpers for aligned read/write of mmio space, for Tegra */
+unsigned int snd_hdac_aligned_read(void __iomem *addr, unsigned int mask)
+{
+	void __iomem *aligned_addr =
+		(void __iomem *)((unsigned long)(addr) & ~0x3);
+	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
+	unsigned int v;
+
+	v = readl(aligned_addr);
+	return (v >> shift) & mask;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_aligned_read);
+
+void snd_hdac_aligned_write(unsigned int val, void __iomem *addr,
+			    unsigned int mask)
+{
+	void __iomem *aligned_addr =
+		(void __iomem *)((unsigned long)(addr) & ~0x3);
+	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
+	unsigned int v;
+
+	v = readl(aligned_addr);
+	v &= ~(mask << shift);
+	v |= val << shift;
+	writel(v, aligned_addr);
+}
+EXPORT_SYMBOL_GPL(snd_hdac_aligned_write);
+#endif /* CONFIG_SND_HDA_ALIGNED_MMIO */
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 35d934309cb2..82198ea8f7f8 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -26,6 +26,7 @@ config SND_HDA_TEGRA
 	tristate "NVIDIA Tegra HD Audio"
 	depends on ARCH_TEGRA
 	select SND_HDA
+	select SND_HDA_ALIGNED_MMIO
 	help
 	  Say Y here to support the HDA controller present in NVIDIA
 	  Tegra SoCs
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index c8d1b4316245..ee5504e2441f 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1202,14 +1202,12 @@ void snd_hda_bus_reset(struct hda_bus *bus)
 }
 
 /* HD-audio bus initialization */
-int azx_bus_init(struct azx *chip, const char *model,
-		 const struct hdac_io_ops *io_ops)
+int azx_bus_init(struct azx *chip, const char *model)
 {
 	struct hda_bus *bus = &chip->bus;
 	int err;
 
-	err = snd_hdac_bus_init(&bus->core, chip->card->dev, &bus_core_ops,
-				io_ops);
+	err = snd_hdac_bus_init(&bus->core, chip->card->dev, &bus_core_ops);
 	if (err < 0)
 		return err;
 
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index baa15374fbcb..146a71e0d594 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -206,8 +206,7 @@ void azx_stop_chip(struct azx *chip);
 irqreturn_t azx_interrupt(int irq, void *dev_id);
 
 /* Codec interface */
-int azx_bus_init(struct azx *chip, const char *model,
-		 const struct hdac_io_ops *io_ops);
+int azx_bus_init(struct azx *chip, const char *model);
 int azx_probe_codecs(struct azx *chip, unsigned int max_slots);
 int azx_codec_configure(struct azx *chip);
 int azx_init_streams(struct azx *chip);
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3bb4c26f2799..963a92943a6d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1627,7 +1627,6 @@ static int default_bdl_pos_adj(struct azx *chip)
 /*
  * constructor
  */
-static const struct hdac_io_ops pci_hda_io_ops;
 static const struct hda_controller_ops pci_hda_ops;
 
 static int azx_create(struct snd_card *card, struct pci_dev *pci,
@@ -1687,7 +1686,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	else
 		chip->bdl_pos_adj = bdl_pos_adj[dev];
 
-	err = azx_bus_init(chip, model[dev], &pci_hda_io_ops);
+	err = azx_bus_init(chip, model[dev]);
 	if (err < 0) {
 		kfree(hda);
 		pci_disable_device(pci);
@@ -1932,41 +1931,6 @@ static void azx_firmware_cb(const struct firmware *fw, void *context)
 }
 #endif
 
-/*
- * HDA controller ops.
- */
-
-/* PCI register access. */
-static void pci_azx_writel(u32 value, u32 __iomem *addr)
-{
-	writel(value, addr);
-}
-
-static u32 pci_azx_readl(u32 __iomem *addr)
-{
-	return readl(addr);
-}
-
-static void pci_azx_writew(u16 value, u16 __iomem *addr)
-{
-	writew(value, addr);
-}
-
-static u16 pci_azx_readw(u16 __iomem *addr)
-{
-	return readw(addr);
-}
-
-static void pci_azx_writeb(u8 value, u8 __iomem *addr)
-{
-	writeb(value, addr);
-}
-
-static u8 pci_azx_readb(u8 __iomem *addr)
-{
-	return readb(addr);
-}
-
 static int disable_msi_reset_irq(struct azx *chip)
 {
 	struct hdac_bus *bus = azx_bus(chip);
@@ -1994,15 +1958,6 @@ static void pcm_mmap_prepare(struct snd_pcm_substream *substream,
 #endif
 }
 
-static const struct hdac_io_ops pci_hda_io_ops = {
-	.reg_writel = pci_azx_writel,
-	.reg_readl = pci_azx_readl,
-	.reg_writew = pci_azx_writew,
-	.reg_readw = pci_azx_readw,
-	.reg_writeb = pci_azx_writeb,
-	.reg_readb = pci_azx_readb,
-};
-
 static const struct hda_controller_ops pci_hda_ops = {
 	.disable_msi_reset_irq = disable_msi_reset_irq,
 	.pcm_mmap_prepare = pcm_mmap_prepare,
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index ba414cc639f1..8350954b7986 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -75,72 +75,6 @@ MODULE_PARM_DESC(power_save,
 #define power_save	0
 #endif
 
-/*
- * Register access ops. Tegra HDA register access is DWORD only.
- */
-static void hda_tegra_writel(u32 value, u32 __iomem *addr)
-{
-	writel(value, addr);
-}
-
-static u32 hda_tegra_readl(u32 __iomem *addr)
-{
-	return readl(addr);
-}
-
-static void hda_tegra_writew(u16 value, u16 __iomem  *addr)
-{
-	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
-	u32 v;
-
-	v = readl(dword_addr);
-	v &= ~(0xffff << shift);
-	v |= value << shift;
-	writel(v, dword_addr);
-}
-
-static u16 hda_tegra_readw(u16 __iomem *addr)
-{
-	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
-	u32 v;
-
-	v = readl(dword_addr);
-	return (v >> shift) & 0xffff;
-}
-
-static void hda_tegra_writeb(u8 value, u8 __iomem *addr)
-{
-	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
-	u32 v;
-
-	v = readl(dword_addr);
-	v &= ~(0xff << shift);
-	v |= value << shift;
-	writel(v, dword_addr);
-}
-
-static u8 hda_tegra_readb(u8 __iomem *addr)
-{
-	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
-	u32 v;
-
-	v = readl(dword_addr);
-	return (v >> shift) & 0xff;
-}
-
-static const struct hdac_io_ops hda_tegra_io_ops = {
-	.reg_writel = hda_tegra_writel,
-	.reg_readl = hda_tegra_readl,
-	.reg_writew = hda_tegra_writew,
-	.reg_readw = hda_tegra_readw,
-	.reg_writeb = hda_tegra_writeb,
-	.reg_readb = hda_tegra_readb,
-};
-
 static const struct hda_controller_ops hda_tegra_ops; /* nothing special */
 
 static void hda_tegra_init(struct hda_tegra *hda)
@@ -459,7 +393,7 @@ static int hda_tegra_create(struct snd_card *card,
 
 	INIT_WORK(&hda->probe_work, hda_tegra_probe_work);
 
-	err = azx_bus_init(chip, NULL, &hda_tegra_io_ops);
+	err = azx_bus_init(chip, NULL);
 	if (err < 0)
 		return err;
 
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 3362e71b4563..c6d8076dc2fd 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -132,7 +132,7 @@ static int skl_init_chip(struct hdac_bus *bus, bool full_reset)
 
 	/* Reset stream-to-link mapping */
 	list_for_each_entry(hlink, &bus->hlink_list, list)
-		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
+		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 
 	skl_enable_miscbdcge(bus->dev, true);
 
@@ -854,7 +854,6 @@ static void skl_probe_work(struct work_struct *work)
  * constructor
  */
 static int skl_create(struct pci_dev *pci,
-		      const struct hdac_io_ops *io_ops,
 		      struct skl **rskl)
 {
 	struct hdac_ext_bus_ops *ext_ops = NULL;
@@ -884,7 +883,7 @@ static int skl_create(struct pci_dev *pci,
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
 	ext_ops = snd_soc_hdac_hda_get_ops();
 #endif
-	snd_hdac_ext_bus_init(bus, &pci->dev, &bus_core_ops, io_ops, ext_ops);
+	snd_hdac_ext_bus_init(bus, &pci->dev, &bus_core_ops, ext_ops);
 	bus->use_posbuf = 1;
 	skl->pci = pci;
 	INIT_WORK(&skl->probe_work, skl_probe_work);
@@ -1013,7 +1012,7 @@ static int skl_probe(struct pci_dev *pci,
 	}
 
 	/* we use ext core ops, so provide NULL for ops here */
-	err = skl_create(pci, NULL, &skl);
+	err = skl_create(pci, &skl);
 	if (err < 0)
 		return err;
 
diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 0bc93fa06b5b..438121c70f99 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -21,45 +21,6 @@ static const struct hdac_bus_ops bus_ops = {
 
 #endif
 
-static void sof_hda_writel(u32 value, u32 __iomem *addr)
-{
-	writel(value, addr);
-}
-
-static u32 sof_hda_readl(u32 __iomem *addr)
-{
-	return readl(addr);
-}
-
-static void sof_hda_writew(u16 value, u16 __iomem *addr)
-{
-	writew(value, addr);
-}
-
-static u16 sof_hda_readw(u16 __iomem *addr)
-{
-	return readw(addr);
-}
-
-static void sof_hda_writeb(u8 value, u8 __iomem *addr)
-{
-	writeb(value, addr);
-}
-
-static u8 sof_hda_readb(u8 __iomem *addr)
-{
-	return readb(addr);
-}
-
-static const struct hdac_io_ops io_ops = {
-	.reg_writel = sof_hda_writel,
-	.reg_readl = sof_hda_readl,
-	.reg_writew = sof_hda_writew,
-	.reg_readw = sof_hda_readw,
-	.reg_writeb = sof_hda_writeb,
-	.reg_readb = sof_hda_readb,
-};
-
 /*
  * This can be used for both with/without hda link support.
  */
@@ -69,7 +30,6 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
 	memset(bus, 0, sizeof(*bus));
 	bus->dev = dev;
 
-	bus->io_ops = &io_ops;
 	INIT_LIST_HEAD(&bus->stream_list);
 
 	bus->irq = -1;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 91de4785b6a3..8d4ce5b4febd 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -356,7 +356,7 @@ static int hda_resume(struct snd_sof_dev *sdev)
 
 	/* Reset stream-to-link mapping */
 	list_for_each_entry(hlink, &bus->hlink_list, list)
-		bus->io_ops->reg_writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
+		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
 #else
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
