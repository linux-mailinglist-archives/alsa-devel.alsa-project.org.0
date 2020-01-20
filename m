Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AE14285C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 11:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743D71668;
	Mon, 20 Jan 2020 11:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743D71668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579517021;
	bh=DaZY0OKHmbcsM7FdEbz7A3lCWZVEypkwaYXAhISrY8Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CCQx82Gk/ZA7pbxz3NdIqrMvVBji2KjgdmXSdQBqAEOcCxKYJ9cZeZ1WVY+rnC8Tc
	 4UwL6o2PLY7RWkS7qHwKE5wMpPOayLp2K8YyAbzDqVhzsy6xEXT4UIhtZQ0281ErhB
	 cxBRuu9w6l8cKv8z+sexqtVeQML0vyF5pFy3bEQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F167CF8020C;
	Mon, 20 Jan 2020 11:41:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F46EF8020C; Mon, 20 Jan 2020 11:41:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C6DF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 11:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C6DF8013E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73337B3E1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 10:41:36 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 20 Jan 2020 11:41:27 +0100
Message-Id: <20200120104127.28985-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda: Apply aligned MMIO access only
	conditionally
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

It turned out that the recent simplification of HD-audio bus access
helpers caused a regression on the virtual HD-audio device on QEMU
with ARM platforms.  The driver got a CORB/RIRB timeout and couldn't
probe any codecs.

The essential difference that caused a problem was the enforced
aligned MMIO accesses by simplification.  Since snd-hda-tegra driver
is enabled on ARM, it enables CONFIG_SND_HDA_ALIGNED_MMIO, which makes
the all HD-audio drivers using the aligned MMIO accesses.  While this
is mandatory for snd-hda-tegra, it seems that snd-hda-intel on ARM
gets broken by this access pattern.

For addressing the regression, this patch introduces a new flag,
aligned_mmio, to hdac_bus object, and applies the aligned MMIO only
when this flag is set.  This change affects only platforms with
CONFIG_SND_HDA_ALIGNED_MMIO set, i.e. mostly only for ARM platforms.

Unfortunately the patch became a big bigger than it should be, just
because the former calls didn't take hdac_bus object in the argument,
hence we had to extend the call patterns.

Fixes: 19abfefd4c76 ("ALSA: hda: Direct MMIO accesses")
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1161152
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h   | 77 ++++++++++++++++++++++++++++++++---------------
 sound/pci/hda/hda_tegra.c |  1 +
 2 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index e05b95e83d5a..fb9dce4c6928 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -8,6 +8,7 @@
 
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/pm_runtime.h>
 #include <linux/timecounter.h>
 #include <sound/core.h>
