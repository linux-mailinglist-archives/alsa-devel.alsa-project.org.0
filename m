Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84374CDD2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 09:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307093E7;
	Mon, 10 Jul 2023 09:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307093E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688972469;
	bh=E7CenpW5AmgXOnW6q70bvYVykauz82dWxeeHQmNjkwQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ozc+T6MYNe4C6mekv3vl8RuenQMYJksMVrT/hzZpZNUZg6h/AlOwDYtnYy7BV41L1
	 Jx7AXKTAvecT5rZrcwBWYVkJfPHY8xjJLJEMDWI7DbU2BIxmAxawhkYjlvrUU2bCEw
	 n8Ii2tcVRQdIvGgWDwggIUojxZmm0sZJd1LnE5Ig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2D8CF8047D; Mon, 10 Jul 2023 09:00:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC19F8024E;
	Mon, 10 Jul 2023 09:00:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 153B5F8024E; Mon, 10 Jul 2023 09:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC355F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 08:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC355F800E4
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AC67123F58;
	Mon, 10 Jul 2023 02:59:56 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qIksG-EEo-00; Mon, 10 Jul 2023 08:59:56 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: emu10k1: make E-MU dock monitoring interrupt-driven
Date: Mon, 10 Jul 2023 08:59:55 +0200
Message-Id: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MOY2P6Q6LSBTSGY6PVGREH3M2HN6UP3K
X-Message-ID-Hash: MOY2P6Q6LSBTSGY6PVGREH3M2HN6UP3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOY2P6Q6LSBTSGY6PVGREH3M2HN6UP3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

... instead of using a one-second polling timer.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  4 +--
 sound/pci/emu10k1/emu10k1.c      |  8 +----
 sound/pci/emu10k1/emu10k1_main.c | 51 ++++++++++++++++++--------------
 sound/pci/emu10k1/io.c           |  2 ++
 sound/pci/emu10k1/irq.c          |  7 +++++
 5 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 386a5f3be3e0..43c097952c3c 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1678,8 +1678,7 @@ struct snd_emu1010 {
 	unsigned int clock_fallback;
 	unsigned int optical_in; /* 0:SPDIF, 1:ADAT */
 	unsigned int optical_out; /* 0:SPDIF, 1:ADAT */
-	struct delayed_work firmware_work;
-	u32 last_reg;
+	struct work_struct firmware_work;
 };
 
 struct snd_emu10k1 {
@@ -1761,6 +1760,7 @@ struct snd_emu10k1 {
 	void (*capture_efx_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
 	void (*spdif_interrupt)(struct snd_emu10k1 *emu, unsigned int status);
 	void (*dsp_interrupt)(struct snd_emu10k1 *emu);
+	void (*gpio_interrupt)(struct snd_emu10k1 *emu);
 	void (*p16v_interrupt)(struct snd_emu10k1 *emu);
 
 	struct snd_pcm_substream *pcm_capture_substream;
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 23adace1b969..1a13c086e86c 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -176,9 +176,6 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	if (emu->card_capabilities->emu_model)
-		schedule_delayed_work(&emu->emu1010.firmware_work, 0);
-
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
@@ -194,7 +191,7 @@ static int snd_emu10k1_suspend(struct device *dev)
 
 	emu->suspend = 1;
 
-	cancel_delayed_work_sync(&emu->emu1010.firmware_work);
+	cancel_work_sync(&emu->emu1010.firmware_work);
 
 	snd_ac97_suspend(emu->ac97);
 
@@ -224,9 +221,6 @@ static int snd_emu10k1_resume(struct device *dev)
 
 	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
 
-	if (emu->card_capabilities->emu_model)
-		schedule_delayed_work(&emu->emu1010.firmware_work, 0);
-
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 58ed72de6403..661164dbf547 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -391,7 +391,10 @@ static void snd_emu10k1_audio_enable(struct snd_emu10k1 *emu)
 	}
 #endif
 
-	snd_emu10k1_intr_enable(emu, INTE_PCIERRORENABLE);
+	if (emu->card_capabilities->emu_model)
+		snd_emu10k1_intr_enable(emu, INTE_PCIERRORENABLE | INTE_A_GPIOENABLE);
+	else
+		snd_emu10k1_intr_enable(emu, INTE_PCIERRORENABLE);
 }
 
 int snd_emu10k1_done(struct snd_emu10k1 *emu)
@@ -745,63 +748,61 @@ static void emu1010_firmware_work(struct work_struct *work)
 	int err;
 
 	emu = container_of(work, struct snd_emu10k1,
-			   emu1010.firmware_work.work);
+			   emu1010.firmware_work);
 	if (emu->card->shutdown)
 		return;
 #ifdef CONFIG_PM_SLEEP
 	if (emu->suspend)
 		return;
 #endif
-	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &tmp); /* IRQ Status */
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg); /* OPTIONS: Which cards are attached to the EMU */
 	if (reg & EMU_HANA_OPTION_DOCK_OFFLINE) {
 		/* Audio Dock attached */
 		/* Return to Audio Dock programming mode */
 		dev_info(emu->card->dev,
 			 "emu1010: Loading Audio Dock Firmware\n");
 		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG,
 				       EMU_HANA_FPGA_CONFIG_AUDIODOCK);
 		err = snd_emu1010_load_firmware(emu, 1, &emu->dock_fw);
 		if (err < 0)
-			goto next;
-
+			return;
 		snd_emu1010_fpga_write(emu, EMU_HANA_FPGA_CONFIG, 0);
