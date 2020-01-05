Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C00130880
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:00:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3046E17AD;
	Sun,  5 Jan 2020 15:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3046E17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236429;
	bh=1EkZQQg+qW+aIRWS7rdxoDzj8UBPxaQIHcvB04ikw5U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tlKyxB5SFs+XBs3ZCnijpRDuL610VZKTOYChcuoDT+9d7He9Y6iXo5E3kc9cCdXIs
	 GzxlddRF8iZ1aH2/dIcXmhRiBhC9mWMT11c9nLvQ2JMJjUpmDeodDjQytalpG/eZQu
	 Rl3RpOTUOUIPN6Kbjzxkjuo8H//hc5U/Slgpr51k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E80F6F80371;
	Sun,  5 Jan 2020 15:49:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84EA0F80334; Sun,  5 Jan 2020 15:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C10C7F80274
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10C7F80274
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E029B1D3
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:29 +0100
Message-Id: <20200105144823.29547-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 14/68] ALSA: emu10k1: More constifications
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

Apply const prefix to the remaining possible places: the static tables
for init verbs and registers, the string arrays, the conversion
tables, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 12 ++++++------
 sound/pci/emu10k1/emufx.c        | 14 +++++++-------
 sound/pci/emu10k1/emumixer.c     | 28 ++++++++++++++--------------
 sound/pci/emu10k1/emuproc.c      | 16 ++++++++--------
 sound/pci/emu10k1/io.c           |  4 ++--
 5 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 51af766f57d2..a89a7e603ca8 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -100,7 +100,7 @@ void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 	}
 }
 
