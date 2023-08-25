Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8EF78A065
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0821E81;
	Sun, 27 Aug 2023 19:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0821E81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693156049;
	bh=pyijv5qE5GjEr2p181ttkiTgpFZ8RQtJPjma1hUanbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XbhdXPR/IFLVggWoGLoY5MGNXjzCtz84owmoBFqIRtr2h3YJT56qtJodG8Lzoyo5X
	 QiJORiYwoTVbzPZlqJiZsVQBQgY/n6bS4W6ejp3u3NYf7Ste008/cqMeurGSK6CcQu
	 THdu3Zmjo18ue+7Dvw+ujc7EDRLh0TZ88gAzWta8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E9AF8061C; Sun, 27 Aug 2023 19:03:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11FD8F80616;
	Sun, 27 Aug 2023 19:03:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21FB5F80158; Sat, 26 Aug 2023 00:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F10CF804DA
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 00:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F10CF804DA
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AC28F242AA;
	Fri, 25 Aug 2023 18:21:58 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qZfBm-iV9-00; Sat, 26 Aug 2023 00:21:58 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v5 7/8] ALSA: emu10k1: add high-rate playback in E-MU D.A.S.
 mode
Date: Sat, 26 Aug 2023 00:21:57 +0200
Message-Id: <20230825222158.171007-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230825222158.171007-1-oswald.buddenhagen@gmx.de>
References: <20230825222158.171007-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: M2VNGHYABU37GAWCJJGTSNO6PQ72YTMY
X-Message-ID-Hash: M2VNGHYABU37GAWCJJGTSNO6PQ72YTMY
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:03:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2VNGHYABU37GAWCJJGTSNO6PQ72YTMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This mode does not offer mmapped I/O, as we need to copy the buffer
anyway to reshuffle it.

A limitation is that we'll refuse writes which aren't a multiple of 2/4
frames, but that's unlikely to be significant. But if one really wanted
to make it work, this could be done either locally, or by reviving (and
fixing) snd_pcm_sw_params.xfer_align, which was obsoleted in commit
d948035a92 ("Remove PCM xfer_align sw params").

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v3:
- rebased to new buffer copy callback.
  fwiw, unlike the emu8000 driver, this open-codes the copy operation
  rather than calling copy_from_iter() for separate samples, as the
  latter seems insanely inefficient to me (which is particularly
  problematic for the emu8000, given that ISA systems are sloooow ...
  but then, literally no-one cares anymore for exactly that reason).
v2:
- fixed `sparse` warning re missing __user annotation
---
 sound/pci/emu10k1/emufx.c    |   7 +-
 sound/pci/emu10k1/emumixer.c |  59 ++++-----
 sound/pci/emu10k1/emupcm.c   | 240 +++++++++++++++++++++++++++--------
 sound/pci/emu10k1/voice.c    |   6 +
 4 files changed, 230 insertions(+), 82 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 2f757096c2ee..bb3ae8d84102 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1316,7 +1316,7 @@ static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
 	if (emu->card_capabilities->ca0108_chip) {
 		int num_cap = emu->card_capabilities->emu_in_32 ? 32 : 16;
 
-		for (int z = 0; z < 16; z++) {
+		for (int z = 0; z < 32; z++) {
 			A_OP(icode, &ptr, iMAC0, A_GPR(tmp), A_C_00000000, A_FXBUS(z * 2), A_C_00010000); // >> 15
 			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp + 1), A_C_00000000, A_FXBUS(z * 2 + 1), A_C_00000002); // << 1
 			A_OP(icode, &ptr, iANDXOR, A3_EMU32OUT(z), A_GPR(tmp), A_GPR(lowword_mask), A_GPR(tmp + 1));
@@ -1338,6 +1338,11 @@ static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
 			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp + 1), A_C_00000000, A_FXBUS(z * 2 + 1), A_C_00000002); // << 1
 			A_OP(icode, &ptr, iANDXOR, A_EMU32OUTL(z), A_GPR(tmp), A_GPR(lowword_mask), A_GPR(tmp + 1));
 		}