-		snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &tmp);
-		dev_info(emu->card->dev,
-			 "emu1010: EMU_HANA+DOCK_IRQ_STATUS = 0x%x\n", tmp);
-		/* ID, should read & 0x7f = 0x55 when FPGA programmed. */
 		snd_emu1010_fpga_read(emu, EMU_HANA_ID, &tmp);
 		dev_info(emu->card->dev,
 			 "emu1010: EMU_HANA+DOCK_ID = 0x%x\n", tmp);
 		if ((tmp & 0x1f) != 0x15) {
 			/* FPGA failed to be programmed */
 			dev_info(emu->card->dev,
 				 "emu1010: Loading Audio Dock Firmware file failed, reg = 0x%x\n",
 				 tmp);
-			goto next;
+			return;
 		}
 		dev_info(emu->card->dev,
 			 "emu1010: Audio Dock Firmware loaded\n");
 		snd_emu1010_fpga_read(emu, EMU_DOCK_MAJOR_REV, &tmp);
 		snd_emu1010_fpga_read(emu, EMU_DOCK_MINOR_REV, &tmp2);
 		dev_info(emu->card->dev, "Audio Dock ver: %u.%u\n", tmp, tmp2);
 		/* Sync clocking between 1010 and Dock */
 		/* Allow DLL to settle */
 		msleep(10);
 		/* Unmute all. Default is muted after a firmware load */
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
-	} else if (!reg && emu->emu1010.last_reg) {
+	}
+}
+
+static void emu1010_interrupt(struct snd_emu10k1 *emu)
+{
+	u32 sts;
+
+	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &sts);
+	if (sts & EMU_HANA_IRQ_DOCK_LOST) {
 		/* Audio Dock removed */
 		dev_info(emu->card->dev, "emu1010: Audio Dock detached\n");
 		/* The hardware auto-mutes all, so we unmute again */
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
+	} else if (sts & EMU_HANA_IRQ_DOCK) {
+		schedule_work(&emu->emu1010.firmware_work);
 	}
-
- next:
-	emu->emu1010.last_reg = reg;
-	if (!emu->card->shutdown)
-		schedule_delayed_work(&emu->emu1010.firmware_work,
-				      msecs_to_jiffies(1000));
 }
 
 /*
@@ -870,6 +871,8 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &reg);
 	dev_info(emu->card->dev, "emu1010: Card options = 0x%x\n", reg);
+	if (reg & EMU_HANA_OPTION_DOCK_OFFLINE)
+		schedule_work(&emu->emu1010.firmware_work);
 	if (emu->card_capabilities->no_adat) {
 		emu->emu1010.optical_in = 0; /* IN_SPDIF */
 		emu->emu1010.optical_out = 0; /* OUT_SPDIF */
@@ -895,10 +898,12 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	/* MIDI routing */
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_IN, EMU_HANA_MIDI_INA_FROM_HAMOA | EMU_HANA_MIDI_INB_FROM_DOCK2);
 	snd_emu1010_fpga_write(emu, EMU_HANA_MIDI_OUT, EMU_HANA_MIDI_OUT_DOCK2 | EMU_HANA_MIDI_OUT_SYNC2);
-	/* IRQ Enable: All on */
-	/* snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x0f); */
-	/* IRQ Enable: All off */
-	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE, 0x00);
+
+	emu->gpio_interrupt = emu1010_interrupt;
+	// Note: The Audigy INTE is set later
+	snd_emu1010_fpga_write(emu, EMU_HANA_IRQ_ENABLE,
+			       EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST);
+	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &reg);  // Clear pending IRQs
 
 	emu->emu1010.clock_source = 1;  /* 48000 */
 	emu->emu1010.clock_fallback = 1;  /* 48000 */
@@ -938,7 +943,7 @@ static void snd_emu10k1_free(struct snd_card *card)
 		/* Disable 48Volt power to Audio Dock */
 		snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
 	}
-	cancel_delayed_work_sync(&emu->emu1010.firmware_work);
+	cancel_work_sync(&emu->emu1010.firmware_work);
 	release_firmware(emu->firmware);
 	release_firmware(emu->dock_fw);
 	snd_util_memhdr_free(emu->memhdr);
@@ -1517,7 +1522,7 @@ int snd_emu10k1_create(struct snd_card *card,
 	emu->irq = -1;
 	emu->synth = NULL;
 	emu->get_synth_voice = NULL;
-	INIT_DELAYED_WORK(&emu->emu1010.firmware_work, emu1010_firmware_work);
+	INIT_WORK(&emu->emu1010.firmware_work, emu1010_firmware_work);
 	/* read revision & serial */
 	emu->revision = pci->revision;
 	pci_read_config_dword(pci, PCI_SUBSYSTEM_VENDOR_ID, &emu->serial);
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index a0d66ce3ee83..c695cb863e5e 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -302,6 +302,8 @@ static void snd_emu1010_fpga_read_locked(struct snd_emu10k1 *emu, u32 reg, u32 *
 {
 	// The higest input pin is used as the designated interrupt trigger,
 	// so it needs to be masked out.
+	// But note that any other input pin change will also cause an IRQ,
+	// so using this function often causes an IRQ as a side effect.
 	u32 mask = emu->card_capabilities->ca0108_chip ? 0x1f : 0x7f;
 	if (snd_BUG_ON(reg > 0x3f))
 		return;
diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index a813ef8c2f8d..8573248dd799 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -149,6 +149,13 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 				outl(0, emu->port + INTE2);
 			status &= ~IPR_P16V;
 		}
+		if (status & IPR_A_GPIO) {
+			if (emu->gpio_interrupt)
+				emu->gpio_interrupt(emu);
+			else
+				snd_emu10k1_intr_disable(emu, INTE_A_GPIOENABLE);
+			status &= ~IPR_A_GPIO;
+		}
 
 		if (status) {
 			dev_err(emu->card->dev,
-- 
2.40.0.152.g15d061e6df

