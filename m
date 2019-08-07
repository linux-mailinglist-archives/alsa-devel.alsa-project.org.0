Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85AE844BC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 08:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A4F847;
	Wed,  7 Aug 2019 08:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A4F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565160276;
	bh=cn0HkPIg4sMmHq+Tb+bEhAu7uHLXqHugehD0kx0mItM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G49da90SFGPyqWARTEZDj45szWIhrzSDdFZWamjLuDIQqP5qkh/+945FhKAgSnURD
	 0JzWzFcoGR4QZ5iAE22KO6lXhuNze3AaiAHd/0OIdT6oI4VUHLcCDyLj5XkOEj5Lqh
	 cVdatbBerz2VlUAZSNGtF141o1ApFrDdUm+KWjOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72280F804CA;
	Wed,  7 Aug 2019 08:42:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FD01F80290; Wed,  7 Aug 2019 08:42:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25775F800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 08:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25775F800E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 543B9AC94
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 06:42:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 08:42:43 +0200
Message-Id: <20190807064243.18053-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda - Workaround for crackled sound on
	AMD controller (1022:1457)
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

A long-time problem on the recent AMD chip (1022:1457) with Realtek
codecs (X370, X470, B450, etc) was the crackled or distorted sound for
capture streams, as well as occasional playback hiccups.  After
lengthy debugging sessions, the workaround we've found is like below:

- Set up the proper driver caps for this controller, similar as the
  other AMD controller.

- Correct the DMA position reporting with the fixed FIFO size, which
  is similar like as workaround used for VIA chip set.

- Even after the position correction, PA still shows mysterious stalls
  of playback streams when a capture is triggered in timer-scheduled
  mode.  Since we have no clear way to eliminate the stall, pass the
  BATCH PCM flag for PA to suppress the tsched mode as a temporary
  workaround.

This patch implements the workarounds.  For the driver caps, it
defines a new preset, AXZ_DCAPS_PRESET_AMD_SB.  It enables the FIFO-
corrected position reporting (corresponding to the new position_fix=6)
and enforces the SNDRV_PCM_INFO_BATCH flag.

Note that the current implementation is merely a workaround.
Hopefully we'll find a better alternative in future, especially about
removing the BATCH flag hack again.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=195303
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.c |  7 +++++
 sound/pci/hda/hda_controller.h |  2 +-
 sound/pci/hda/hda_intel.c      | 63 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 2fbdde239936..48d863736b3c 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -613,6 +613,13 @@ static int azx_pcm_open(struct snd_pcm_substream *substream)
 				     20,
 				     178000000);
 
+	/* by some reason, the playback stream stalls on PulseAudio with
+	 * tsched=1 when a capture stream triggers.  Until we figure out the
+	 * real cause, disable tsched mode by telling the PCM info flag.
+	 */
+	if (chip->driver_caps & AZX_DCAPS_AMD_WORKAROUND)
+		runtime->hw.info |= SNDRV_PCM_INFO_BATCH;
+
 	if (chip->align_buffer_size)
 		/* constrain buffer sizes to be multiple of 128
 		   bytes. This is more efficient in terms of memory
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index baa15374fbcb..f2a6df5e6bcb 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -31,7 +31,7 @@
 /* 14 unused */
 #define AZX_DCAPS_CTX_WORKAROUND (1 << 15)	/* X-Fi workaround */
 #define AZX_DCAPS_POSFIX_LPIB	(1 << 16)	/* Use LPIB as default */
-/* 17 unused */
+#define AZX_DCAPS_AMD_WORKAROUND (1 << 17)	/* AMD-specific workaround */
 #define AZX_DCAPS_NO_64BIT	(1 << 18)	/* No 64bit address */
 #define AZX_DCAPS_SYNC_WRITE	(1 << 19)	/* sync each cmd write */
 #define AZX_DCAPS_OLD_SSYNC	(1 << 20)	/* Old SSYNC reg for ICH */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 1e14d7270adf..a6d8c0d77b84 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -64,6 +64,7 @@ enum {
 	POS_FIX_VIACOMBO,
 	POS_FIX_COMBO,
 	POS_FIX_SKL,
+	POS_FIX_FIFO,
 };
 
 /* Defines for ATI HD Audio support in SB450 south bridge */
@@ -135,7 +136,7 @@ module_param_array(model, charp, NULL, 0444);
 MODULE_PARM_DESC(model, "Use the given board model.");
 module_param_array(position_fix, int, NULL, 0444);
 MODULE_PARM_DESC(position_fix, "DMA pointer read method."
-		 "(-1 = system default, 0 = auto, 1 = LPIB, 2 = POSBUF, 3 = VIACOMBO, 4 = COMBO, 5 = SKL+).");
+		 "(-1 = system default, 0 = auto, 1 = LPIB, 2 = POSBUF, 3 = VIACOMBO, 4 = COMBO, 5 = SKL+, 6 = FIFO).");
 module_param_array(bdl_pos_adj, int, NULL, 0644);
 MODULE_PARM_DESC(bdl_pos_adj, "BDL position adjustment offset.");
 module_param_array(probe_mask, int, NULL, 0444);