+		for (int z = 0; z < 16; z++) {
+			A_OP(icode, &ptr, iMAC0, A_GPR(tmp), A_C_00000000, A_FXBUS(z * 2 + 32), A_C_00010000); // >> 15
+			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp + 1), A_C_00000000, A_FXBUS(z * 2 + 33), A_C_00000002); // << 1
+			A_OP(icode, &ptr, iANDXOR, A_EMU32OUTH(z), A_GPR(tmp), A_GPR(lowword_mask), A_GPR(tmp + 1));
+		}
 
 		/* Note that the Alice2 DSPs have 6 I2S inputs which we don't use. */
 		snd_emu10k1_audigy_dsp_convert_32_to_2x16(
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index a0e37b86f5f1..0ae7aea90bd5 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -120,14 +120,15 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	"DSP 16", "DSP 17", "DSP 18", "DSP 19", "DSP 20", "DSP 21", "DSP 22", "DSP 23", \
 	"DSP 24", "DSP 25", "DSP 26", "DSP 27", "DSP 28", "DSP 29", "DSP 30", "DSP 31"
 
-#define PB_TEXTS \
+#define PB_4x_TEXTS \
 	"PbChn 00", "PbChn 01", "PbChn 02", "PbChn 03", \
-	"PbChn 04", "PbChn 05", "PbChn 06", "PbChn 07", \
+	"PbChn 04", "PbChn 05", "PbChn 06", "PbChn 07"
+
+#define PB_TEXTS \
+	PB_4x_TEXTS, \
 	"PbChn 08", "PbChn 09", "PbChn 10", "PbChn 11", \
 	"PbChn 12", "PbChn 13", "PbChn 14", "PbChn 15"
 
-#define PB_4x_TEXTS PB_TEXTS  // Only 1x playback for now
-
 #define PAIR_TEXTS(base, one, two) PAIR_PS(base, one, two, "")
 #define LR_TEXTS(base) LR_PS(base, "")
 #define ADAT_TEXTS(pfx) ADAT_PS(pfx, "")
@@ -171,26 +172,33 @@ static int snd_emu10k1_spdif_get_mask(struct snd_kcontrol *kcontrol,
 	EMU_SRC_ALICE_EMU32B+0xe, \
 	EMU_SRC_ALICE_EMU32B+0xf
 
-// Only 1x playback for now
 #define EMU32_2x_SRC_REGS \
-	{ EMU_SRC_ALICE_EMU32A }, \
-	{ EMU_SRC_ALICE_EMU32A+1 }, \
-	{ EMU_SRC_ALICE_EMU32A+2 }, \
-	{ EMU_SRC_ALICE_EMU32A+3 }, \
-	{ EMU_SRC_ALICE_EMU32A+4 }, \
-	{ EMU_SRC_ALICE_EMU32A+5 }, \
-	{ EMU_SRC_ALICE_EMU32A+6 }, \
-	{ EMU_SRC_ALICE_EMU32A+7 }, \
-	{ EMU_SRC_ALICE_EMU32A+8 }, \
-	{ EMU_SRC_ALICE_EMU32A+9 }, \
-	{ EMU_SRC_ALICE_EMU32A+0xa }, \
-	{ EMU_SRC_ALICE_EMU32A+0xb }, \
-	{ EMU_SRC_ALICE_EMU32A+0xc }, \
-	{ EMU_SRC_ALICE_EMU32A+0xd }, \
-	{ EMU_SRC_ALICE_EMU32A+0xe }, \
-	{ EMU_SRC_ALICE_EMU32A+0xf }
+	{ EMU_SRC_ALICE_EMU32A+0x0, EMU_SRC_ALICE_EMU32A+0x1 }, \
+	{ EMU_SRC_ALICE_EMU32A+0x2, EMU_SRC_ALICE_EMU32A+0x3 }, \
+	{ EMU_SRC_ALICE_EMU32A+0x4, EMU_SRC_ALICE_EMU32A+0x5 }, \
+	{ EMU_SRC_ALICE_EMU32A+0x6, EMU_SRC_ALICE_EMU32A+0x7 }, \
+	{ EMU_SRC_ALICE_EMU32A+0x8, EMU_SRC_ALICE_EMU32A+0x9 }, \
+	{ EMU_SRC_ALICE_EMU32A+0xa, EMU_SRC_ALICE_EMU32A+0xb }, \
+	{ EMU_SRC_ALICE_EMU32A+0xc, EMU_SRC_ALICE_EMU32A+0xd }, \
+	{ EMU_SRC_ALICE_EMU32A+0xe, EMU_SRC_ALICE_EMU32A+0xf }, \
+	{ EMU_SRC_ALICE_EMU32B+0x0, EMU_SRC_ALICE_EMU32B+0x1 }, \
+	{ EMU_SRC_ALICE_EMU32B+0x2, EMU_SRC_ALICE_EMU32B+0x3 }, \
+	{ EMU_SRC_ALICE_EMU32B+0x4, EMU_SRC_ALICE_EMU32B+0x5 }, \
+	{ EMU_SRC_ALICE_EMU32B+0x6, EMU_SRC_ALICE_EMU32B+0x7 }, \
+	{ EMU_SRC_ALICE_EMU32B+0x8, EMU_SRC_ALICE_EMU32B+0x9 }, \
+	{ EMU_SRC_ALICE_EMU32B+0xa, EMU_SRC_ALICE_EMU32B+0xb }, \
+	{ EMU_SRC_ALICE_EMU32B+0xc, EMU_SRC_ALICE_EMU32B+0xd }, \
+	{ EMU_SRC_ALICE_EMU32B+0xe, EMU_SRC_ALICE_EMU32B+0xf }
 
-#define EMU32_4x_SRC_REGS EMU32_2x_SRC_REGS
+#define EMU32_4x_SRC_REGS \
+	{ EMU_SRC_ALICE_EMU32A+0x0, EMU_SRC_ALICE_EMU32A+0x1, EMU_SRC_ALICE_EMU32A+0x2, EMU_SRC_ALICE_EMU32A+0x3 }, \
+	{ EMU_SRC_ALICE_EMU32A+0x4, EMU_SRC_ALICE_EMU32A+0x5, EMU_SRC_ALICE_EMU32A+0x6, EMU_SRC_ALICE_EMU32A+0x7 }, \
+	{ EMU_SRC_ALICE_EMU32A+0x8, EMU_SRC_ALICE_EMU32A+0x9, EMU_SRC_ALICE_EMU32A+0xa, EMU_SRC_ALICE_EMU32A+0xb }, \
+	{ EMU_SRC_ALICE_EMU32A+0xc, EMU_SRC_ALICE_EMU32A+0xd, EMU_SRC_ALICE_EMU32A+0xe, EMU_SRC_ALICE_EMU32A+0xf }, \
+	{ EMU_SRC_ALICE_EMU32B+0x0, EMU_SRC_ALICE_EMU32B+0x1, EMU_SRC_ALICE_EMU32B+0x2, EMU_SRC_ALICE_EMU32B+0x3 }, \
+	{ EMU_SRC_ALICE_EMU32B+0x4, EMU_SRC_ALICE_EMU32B+0x5, EMU_SRC_ALICE_EMU32B+0x6, EMU_SRC_ALICE_EMU32B+0x7 }, \
+	{ EMU_SRC_ALICE_EMU32B+0x8, EMU_SRC_ALICE_EMU32B+0x9, EMU_SRC_ALICE_EMU32B+0xa, EMU_SRC_ALICE_EMU32B+0xb }, \
+	{ EMU_SRC_ALICE_EMU32B+0xc, EMU_SRC_ALICE_EMU32B+0xd, EMU_SRC_ALICE_EMU32B+0xe, EMU_SRC_ALICE_EMU32B+0xf }
 
 /* 1010 rev1 */
 
@@ -1080,13 +1088,6 @@ static void snd_emu1010_source_apply(struct snd_emu10k1 *emu, unsigned shift,
 				     const unsigned short *regs,
 				     const unsigned short *vals)
 {
-	unsigned short avals[4];
-
-	if ((vals[0] & 0x700) == 0x300) {  // EMU32x
-		// Only 1x playback for now
-		avals[0] = avals[1] = avals[2] = avals[3] = vals[0];
-		vals = avals;
-	}
 	switch (shift) {
 	case 2:
 		snd_emu1010_fpga_link_dst_src_write(emu, regs[3], vals[3]);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 769096e05571..c9663f432829 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -225,16 +225,6 @@ static void snd_emu1010_constrain_efx_rate(struct snd_emu10k1 *emu,
 {
 	int rate;
 
-	rate = emu->emu1010.word_clock;
-	runtime->hw.rate_min = runtime->hw.rate_max = rate;
-	runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
-}
-
-static void snd_emu1010_constrain_efx_capture_rate(struct snd_emu10k1 *emu,
-						   struct snd_pcm_runtime *runtime)
-{
-	int rate;
-
 	rate = emu->emu1010.word_clock << emu->emu1010.clock_shift;
 	runtime->hw.rate_min = runtime->hw.rate_max = rate;
 	runtime->hw.rates = snd_pcm_rate_to_rate_bit(rate);
@@ -413,7 +403,7 @@ static int snd_emu10k1_playback_hw_params(struct snd_pcm_substream *substream,
 	} else {
 		type = EMU10K1_EFX;
 		channels = params_channels(hw_params);
-		count = 1 + emu->das_mode;
+		count = (1 + emu->das_mode) << emu->emu1010.clock_shift;
 	}
 	err = snd_emu10k1_pcm_channel_alloc(epcm, type, count, channels);
 	if (err < 0)
@@ -502,28 +492,32 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	bool das_mode = emu->das_mode;
+	unsigned int shift = emu->emu1010.clock_shift;
 	unsigned int start_addr;
 	unsigned int extra_size, channel_size;
-	unsigned int i;
+	unsigned int i, j;
 
 	epcm->pitch_target = PITCH_48000;
 
 	start_addr = epcm->start_addr >> 1;  // 16-bit voices
 
-	extra_size = runtime->period_size;
-	channel_size = runtime->buffer_size;
+	extra_size = runtime->period_size >> shift;
+	channel_size = runtime->buffer_size >> shift;
 
 	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
 					 start_addr, start_addr + extra_size);
 
 	if (das_mode) {
+		unsigned count = 1 << shift;
 		start_addr >>= 1;
 		epcm->ccca_start_addr = start_addr;
 		for (i = 0; i < runtime->channels; i++) {
-			snd_emu10k1_pcm_init_das_voices(emu, epcm->voices[i],
-							start_addr, start_addr + channel_size,
-							i * 2);
-			start_addr += channel_size;
+			for (j = 0; j < count; j++) {
+				snd_emu10k1_pcm_init_das_voices(emu, epcm->voices[i] + j * 2,
+								start_addr, start_addr + channel_size,
+								(i * count + j) * 2);
+				start_addr += channel_size;
+			}
 		}
 	} else {
 		epcm->ccca_start_addr = start_addr;
@@ -663,26 +657,29 @@ static void snd_emu10k1_playback_fill_cache(struct snd_emu10k1 *emu,
 static void snd_emu10k1_playback_prepare_voices(struct snd_emu10k1 *emu,
 						struct snd_emu10k1_pcm *epcm,
 						bool w_16, bool stereo,
-						int channels)
+						int shift, int channels)
 {
 	struct snd_pcm_substream *substream = epcm->substream;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned eloop_start = epcm->start_addr >> w_16;
 	unsigned loop_start = eloop_start >> stereo;
-	unsigned eloop_size = runtime->period_size;
-	unsigned loop_size = runtime->buffer_size;
+	unsigned eloop_size = runtime->period_size >> shift;
+	unsigned loop_size = runtime->buffer_size >> shift;
 	u32 sample = w_16 ? 0 : 0x80808080;
+	int count = 1 << shift;
 
 	// To make the playback actually start at the 1st frame,
 	// we need to compensate for two circumstances:
 	// - The actual position is delayed by the cache size (64 frames)
 	// - The interpolator is centered around the 4th frame
 	loop_start += (epcm->resume_pos + 64 - 3) % loop_size;
 	for (int i = 0; i < channels; i++) {
 		unsigned voice = epcm->voices[i]->number;
-		snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, voice, loop_start);
-		loop_start += loop_size;
-		snd_emu10k1_playback_fill_cache(emu, voice, sample, stereo);
+		for (int j = 0; j < count; j++, voice += 2) {
+			snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, voice, loop_start);
+			loop_start += loop_size;
+			snd_emu10k1_playback_fill_cache(emu, voice, sample, stereo);
+		}
 	}
 
 	// The interrupt is triggered when CCCA_CURRADDR (CA) wraps around,
@@ -825,7 +822,7 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 	spin_lock(&emu->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		snd_emu10k1_playback_prepare_voices(emu, epcm, w_16, stereo, 1);
+		snd_emu10k1_playback_prepare_voices(emu, epcm, w_16, stereo, 0, 1);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -929,6 +926,7 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
+	int shift = emu->emu1010.clock_shift;
 	int ptr;
 
 	if (!epcm->running)
@@ -948,42 +946,45 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 	//
 	ptr -= 64 - 3;
 	if (ptr < 0)
-		ptr += runtime->buffer_size;
+		ptr += runtime->buffer_size >> shift;
 
 	/*
 	dev_dbg(emu->card->dev,
 	       "ptr = 0x%lx, buffer_size = 0x%lx, period_size = 0x%lx\n",
 	       (long)ptr, (long)runtime->buffer_size,
 	       (long)runtime->period_size);
 	*/
-	return ptr;
+
+	return ptr << shift;
 }
 
 static u64 snd_emu10k1_efx_playback_voice_mask(struct snd_emu10k1_pcm *epcm,
-					       bool stereo, int channels)
+					       bool stereo, int count, int channels)
 {
 	u64 mask = 0;
-	u64 mask0 = (1 << (1 << stereo)) - 1;
+	u64 mask0 = (1 << (count << stereo)) - 1;
 
 	for (int i = 0; i < channels; i++) {
 		int voice = epcm->voices[i]->number;
 		mask |= mask0 << voice;
 	}
 	return mask;
 }
 
 static void snd_emu10k1_efx_playback_freeze_voices(struct snd_emu10k1 *emu,
 						   struct snd_emu10k1_pcm *epcm,
-						   bool stereo, int channels)
+						   bool stereo, int count, int channels)
 {
 	for (int i = 0; i < channels; i++) {
 		int voice = epcm->voices[i]->number;
-		snd_emu10k1_ptr_write(emu, CPF_STOP, voice, 1);
-		if (stereo) {
-			// Weirdly enough, the stereo slave needs to be stopped separately
-			snd_emu10k1_ptr_write(emu, CPF_STOP, voice + 1, 1);
+		for (int j = 0; j < count; j++, voice += 2) {
+			snd_emu10k1_ptr_write(emu, CPF_STOP, voice, 1);
+			if (stereo) {
+				// Weirdly enough, the stereo slave needs to be stopped separately
+				snd_emu10k1_ptr_write(emu, CPF_STOP, voice + 1, 1);
+			}
+			snd_emu10k1_playback_commit_pitch(emu, voice, PITCH_48000 << 16);
 		}
-		snd_emu10k1_playback_commit_pitch(emu, voice, PITCH_48000 << 16);
 	}
 }
 
@@ -998,57 +999,63 @@ static void snd_emu10k1_efx_playback_unmute_voices(struct snd_emu10k1 *emu,
 
 static void snd_emu10k1_efx_playback_unmute_das_voices(struct snd_emu10k1 *emu,
 						       struct snd_emu10k1_pcm *epcm,
-						       int channels)
+						       int count, int channels)
 {
 	for (int i = 0; i < channels; i++)
-		snd_emu10k1_playback_unmute_das_voices(emu, epcm->voices[i]);
+		for (int j = 0; j < count; j++)
+			snd_emu10k1_playback_unmute_das_voices(emu, epcm->voices[i] + j * 2);
 }
 
 static void snd_emu10k1_efx_playback_stop_voices(struct snd_emu10k1 *emu,
 						 struct snd_emu10k1_pcm *epcm,
-						 bool stereo, int channels)
+						 bool stereo, int count, int channels)
 {
 	for (int i = 0; i < channels; i++)
-		snd_emu10k1_playback_stop_voice(emu, epcm->voices[i]);
+		for (int j = 0; j < count; j++)
+			snd_emu10k1_playback_stop_voice(emu, epcm->voices[i] + j * 2);
 	snd_emu10k1_playback_set_stopped(emu, epcm);
 
 	for (int i = 0; i < channels; i++)
-		snd_emu10k1_playback_mute_voices(emu, epcm->voices[i], stereo);
+		for (int j = 0; j < count; j++)
+			snd_emu10k1_playback_mute_voices(
+						emu, epcm->voices[i] + j * 2, stereo);
 }
 
 static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 				        int cmd)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
+	unsigned shift = emu->emu1010.clock_shift;
+	unsigned count = 1U << shift;
 	bool das_mode = emu->das_mode;
 	u64 mask;
 	int result = 0;
 
 	spin_lock(&emu->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mask = snd_emu10k1_efx_playback_voice_mask(
-				epcm, das_mode, runtime->channels);
+				epcm, das_mode, count, runtime->channels);
 		for (int i = 0; i < 10; i++) {
 			// Note that the freeze is not interruptible, so we make no
 			// effort to reset the bits outside the error handling here.
 			snd_emu10k1_voice_set_loop_stop_multiple(emu, mask);
 			snd_emu10k1_efx_playback_freeze_voices(
-					emu, epcm, das_mode, runtime->channels);
+					emu, epcm, das_mode, count, runtime->channels);
 			snd_emu10k1_playback_prepare_voices(
-					emu, epcm, true, das_mode, runtime->channels);
+					emu, epcm, true, das_mode, shift, runtime->channels);
 
 			// It might seem to make more sense to unmute the voices only after
 			// they have been started, to potentially avoid torturing the speakers
 			// if something goes wrong. However, we cannot unmute atomically,
 			// which means that we'd get some mild artifacts in the regular case.
 			if (das_mode)
 				snd_emu10k1_efx_playback_unmute_das_voices(
-						emu, epcm, runtime->channels);
+						emu, epcm, count, runtime->channels);
 			else
 				snd_emu10k1_efx_playback_unmute_voices(
 						emu, epcm, runtime->channels);
