Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA3E130891
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:10:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1209C17CF;
	Sun,  5 Jan 2020 16:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1209C17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237036;
	bh=rBJk/lVckO1jgGaq487RFVe1jFRQ62hDLm2UbaIaaPU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPPGfbx8QM8QXdZMze1p8xpQ6JlSFfKc/c8TETsLhaYhqWhjeOI03EilXC8lTpnEq
	 Y/KC8vZ7wy8xcDBdnS3Ix3ouKQWkPFA/Y1RJUukRxKHDbW/wWzaWdB1VOwV9ygzmRX
	 ojdYXwkb2GmrTNLsYFMssLjn7uln0mr+77ssvpVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A52BF80407;
	Sun,  5 Jan 2020 15:50:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33172F8028D; Sun,  5 Jan 2020 15:49:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A6F7F8027D
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6F7F8027D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7B3EFB1DC
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:32 +0100
Message-Id: <20200105144823.29547-18-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 17/68] ALSA: ppc: More constifications
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

Apply const prefix to each possible place: the static tables for rate,
volume, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ppc/beep.c           |  2 +-
 sound/ppc/pmac.c           |  8 ++++----
 sound/ppc/pmac.h           |  2 +-
 sound/ppc/tumbler.c        | 20 ++++++++++----------
 sound/ppc/tumbler_volume.h | 12 ++++++------
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/ppc/beep.c b/sound/ppc/beep.c
index e2806b8aee53..6bc586a5db0f 100644
--- a/sound/ppc/beep.c
+++ b/sound/ppc/beep.c
@@ -44,7 +44,7 @@ void snd_pmac_beep_stop(struct snd_pmac *chip)
  * so we can multiply by an amplitude in the range 0..100 to get a
  * signed short value to put in the output buffer.
  */
