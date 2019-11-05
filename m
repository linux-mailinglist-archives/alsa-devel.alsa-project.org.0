Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02636F017C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CC116F8;
	Tue,  5 Nov 2019 16:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CC116F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967906;
	bh=7O7HMwKnDvPg1nyF4jLjs5vj1Hr2zvKTC4pbYukHhb0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzBrk6sCYJePWNAOH9SpN6Bg9/d0G8RDODS99ATD8qKVksiBDrAd6Oz9KjqTEtAWv
	 j1ysT33Eh4OJCDqsv1esmVJANzFnImA615U3AdMf5PUAiJwubKL5nYD1siEd9h2EtY
	 PpX53uTccm1V3BPXZlDfMbg5FIyGUHm0UV+gz580=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9720F80764;
	Tue,  5 Nov 2019 16:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 702E1F80639; Tue,  5 Nov 2019 16:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70A95F8060F
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70A95F8060F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 809F5B39D
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:50 +0100
Message-Id: <20191105151856.10785-19-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 18/24] ALSA: pci: Drop superfluous
	snd_pcm_sgbuf_ops_page
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

snd_pcm_sgbuf_ops_page is no longer needed to be set explicitly to PCM
page ops since the recent change in the PCM core (*).  Leaving it NULL
should work as long as the preallocation has been done properly.

This patch drops the redundant lines.