@@ -1062,7 +1069,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 			}
 
 			snd_emu10k1_efx_playback_stop_voices(
-					emu, epcm, das_mode, runtime->channels);
+					emu, epcm, das_mode, count, runtime->channels);
 
 			if (result != -EAGAIN)
 				break;
@@ -1075,7 +1082,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_efx_playback_stop_voices(
-				emu, epcm, das_mode, runtime->channels);
+				emu, epcm, das_mode, count, runtime->channels);
 
 		epcm->resume_pos = snd_emu10k1_playback_pointer(substream);
 		break;
@@ -1088,6 +1095,113 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	return result;
 }
 
+static void *get_dma_ptr(struct snd_pcm_runtime *runtime,
+			 int channel, unsigned long hwoff)
+{
+	return runtime->dma_area + hwoff +
+		channel * (runtime->dma_bytes / runtime->channels);
+}
+
+static void *get_dma_ptr_x(struct snd_pcm_runtime *runtime,
+			   int shift, int channel, int subch, unsigned long hwoff)
+{
+	return runtime->dma_area + hwoff +
+		((channel << shift) + subch) *
+			(runtime->dma_bytes / (runtime->channels << shift));
+}
+
+static int snd_emu10k1_efx_playback_silence(struct snd_pcm_substream *substream,
+					    int channel, unsigned long hwoff,
+					    unsigned long bytes)
+{
+	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned shift = emu->emu1010.clock_shift;
+	unsigned i, j, channels, subchans, voices;
+
+	if (!shift) {
+		// Non-interleaved buffer is assumed
+		memset(get_dma_ptr(runtime, channel, hwoff), 0, bytes);
+	} else {
+		// Interleaved buffer is assumed, which isn't actually the case
+		channels = runtime->channels;
+		subchans = 1 << shift;
+		voices = channels << shift;
+		hwoff /= voices;
+		if (bytes % (voices << 2))  // See *_copy_user() below.
+			return -EIO;
+		bytes /= voices;
+		for (i = 0; i < channels; i++)
+			for (j = 0; j < subchans; j++)
+				memset(get_dma_ptr_x(runtime, shift, i, j, hwoff), 0, bytes);
+	}
+	return 0;
+}
+
+static int snd_emu10k1_efx_playback_copy(struct snd_pcm_substream *substream,
+					 int channel, unsigned long hwoff,
+					 struct iov_iter *iter, unsigned long bytes)
+{
+	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned shift = emu->emu1010.clock_shift;
+	unsigned i, j, k, channels, subchans, voices, frame_size, frames;
+
+	if (!shift) {
+		// Non-interleaved source
+		if (copy_from_iter(get_dma_ptr(runtime, channel, hwoff), bytes, iter) != bytes)
+			return -EFAULT;
+	} else {
+		// Interleaved source
+		if (snd_BUG_ON(iter->nr_segs != 1))  // We don't support generalized iovec's.
+			return -EIO;
+		channels = runtime->channels;
+		subchans = 1 << shift;
+		voices = channels << shift;
+		frame_size = voices << 2;
+		// It is recommended that writes are period-sized, and it appears
+		// unlikely that someone would actually use a period size which
+		// is not divisible by four, so don't bother making it work.
+		// This check should also prevent that hwoff becomes unaligned.
+		// Ideally, snd_pcm_sw_params.xfer_align would handle this ...
+		if (snd_BUG_ON(bytes % frame_size))
+			return -EIO;
+		frames = bytes / frame_size;
+		hwoff /= voices;
+		if (iter_is_ubuf(iter)) {
+			void __user *buf = iter->ubuf;
+			if (!user_access_begin(buf, bytes))
+				return -EFAULT;
+			for (i = 0; i < channels; i++) {
+				for (j = 0; j < subchans; j++) {
+					u32 *dst = get_dma_ptr_x(runtime, shift, i, j, hwoff);
+					u32 __user *src = (u32 __user *)buf + j * channels + i;
+					for (k = 0; k < frames; k++, dst++, src += voices)
+						unsafe_get_user(*dst, src, faulted);
+				}
+			}
+			user_access_end();
+		} else if (iov_iter_is_kvec(iter)) {
+			void *buf = iter->kvec->iov_base;
+			for (i = 0; i < channels; i++) {
+				for (j = 0; j < subchans; j++) {
+					u32 *dst = get_dma_ptr_x(runtime, shift, i, j, hwoff);
+					u32 *src = (u32 *)buf + j * channels + i;
+					for (k = 0; k < frames; k++, dst++, src += voices)
+						*dst = *src;
+				}
+			}
+		} else {
+			snd_BUG();
+			return -EIO;
+		}
+	}
+	return 0;
+
+faulted:
+	user_access_end();
+	return -EFAULT;
+}
 
 static snd_pcm_uframes_t snd_emu10k1_capture_pointer(struct snd_pcm_substream *substream)
 {
@@ -1250,19 +1364,21 @@ static int snd_emu10k1_efx_playback_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_emu10k1_playback_set_constraints(struct snd_pcm_runtime *runtime)
+static int snd_emu10k1_playback_set_constraints(struct snd_emu10k1 *emu,
+						struct snd_pcm_runtime *runtime)
 {
 	int err;
 
 	// The buffer size must be a multiple of the period size, to avoid a
 	// mismatch between the extra voice and the regular voices.
 	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (err < 0)
 		return err;
 	// The hardware is typically the cache's size of 64 frames ahead.
 	// Leave enough time for actually filling up the buffer.
 	err = snd_pcm_hw_constraint_minmax(
-			runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 128, UINT_MAX);
+			runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+			128 << emu->emu1010.clock_shift, UINT_MAX);
 	return err;
 }
 
