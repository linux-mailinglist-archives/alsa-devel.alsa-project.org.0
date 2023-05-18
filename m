Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE052707CBF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC121825;
	Thu, 18 May 2023 11:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC121825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684401941;
	bh=BkItPpYOg/SveYyRI2xq0H4iqzy8o8jT7k4K5G6E69c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qGZeWv4mPvcXRfTp0WH4QLTJ0ETi6IRbVLimjpnPvaOEJc0wgqM9lmaifuXX37gxo
	 zebKWQaPj6B4QYxLYfKLabedtjkrjoTeXtYNHTJ1MiH/z1W7+8zpRHzVFjiZcWIB9G
	 ZmOLaqlQd4C33srmcy9odyzY0vzXtysQyggVSTkk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B21FF805D3; Thu, 18 May 2023 11:23:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5AE4F805BB;
	Thu, 18 May 2023 11:23:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1495F80087; Thu, 18 May 2023 11:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2367F80431
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2367F80431
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 8A70A24210;
	Thu, 18 May 2023 05:22:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZq4-Vl1-00; Thu, 18 May 2023 11:22:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 5/9] ALSA: emu10k1: fix PCM playback cache and interrupt
 handling
Date: Thu, 18 May 2023 11:22:20 +0200
Message-Id: <20230518092224.3696958-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FSI7UKORAVBENZGVTWFZ7BVW3AEYUFVZ
X-Message-ID-Hash: FSI7UKORAVBENZGVTWFZ7BVW3AEYUFVZ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSI7UKORAVBENZGVTWFZ7BVW3AEYUFVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cache causes a fixed delay regardless of stream parameters.
Consequently, all that "cache invalidate size" calculation stuff was
garbage (which can be traced right back to Creative's OSS driver).

This also removes the definitions of registers CD1..CDF, because they
are accessed only relative to CD0 anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    | 38 +++++++++++----------
 sound/pci/emu10k1/emupcm.c | 67 +++++++++++++-------------------------
 2 files changed, 43 insertions(+), 62 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 2d64f07e3883..ee662a1b0dc7 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -116,6 +116,10 @@
 #define IPR_MIDITRANSBUFEMPTY	0x00000100	/* MIDI UART transmit buffer empty		*/
 #define IPR_MIDIRECVBUFEMPTY	0x00000080	/* MIDI UART receive buffer empty		*/
 #define IPR_CHANNELLOOP		0x00000040	/* Channel (half) loop interrupt(s) pending	*/
+						/* The interrupt is triggered shortly after	*/
+						/* CCR_READADDRESS has crossed the boundary;	*/
+						/* due to the cache, this runs ahead of the	*/
+						/* actual playback position.			*/
 #define IPR_CHANNELNUMBERMASK	0x0000003f	/* When IPR_CHANNELLOOP is set, indicates the	*/
 						/* highest set channel in CLIPL, CLIPH, HLIPL,  */
 						/* or HLIPH.  When IPR is written with CL set,	*/
@@ -586,24 +590,22 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 
 /* 0x1f: not used */
 
-#define CD0			0x20		/* Cache data 0 register				*/
-#define CD1			0x21		/* Cache data 1 register				*/
-#define CD2			0x22		/* Cache data 2 register				*/
-#define CD3			0x23		/* Cache data 3 register				*/
-#define CD4			0x24		/* Cache data 4 register				*/
-#define CD5			0x25		/* Cache data 5 register				*/
-#define CD6			0x26		/* Cache data 6 register				*/
-#define CD7			0x27		/* Cache data 7 register				*/
-#define CD8			0x28		/* Cache data 8 register				*/
-#define CD9			0x29		/* Cache data 9 register				*/
-#define CDA			0x2a		/* Cache data A register				*/
-#define CDB			0x2b		/* Cache data B register				*/
-#define CDC			0x2c		/* Cache data C register				*/
-#define CDD			0x2d		/* Cache data D register				*/
-#define CDE			0x2e		/* Cache data E register				*/
-#define CDF			0x2f		/* Cache data F register				*/
-
-/* 0x30-3f seem to be the same as 0x20-2f */
+// 32 cache registers (== 128 bytes) per channel follow.
+// In stereo mode, the two channels' caches are concatenated into one,
+// and hold the interleaved frames.
+// The cache holds 64 frames, so the upper half is not used in 8-bit mode.
+// All registers mentioned below count in frames.
+// The cache is a ring buffer; CCR_READADDRESS operates modulo 64.
+// The cache is filled from (CCCA_CURRADDR - CCR_CACHEINVALIDSIZE)
+// into (CCR_READADDRESS - CCR_CACHEINVALIDSIZE).
+// The engine has a fetch threshold of 32 bytes, so it tries to keep
+// CCR_CACHEINVALIDSIZE below 8 (16-bit stereo), 16 (16-bit mono,
+// 8-bit stereo), or 32 (8-bit mono). The actual transfers are pretty
+// unpredictable, especially if several voices are running.
+// Frames are consumed at CCR_READADDRESS, which is incremented afterwards,
+// along with CCCA_CURRADDR and CCR_CACHEINVALIDSIZE. This implies that the
+// actual playback position always lags CCCA_CURRADDR by exactly 64 frames.
+#define CD0			0x20		/* Cache data registers 0 .. 0x1f			*/
 
 #define PTB			0x40		/* Page table base register				*/
 #define PTB_MASK		0xfffff000	/* Physical address of the page table in host memory	*/
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index a6c4f1895a08..feb575922738 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -112,6 +112,10 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voic
 		}
 	}
 	if (epcm->extra == NULL) {
+		// The hardware supports only (half-)loop interrupts, so to support an
+		// arbitrary number of periods per buffer, we use an extra voice with a
+		// period-sized loop as the interrupt source. Additionally, the interrupt
+		// timing of the hardware is "suboptimal" and needs some compensation.
 		err = snd_emu10k1_voice_alloc(epcm->emu,
 					      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM : EMU10K1_EFX,
 					      1,
@@ -232,23 +236,6 @@ static unsigned int emu10k1_select_interprom(unsigned int pitch_target)
 		return CCCA_INTERPROM_2;
 }
 
-/*
- * calculate cache invalidate size 
- *
- * stereo: channel is stereo
- * w_16: using 16bit samples
- *
- * returns: cache invalidate size in samples
- */
-static inline int emu10k1_ccis(int stereo, int w_16)
-{
-	if (w_16) {
-		return stereo ? 24 : 26;
-	} else {
-		return stereo ? 24*2 : 26*2;
-	}
-}
-
 static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 				       int master, int extra,
 				       struct snd_emu10k1_voice *evoice,
@@ -264,7 +251,6 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	unsigned char send_routing[8];
 	unsigned long flags;
 	unsigned int pitch_target;
-	unsigned int ccis;
 
 	voice = evoice->number;
 	stereo = runtime->channels == 2;
@@ -284,10 +270,8 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		memcpy(send_amount, &mix->send_volume[tmp][0], 8);
 	}
 