-static short beep_wform[256] = {
+static const short beep_wform[256] = {
 	0,	40,	79,	117,	153,	187,	218,	245,
 	269,	288,	304,	316,	323,	327,	327,	324,
 	318,	310,	299,	288,	275,	262,	249,	236,
diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 87738ddc8bfd..592532c09a82 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -24,11 +24,11 @@
 
 
 /* fixed frequency table for awacs, screamer, burgundy, DACA (44100 max) */
-static int awacs_freqs[8] = {
+static const int awacs_freqs[8] = {
 	44100, 29400, 22050, 17640, 14700, 11025, 8820, 7350
 };
 /* fixed frequency table for tumbler */
-static int tumbler_freqs[1] = {
+static const int tumbler_freqs[1] = {
 	44100
 };
 
@@ -1174,7 +1174,7 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 	np = chip->node;
 	chip->requested = 0;
 	if (chip->is_k2) {
-		static char *rnames[] = {
+		static const char * const rnames[] = {
 			"Sound Control", "Sound DMA" };
 		for (i = 0; i < 2; i ++) {
 			if (of_address_to_resource(np->parent, i,
@@ -1199,7 +1199,7 @@ int snd_pmac_new(struct snd_card *card, struct snd_pmac **chip_return)
 		txdma_addr = chip->rsrc[1].start;
 		rxdma_addr = txdma_addr + 0x100;
 	} else {
-		static char *rnames[] = {
+		static const char * const rnames[] = {
 			"Sound Control", "Sound Tx DMA", "Sound Rx DMA" };
 		for (i = 0; i < 3; i ++) {
 			if (of_address_to_resource(np, i,
diff --git a/sound/ppc/pmac.h b/sound/ppc/pmac.h
index 529f5a9f9039..a758caf689d2 100644
--- a/sound/ppc/pmac.h
+++ b/sound/ppc/pmac.h
@@ -104,7 +104,7 @@ struct snd_pmac {
 	struct resource rsrc[3];
 
 	int num_freqs;
-	int *freq_table;
+	const int *freq_table;
 	unsigned int freqs_ok;		/* bit flags */
 	unsigned int formats_ok;	/* pcm hwinfo */
 	int active;
diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index a5843035d718..6e5bdaa262b0 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -106,7 +106,7 @@ struct pmac_tumbler {
 /*
  */
 
-static int send_init_client(struct pmac_keywest *i2c, unsigned int *regs)
+static int send_init_client(struct pmac_keywest *i2c, const unsigned int *regs)
 {
 	while (*regs > 0) {
 		int err, count = 10;
@@ -128,7 +128,7 @@ static int send_init_client(struct pmac_keywest *i2c, unsigned int *regs)
 
 static int tumbler_init_client(struct pmac_keywest *i2c)
 {
-	static unsigned int regs[] = {
+	static const unsigned int regs[] = {
 		/* normal operation, SCLK=64fps, i2s output, i2s input, 16bit width */
 		TAS_REG_MCS, (1<<6)|(2<<4)|(2<<2)|0,
 		0, /* terminator */
@@ -139,7 +139,7 @@ static int tumbler_init_client(struct pmac_keywest *i2c)
 
 static int snapper_init_client(struct pmac_keywest *i2c)
 {
-	static unsigned int regs[] = {
+	static const unsigned int regs[] = {
 		/* normal operation, SCLK=64fps, i2s output, 16bit width */
 		TAS_REG_MCS, (1<<6)|(2<<4)|0,
 		/* normal operation, all-pass mode */
@@ -478,11 +478,11 @@ struct tumbler_mono_vol {
 	int reg;
 	int bytes;
 	unsigned int max;
-	unsigned int *table;
+	const unsigned int *table;
 };
 
 static int tumbler_set_mono_volume(struct pmac_tumbler *mix,
-				   struct tumbler_mono_vol *info)
+				   const struct tumbler_mono_vol *info)
 {
 	unsigned char block[4];
 	unsigned int vol;
@@ -553,7 +553,7 @@ static int tumbler_put_mono(struct snd_kcontrol *kcontrol,
 }
 
 /* TAS3001c mono volumes */
-static struct tumbler_mono_vol tumbler_pcm_vol_info = {
+static const struct tumbler_mono_vol tumbler_pcm_vol_info = {
 	.index = VOL_IDX_PCM_MONO,
 	.reg = TAS_REG_PCM,
 	.bytes = 3,
@@ -561,7 +561,7 @@ static struct tumbler_mono_vol tumbler_pcm_vol_info = {
 	.table = mixer_volume_table,
 };
 
-static struct tumbler_mono_vol tumbler_bass_vol_info = {
+static const struct tumbler_mono_vol tumbler_bass_vol_info = {
 	.index = VOL_IDX_BASS,
 	.reg = TAS_REG_BASS,
 	.bytes = 1,
@@ -569,7 +569,7 @@ static struct tumbler_mono_vol tumbler_bass_vol_info = {
 	.table = bass_volume_table,
 };
 
-static struct tumbler_mono_vol tumbler_treble_vol_info = {
+static const struct tumbler_mono_vol tumbler_treble_vol_info = {
 	.index = VOL_IDX_TREBLE,
 	.reg = TAS_REG_TREBLE,
 	.bytes = 1,
@@ -578,7 +578,7 @@ static struct tumbler_mono_vol tumbler_treble_vol_info = {
 };
 
 /* TAS3004 mono volumes */
-static struct tumbler_mono_vol snapper_bass_vol_info = {
+static const struct tumbler_mono_vol snapper_bass_vol_info = {
 	.index = VOL_IDX_BASS,
 	.reg = TAS_REG_BASS,
 	.bytes = 1,
@@ -586,7 +586,7 @@ static struct tumbler_mono_vol snapper_bass_vol_info = {
 	.table = snapper_bass_volume_table,
 };
 
-static struct tumbler_mono_vol snapper_treble_vol_info = {
+static const struct tumbler_mono_vol snapper_treble_vol_info = {
 	.index = VOL_IDX_TREBLE,
 	.reg = TAS_REG_TREBLE,
 	.bytes = 1,
diff --git a/sound/ppc/tumbler_volume.h b/sound/ppc/tumbler_volume.h
index 549ec6a31a98..16d548019ee9 100644
--- a/sound/ppc/tumbler_volume.h
+++ b/sound/ppc/tumbler_volume.h
@@ -2,7 +2,7 @@
 /* volume tables, taken from TAS3001c data manual */
 /* volume gain values */
 /* 0 = -70 dB, 175 = 18.0 dB in 0.5 dB step */
-static unsigned int master_volume_table[] = {
+static const unsigned int master_volume_table[] = {
 	0x00000015, 0x00000016,	0x00000017,
 	0x00000019, 0x0000001a,	0x0000001c,
 	0x0000001d, 0x0000001f,	0x00000021,
@@ -66,7 +66,7 @@ static unsigned int master_volume_table[] = {
 
 /* treble table for TAS3001c */
 /* 0 = -18 dB, 72 = 18 dB in 0.5 dB step */
-static unsigned int treble_volume_table[] = {
+static const unsigned int treble_volume_table[] = {
 	0x96, 0x95, 0x94,
 	0x93, 0x92, 0x91,
 	0x90, 0x8f, 0x8e,
@@ -96,7 +96,7 @@ static unsigned int treble_volume_table[] = {
 
 /* bass table for TAS3001c */
 /* 0 = -18 dB, 72 = 18 dB in 0.5 dB step */
-static unsigned int bass_volume_table[] = {
+static const unsigned int bass_volume_table[] = {
 	0x86, 0x82, 0x7f,
 	0x7d, 0x7a, 0x78,
 	0x76, 0x74, 0x72,
@@ -126,7 +126,7 @@ static unsigned int bass_volume_table[] = {
 
 /* mixer (pcm) volume table */
 /* 0 = -70 dB, 175 = 18.0 dB in 0.5 dB step */
-static unsigned int mixer_volume_table[] = {
+static const unsigned int mixer_volume_table[] = {
 	0x00014b, 0x00015f, 0x000174,
 	0x00018a, 0x0001a1, 0x0001ba,
 	0x0001d4, 0x0001f0, 0x00020d,
@@ -191,7 +191,7 @@ static unsigned int mixer_volume_table[] = {
 
 /* treble table for TAS3004 */
 /* 0 = -18 dB, 72 = 18 dB in 0.5 dB step */
-static unsigned int snapper_treble_volume_table[] = {
+static const unsigned int snapper_treble_volume_table[] = {
 	0x96, 0x95, 0x94,
 	0x93, 0x92, 0x91,
 	0x90, 0x8f, 0x8e,
@@ -221,7 +221,7 @@ static unsigned int snapper_treble_volume_table[] = {
 
 /* bass table for TAS3004 */
 /* 0 = -18 dB, 72 = 18 dB in 0.5 dB step */
-static unsigned int snapper_bass_volume_table[] = {
+static const unsigned int snapper_bass_volume_table[] = {
 	0x96, 0x95, 0x94,
 	0x93, 0x92, 0x91,
 	0x90, 0x8f, 0x8e,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