@@ -332,6 +333,11 @@ enum {
 #define AZX_DCAPS_PRESET_ATI_HDMI_NS \
 	(AZX_DCAPS_PRESET_ATI_HDMI | AZX_DCAPS_SNOOP_OFF)
 
+/* quirks for AMD SB */
+#define AZX_DCAPS_PRESET_AMD_SB \
+	(AZX_DCAPS_NO_TCSEL | AZX_DCAPS_SYNC_WRITE | AZX_DCAPS_AMD_WORKAROUND |\
+	 AZX_DCAPS_SNOOP_TYPE(ATI) | AZX_DCAPS_PM_RUNTIME)
+
 /* quirks for Nvidia */
 #define AZX_DCAPS_PRESET_NVIDIA \
 	(AZX_DCAPS_NO_MSI | AZX_DCAPS_CORBRP_SELF_CLEAR |\
@@ -841,6 +847,49 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	return bound_pos + mod_dma_pos;
 }
 
+#define AMD_FIFO_SIZE	32
+
+/* get the current DMA position with FIFO size correction */
+static unsigned int azx_get_pos_fifo(struct azx *chip, struct azx_dev *azx_dev)
+{
+	struct snd_pcm_substream *substream = azx_dev->core.substream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int pos, delay;
+
+	pos = snd_hdac_stream_get_pos_lpib(azx_stream(azx_dev));
+	if (!runtime)
+		return pos;
+
+	runtime->delay = AMD_FIFO_SIZE;
+	delay = frames_to_bytes(runtime, AMD_FIFO_SIZE);
+	if (azx_dev->insufficient) {
+		if (pos < delay) {
+			delay = pos;
+			runtime->delay = bytes_to_frames(runtime, pos);
+		} else {
+			azx_dev->insufficient = 0;
+		}
+	}
+
+	/* correct the DMA position for capture stream */
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		if (pos < delay)
+			pos += azx_dev->core.bufsize;
+		pos -= delay;
+	}
+
+	return pos;
+}
+
+static int azx_get_delay_from_fifo(struct azx *chip, struct azx_dev *azx_dev,
+				   unsigned int pos)
+{
+	struct snd_pcm_substream *substream = azx_dev->core.substream;
+
+	/* just read back the calculated value in the above */
+	return substream->runtime->delay;
+}
+
 static unsigned int azx_skl_get_dpib_pos(struct azx *chip,
 					 struct azx_dev *azx_dev)
 {
@@ -1417,6 +1466,7 @@ static int check_position_fix(struct azx *chip, int fix)
 	case POS_FIX_VIACOMBO:
 	case POS_FIX_COMBO:
 	case POS_FIX_SKL:
+	case POS_FIX_FIFO:
 		return fix;
 	}
 
@@ -1433,6 +1483,10 @@ static int check_position_fix(struct azx *chip, int fix)
 		dev_dbg(chip->card->dev, "Using VIACOMBO position fix\n");
 		return POS_FIX_VIACOMBO;
 	}
+	if (chip->driver_caps & AZX_DCAPS_AMD_WORKAROUND) {
+		dev_dbg(chip->card->dev, "Using FIFO position fix\n");
+		return POS_FIX_FIFO;
+	}
 	if (chip->driver_caps & AZX_DCAPS_POSFIX_LPIB) {
 		dev_dbg(chip->card->dev, "Using LPIB position fix\n");
 		return POS_FIX_LPIB;
@@ -1453,6 +1507,7 @@ static void assign_position_fix(struct azx *chip, int fix)
 		[POS_FIX_VIACOMBO] = azx_via_get_position,
 		[POS_FIX_COMBO] = azx_get_pos_lpib,
 		[POS_FIX_SKL] = azx_get_pos_skl,
+		[POS_FIX_FIFO] = azx_get_pos_fifo,
 	};
 
 	chip->get_position[0] = chip->get_position[1] = callbacks[fix];
@@ -1467,6 +1522,9 @@ static void assign_position_fix(struct azx *chip, int fix)
 			azx_get_delay_from_lpib;
 	}
 
+	if (fix == POS_FIX_FIFO)
+		chip->get_delay[0] = chip->get_delay[1] =
+			azx_get_delay_from_fifo;
 }
 
 /*
@@ -2447,6 +2505,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* AMD Hudson */
 	{ PCI_DEVICE(0x1022, 0x780d),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_SB },
+	/* AMD, X370 & co */
+	{ PCI_DEVICE(0x1022, 0x1457),
+	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
 	/* AMD Stoney */
 	{ PCI_DEVICE(0x1022, 0x157a),
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_SB |
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
