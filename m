Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B44051308AA
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:20:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB0F1810;
	Sun,  5 Jan 2020 16:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB0F1810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237628;
	bh=uPx/dtOJbfTKYUhv5/1/7CT6CHpvdCcu7iqQYNBr8sk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iuBW6iDlMkb+4Dxuvwrp83hEYHReigZ2RiD2n4jkuyUUjQuShDIgy25saYmk7EK0/
	 6Gw8I2IspV1+Us8Q6y3AmBIIFuddqPuV3kaQeJFCHXXc6xbyTJemtpynw2ESdsY8fN
	 cmz1Wp8BdT+K3Q4eY9VVR0GDvSXew2xUMc2kF/bI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96486F804DF;
	Sun,  5 Jan 2020 15:50:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E84D8F80394; Sun,  5 Jan 2020 15:49:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1061FF802C2
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1061FF802C2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE126B2BE
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:48:00 +0100
Message-Id: <20200105144823.29547-46-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 45/68] ALSA: sb: More constifications
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

Apply const prefix to each possible place: the static tables for the
resources, controls, registers, values and parameters.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000.c  | 16 ++++++++--------
 sound/isa/sb/jazz16.c   | 10 +++++-----
 sound/isa/sb/sb16.c     |  8 ++++----
 sound/isa/sb/sb8.c      |  2 +-
 sound/isa/sb/sb_mixer.c | 38 +++++++++++++++++++-------------------
 5 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index 455dd5fa3ccb..0aa545ac6e60 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -222,7 +222,7 @@ init_dma(struct snd_emu8000 *emu)
 /*
  * initialization arrays; from ADIP
  */