-static unsigned int spi_dac_init[] = {
+static const unsigned int spi_dac_init[] = {
 		0x00ff,
 		0x02ff,
 		0x0400,
@@ -124,7 +124,7 @@ static unsigned int spi_dac_init[] = {
 		0x1400,
 };
 
-static unsigned int i2c_adc_init[][2] = {
+static const unsigned int i2c_adc_init[][2] = {
 	{ 0x17, 0x00 }, /* Reset */
 	{ 0x07, 0x00 }, /* Timeout */
 	{ 0x0b, 0x22 },  /* Interface control */
@@ -2050,7 +2050,7 @@ int snd_emu10k1_create(struct snd_card *card,
 }
 
 #ifdef CONFIG_PM_SLEEP
-static unsigned char saved_regs[] = {
+static const unsigned char saved_regs[] = {
 	CPF, PTRX, CVCF, VTFT, Z1, Z2, PSST, DSL, CCCA, CCR, CLP,
 	FXRT, MAPA, MAPB, ENVVOL, ATKHLDV, DCYSUSV, LFOVAL1, ENVVAL,
 	ATKHLDM, DCYSUSM, LFOVAL2, IP, IFATN, PEFE, FMMOD, TREMFRQ, FM2FRQ2,
@@ -2059,7 +2059,7 @@ static unsigned char saved_regs[] = {
 	SPBYPASS, AC97SLOT, CDSRCS, GPSRCS, ZVSRCS, MICIDX, ADCIDX, FXIDX,
 	0xff /* end */
 };
-static unsigned char saved_regs_audigy[] = {
+static const unsigned char saved_regs_audigy[] = {
 	A_ADCIDX, A_MICIDX, A_FXWC1, A_FXWC2, A_SAMPLE_RATE,
 	A_FXRT2, A_SENDAMOUNTS, A_FXRT1,
 	0xff /* end */
@@ -2094,7 +2094,7 @@ static void free_pm_buffer(struct snd_emu10k1 *emu)
 void snd_emu10k1_suspend_regs(struct snd_emu10k1 *emu)
 {
 	int i;
-	unsigned char *reg;
+	const unsigned char *reg;
 	unsigned int *val;
 
 	val = emu->saved_ptr;
@@ -2127,7 +2127,7 @@ void snd_emu10k1_resume_init(struct snd_emu10k1 *emu)
 void snd_emu10k1_resume_regs(struct snd_emu10k1 *emu)
 {
 	int i;
-	unsigned char *reg;
+	const unsigned char *reg;
 	unsigned int *val;
 
 	snd_emu10k1_audio_enable(emu);
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index e0e076a9c321..6b7ff4a94800 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -46,7 +46,7 @@ MODULE_PARM_DESC(high_res_gpr_volume, "GPR mixer controls use 31-bit range.");
  *  Tables
  */ 
 
-static char *fxbuses[16] = {
+static const char * const fxbuses[16] = {
 	/* 0x00 */ "PCM Left",
 	/* 0x01 */ "PCM Right",
 	/* 0x02 */ "PCM Surround Left",
@@ -65,7 +65,7 @@ static char *fxbuses[16] = {
 	/* 0x0f */ NULL
 };
 
-static char *creative_ins[16] = {
+static const char * const creative_ins[16] = {
 	/* 0x00 */ "AC97 Left",
 	/* 0x01 */ "AC97 Right",
 	/* 0x02 */ "TTL IEC958 Left",
@@ -84,7 +84,7 @@ static char *creative_ins[16] = {
 	/* 0x0f */ NULL
 };
 
-static char *audigy_ins[16] = {
+static const char * const audigy_ins[16] = {
 	/* 0x00 */ "AC97 Left",
 	/* 0x01 */ "AC97 Right",
 	/* 0x02 */ "Audigy CD Left",
@@ -103,7 +103,7 @@ static char *audigy_ins[16] = {
 	/* 0x0f */ NULL
 };
 
-static char *creative_outs[32] = {
+static const char * const creative_outs[32] = {
 	/* 0x00 */ "AC97 Left",
 	/* 0x01 */ "AC97 Right",
 	/* 0x02 */ "Optical IEC958 Left",
@@ -138,7 +138,7 @@ static char *creative_outs[32] = {
 	/* 0x1f */ NULL,
 };
 
-static char *audigy_outs[32] = {
+static const char * const audigy_outs[32] = {
 	/* 0x00 */ "Digital Front Left",
 	/* 0x01 */ "Digital Front Right",
 	/* 0x02 */ "Digital Center",
@@ -2485,7 +2485,7 @@ static int snd_emu10k1_fx8010_open(struct snd_hwdep * hw, struct file *file)
 	return 0;
 }
 
-static void copy_string(char *dst, char *src, char *null, int idx)
+static void copy_string(char *dst, const char *src, const char *null, int idx)
 {
 	if (src == NULL)
 		sprintf(dst, "%s %02X", null, idx);
@@ -2496,7 +2496,7 @@ static void copy_string(char *dst, char *src, char *null, int idx)
 static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
 				   struct snd_emu10k1_fx8010_info *info)
 {
-	char **fxbus, **extin, **extout;
+	const char * const *fxbus, * const *extin, * const *extout;
 	unsigned short fxbus_mask, extin_mask, extout_mask;
 	int res;
 
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 46c79dfe9844..8a6cbe67e29d 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -183,7 +183,7 @@ static const char * const emu1616_src_texts[] = {
 /*
  * List of data sources available for each destination
  */
-static unsigned int emu1010_src_regs[] = {
+static const unsigned int emu1010_src_regs[] = {
 	EMU_SRC_SILENCE,/* 0 */
 	EMU_SRC_DOCK_MIC_A1, /* 1 */
 	EMU_SRC_DOCK_MIC_B1, /* 2 */
@@ -240,7 +240,7 @@ static unsigned int emu1010_src_regs[] = {
 };
 
 /* 1616(m) cardbus */
-static unsigned int emu1616_src_regs[] = {
+static const unsigned int emu1616_src_regs[] = {
 	EMU_SRC_SILENCE,
 	EMU_SRC_DOCK_MIC_A1,
 	EMU_SRC_DOCK_MIC_B1,
@@ -296,7 +296,7 @@ static unsigned int emu1616_src_regs[] = {
  * Data destinations - physical EMU outputs.
  * Each destination has an enum mixer control to choose a data source
  */
-static unsigned int emu1010_output_dst[] = {
+static const unsigned int emu1010_output_dst[] = {
 	EMU_DST_DOCK_DAC1_LEFT1, /* 0 */
 	EMU_DST_DOCK_DAC1_RIGHT1, /* 1 */
 	EMU_DST_DOCK_DAC2_LEFT1, /* 2 */
@@ -324,7 +324,7 @@ static unsigned int emu1010_output_dst[] = {
 };
 
 /* 1616(m) cardbus */
-static unsigned int emu1616_output_dst[] = {
+static const unsigned int emu1616_output_dst[] = {
 	EMU_DST_DOCK_DAC1_LEFT1,
 	EMU_DST_DOCK_DAC1_RIGHT1,
 	EMU_DST_DOCK_DAC2_LEFT1,
@@ -350,7 +350,7 @@ static unsigned int emu1616_output_dst[] = {
  *   capture (EMU32 + I2S links)
  * Each destination has an enum mixer control to choose a data source
  */
-static unsigned int emu1010_input_dst[] = {
+static const unsigned int emu1010_input_dst[] = {
 	EMU_DST_ALICE2_EMU32_0,
 	EMU_DST_ALICE2_EMU32_1,
 	EMU_DST_ALICE2_EMU32_2,
@@ -1778,8 +1778,8 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 	int err, pcm;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = emu->card;
-	char **c;
-	static char *emu10k1_remove_ctls[] = {
+	const char * const *c;
+	static const char * const emu10k1_remove_ctls[] = {
 		/* no AC97 mono, surround, center/lfe */
 		"Master Mono Playback Switch",
 		"Master Mono Playback Volume",
@@ -1793,13 +1793,13 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		"LFE Playback Volume",
 		NULL
 	};
-	static char *emu10k1_rename_ctls[] = {
+	static const char * const emu10k1_rename_ctls[] = {
 		"Surround Digital Playback Volume", "Surround Playback Volume",
 		"Center Digital Playback Volume", "Center Playback Volume",
 		"LFE Digital Playback Volume", "LFE Playback Volume",
 		NULL
 	};
-	static char *audigy_remove_ctls[] = {
+	static const char * const audigy_remove_ctls[] = {
 		/* Master/PCM controls on ac97 of Audigy has no effect */
 		/* On the Audigy2 the AC97 playback is piped into
 		 * the Philips ADC for 24bit capture */
@@ -1826,7 +1826,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		"External Amplifier",
 		NULL
 	};
-	static char *audigy_rename_ctls[] = {
+	static const char * const audigy_rename_ctls[] = {
 		/* use conventional names */
 		"Wave Playback Volume", "PCM Playback Volume",
 		/* "Wave Capture Volume", "PCM Capture Volume", */
@@ -1836,7 +1836,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		"Master Mono Playback Volume", "Phone Output Playback Volume",
 		NULL
 	};
-	static char *audigy_rename_ctls_i2c_adc[] = {
+	static const char * const audigy_rename_ctls_i2c_adc[] = {
 		//"Analog Mix Capture Volume","OLD Analog Mix Capture Volume",
 		"Line Capture Volume", "Analog Mix Capture Volume",
 		"Wave Playback Volume", "OLD PCM Playback Volume",
@@ -1845,7 +1845,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		"CD Capture Volume", "IEC958 Optical Capture Volume",
 		NULL
 	};
-	static char *audigy_remove_ctls_i2c_adc[] = {
+	static const char * const audigy_remove_ctls_i2c_adc[] = {
 		/* On the Audigy2 ZS Notebook
 		 * Capture via WM8775  */
 		"Mic Capture Volume",
@@ -1854,7 +1854,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		"IEC958 Optical Capture Volume",
 		NULL
 	};
-	static char *audigy_remove_ctls_1361t_adc[] = {
+	static const char * const audigy_remove_ctls_1361t_adc[] = {
 		/* On the Audigy2 the AC97 playback is piped into
 		 * the Philips ADC for 24bit capture */
 		"PCM Playback Switch",
@@ -1872,7 +1872,7 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		"Line2 Capture Volume",
 		NULL
 	};
-	static char *audigy_rename_ctls_1361t_adc[] = {
+	static const char * const audigy_rename_ctls_1361t_adc[] = {
 		"Master Playback Switch", "Master Capture Switch",
 		"Master Playback Volume", "Master Capture Volume",
 		"Wave Master Playback Volume", "Master Playback Volume",
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 637446f19598..6e20cca9c98f 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -26,10 +26,10 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 					  int status_reg,
 					  int rate_reg)
 {
-	static char *clkaccy[4] = { "1000ppm", "50ppm", "variable", "unknown" };
-	static int samplerate[16] = { 44100, 1, 48000, 32000, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
-	static char *channel[16] = { "unspec", "left", "right", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15" };
-	static char *emphasis[8] = { "none", "50/15 usec 2 channel", "2", "3", "4", "5", "6", "7" };
+	static const char * const clkaccy[4] = { "1000ppm", "50ppm", "variable", "unknown" };
+	static const int samplerate[16] = { 44100, 1, 48000, 32000, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
+	static const char * const channel[16] = { "unspec", "left", "right", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15" };
+	static const char * const emphasis[8] = { "none", "50/15 usec 2 channel", "2", "3", "4", "5", "6", "7" };
 	unsigned int status, rate = 0;
 	
 	status = snd_emu10k1_ptr_read(emu, status_reg, 0);
@@ -67,7 +67,7 @@ static void snd_emu10k1_proc_read(struct snd_info_entry *entry,
 				  struct snd_info_buffer *buffer)
 {
 	/* FIXME - output names are in emufx.c too */
-	static char *creative_outs[32] = {
+	static const char * const creative_outs[32] = {
 		/* 00 */ "AC97 Left",
 		/* 01 */ "AC97 Right",
 		/* 02 */ "Optical IEC958 Left",
@@ -102,7 +102,7 @@ static void snd_emu10k1_proc_read(struct snd_info_entry *entry,
 		/* 31 */ "???"
 	};
 
-	static char *audigy_outs[64] = {
+	static const char * const audigy_outs[64] = {
 		/* 00 */ "Digital Front Left",
 		/* 01 */ "Digital Front Right",
 		/* 02 */ "Digital Center",
@@ -172,7 +172,7 @@ static void snd_emu10k1_proc_read(struct snd_info_entry *entry,
 	struct snd_emu10k1 *emu = entry->private_data;
 	unsigned int val, val1;
 	int nefx = emu->audigy ? 64 : 32;
-	char **outputs = emu->audigy ? audigy_outs : creative_outs;
+	const char * const *outputs = emu->audigy ? audigy_outs : creative_outs;
 	int idx;
 	
 	snd_iprintf(buffer, "EMU10K1\n\n");
@@ -262,7 +262,7 @@ static void snd_emu10k1_proc_spdif_read(struct snd_info_entry *entry,
 static void snd_emu10k1_proc_rates_read(struct snd_info_entry *entry, 
 				  struct snd_info_buffer *buffer)
 {
-	static int samplerate[8] = { 44100, 48000, 96000, 192000, 4, 5, 6, 7 };
+	static const int samplerate[8] = { 44100, 48000, 96000, 192000, 4, 5, 6, 7 };
 	struct snd_emu10k1 *emu = entry->private_data;
 	unsigned int val, tmp, n;
 	val = snd_emu10k1_ptr20_read(emu, CAPTURE_RATE_STATUS, 0);
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index a3f1de7e5fee..e15092ce9848 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -510,7 +510,7 @@ void snd_emu10k1_ac97_write(struct snd_ac97 *ac97, unsigned short reg, unsigned
 
 unsigned int snd_emu10k1_rate_to_pitch(unsigned int rate)
 {
-	static u32 logMagTable[128] = {
+	static const u32 logMagTable[128] = {
 		0x00000, 0x02dfc, 0x05b9e, 0x088e6, 0x0b5d6, 0x0e26f, 0x10eb3, 0x13aa2,
 		0x1663f, 0x1918a, 0x1bc84, 0x1e72e, 0x2118b, 0x23b9a, 0x2655d, 0x28ed5,
 		0x2b803, 0x2e0e8, 0x30985, 0x331db, 0x359eb, 0x381b6, 0x3a93d, 0x3d081,
@@ -528,7 +528,7 @@ unsigned int snd_emu10k1_rate_to_pitch(unsigned int rate)
 		0xe829f, 0xe9b31, 0xeb3a9, 0xecc08, 0xee44c, 0xefc78, 0xf148a, 0xf2c83,
 		0xf4463, 0xf5c2a, 0xf73da, 0xf8b71, 0xfa2f0, 0xfba57, 0xfd1a7, 0xfe8df
 	};
-	static char logSlopeTable[128] = {
+	static const char logSlopeTable[128] = {
 		0x5c, 0x5c, 0x5b, 0x5a, 0x5a, 0x59, 0x58, 0x58,
 		0x57, 0x56, 0x56, 0x55, 0x55, 0x54, 0x53, 0x53,
 		0x52, 0x52, 0x51, 0x51, 0x50, 0x50, 0x4f, 0x4f,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