(*) 6ef6be988f98: ALSA: pcm: Handle special page mapping in the
                  default mmap handler

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/au88x0/au88x0_pcm.c    | 1 -
 sound/pci/bt87x.c                | 1 -
 sound/pci/ctxfi/ctpcm.c          | 2 --
 sound/pci/echoaudio/echoaudio.c  | 4 ----
 sound/pci/emu10k1/emupcm.c       | 2 --
 sound/pci/hda/hda_controller.c   | 1 -
 sound/pci/lola/lola_pcm.c        | 1 -
 sound/pci/riptide/riptide.c      | 2 --
 sound/pci/rme9652/hdspm.c        | 1 -
 sound/pci/trident/trident_main.c | 2 --
 sound/pci/via82xx.c              | 5 -----
 sound/pci/via82xx_modem.c        | 2 --
 12 files changed, 24 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index 39ea9ef00f47..b835042893d9 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -436,7 +436,6 @@ static const struct snd_pcm_ops snd_vortex_playback_ops = {
 	.prepare = snd_vortex_pcm_prepare,
 	.trigger = snd_vortex_pcm_trigger,
 	.pointer = snd_vortex_pcm_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 
 /*
diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 66a5a24e7558..d4b6da79ef49 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -545,7 +545,6 @@ static const struct snd_pcm_ops snd_bt87x_pcm_ops = {
 	.prepare = snd_bt87x_prepare,
 	.trigger = snd_bt87x_trigger,
 	.pointer = snd_bt87x_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 
 static int snd_bt87x_capture_volume_info(struct snd_kcontrol *kcontrol,
diff --git a/sound/pci/ctxfi/ctpcm.c b/sound/pci/ctxfi/ctpcm.c
index 89923399e646..c341f509e4fc 100644
--- a/sound/pci/ctxfi/ctpcm.c
+++ b/sound/pci/ctxfi/ctpcm.c
@@ -379,7 +379,6 @@ static const struct snd_pcm_ops ct_pcm_playback_ops = {
 	.prepare	= ct_pcm_playback_prepare,
 	.trigger	= ct_pcm_playback_trigger,
 	.pointer	= ct_pcm_playback_pointer,
-	.page		= snd_pcm_sgbuf_ops_page,
 };
 
 /* PCM operators for capture */
@@ -392,7 +391,6 @@ static const struct snd_pcm_ops ct_pcm_capture_ops = {
 	.prepare	= ct_pcm_capture_prepare,
 	.trigger	= ct_pcm_capture_trigger,
 	.pointer	= ct_pcm_capture_pointer,
-	.page		= snd_pcm_sgbuf_ops_page,
 };
 
 static const struct snd_pcm_chmap_elem surround_map[] = {
diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index ca9125726be2..40877e478bb6 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -824,7 +824,6 @@ static const struct snd_pcm_ops analog_playback_ops = {
 	.prepare = pcm_prepare,
 	.trigger = pcm_trigger,
 	.pointer = pcm_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 static const struct snd_pcm_ops analog_capture_ops = {
 	.open = pcm_analog_in_open,
@@ -835,7 +834,6 @@ static const struct snd_pcm_ops analog_capture_ops = {
 	.prepare = pcm_prepare,
 	.trigger = pcm_trigger,
 	.pointer = pcm_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 #ifdef ECHOCARD_HAS_DIGITAL_IO
 #ifndef ECHOCARD_HAS_VMIXER
@@ -848,7 +846,6 @@ static const struct snd_pcm_ops digital_playback_ops = {
 	.prepare = pcm_prepare,
 	.trigger = pcm_trigger,
 	.pointer = pcm_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 #endif /* !ECHOCARD_HAS_VMIXER */
 static const struct snd_pcm_ops digital_capture_ops = {
@@ -860,7 +857,6 @@ static const struct snd_pcm_ops digital_capture_ops = {
 	.prepare = pcm_prepare,
 	.trigger = pcm_trigger,
 	.pointer = pcm_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 #endif /* ECHOCARD_HAS_DIGITAL_IO */
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 6530a55fb878..46d8768adc01 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1366,7 +1366,6 @@ static const struct snd_pcm_ops snd_emu10k1_playback_ops = {
 	.prepare =		snd_emu10k1_playback_prepare,
 	.trigger =		snd_emu10k1_playback_trigger,
 	.pointer =		snd_emu10k1_playback_pointer,
-	.page =			snd_pcm_sgbuf_ops_page,
 };
 
 static const struct snd_pcm_ops snd_emu10k1_capture_ops = {
@@ -1390,7 +1389,6 @@ static const struct snd_pcm_ops snd_emu10k1_efx_playback_ops = {
 	.prepare =		snd_emu10k1_efx_playback_prepare,
 	.trigger =		snd_emu10k1_efx_playback_trigger,
 	.pointer =		snd_emu10k1_efx_playback_pointer,
-	.page =			snd_pcm_sgbuf_ops_page,
 };
 
 int snd_emu10k1_pcm(struct snd_emu10k1 *emu, int device)
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 6387c7e90918..2f3b7a35f2d9 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -701,7 +701,6 @@ static const struct snd_pcm_ops azx_pcm_ops = {
 	.pointer = azx_pcm_pointer,
 	.get_time_info =  azx_get_time_info,
 	.mmap = azx_pcm_mmap,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 
 static void azx_pcm_free(struct snd_pcm *pcm)
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index 151f7cf5ce0e..f032d7ceb6e5 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -582,7 +582,6 @@ static const struct snd_pcm_ops lola_pcm_ops = {
 	.prepare = lola_pcm_prepare,
 	.trigger = lola_pcm_trigger,
 	.pointer = lola_pcm_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 
 int lola_create_pcm(struct lola *chip)
diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 58771ae0ed63..ac10d6f229d8 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1661,7 +1661,6 @@ static const struct snd_pcm_ops snd_riptide_playback_ops = {
 	.hw_params = snd_riptide_hw_params,
 	.hw_free = snd_riptide_hw_free,
 	.prepare = snd_riptide_prepare,
-	.page = snd_pcm_sgbuf_ops_page,
 	.trigger = snd_riptide_trigger,
 	.pointer = snd_riptide_pointer,
 };
@@ -1672,7 +1671,6 @@ static const struct snd_pcm_ops snd_riptide_capture_ops = {
 	.hw_params = snd_riptide_hw_params,
 	.hw_free = snd_riptide_hw_free,
 	.prepare = snd_riptide_prepare,
-	.page = snd_pcm_sgbuf_ops_page,
 	.trigger = snd_riptide_trigger,
 	.pointer = snd_riptide_pointer,
 };
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 81a6f4b2bd3c..b571d9d017bb 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6368,7 +6368,6 @@ static const struct snd_pcm_ops snd_hdspm_ops = {
 	.prepare = snd_hdspm_prepare,
 	.trigger = snd_hdspm_trigger,
 	.pointer = snd_hdspm_hw_pointer,
-	.page = snd_pcm_sgbuf_ops_page,
 };
 
 static int snd_hdspm_create_hwdep(struct snd_card *card,
diff --git a/sound/pci/trident/trident_main.c b/sound/pci/trident/trident_main.c
index 1a6f6202fd16..8ac6f541b008 100644
--- a/sound/pci/trident/trident_main.c
+++ b/sound/pci/trident/trident_main.c
@@ -2076,7 +2076,6 @@ static const struct snd_pcm_ops snd_trident_nx_playback_ops = {
 	.prepare =	snd_trident_playback_prepare,
 	.trigger =	snd_trident_trigger,
 	.pointer =	snd_trident_playback_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 static const struct snd_pcm_ops snd_trident_capture_ops = {
@@ -2121,7 +2120,6 @@ static const struct snd_pcm_ops snd_trident_nx_foldback_ops = {
 	.prepare =	snd_trident_foldback_prepare,
 	.trigger =	snd_trident_trigger,
 	.pointer =	snd_trident_playback_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 static const struct snd_pcm_ops snd_trident_spdif_ops = {
diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 38601d0dfb73..902409dbc4c8 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -1363,7 +1363,6 @@ static const struct snd_pcm_ops snd_via686_playback_ops = {
 	.prepare =	snd_via686_playback_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via686_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 /* via686 capture callbacks */
@@ -1376,7 +1375,6 @@ static const struct snd_pcm_ops snd_via686_capture_ops = {
 	.prepare =	snd_via686_capture_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via686_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 /* via823x DSX playback callbacks */
@@ -1389,7 +1387,6 @@ static const struct snd_pcm_ops snd_via8233_playback_ops = {
 	.prepare =	snd_via8233_playback_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via8233_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 /* via823x multi-channel playback callbacks */
@@ -1402,7 +1399,6 @@ static const struct snd_pcm_ops snd_via8233_multi_ops = {
 	.prepare =	snd_via8233_multi_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via8233_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 /* via823x capture callbacks */
@@ -1415,7 +1411,6 @@ static const struct snd_pcm_ops snd_via8233_capture_ops = {
 	.prepare =	snd_via8233_capture_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via8233_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 
diff --git a/sound/pci/via82xx_modem.c b/sound/pci/via82xx_modem.c
index bfb5e1b89d5f..2c8370cf03b3 100644
--- a/sound/pci/via82xx_modem.c
+++ b/sound/pci/via82xx_modem.c
@@ -801,7 +801,6 @@ static const struct snd_pcm_ops snd_via686_playback_ops = {
 	.prepare =	snd_via82xx_pcm_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via686_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 /* via686 capture callbacks */
@@ -814,7 +813,6 @@ static const struct snd_pcm_ops snd_via686_capture_ops = {
 	.prepare =	snd_via82xx_pcm_prepare,
 	.trigger =	snd_via82xx_pcm_trigger,
 	.pointer =	snd_via686_pcm_pointer,
-	.page =		snd_pcm_sgbuf_ops_page,
 };
 
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
