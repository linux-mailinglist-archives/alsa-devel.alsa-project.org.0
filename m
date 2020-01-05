Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5951130877
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C471779;
	Sun,  5 Jan 2020 15:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C471779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236173;
	bh=wbbFOxmL3sqKI+JNHWovSX6mOTBbI6N+XJ+6DONy9JM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=biuTmkc3r5NqeSvONGr0sUdBxEjiLxMPTXKzSashiTMKI9F8Ol1oChADlAW0QtEMY
	 ExoI9r4sVy1EIy3K5IBlVJh7O1m8SFdpGESKWy7tMfTebIPPkRye3XfEHutlFKsF8u
	 YzU72QFFMz6x2ihJIf+kOq2cFWtsexoorq2p58Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E14B4F80342;
	Sun,  5 Jan 2020 15:49:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C591F80328; Sun,  5 Jan 2020 15:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FB37F801EB
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FB37F801EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EA342B18D
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:23 +0100
Message-Id: <20200105144823.29547-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 08/68] ALSA: intel8x0: More constifications
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

Apply const prefix to more places: the static tables for PCM
definitions, the register tables, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 28 ++++++++++++++--------------
 sound/pci/intel8x0m.c | 12 ++++++------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 5bdd25815fc7..1781a1c081c3 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -393,7 +393,7 @@ struct intel8x0 {
 	struct snd_ac97 *ac97[3];
 	unsigned int ac97_sdin[3];
 	unsigned int max_codecs, ncodecs;
-	unsigned int *codec_bit;
+	const unsigned int *codec_bit;
 	unsigned int codec_isr_bits;
 	unsigned int codec_ready_bits;
 
@@ -843,7 +843,7 @@ static int snd_intel8x0_ali_trigger(struct snd_pcm_substream *substream, int cmd
 	struct intel8x0 *chip = snd_pcm_substream_chip(substream);
 	struct ichdev *ichdev = get_ichdev(substream);
 	unsigned long port = ichdev->reg_offset;
-	static int fiforeg[] = {
+	static const int fiforeg[] = {
 		ICHREG(ALI_FIFOCR1), ICHREG(ALI_FIFOCR2), ICHREG(ALI_FIFOCR3)
 	};
 	unsigned int val, fifo;
@@ -1443,7 +1443,7 @@ struct ich_pcm_table {
 	((chip)->fix_nocache ? SNDRV_DMA_TYPE_DEV_UC : SNDRV_DMA_TYPE_DEV)
 
 static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
-			     struct ich_pcm_table *rec)
+			     const struct ich_pcm_table *rec)
 {
 	struct snd_pcm *pcm;
 	int err;
@@ -1498,7 +1498,7 @@ static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
 	return 0;
 }
 
-static struct ich_pcm_table intel_pcms[] = {
+static const struct ich_pcm_table intel_pcms[] = {
 	{
 		.playback_ops = &snd_intel8x0_playback_ops,
 		.capture_ops = &snd_intel8x0_capture_ops,
@@ -1535,7 +1535,7 @@ static struct ich_pcm_table intel_pcms[] = {
 	},
 };
 
-static struct ich_pcm_table nforce_pcms[] = {
+static const struct ich_pcm_table nforce_pcms[] = {
 	{
 		.playback_ops = &snd_intel8x0_playback_ops,
 		.capture_ops = &snd_intel8x0_capture_ops,
@@ -1558,7 +1558,7 @@ static struct ich_pcm_table nforce_pcms[] = {
 	},
 };
 
-static struct ich_pcm_table ali_pcms[] = {
+static const struct ich_pcm_table ali_pcms[] = {
 	{
 		.playback_ops = &snd_intel8x0_ali_playback_ops,
 		.capture_ops = &snd_intel8x0_ali_capture_ops,
@@ -1593,7 +1593,7 @@ static struct ich_pcm_table ali_pcms[] = {
 static int snd_intel8x0_pcm(struct intel8x0 *chip)
 {
 	int i, tblsize, device, err;
-	struct ich_pcm_table *tbl, *rec;
+	const struct ich_pcm_table *tbl, *rec;
 
 	switch (chip->device_type) {
 	case DEVICE_INTEL_ICH4:
@@ -2849,10 +2849,10 @@ struct ich_reg_info {
 	unsigned int offset;
 };
 
-static unsigned int ich_codec_bits[3] = {
+static const unsigned int ich_codec_bits[3] = {
 	ICH_PCR, ICH_SCR, ICH_TCR
 };
-static unsigned int sis_codec_bits[3] = {
+static const unsigned int sis_codec_bits[3] = {
 	ICH_PCR, ICH_SCR, ICH_SIS_TCR
 };
 
@@ -2901,14 +2901,14 @@ static int snd_intel8x0_create(struct snd_card *card,
 		.dev_free =	snd_intel8x0_dev_free,
 	};
 
-	static unsigned int bdbars[] = {
+	static const unsigned int bdbars[] = {
 		3, /* DEVICE_INTEL */
 		6, /* DEVICE_INTEL_ICH4 */
 		3, /* DEVICE_SIS */
 		6, /* DEVICE_ALI */
 		4, /* DEVICE_NFORCE */
 	};
-	static struct ich_reg_info intel_regs[6] = {
+	static const struct ich_reg_info intel_regs[6] = {
 		{ ICH_PIINT, 0 },
 		{ ICH_POINT, 0x10 },
 		{ ICH_MCINT, 0x20 },
@@ -2916,13 +2916,13 @@ static int snd_intel8x0_create(struct snd_card *card,
 		{ ICH_P2INT, 0x50 },
 		{ ICH_SPINT, 0x60 },
 	};
-	static struct ich_reg_info nforce_regs[4] = {
+	static const struct ich_reg_info nforce_regs[4] = {
 		{ ICH_PIINT, 0 },
 		{ ICH_POINT, 0x10 },
 		{ ICH_MCINT, 0x20 },
 		{ ICH_NVSPINT, 0x70 },
 	};
-	static struct ich_reg_info ali_regs[6] = {
+	static const struct ich_reg_info ali_regs[6] = {
 		{ ALI_INT_PCMIN, 0x40 },
 		{ ALI_INT_PCMOUT, 0x50 },
 		{ ALI_INT_MICIN, 0x60 },
@@ -2930,7 +2930,7 @@ static int snd_intel8x0_create(struct snd_card *card,
 		{ ALI_INT_SPDIFIN, 0xa0 },
 		{ ALI_INT_SPDIFOUT, 0xb0 },
 	};
-	struct ich_reg_info *tbl;
+	const struct ich_reg_info *tbl;
 
 	*r_intel8x0 = NULL;
 
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 74d45b9a1571..1b7df0c4e57c 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -288,7 +288,7 @@ static inline void iaputword(struct intel8x0m *chip, u32 offset, u16 val)
 /* return the GLOB_STA bit for the corresponding codec */
 static unsigned int get_ich_codec_bit(struct intel8x0m *chip, unsigned int codec)
 {
-	static unsigned int codec_bit[3] = {
+	static const unsigned int codec_bit[3] = {
 		ICH_PCR, ICH_SCR, ICH_TCR
 	};
 	if (snd_BUG_ON(codec >= 3))
@@ -686,7 +686,7 @@ struct ich_pcm_table {
 };
 
 static int snd_intel8x0m_pcm1(struct intel8x0m *chip, int device,
-			      struct ich_pcm_table *rec)
+			      const struct ich_pcm_table *rec)
 {
 	struct snd_pcm *pcm;
 	int err;
@@ -724,7 +724,7 @@ static int snd_intel8x0m_pcm1(struct intel8x0m *chip, int device,
 	return 0;
 }
 
-static struct ich_pcm_table intel_pcms[] = {
+static const struct ich_pcm_table intel_pcms[] = {
 	{
 		.suffix = "Modem",
 		.playback_ops = &snd_intel8x0m_playback_ops,
@@ -737,7 +737,7 @@ static struct ich_pcm_table intel_pcms[] = {
 static int snd_intel8x0m_pcm(struct intel8x0m *chip)
 {
 	int i, tblsize, device, err;
-	struct ich_pcm_table *tbl, *rec;
+	const struct ich_pcm_table *tbl, *rec;
 
 #if 1
 	tbl = intel_pcms;
@@ -1082,11 +1082,11 @@ static int snd_intel8x0m_create(struct snd_card *card,
 	static const struct snd_device_ops ops = {
 		.dev_free =	snd_intel8x0m_dev_free,
 	};
-	static struct ich_reg_info intel_regs[2] = {
+	static const struct ich_reg_info intel_regs[2] = {
 		{ ICH_MIINT, 0 },
 		{ ICH_MOINT, 0x10 },
 	};
-	struct ich_reg_info *tbl;
+	const struct ich_reg_info *tbl;
 
 	*r_intel8x0m = NULL;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