-static unsigned short init1[128] = {
+static const unsigned short init1[128] = {
 	0x03ff, 0x0030,  0x07ff, 0x0130, 0x0bff, 0x0230,  0x0fff, 0x0330,
 	0x13ff, 0x0430,  0x17ff, 0x0530, 0x1bff, 0x0630,  0x1fff, 0x0730,
 	0x23ff, 0x0830,  0x27ff, 0x0930, 0x2bff, 0x0a30,  0x2fff, 0x0b30,
@@ -244,7 +244,7 @@ static unsigned short init1[128] = {
 	0xf3ff, 0x0c30,  0xf7ff, 0x0d30, 0xfbff, 0x0e30,  0xffff, 0x0f30,
 };
 
-static unsigned short init2[128] = {
+static const unsigned short init2[128] = {
 	0x03ff, 0x8030, 0x07ff, 0x8130, 0x0bff, 0x8230, 0x0fff, 0x8330,
 	0x13ff, 0x8430, 0x17ff, 0x8530, 0x1bff, 0x8630, 0x1fff, 0x8730,
 	0x23ff, 0x8830, 0x27ff, 0x8930, 0x2bff, 0x8a30, 0x2fff, 0x8b30,
@@ -266,7 +266,7 @@ static unsigned short init2[128] = {
 	0xf3ff, 0x8c30, 0xf7ff, 0x8d30, 0xfbff, 0x8e30, 0xffff, 0x8f30,
 };
 
-static unsigned short init3[128] = {
+static const unsigned short init3[128] = {
 	0x0C10, 0x8470, 0x14FE, 0xB488, 0x167F, 0xA470, 0x18E7, 0x84B5,
 	0x1B6E, 0x842A, 0x1F1D, 0x852A, 0x0DA3, 0x8F7C, 0x167E, 0xF254,
 	0x0000, 0x842A, 0x0001, 0x852A, 0x18E6, 0x8BAA, 0x1B6D, 0xF234,
@@ -288,7 +288,7 @@ static unsigned short init3[128] = {
 	0x1342, 0xD36E, 0x3EC7, 0xB3FF, 0x0000, 0x8365, 0x1420, 0x9570,
 };
 
-static unsigned short init4[128] = {
+static const unsigned short init4[128] = {
 	0x0C10, 0x8470, 0x14FE, 0xB488, 0x167F, 0xA470, 0x18E7, 0x84B5,
 	0x1B6E, 0x842A, 0x1F1D, 0x852A, 0x0DA3, 0x0F7C, 0x167E, 0x7254,
 	0x0000, 0x842A, 0x0001, 0x852A, 0x18E6, 0x0BAA, 0x1B6D, 0x7234,
@@ -315,10 +315,10 @@ static unsigned short init4[128] = {
  * is meant to work
  */
 static void
-send_array(struct snd_emu8000 *emu, unsigned short *data, int size)
+send_array(struct snd_emu8000 *emu, const unsigned short *data, int size)
 {
 	int i;
-	unsigned short *p;
+	const unsigned short *p;
 
 	p = data;
 	for (i = 0; i < size; i++, p++)
@@ -548,7 +548,7 @@ snd_emu8000_init_hw(struct snd_emu8000 *emu)
  * Bass/Treble Equalizer
  *----------------------------------------------------------------*/
 
-static unsigned short bass_parm[12][3] = {
+static const unsigned short bass_parm[12][3] = {
 	{0xD26A, 0xD36A, 0x0000}, /* -12 dB */
 	{0xD25B, 0xD35B, 0x0000}, /*  -8 */
 	{0xD24C, 0xD34C, 0x0000}, /*  -6 */
@@ -563,7 +563,7 @@ static unsigned short bass_parm[12][3] = {
 	{0xC26A, 0xC36A, 0x0002}, /* +12 dB */
 };
 
-static unsigned short treble_parm[12][9] = {
+static const unsigned short treble_parm[12][9] = {
 	{0x821E, 0xC26A, 0x031E, 0xC36A, 0x021E, 0xD208, 0x831E, 0xD308, 0x0001}, /* -12 dB */
 	{0x821E, 0xC25B, 0x031E, 0xC35B, 0x021E, 0xD208, 0x831E, 0xD308, 0x0001},
 	{0x821E, 0xC24C, 0x031E, 0xC34C, 0x021E, 0xD208, 0x831E, 0xD308, 0x0001},
diff --git a/sound/isa/sb/jazz16.c b/sound/isa/sb/jazz16.c
index 7a313ff589c7..ee379bbf70a4 100644
--- a/sound/isa/sb/jazz16.c
+++ b/sound/isa/sb/jazz16.c
@@ -158,9 +158,9 @@ static int jazz16_detect_board(unsigned long port,
 
 static int jazz16_configure_board(struct snd_sb *chip, int mpu_irq)
 {
-	static unsigned char jazz_irq_bits[] = { 0, 0, 2, 3, 0, 1, 0, 4,
+	static const unsigned char jazz_irq_bits[] = { 0, 0, 2, 3, 0, 1, 0, 4,
 						 0, 2, 5, 0, 0, 0, 0, 6 };
-	static unsigned char jazz_dma_bits[] = { 0, 1, 0, 2, 0, 3, 0, 4 };
+	static const unsigned char jazz_dma_bits[] = { 0, 1, 0, 2, 0, 3, 0, 4 };
 
 	if (jazz_dma_bits[chip->dma8] == 0 ||
 	    jazz_dma_bits[chip->dma16] == 0 ||
@@ -224,9 +224,9 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 	struct snd_card_jazz16 *jazz16;
 	struct snd_sb *chip;
 	struct snd_opl3 *opl3;
-	static int possible_irqs[] = {2, 3, 5, 7, 9, 10, 15, -1};
-	static int possible_dmas8[] = {1, 3, -1};
-	static int possible_dmas16[] = {5, 7, -1};
+	static const int possible_irqs[] = {2, 3, 5, 7, 9, 10, 15, -1};
+	static const int possible_dmas8[] = {1, 3, -1};
+	static const int possible_dmas16[] = {5, 7, -1};
 	int err, xirq, xdma8, xdma16, xmpu_port, xmpu_irq;
 
 	err = snd_card_new(devptr, index[dev], id[dev], THIS_MODULE,
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index b528238675fe..479197c13803 100644
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -509,9 +509,9 @@ static int snd_sb16_isa_match(struct device *pdev, unsigned int dev)
 static int snd_sb16_isa_probe(struct device *pdev, unsigned int dev)
 {
 	int err;
-	static int possible_irqs[] = {5, 9, 10, 7, -1};
-	static int possible_dmas8[] = {1, 3, 0, -1};
-	static int possible_dmas16[] = {5, 6, 7, -1};
+	static const int possible_irqs[] = {5, 9, 10, 7, -1};
+	static const int possible_dmas8[] = {1, 3, 0, -1};
+	static const int possible_dmas16[] = {5, 6, 7, -1};
 
 	if (irq[dev] == SNDRV_AUTO_IRQ) {
 		if ((irq[dev] = snd_legacy_find_free_irq(possible_irqs)) < 0) {
@@ -535,7 +535,7 @@ static int snd_sb16_isa_probe(struct device *pdev, unsigned int dev)
 	if (port[dev] != SNDRV_AUTO_PORT)
 		return snd_sb16_isa_probe1(dev, pdev);
 	else {
-		static int possible_ports[] = {0x220, 0x240, 0x260, 0x280};
+		static const int possible_ports[] = {0x220, 0x240, 0x260, 0x280};
 		int i;
 		for (i = 0; i < ARRAY_SIZE(possible_ports); i++) {
 			port[dev] = possible_ports[i];
diff --git a/sound/isa/sb/sb8.c b/sound/isa/sb/sb8.c
index d67eae3988bd..438109f167d6 100644
--- a/sound/isa/sb/sb8.c
+++ b/sound/isa/sb/sb8.c
@@ -111,7 +111,7 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 			goto _err;
 	} else {
 		/* auto-probe legacy ports */
-		static unsigned long possible_ports[] = {
+		static const unsigned long possible_ports[] = {
 			0x220, 0x240, 0x260,
 		};
 		int i;
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index 789dcf279a26..3f703b4a304d 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -494,14 +494,14 @@ int snd_sbmixer_add_ctl(struct snd_sb *chip, const char *name, int index, int ty
  * SB 2.0 specific mixer elements
  */
 
-static struct sbmix_elem snd_sb20_controls[] = {
+static const struct sbmix_elem snd_sb20_controls[] = {
 	SB_SINGLE("Master Playback Volume", SB_DSP20_MASTER_DEV, 1, 7),
 	SB_SINGLE("PCM Playback Volume", SB_DSP20_PCM_DEV, 1, 3),
 	SB_SINGLE("Synth Playback Volume", SB_DSP20_FM_DEV, 1, 7),
 	SB_SINGLE("CD Playback Volume", SB_DSP20_CD_DEV, 1, 7)
 };
 
-static unsigned char snd_sb20_init_values[][2] = {
+static const unsigned char snd_sb20_init_values[][2] = {
 	{ SB_DSP20_MASTER_DEV, 0 },
 	{ SB_DSP20_FM_DEV, 0 },
 };
@@ -509,7 +509,7 @@ static unsigned char snd_sb20_init_values[][2] = {
 /*
  * SB Pro specific mixer elements
  */
-static struct sbmix_elem snd_sbpro_controls[] = {
+static const struct sbmix_elem snd_sbpro_controls[] = {
 	SB_DOUBLE("Master Playback Volume",
 		  SB_DSP_MASTER_DEV, SB_DSP_MASTER_DEV, 5, 1, 7),
 	SB_DOUBLE("PCM Playback Volume",
@@ -529,7 +529,7 @@ static struct sbmix_elem snd_sbpro_controls[] = {
 	SB_SINGLE("Capture Low-Pass Filter", SB_DSP_CAPTURE_FILT, 3, 1)
 };
 
-static unsigned char snd_sbpro_init_values[][2] = {
+static const unsigned char snd_sbpro_init_values[][2] = {
 	{ SB_DSP_MASTER_DEV, 0 },
 	{ SB_DSP_PCM_DEV, 0 },
 	{ SB_DSP_FM_DEV, 0 },
@@ -538,7 +538,7 @@ static unsigned char snd_sbpro_init_values[][2] = {
 /*
  * SB16 specific mixer elements
  */
-static struct sbmix_elem snd_sb16_controls[] = {
+static const struct sbmix_elem snd_sb16_controls[] = {
 	SB_DOUBLE("Master Playback Volume",
 		  SB_DSP4_MASTER_DEV, (SB_DSP4_MASTER_DEV + 1), 3, 3, 31),
 	SB_DOUBLE("PCM Playback Volume",
@@ -576,7 +576,7 @@ static struct sbmix_elem snd_sb16_controls[] = {
 		  SB_DSP4_TREBLE_DEV, (SB_DSP4_TREBLE_DEV + 1), 4, 4, 15)
 };
 
-static unsigned char snd_sb16_init_values[][2] = {
+static const unsigned char snd_sb16_init_values[][2] = {
 	{ SB_DSP4_MASTER_DEV + 0, 0 },
 	{ SB_DSP4_MASTER_DEV + 1, 0 },
 	{ SB_DSP4_PCM_DEV + 0, 0 },
@@ -592,7 +592,7 @@ static unsigned char snd_sb16_init_values[][2] = {
 /*
  * DT019x specific mixer elements
  */
-static struct sbmix_elem snd_dt019x_controls[] = {
+static const struct sbmix_elem snd_dt019x_controls[] = {
 	/* ALS4000 below has some parts which we might be lacking,
 	 * e.g. snd_als4000_ctl_mono_playback_switch - check it! */
 	SB_DOUBLE("Master Playback Volume",
@@ -622,7 +622,7 @@ static struct sbmix_elem snd_dt019x_controls[] = {
 	}
 };
 
-static unsigned char snd_dt019x_init_values[][2] = {
+static const unsigned char snd_dt019x_init_values[][2] = {
         { SB_DT019X_MASTER_DEV, 0 },
         { SB_DT019X_PCM_DEV, 0 },
         { SB_DT019X_SYNTH_DEV, 0 },
@@ -637,7 +637,7 @@ static unsigned char snd_dt019x_init_values[][2] = {
 /*
  * ALS4000 specific mixer elements
  */
-static struct sbmix_elem snd_als4000_controls[] = {
+static const struct sbmix_elem snd_als4000_controls[] = {
 	SB_DOUBLE("PCM Playback Switch",
 		  SB_DT019X_OUTPUT_SW2, SB_DT019X_OUTPUT_SW2, 2, 1, 1),
 	SB_DOUBLE("Synth Playback Switch",
@@ -671,7 +671,7 @@ static struct sbmix_elem snd_als4000_controls[] = {
 #endif
 };
 
-static unsigned char snd_als4000_init_values[][2] = {
+static const unsigned char snd_als4000_init_values[][2] = {
 	{ SB_DSP4_MASTER_DEV + 0, 0 },
 	{ SB_DSP4_MASTER_DEV + 1, 0 },
 	{ SB_DSP4_PCM_DEV + 0, 0 },
@@ -689,9 +689,9 @@ static unsigned char snd_als4000_init_values[][2] = {
 /*
  */
 static int snd_sbmixer_init(struct snd_sb *chip,
-			    struct sbmix_elem *controls,
+			    const struct sbmix_elem *controls,
 			    int controls_count,
-			    unsigned char map[][2],
+			    const unsigned char map[][2],
 			    int map_count,
 			    char *name)
 {
@@ -800,14 +800,14 @@ int snd_sbmixer_new(struct snd_sb *chip)
 }
 
 #ifdef CONFIG_PM
-static unsigned char sb20_saved_regs[] = {
+static const unsigned char sb20_saved_regs[] = {
 	SB_DSP20_MASTER_DEV,
 	SB_DSP20_PCM_DEV,
 	SB_DSP20_FM_DEV,
 	SB_DSP20_CD_DEV,
 };
 
-static unsigned char sbpro_saved_regs[] = {
+static const unsigned char sbpro_saved_regs[] = {
 	SB_DSP_MASTER_DEV,
 	SB_DSP_PCM_DEV,
 	SB_DSP_PLAYBACK_FILT,
@@ -819,7 +819,7 @@ static unsigned char sbpro_saved_regs[] = {
 	SB_DSP_CAPTURE_FILT,
 };
 
-static unsigned char sb16_saved_regs[] = {
+static const unsigned char sb16_saved_regs[] = {
 	SB_DSP4_MASTER_DEV, SB_DSP4_MASTER_DEV + 1,
 	SB_DSP4_3DSE,
 	SB_DSP4_BASS_DEV, SB_DSP4_BASS_DEV + 1,
@@ -837,7 +837,7 @@ static unsigned char sb16_saved_regs[] = {
 	SB_DSP4_MIC_AGC
 };
 
-static unsigned char dt019x_saved_regs[] = {
+static const unsigned char dt019x_saved_regs[] = {
 	SB_DT019X_MASTER_DEV,
 	SB_DT019X_PCM_DEV,
 	SB_DT019X_SYNTH_DEV,
@@ -850,7 +850,7 @@ static unsigned char dt019x_saved_regs[] = {
 	SB_DT019X_CAPTURE_SW,
 };
 
-static unsigned char als4000_saved_regs[] = {
+static const unsigned char als4000_saved_regs[] = {
 	/* please verify in dsheet whether regs to be added
 	   are actually real H/W or just dummy */
 	SB_DSP4_MASTER_DEV, SB_DSP4_MASTER_DEV + 1,
@@ -872,7 +872,7 @@ static unsigned char als4000_saved_regs[] = {
 	SB_ALS4000_CR3_CONFIGURATION,
 };
 
-static void save_mixer(struct snd_sb *chip, unsigned char *regs, int num_regs)
+static void save_mixer(struct snd_sb *chip, const unsigned char *regs, int num_regs)
 {
 	unsigned char *val = chip->saved_regs;
 	if (snd_BUG_ON(num_regs > ARRAY_SIZE(chip->saved_regs)))
@@ -881,7 +881,7 @@ static void save_mixer(struct snd_sb *chip, unsigned char *regs, int num_regs)
 		*val++ = snd_sbmixer_read(chip, *regs++);
 }
 
-static void restore_mixer(struct snd_sb *chip, unsigned char *regs, int num_regs)
+static void restore_mixer(struct snd_sb *chip, const unsigned char *regs, int num_regs)
 {
 	unsigned char *val = chip->saved_regs;
 	if (snd_BUG_ON(num_regs > ARRAY_SIZE(chip->saved_regs)))
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