@@ -1286,10 +1402,28 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	runtime->hw = snd_emu10k1_efx_playback;
 	if (emu->card_capabilities->emu_model) {
 		snd_emu1010_constrain_efx_rate(emu, runtime);
-		if (emu->das_mode)
+		if (emu->das_mode) {
+			unsigned shift = emu->emu1010.clock_shift;
+			if (shift) {
+				runtime->hw.info =
+					// No SNDRV_PCM_INFO_MMAP; doable without SNDRV_PCM_INFO_MMAP_VALID
+					SNDRV_PCM_INFO_INTERLEAVED |  // Unlike in 1x mode
+					SNDRV_PCM_INFO_BLOCK_TRANSFER |
+					SNDRV_PCM_INFO_RESUME |
+					SNDRV_PCM_INFO_PAUSE;
+				if (shift == 2)
+					runtime->hw.channels_max = 7;  // FIXME: should be 8, but extra voice ...
+				err = snd_pcm_hw_constraint_step(
+						runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 1 << shift);
+				if (err < 0) {
+					kfree(epcm);
+					return err;
+				}
+			}
 			runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
+		}
 	}
-	err = snd_emu10k1_playback_set_constraints(runtime);
+	err = snd_emu10k1_playback_set_constraints(emu, runtime);
 	if (err < 0) {
 		kfree(epcm);
 		return err;
@@ -1330,7 +1464,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_playback;
-	err = snd_emu10k1_playback_set_constraints(runtime);
+	err = snd_emu10k1_playback_set_constraints(emu, runtime);
 	if (err < 0) {
 		kfree(epcm);
 		return err;
@@ -1464,7 +1598,7 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 	substream->runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_capture_efx;
 	if (emu->card_capabilities->emu_model) {
-		snd_emu1010_constrain_efx_capture_rate(emu, runtime);
+		snd_emu1010_constrain_efx_rate(emu, runtime);
 		/*
 		 * There are 32 mono channels of 16bits each.
 		 * 24bit Audio uses 2x channels over 16bit,
@@ -1554,6 +1688,8 @@ static const struct snd_pcm_ops snd_emu10k1_efx_playback_ops = {
 	.prepare =		snd_emu10k1_efx_playback_prepare,
 	.trigger =		snd_emu10k1_efx_playback_trigger,
 	.pointer =		snd_emu10k1_playback_pointer,
+	.copy =			snd_emu10k1_efx_playback_copy,
+	.fill_silence =		snd_emu10k1_efx_playback_silence,
 };
 
 int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device)
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index 77fb5427aaed..797784a31314 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -39,6 +39,12 @@ static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 			continue;
 		}
 
+		// The voices must be consecutive without wrap-around
+		if (i + number > NUM_G) {
+			skip = NUM_G - i;
+			continue;
+		}
+
 		for (k = 0; k < number; k++) {
 			voice = &emu->voices[i + k];
 			if (voice->use) {
-- 
2.40.0.152.g15d061e6df

