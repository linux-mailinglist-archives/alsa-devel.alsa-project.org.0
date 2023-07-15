Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2A6754A00
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 18:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE64A4C;
	Sat, 15 Jul 2023 18:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE64A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689437329;
	bh=8oOGkGNISyNt3Hc5eyw3rD3cYxiiHT7r0QPfVVEJXzQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZmbkWa8Bx128+fY2eW9PhB4O+IX55SeMLMy4pZhy3w3wzVwUiPSMX4n1zrUj0WNiK
	 aJJpV3ZkFypx6AJTWhftCtWahhR+THojSQNxeEf0oe0GkocrLWafXf35QwH+ixygDy
	 /TFzOPyDCA/wndqQhxASPx5eHR07iSkIi7t+hi3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16637F8024E; Sat, 15 Jul 2023 18:07:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC2BF80236;
	Sat, 15 Jul 2023 18:07:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73D87F80249; Sat, 15 Jul 2023 18:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBA76F800E4
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 18:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA76F800E4
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id CFB2A23EE2;
	Sat, 15 Jul 2023 12:07:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qKho2-N1d-00; Sat, 15 Jul 2023 18:07:38 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2] ALSA: emu10k1: track loss of external clock on E-MU cards
Date: Sat, 15 Jul 2023 18:07:38 +0200
Message-Id: <20230715160738.326832-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NEKXRMY5JAHKOWPYZWG6CBZZO7MWVRW3
X-Message-ID-Hash: NEKXRMY5JAHKOWPYZWG6CBZZO7MWVRW3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEKXRMY5JAHKOWPYZWG6CBZZO7MWVRW3/>
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
v2:
- use driver-local lock instead of core's control_rwsem

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
 sound/pci/emu10k1/emu10k1_main.c | 30 +++++++++++++++++++++++++++++-
 sound/pci/emu10k1/emumixer.c     | 12 ++++++++----
 4 files changed, 43 insertions(+), 5 deletions(-)

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
index a11fcba4b9af..604645bfc908 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -789,6 +789,30 @@ static void emu1010_firmware_work(struct work_struct *work)
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
+	spin_lock_irq(&emu->reg_lock);
+	// This is the only thing that can actually happen.
+	emu->emu1010.clock_source = emu->emu1010.clock_fallback;
+	emu->emu1010.wclock = 1 - emu->emu1010.clock_source;
+	snd_emu1010_update_clock(emu);
+	spin_unlock_irq(&emu->reg_lock);
+	snd_ctl_build_ioff(&id, emu->ctl_clock_source, 0);
+	snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
+}
+
 static void emu1010_interrupt(struct snd_emu10k1 *emu)
 {
 	u32 sts;
@@ -802,6 +826,8 @@ static void emu1010_interrupt(struct snd_emu10k1 *emu)
 	} else if (sts & EMU_HANA_IRQ_DOCK) {
 		schedule_work(&emu->emu1010.firmware_work);
 	}
+	if (sts & EMU_HANA_IRQ_WCLK_CHANGED)
+		schedule_work(&emu->emu1010.clock_work);
 }
 
 /*
@@ -901,7 +927,7 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	emu->gpio_interrupt = emu1010_interrupt;
 	// Note: The Audigy INTE is set later
 	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE,
-			       EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST);
+			       EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST | EMU_HANA_IRQ_WCLK_CHANGED);
 	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &reg);  // Clear pending IRQs
 
 	emu->emu1010.clock_source = 1;  /* 48000 */
@@ -943,6 +969,7 @@ static void snd_emu10k1_free(struct snd_card *card)
 		snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
 	}
 	cancel_work_sync(&emu->emu1010.firmware_work);
+	cancel_work_sync(&emu->emu1010.clock_work);
 	release_firmware(emu->firmware);
 	release_firmware(emu->dock_fw);
 	snd_util_memhdr_free(emu->memhdr);
@@ -1522,6 +1549,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	emu->synth = NULL;
 	emu->get_synth_voice = NULL;
 	INIT_WORK(&emu->emu1010.firmware_work, emu1010_firmware_work);
+	INIT_WORK(&emu->emu1010.clock_work, emu1010_clock_work);
 	/* read revision & serial */
 	emu->revision = pci->revision;
 	pci_read_config_dword(pci, PCI_SUBSYSTEM_VENDOR_ID, &emu->serial);
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 9a94f08f2463..f39025748072 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -986,17 +986,21 @@ static int snd_emu1010_clock_source_put(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.enumerated.item[0] ;
 	if (val >= emu_ci->num)
 		return -EINVAL;
+	spin_lock_irq(&emu->reg_lock);
 	change = (emu->emu1010.clock_source != val);
 	if (change) {
 		emu->emu1010.clock_source = val;
 		emu->emu1010.wclock = emu_ci->vals[val];
+		snd_emu1010_update_clock(emu);
 
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_MUTE);
 		snd_emu1010_fpga_write(emu, EMU_HANA_WCLOCK, emu->emu1010.wclock);
+		spin_unlock_irq(&emu->reg_lock);
+
 		msleep(10);  // Allow DLL to settle
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
-
-		snd_emu1010_update_clock(emu);
+	} else {
+		spin_unlock_irq(&emu->reg_lock);
 	}
 	return change;
 }
@@ -2336,8 +2340,8 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
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