-	ccis = emu10k1_ccis(stereo, w_16);
-	
 	if (master) {
-		evoice->epcm->ccca_start_addr = start_addr + ccis;
+		evoice->epcm->ccca_start_addr = start_addr + 64 - 3;
 	}
 	if (stereo && !extra) {
 		// Not really necessary for the slave, but it doesn't hurt
@@ -317,11 +301,11 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	else 
 		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
 	if (extra)
-		snd_emu10k1_ptr_write(emu, CCCA, voice, start_addr |
+		snd_emu10k1_ptr_write(emu, CCCA, voice, (end_addr - 3) |
 			      emu10k1_select_interprom(pitch_target) |
 			      (w_16 ? 0 : CCCA_8BITSELECT));
 	else
-		snd_emu10k1_ptr_write(emu, CCCA, voice, (start_addr + ccis) |
+		snd_emu10k1_ptr_write(emu, CCCA, voice, (start_addr + 64 - 3) |
 			      emu10k1_select_interprom(pitch_target) |
 			      (w_16 ? 0 : CCCA_8BITSELECT));
 	/* Clear filter delay memory */
@@ -532,35 +516,30 @@ static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu,
 						  struct snd_emu10k1_voice *evoice)
 {
 	struct snd_pcm_runtime *runtime;
-	unsigned int voice, stereo, i, ccis, cra = 64, cs, sample;
+	unsigned voice, stereo, sample;
+	u32 ccr;
 
 	runtime = evoice->epcm->substream->runtime;
 	voice = evoice->number;
 	stereo = (runtime->channels == 2);
 	sample = snd_pcm_format_width(runtime->format) == 16 ? 0 : 0x80808080;
-	ccis = emu10k1_ccis(stereo, sample == 0);
-	/* set cs to 2 * number of cache registers beside the invalidated */
-	cs = (sample == 0) ? (32-ccis) : (64-ccis+1) >> 1;
-	if (cs > 16) cs = 16;
-	for (i = 0; i < cs; i++) {
+
+	// We assume that the cache is resting at this point (i.e.,
+	// CCR_CACHEINVALIDSIZE is very small).
+
+	// Clear leading frames. For simplicitly, this does too much,
+	// except for 16-bit stereo. And the interpolator will actually
+	// access them at all only when we're pitch-shifting.
+	for (int i = 0; i < 3; i++)
 		snd_emu10k1_ptr_write(emu, CD0 + i, voice, sample);
-		if (stereo) {
-			snd_emu10k1_ptr_write(emu, CD0 + i, voice + 1, sample);
-		}
-	}
-	/* reset cache */
-	snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice, 0);
-	snd_emu10k1_ptr_write(emu, CCR_READADDRESS, voice, cra);
+
+	// Fill cache
+	ccr = (64 - 3) << REG_SHIFT(CCR_CACHEINVALIDSIZE);
 	if (stereo) {
-		snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice + 1, 0);
-		// The engine goes haywire if this one is out of sync
-		snd_emu10k1_ptr_write(emu, CCR_READADDRESS, voice + 1, cra);
-	}
-	/* fill cache */
-	snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice, ccis);
-	if (stereo) {
-		snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice+1, ccis);
+		// The engine goes haywire if CCR_READADDRESS is out of sync
+		snd_emu10k1_ptr_write(emu, CCR, voice + 1, ccr);
 	}
+	snd_emu10k1_ptr_write(emu, CCR, voice, ccr);
 }
 
 static void snd_emu10k1_playback_commit_volume(struct snd_emu10k1 *emu,
-- 
2.40.0.152.g15d061e6df

