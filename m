Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD272CF34
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:17:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2832083A;
	Mon, 12 Jun 2023 21:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2832083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597429;
	bh=sJ+m7PhD9EbYzP2SLAz3V2su4BG9WntGd3m08q7H8oI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hzK7F0r6uxVGINfADfuwXj64zOkDlX8iwojR+D/XJO0XBw4z0eH4BAtpTAY85iRFq
	 VRz0/EZa34BkCeeeMi+9wlFwJUF2vQJvOydEy4ttovjptTn3GTfFWr+Kof4UUdMsoB
	 2a0wwRyLdIS1f6waCCc8WcHT/D73HGpxbsXsTHJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA551F80564; Mon, 12 Jun 2023 21:14:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EDB4F80557;
	Mon, 12 Jun 2023 21:14:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9398DF80149; Mon, 12 Jun 2023 21:14:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F996F80132
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F996F80132
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CC7C124154;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WJr-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/9] ALSA: emu10k1: split off E-MU fallback clock from clock
 source
Date: Mon, 12 Jun 2023 21:13:17 +0200
Message-Id: <20230612191325.1315854-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZIASWMFANOOMNP5ROJMCJO726P3KLLHZ
X-Message-ID-Hash: ZIASWMFANOOMNP5ROJMCJO726P3KLLHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIASWMFANOOMNP5ROJMCJO726P3KLLHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So far, we set the fallback as a side effect of setting the source. But
the fallback makes no sense at all when an internal clock is selected.
Defaulting to 48k for S/PDIF & ADAT makes sense, but as that is the
global default and we're not changing it automatically any more, it's
just fine to leave it entirely to the explicit setting.

This changes the name of the pre-existing control to something more
appropriate (regardless of the split), so users will need to adjust
their mixer settings.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  3 +-
 sound/pci/emu10k1/emu10k1_main.c |  3 +-
 sound/pci/emu10k1/emumixer.c     | 89 +++++++++++++++++++++++---------
 sound/pci/emu10k1/emupcm.c       |  4 +-
 4 files changed, 72 insertions(+), 27 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index cc0151e7c828..59e79ea1f75e 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1668,7 +1668,8 @@ struct snd_emu1010 {
 	unsigned char input_source[NUM_INPUT_DESTS];
 	unsigned int adc_pads; /* bit mask */
 	unsigned int dac_pads; /* bit mask */
-	unsigned int internal_clock; /* 44100 or 48000 */
+	unsigned int clock_source;
+	unsigned int clock_fallback;
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
 	unsigned int optical_out; /* 0:SPDIF, 1:ADAT */
 	struct delayed_work firmware_work;
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 65207ef689cb..2aa11d70e285 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -900,7 +900,8 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* IRQ Enable: All off */
 	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x00);
 
-	emu->emu1010.internal_clock = 1; /* 48000 */
+	emu->emu1010.clock_source = 1;  /* 48000 */
+	emu->emu1010.clock_fallback = 1;  /* 48000 */
 	/* Default WCLK set to 48kHz. */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K);
 	/* Word Clock source, Internal 48kHz x1 */
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 20a0b3afc8a5..5b50d9c07a60 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -888,46 +888,44 @@ static const struct snd_emu1010_pads_info emu1010_pads_info[] = {
 };
 
 
-static int snd_emu1010_internal_clock_info(struct snd_kcontrol *kcontrol,
+static int snd_emu1010_clock_source_info(struct snd_kcontrol *kcontrol,
 					  struct snd_ctl_elem_info *uinfo)
 {
 	static const char * const texts[4] = {
 		"44100", "48000", "SPDIF", "ADAT"
 	};
 		
 	return snd_ctl_enum_info(uinfo, 1, 4, texts);
 }
 
-static int snd_emu1010_internal_clock_get(struct snd_kcontrol *kcontrol,
+static int snd_emu1010_clock_source_get(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 
-	ucontrol->value.enumerated.item[0] = emu->emu1010.internal_clock;
+	ucontrol->value.enumerated.item[0] = emu->emu1010.clock_source;
 	return 0;
 }
 
-static int snd_emu1010_internal_clock_put(struct snd_kcontrol *kcontrol,
+static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int val;
 	int change = 0;
 
 	val = ucontrol->value.enumerated.item[0] ;
 	/* Limit: uinfo->value.enumerated.items = 4; */
 	if (val >= 4)
 		return -EINVAL;
-	change = (emu->emu1010.internal_clock != val);
+	change = (emu->emu1010.clock_source != val);
 	if (change) {
-		emu->emu1010.internal_clock = val;
+		emu->emu1010.clock_source = val;
 		switch (val) {
 		case 0:
 			/* 44100 */
 			/* Mute all */
 			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Default fallback clock 44.1kHz */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_44_1K );
 			/* Word Clock source, Internal 44.1kHz x1 */
 			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
 			EMU_HANA_WCLOCK_INT_44_1K | EMU_HANA_WCLOCK_1X );
@@ -943,8 +941,6 @@ static int snd_emu1010_internal_clock_put(struct snd_kcontrol *kcontrol,
 			/* 48000 */
 			/* Mute all */
 			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Default fallback clock 48kHz */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K );
 			/* Word Clock source, Internal 48kHz x1 */
 			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
 				EMU_HANA_WCLOCK_INT_48K | EMU_HANA_WCLOCK_1X );
@@ -960,8 +956,6 @@ static int snd_emu1010_internal_clock_put(struct snd_kcontrol *kcontrol,
 		case 2: /* Take clock from S/PDIF IN */
 			/* Mute all */
 			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Default fallback clock 48kHz */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K );
 			/* Word Clock source, sync to S/PDIF input */
 			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
 				EMU_HANA_WCLOCK_HANA_SPDIF_IN | EMU_HANA_WCLOCK_1X );
@@ -979,8 +973,6 @@ static int snd_emu1010_internal_clock_put(struct snd_kcontrol *kcontrol,
 			/* Take clock from ADAT IN */
 			/* Mute all */
 			snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE );
-			/* Default fallback clock 48kHz */
-			snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, EMU_HANA_DEFCLOCK_48K );
 			/* Word Clock source, sync to ADAT input */
 			snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK,
 				EMU_HANA_WCLOCK_HANA_ADAT_IN | EMU_HANA_WCLOCK_1X );
