Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4E233D5F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 04:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6B911686;
	Fri, 31 Jul 2020 04:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6B911686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596163434;
	bh=4ro6F6gd3MIfxNfjcR3/wDQo15MNNBzOnabcCfOhZm0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kbT4Lc77AooGAvPF1mOU7Bji+/Zynru1W7LQAYJI1+DkTRTrGcdIbW0hv8f9Lxze0
	 P8IiUBGCRdYzsw9sRw2lzMdZ3ihvG2KIJ4O8D0ZSlNb/mmrNA83LB4LXbOx22hjnRY
	 T58/fxl7zPPD0NkTfXjS8uT/CbgPITbXLHBT+Klk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD0BF80161;
	Fri, 31 Jul 2020 04:42:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C8ADF80171; Fri, 31 Jul 2020 04:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B59BF80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 04:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B59BF80111
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf97yhCNfT84CAA--.551S2;
 Fri, 31 Jul 2020 10:41:55 +0800 (CST)
From: Kaige Li <likaige@loongson.cn>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Sameer Pujar <spujar@nvidia.com>,
 Mohan Kumar <mkumard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC] ALSA: hda: Add workaround to adapt to Loongson 7A1000 controller
Date: Fri, 31 Jul 2020 10:41:54 +0800
Message-Id: <1596163314-21808-1-git-send-email-likaige@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxf97yhCNfT84CAA--.551S2
X-Coremail-Antispam: 1UD129KBjvJXoW3KFW5Xw43GF47Xr18ZrWxtFb_yoWkGF18pw
 40y3WrKFZrtF4Ivr4DKay0kF1ftFs7Ga43KrWSkw13Zw47Jr4Yqryj9r1xAFZ2kr909rW3
 Xa12yr9rGay5WrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbb18PUUUUU==
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Cc: alsa-devel@alsa-project.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-kernel@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>
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

There's some issues that cause palyback without a sound on Loongson
platform (3A3000 + 7A1000) with a Realtek ALC269 codec. After lengthy
debugging sessions, we solved it by adding workaround.

Signed-off-by: Kaige Li <likaige@loongson.cn>
---
 sound/hda/hdac_controller.c    | 63 ++++++++++++++++++++++++++++++++++++------
 sound/hda/hdac_stream.c        | 22 +++++++++++++--
 sound/pci/hda/hda_controller.h |  2 +-
 sound/pci/hda/hda_intel.c      |  9 +++++-
 4 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 011b17c..f60f49a 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -9,6 +9,7 @@
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_register.h>
+#include "../pci/hda/hda_controller.h"
 #include "local.h"
 
 /* clear CORB read pointer properly */
@@ -42,6 +43,8 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
  */
 void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 {
+	struct azx *chip = bus_to_azx(bus);
+
 	WARN_ON_ONCE(!bus->rb.area);
 
 	spin_lock_irq(&bus->reg_lock);
@@ -58,11 +61,15 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 
 	/* reset the corb hw read pointer */
 	snd_hdac_chip_writew(bus, CORBRP, AZX_CORBRP_RST);
-	if (!bus->corbrp_self_clear)
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+		snd_hdac_chip_writew(bus, CORBRP, 0);
+	else if (!bus->corbrp_self_clear)
 		azx_clear_corbrp(bus);
 
 	/* enable corb dma */
 	snd_hdac_chip_writeb(bus, CORBCTL, AZX_CORBCTL_RUN);
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+		snd_hdac_chip_readb(bus, CORBCTL);
 
 	/* RIRB set up */
 	bus->rirb.addr = bus->rb.addr + 2048;
@@ -79,7 +86,12 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
 	/* set N=1, get RIRB response interrupt for new entry */
 	snd_hdac_chip_writew(bus, RINTCNT, 1);
 	/* enable rirb dma and response irq */
-	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND) {
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
+		snd_hdac_chip_readb(bus, RIRBCTL);
+	} else {
+		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
+	}
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 	spin_unlock_irq(&bus->reg_lock);
@@ -132,6 +144,18 @@ static unsigned int azx_command_addr(u32 cmd)
 	return addr;
 }
 