@@ -330,6 +331,7 @@ struct hdac_bus {
 	bool chip_init:1;		/* h/w initialized */
 
 	/* behavior flags */
+	bool aligned_mmio:1;		/* aligned MMIO access */
 	bool sync_write:1;		/* sync after verb write */
 	bool use_posbuf:1;		/* use position buffer */
 	bool snoop:1;			/* enable snooping */
@@ -405,34 +407,61 @@ void snd_hdac_bus_free_stream_pages(struct hdac_bus *bus);
 unsigned int snd_hdac_aligned_read(void __iomem *addr, unsigned int mask);
 void snd_hdac_aligned_write(unsigned int val, void __iomem *addr,
 			    unsigned int mask);
-#define snd_hdac_reg_writeb(v, addr)	snd_hdac_aligned_write(v, addr, 0xff)
-#define snd_hdac_reg_writew(v, addr)	snd_hdac_aligned_write(v, addr, 0xffff)
-#define snd_hdac_reg_readb(addr)	snd_hdac_aligned_read(addr, 0xff)
-#define snd_hdac_reg_readw(addr)	snd_hdac_aligned_read(addr, 0xffff)
-#else /* CONFIG_SND_HDA_ALIGNED_MMIO */
-#define snd_hdac_reg_writeb(val, addr)	writeb(val, addr)
-#define snd_hdac_reg_writew(val, addr)	writew(val, addr)
-#define snd_hdac_reg_readb(addr)	readb(addr)
-#define snd_hdac_reg_readw(addr)	readw(addr)
-#endif /* CONFIG_SND_HDA_ALIGNED_MMIO */
-#define snd_hdac_reg_writel(val, addr)	writel(val, addr)
-#define snd_hdac_reg_readl(addr)	readl(addr)
+#define snd_hdac_aligned_mmio(bus)	(bus)->aligned_mmio
+#else
+#define snd_hdac_aligned_mmio(bus)	false
+#define snd_hdac_aligned_read(addr, mask)	0
+#define snd_hdac_aligned_write(val, addr, mask) do {} while (0)
+#endif
+
+static inline void snd_hdac_reg_writeb(struct hdac_bus *bus, void __iomem *addr,
+				       u8 val)
+{
+	if (snd_hdac_aligned_mmio(bus))
+		snd_hdac_aligned_write(val, addr, 0xff);
+	else
+		writeb(val, addr);
+}
+
+static inline void snd_hdac_reg_writew(struct hdac_bus *bus, void __iomem *addr,
+				       u16 val)
+{
+	if (snd_hdac_aligned_mmio(bus))
+		snd_hdac_aligned_write(val, addr, 0xffff);
+	else
+		writew(val, addr);
+}
+
+static inline u8 snd_hdac_reg_readb(struct hdac_bus *bus, void __iomem *addr)
+{
+	return snd_hdac_aligned_mmio(bus) ?
+		snd_hdac_aligned_read(addr, 0xff) : readb(addr);
+}
+
+static inline u16 snd_hdac_reg_readw(struct hdac_bus *bus, void __iomem *addr)
+{
+	return snd_hdac_aligned_mmio(bus) ?
+		snd_hdac_aligned_read(addr, 0xffff) : readw(addr);
+}
+
+#define snd_hdac_reg_writel(bus, addr, val)	writel(val, addr)
+#define snd_hdac_reg_readl(bus, addr)	readl(addr)
 
 /*
  * macros for easy use
  */
 #define _snd_hdac_chip_writeb(chip, reg, value) \
-	snd_hdac_reg_writeb(value, (chip)->remap_addr + (reg))
+	snd_hdac_reg_writeb(chip, (chip)->remap_addr + (reg), value)
 #define _snd_hdac_chip_readb(chip, reg) \
-	snd_hdac_reg_readb((chip)->remap_addr + (reg))
+	snd_hdac_reg_readb(chip, (chip)->remap_addr + (reg))
 #define _snd_hdac_chip_writew(chip, reg, value) \
-	snd_hdac_reg_writew(value, (chip)->remap_addr + (reg))
+	snd_hdac_reg_writew(chip, (chip)->remap_addr + (reg), value)
 #define _snd_hdac_chip_readw(chip, reg) \
-	snd_hdac_reg_readw((chip)->remap_addr + (reg))
+	snd_hdac_reg_readw(chip, (chip)->remap_addr + (reg))
 #define _snd_hdac_chip_writel(chip, reg, value) \
-	snd_hdac_reg_writel(value, (chip)->remap_addr + (reg))
+	snd_hdac_reg_writel(chip, (chip)->remap_addr + (reg), value)
 #define _snd_hdac_chip_readl(chip, reg) \
-	snd_hdac_reg_readl((chip)->remap_addr + (reg))
+	snd_hdac_reg_readl(chip, (chip)->remap_addr + (reg))
 
 /* read/write a register, pass without AZX_REG_ prefix */
 #define snd_hdac_chip_writel(chip, reg, value) \
@@ -540,17 +569,17 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
  */
 /* read/write a register, pass without AZX_REG_ prefix */
 #define snd_hdac_stream_writel(dev, reg, value) \
-	snd_hdac_reg_writel(value, (dev)->sd_addr + AZX_REG_ ## reg)
+	snd_hdac_reg_writel((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg, value)
 #define snd_hdac_stream_writew(dev, reg, value) \
-	snd_hdac_reg_writew(value, (dev)->sd_addr + AZX_REG_ ## reg)
+	snd_hdac_reg_writew((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg, value)
 #define snd_hdac_stream_writeb(dev, reg, value) \
-	snd_hdac_reg_writeb(value, (dev)->sd_addr + AZX_REG_ ## reg)
+	snd_hdac_reg_writeb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg, value)
 #define snd_hdac_stream_readl(dev, reg) \
-	snd_hdac_reg_readl((dev)->sd_addr + AZX_REG_ ## reg)
+	snd_hdac_reg_readl((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readw(dev, reg) \
-	snd_hdac_reg_readw((dev)->sd_addr + AZX_REG_ ## reg)
+	snd_hdac_reg_readw((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readb(dev, reg) \
-	snd_hdac_reg_readb((dev)->sd_addr + AZX_REG_ ## reg)
+	snd_hdac_reg_readb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 
 /* update a register, pass without AZX_REG_ prefix */
 #define snd_hdac_stream_updatel(dev, reg, mask, val) \
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 8350954b7986..e5191584638a 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -398,6 +398,7 @@ static int hda_tegra_create(struct snd_card *card,
 		return err;
 
 	chip->bus.needs_damn_long_delay = 1;
+	chip->bus.core.aligned_mmio = 1;
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
 	if (err < 0) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
