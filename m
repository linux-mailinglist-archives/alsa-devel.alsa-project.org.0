Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A182574CDD6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 09:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D5884A;
	Mon, 10 Jul 2023 09:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D5884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688972520;
	bh=WBZWK/TOLdbPTBYeRsOJnGBOitmGVcY25JphNDq5O5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pcwVHdpsHt8FbOxvg4svI0FR/vvZk6zTzSFYpD20ArYpmJ2nR+DS8rZ6MWSD3ssY+
	 Z4fKqlANl3jsGo0EWOysNswrlsGEGSQhA46CL3sN9YHD5WQVKanVuZCNHpU4ons2fg
	 JbpPYnfZZVHaSmBpoK2grRgPTLO+aafKwUPVGUPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C49BF80549; Mon, 10 Jul 2023 09:00:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB40F800E4;
	Mon, 10 Jul 2023 09:00:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC5F1F80551; Mon, 10 Jul 2023 09:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44F2FF80153
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 08:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F2FF80153
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id ACCBE2422E;
	Mon, 10 Jul 2023 02:59:56 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qIksG-EEu-00; Mon, 10 Jul 2023 08:59:56 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: emu10k1: track loss of external clock on E-MU cards
Date: Mon, 10 Jul 2023 08:59:56 +0200
Message-Id: <20230710065956.1246364-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
References: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OEFEEYLK4WAEGCYDAHO655C72UGIALJT
X-Message-ID-Hash: OEFEEYLK4WAEGCYDAHO655C72UGIALJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OEFEEYLK4WAEGCYDAHO655C72UGIALJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This uses IRQs to track spontaneous changes to the word clock source
register.

FWIW, that this can happen in the first place is the reason why it is
futile to lock the clock source mixer setting while the device is open -
we can't consistently control the rate anyway. Though arguably, we
should reset any open streams when that happens, as they become
corrupted anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

FIXME? while i'm not sure, i think this won't notice seamless switches
between 44.1 and 48 kHz. assuming that's the case, this seems like a
minor issue: firstly, just about nothing actually produces such a
seamless switch - my only device that can even do that is the e-mu card
itself, but the driver disrupts that by temporarily muting the output.
secondly, the user is unlikely to select an external source before
setting it up properly. and the easy workaround is actually never doing
that.
regardless, to actually test that i'd need a second e-mu card.
---
 include/sound/emu10k1.h          |  5 +++++
 sound/pci/emu10k1/emu10k1.c      |  1 +
 sound/pci/emu10k1/emu10k1_main.c | 32 +++++++++++++++++++++++++++++++-
 sound/pci/emu10k1/emumixer.c     |  4 ++--
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 43c097952c3c..7c55a8244747 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -992,6 +992,9 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 #define EMU_HANA_WCLOCK_4X		0x10
 #define EMU_HANA_WCLOCK_MULT_RESERVED	0x18
 
+// If the selected external clock source is/becomes invalid or incompatible
+// with the clock multiplier, the clock source is reset to this value, and
+// a WCLK_CHANGED interrupt is raised.
 #define EMU_HANA_DEFCLOCK	0x06	/* 000000x  1 bits Default Word Clock  */
 #define EMU_HANA_DEFCLOCK_48K		0x00
 #define EMU_HANA_DEFCLOCK_44_1K		0x01