+static unsigned int azx_response_addr(u32 res)
+{
+	unsigned int addr = res & 0xf;
+
+	if (addr >= AZX_MAX_CODECS) {
+		snd_BUG();
+		addr = 0;
+	}
+
+	return addr;
+}
+
 /**
  * snd_hdac_bus_send_cmd - send a command verb via CORB
  * @bus: HD-audio core bus
@@ -189,6 +213,7 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
 	unsigned int rp, wp;
 	unsigned int addr;
 	u32 res, res_ex;
+	struct azx *chip = bus_to_azx(bus);
 
 	wp = snd_hdac_chip_readw(bus, RIRBWP);
 	if (wp == 0xffff) {
@@ -207,7 +232,11 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
 		rp = bus->rirb.rp << 1; /* an RIRB entry is 8-bytes */
 		res_ex = le32_to_cpu(bus->rirb.buf[rp + 1]);
 		res = le32_to_cpu(bus->rirb.buf[rp]);
-		addr = res_ex & 0xf;
+		if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND) {
+			addr = azx_response_addr(res_ex);
+		} else {
+			addr = res_ex & 0xf;
+		}
 		if (addr >= HDA_MAX_CODECS) {
 			dev_err(bus->dev,
 				"spurious response %#x:%#x, rp = %d, wp = %d",
@@ -245,6 +274,7 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 	unsigned long loopcounter;
 	wait_queue_entry_t wait;
 	bool warned = false;
+	struct azx *chip = bus_to_azx(bus);
 
 	init_wait_entry(&wait, 0);
 	timeout = jiffies + msecs_to_jiffies(1000);
@@ -254,8 +284,11 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 		if (!bus->polling_mode)
 			prepare_to_wait(&bus->rirb_wq, &wait,
 					TASK_UNINTERRUPTIBLE);
-		if (bus->polling_mode)
+		if (bus->polling_mode) {
+			if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+				bus->rirb.cmds[addr] %= AZX_MAX_RIRB_ENTRIES;
 			snd_hdac_bus_update_rirb(bus);
+		}
 		if (!bus->rirb.cmds[addr]) {
 			if (res)
 				*res = bus->rirb.res[addr]; /* the last value */
@@ -484,16 +517,24 @@ static void azx_int_disable(struct hdac_bus *bus)
 static void azx_int_clear(struct hdac_bus *bus)
 {
 	struct hdac_stream *azx_dev;
+	struct azx *chip = bus_to_azx(bus);
 
 	/* clear stream status */
-	list_for_each_entry(azx_dev, &bus->stream_list, list)
-		snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
+	list_for_each_entry(azx_dev, &bus->stream_list, list) {
+		if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+			snd_hdac_stream_updateb(azx_dev, SD_STS, 0, 0);
+		else
+			snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
+	}
 
 	/* clear STATESTS */
 	snd_hdac_chip_writew(bus, STATESTS, STATESTS_INT_MASK);
 
 	/* clear rirb status */
-	snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+		snd_hdac_chip_updateb(bus, RIRBSTS, ~RIRB_INT_MASK, 0);
+	else
+		snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
 
 	/* clear int status */
 	snd_hdac_chip_writel(bus, INTSTS, AZX_INT_CTRL_EN | AZX_INT_ALL_STREAM);
@@ -585,11 +626,17 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
 	struct hdac_stream *azx_dev;
 	u8 sd_status;
 	int handled = 0;
+	struct azx *chip = bus_to_azx(bus);
 
 	list_for_each_entry(azx_dev, &bus->stream_list, list) {
 		if (status & azx_dev->sd_int_sta_mask) {
 			sd_status = snd_hdac_stream_readb(azx_dev, SD_STS);
-			snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
+			if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND) {
+				snd_hdac_stream_writeb(azx_dev, SD_STS, sd_status);
+				snd_hdac_stream_readb(azx_dev, SD_STS);
+			} else {
+				snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
+			}
 			handled |= 1 << azx_dev->index;
 			if (!azx_dev->substream || !azx_dev->running ||
 			    !(sd_status & SD_INT_COMPLETE))
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a38a2af..fa91832 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -12,6 +12,7 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_register.h>
 #include "trace.h"
+#include "../pci/hda/hda_controller.h"
 
 /**
  * snd_hdac_get_stream_stripe_ctl - get stripe control value
@@ -83,6 +84,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_init);
 void snd_hdac_stream_start(struct hdac_stream *azx_dev, bool fresh_start)
 {
 	struct hdac_bus *bus = azx_dev->bus;
+	struct azx *chip = bus_to_azx(bus);
 	int stripe_ctl;
 
 	trace_snd_hdac_stream_start(bus, azx_dev);
@@ -105,7 +107,11 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev, bool fresh_start)
 					stripe_ctl);
 	}
 	/* set DMA start and interrupt mask */
-	snd_hdac_stream_updateb(azx_dev, SD_CTL,
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+		snd_hdac_stream_updatel(azx_dev, SD_CTL,
+				0, SD_CTL_DMA_START | SD_INT_MASK);
+	else
+		snd_hdac_stream_updateb(azx_dev, SD_CTL,
 				0, SD_CTL_DMA_START | SD_INT_MASK);
 	azx_dev->running = true;
 }
@@ -190,6 +196,7 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_runtime *runtime;
 	unsigned int val;
+	struct azx *chip = bus_to_azx(bus);
 
 	if (azx_dev->substream)
 		runtime = azx_dev->substream->runtime;
@@ -206,8 +213,14 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	snd_hdac_stream_writel(azx_dev, SD_CTL, val);
 
 	/* program the length of samples in cyclic buffer */
-	snd_hdac_stream_writel(azx_dev, SD_CBL, azx_dev->bufsize);
-
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND) {
+		if (azx_dev->substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			snd_hdac_stream_writel(azx_dev, SD_CBL, azx_dev->bufsize - 64);
+		else
+			snd_hdac_stream_writel(azx_dev, SD_CBL, azx_dev->bufsize - 16);
+	} else {
+		snd_hdac_stream_writel(azx_dev, SD_CBL, azx_dev->bufsize);
+	}
 	/* program the stream format */
 	/* this value needs to be the same as the one programmed */
 	snd_hdac_stream_writew(azx_dev, SD_FORMAT, azx_dev->format_val);
@@ -412,6 +425,7 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 	__le32 *bdl;
 	int i, ofs, periods, period_bytes;
 	int pos_adj, pos_align;
+	struct azx *chip = bus_to_azx(bus);
 
 	/* reset BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
@@ -426,6 +440,8 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 	azx_dev->frags = 0;
 
 	pos_adj = bus->bdl_pos_adj;
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+		pos_adj = 0;
 	if (!azx_dev->no_period_wakeup && pos_adj > 0) {
 		pos_align = pos_adj;
 		pos_adj = (pos_adj * runtime->rate + 47999) / 48000;
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index fe17168..74fae0b 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -36,7 +36,7 @@
 /* 19 unused */
 #define AZX_DCAPS_OLD_SSYNC	(1 << 20)	/* Old SSYNC reg for ICH */
 #define AZX_DCAPS_NO_ALIGN_BUFSIZE (1 << 21)	/* no buffer size alignment */
-/* 22 unused */
+#define AZX_DCAPS_LOONGSON_HDA_WORKAROUND (1 << 22)   /* Loongson-HDA workaround */
 #define AZX_DCAPS_4K_BDLE_BOUNDARY (1 << 23)	/* BDLE in 4k boundary */
 /* 24 unused */
 #define AZX_DCAPS_COUNT_LPIB_DELAY  (1 << 25)	/* Take LPIB as delay */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ea1d535..573e12f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -678,6 +678,8 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
 	u32 wallclk;
 	unsigned int pos;
 
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND)
+		return 1;
 	wallclk = azx_readl(chip, WALLCLK) - azx_dev->core.start_wallclk;
 	if (wallclk < (azx_dev->core.period_wallclk * 2) / 3)
 		return -1;	/* bogus (too early) interrupt */
@@ -1566,6 +1568,10 @@ static int check_position_fix(struct azx *chip, int fix)
 		dev_dbg(chip->card->dev, "Using SKL position fix\n");
 		return POS_FIX_SKL;
 	}
+	if (chip->driver_caps & AZX_DCAPS_LOONGSON_HDA_WORKAROUND) {
+		dev_dbg(chip->card->dev, "Using LPIB position fix\n");
+		return POS_FIX_LPIB;
+	}
 	return POS_FIX_AUTO;
 }
 
@@ -2736,7 +2742,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* Zhaoxin */
 	{ PCI_DEVICE(0x1d17, 0x3288), .driver_data = AZX_DRIVER_ZHAOXIN },
 	/* Loongson */
-	{ PCI_DEVICE(0x0014, 0x7a07), .driver_data = AZX_DRIVER_GENERIC },
+	{ PCI_DEVICE(0x0014, 0x7a07),
+	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_LOONGSON_HDA_WORKAROUND},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, azx_ids);
-- 
2.1.0