@@ -999,15 +991,62 @@ static int snd_emu1010_internal_clock_put(struct snd_kcontrol *kcontrol,
         return change;
 }
 
-static const struct snd_kcontrol_new snd_emu1010_internal_clock =
+static const struct snd_kcontrol_new snd_emu1010_clock_source =
 {
-	.access =	SNDRV_CTL_ELEM_ACCESS_READWRITE,
-	.iface =        SNDRV_CTL_ELEM_IFACE_MIXER,
-	.name =         "Clock Internal Rate",
-	.count =	1,
-	.info =         snd_emu1010_internal_clock_info,
-	.get =          snd_emu1010_internal_clock_get,
-	.put =          snd_emu1010_internal_clock_put
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Clock Source",
+	.count = 1,
+	.info = snd_emu1010_clock_source_info,
+	.get = snd_emu1010_clock_source_get,
+	.put = snd_emu1010_clock_source_put
+};
+
+static int snd_emu1010_clock_fallback_info(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	static const char * const texts[2] = {
+		"44100", "48000"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, 2, texts);
+}
+
+static int snd_emu1010_clock_fallback_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.enumerated.item[0] = emu->emu1010.clock_fallback;
+	return 0;
+}
+
+static int snd_emu1010_clock_fallback_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
+	unsigned int val = ucontrol->value.enumerated.item[0];
+	int change;
+
+	if (val >= 2)
+		return -EINVAL;
+	change = (emu->emu1010.clock_fallback != val);
+	if (change) {
+		emu->emu1010.clock_fallback = val;
+		snd_emu1010_fpga_write(emu, EMU_HANA_DEFCLOCK, 1 - val);
+	}
+	return change;
+}
+
+static const struct snd_kcontrol_new snd_emu1010_clock_fallback =
+{
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Clock Fallback",
+	.count = 1,
+	.info = snd_emu1010_clock_fallback_info,
+	.get = snd_emu1010_clock_fallback_get,
+	.put = snd_emu1010_clock_fallback_put
 };
 
 static int snd_emu1010_optical_out_info(struct snd_kcontrol *kcontrol,
@@ -2297,7 +2336,11 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		snd_emu1010_apply_sources(emu);
 
 		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_internal_clock, emu));
+			snd_ctl_new1(&snd_emu1010_clock_source, emu));
+		if (err < 0)
+			return err;
+		err = snd_ctl_add(card,
+			snd_ctl_new1(&snd_emu1010_clock_fallback, emu));
 		if (err < 0)
 			return err;
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 550caefa0ce4..fab537788587 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -1185,7 +1185,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 		kfree(epcm);
 		return err;
 	}
-	if (emu->card_capabilities->emu_model && emu->emu1010.internal_clock == 0)
+	if (emu->card_capabilities->emu_model && emu->emu1010.clock_source == 0)
 		sample_rate = 44100;
 	else
 		sample_rate = 48000;
@@ -1335,7 +1335,7 @@ static int snd_emu10k1_capture_efx_open(struct snd_pcm_substream *substream)
 		 * but we don't exceed 16 channels anyway.
 		 */
 #if 1
-		switch (emu->emu1010.internal_clock) {
+		switch (emu->emu1010.clock_source) {
 		case 0:
 			/* For 44.1kHz */
 			runtime->hw.rates = SNDRV_PCM_RATE_44100;
-- 
2.40.0.152.g15d061e6df