@@ -1679,6 +1682,7 @@ struct snd_emu1010 {
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
 	unsigned int optical_out; /* 0:SPDIF, 1:ADAT */
 	struct work_struct firmware_work;
+	struct work_struct clock_work;
 };
 
 struct snd_emu10k1 {
@@ -1753,6 +1757,7 @@ struct snd_emu10k1 {
 	struct snd_kcontrol *ctl_efx_send_routing;
 	struct snd_kcontrol *ctl_efx_send_volume;
 	struct snd_kcontrol *ctl_efx_attn;
+	struct snd_kcontrol *ctl_clock_source;
 
 	void (*hwvol_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
 	void (*capture_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 1a13c086e86c..421053569aa0 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -192,6 +192,7 @@ static int snd_emu10k1_suspend(struct device *dev)
 	emu->suspend = 1;
 
 	cancel_work_sync(&emu->emu1010.firmware_work);
+	cancel_work_sync(&emu->emu1010.clock_work);
 
 	snd_ac97_suspend(emu->ac97);
 
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 661164dbf547..7c114fe31831 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -790,6 +790,32 @@ static void emu1010_firmware_work(struct work_struct *work)
 	}
 }
 
+static void emu1010_clock_work(struct work_struct *work)
+{
+	struct snd_emu10k1 *emu;
+	struct snd_ctl_elem_id id;
+
+	emu = container_of(work, struct snd_emu10k1,
+			   emu1010.clock_work);
+	if (emu->card->shutdown)
+		return;
+#ifdef CONFIG_PM_SLEEP
+	if (emu->suspend)
+		return;
+#endif
+
+	// We consider this a mixer setting, so use the mixer's lock
+	down_write(&emu->card->controls_rwsem);
+	// This is the only thing that can actually happen.
+	emu->emu1010.clock_source = emu->emu1010.clock_fallback;
+	emu->emu1010.wclock = 1 - emu->emu1010.clock_source;
+	snd_emu1010_update_clock(emu);
+	downgrade_write(&emu->card->controls_rwsem);
+	snd_ctl_build_ioff(&id, emu->ctl_clock_source, 0);
+	snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
+	up_read(&emu->card->controls_rwsem);
+}
+
 static void emu1010_interrupt(struct snd_emu10k1 *emu)
 {
 	u32 sts;
@@ -803,6 +829,8 @@ static void emu1010_interrupt(struct snd_emu10k1 *emu)
 	} else if (sts & EMU_HANA_IRQ_DOCK) {
 		schedule_work(&emu->emu1010.firmware_work);
 	}
+	if (sts & EMU_HANA_IRQ_WCLK_CHANGED)
+		schedule_work(&emu->emu1010.clock_work);
 }
 
 /*
@@ -902,7 +930,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	emu->gpio_interrupt = emu1010_interrupt;
 	// Note: The Audigy INTE is set later
 	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE,
-			       EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST);
+			       EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST | EMU_HANA_IRQ_WCLK_CHANGED);
 	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &reg);  // Clear pending IRQs
 
 	emu->emu1010.clock_source = 1;  /* 48000 */
@@ -944,6 +972,7 @@ static void snd_emu10k1_free(struct snd_card *card)
 		snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
 	}
 	cancel_work_sync(&emu->emu1010.firmware_work);
+	cancel_work_sync(&emu->emu1010.clock_work);
 	release_firmware(emu->firmware);
 	release_firmware(emu->dock_fw);
 	snd_util_memhdr_free(emu->memhdr);
@@ -1523,6 +1552,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	emu->synth = NULL;
 	emu->get_synth_voice = NULL;
 	INIT_WORK(&emu->emu1010.firmware_work, emu1010_firmware_work);
+	INIT_WORK(&emu->emu1010.clock_work, emu1010_clock_work);
 	/* read revision & serial */
 	emu->revision = pci->revision;
 	pci_read_config_dword(pci, PCI_SUBSYSTEM_VENDOR_ID, &emu->serial);
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index f9500cd50a4b..a9302db535d9 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -2342,8 +2342,8 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 				emu1010_map_source(emu_ri, emu_ri->out_dflts[i]);
 		snd_emu1010_apply_sources(emu);
 
-		err = snd_ctl_add(card,
-			snd_ctl_new1(&snd_emu1010_clock_source, emu));
+		kctl = emu->ctl_clock_source = snd_ctl_new1(&snd_emu1010_clock_source, emu);
+		err = snd_ctl_add(card, kctl);
 		if (err < 0)
 			return err;
 		err = snd_ctl_add(card,
-- 
2.40.0.152.g15d061e6df

