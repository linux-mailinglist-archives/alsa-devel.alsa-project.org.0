Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B015B6EBA36
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA5CEE8;
	Sat, 22 Apr 2023 18:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA5CEE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682179933;
	bh=YNo+HMkZosj6z0qqno8BJHCNmPn3fs1jqph5FgdqwjI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iTHlYgUqeim3zh0fPcw5s+yM5L04IAfhSVSeY/G0l5RJFM6jZBsw5M2GWKQ+8T5QG
	 us2r8fsy8J1+UdHpHeoYmuViBzm6zZlP53sDgvmHYUHrSwbTeQuvgUtejg5LXfeSxX
	 oozLkZ6m+C7c+Kfl8SFQVATGWUn8OpLBcodsd138=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B787F80548;
	Sat, 22 Apr 2023 18:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 981B2F80542; Sat, 22 Apr 2023 18:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87053F80149
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87053F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 8197724187;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-naV-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ALSA: emu10k1: fix lineup of EMU_HANA_* defines
Date: Sat, 22 Apr 2023 18:10:16 +0200
Message-Id: <20230422161021.1143903-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
References: <20230422161021.1143903-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2WTCH754D24EXJTXMYR6R567CEEFHVOH
X-Message-ID-Hash: 2WTCH754D24EXJTXMYR6R567CEEFHVOH
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WTCH754D24EXJTXMYR6R567CEEFHVOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The bit values are supposed to be internally indented by one step
relative to the register addresses.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 7786d5807679..35a60bdcf641 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1072,44 +1072,44 @@
 #define EMU_HANA_DOCK_LEDS_3_MANUAL_SIGNAL	0x20	/* Manual Signal detection */
 
 #define EMU_HANA_ADC_PADS	0x10	/* 0000xxx  3 bit  Audio Dock ADC 14dB pads */
-#define EMU_HANA_DOCK_ADC_PAD1	0x01	/* 14dB Attenuation on Audio Dock ADC 1 */
-#define EMU_HANA_DOCK_ADC_PAD2	0x02	/* 14dB Attenuation on Audio Dock ADC 2 */
-#define EMU_HANA_DOCK_ADC_PAD3	0x04	/* 14dB Attenuation on Audio Dock ADC 3 */
-#define EMU_HANA_0202_ADC_PAD1	0x08	/* 14dB Attenuation on 0202 ADC 1 */
+#define EMU_HANA_DOCK_ADC_PAD1		0x01	/* 14dB Attenuation on Audio Dock ADC 1 */
+#define EMU_HANA_DOCK_ADC_PAD2		0x02	/* 14dB Attenuation on Audio Dock ADC 2 */
+#define EMU_HANA_DOCK_ADC_PAD3		0x04	/* 14dB Attenuation on Audio Dock ADC 3 */
+#define EMU_HANA_0202_ADC_PAD1		0x08	/* 14dB Attenuation on 0202 ADC 1 */
 
 #define EMU_HANA_DOCK_MISC	0x11	/* 0xxxxxx  6 bit  Audio Dock misc bits */
-#define EMU_HANA_DOCK_DAC1_MUTE	0x01	/* DAC 1 Mute */
-#define EMU_HANA_DOCK_DAC2_MUTE	0x02	/* DAC 2 Mute */
-#define EMU_HANA_DOCK_DAC3_MUTE	0x04	/* DAC 3 Mute */
-#define EMU_HANA_DOCK_DAC4_MUTE	0x08	/* DAC 4 Mute */
+#define EMU_HANA_DOCK_DAC1_MUTE		0x01	/* DAC 1 Mute */
+#define EMU_HANA_DOCK_DAC2_MUTE		0x02	/* DAC 2 Mute */
+#define EMU_HANA_DOCK_DAC3_MUTE		0x04	/* DAC 3 Mute */
+#define EMU_HANA_DOCK_DAC4_MUTE		0x08	/* DAC 4 Mute */
 #define EMU_HANA_DOCK_PHONES_192_DAC1	0x00	/* DAC 1 Headphones source at 192kHz */
 #define EMU_HANA_DOCK_PHONES_192_DAC2	0x10	/* DAC 2 Headphones source at 192kHz */
 #define EMU_HANA_DOCK_PHONES_192_DAC3	0x20	/* DAC 3 Headphones source at 192kHz */
 #define EMU_HANA_DOCK_PHONES_192_DAC4	0x30	/* DAC 4 Headphones source at 192kHz */
 
 #define EMU_HANA_MIDI_OUT	0x12	/* 00xxxxx  5 bit  Source for each MIDI out port */
-#define EMU_HANA_MIDI_OUT_0202	0x01 /* 0202 MIDI from Alice 2. 0 = A, 1 = B */
-#define EMU_HANA_MIDI_OUT_DOCK1	0x02 /* Audio Dock MIDI1 front, from Alice 2. 0 = A, 1 = B */
-#define EMU_HANA_MIDI_OUT_DOCK2	0x04 /* Audio Dock MIDI2 rear, from Alice 2. 0 = A, 1 = B */
-#define EMU_HANA_MIDI_OUT_SYNC2	0x08 /* Sync card. Not the actual MIDI out jack. 0 = A, 1 = B */
-#define EMU_HANA_MIDI_OUT_LOOP	0x10 /* 0 = bits (3:0) normal. 1 = MIDI loopback enabled. */
+#define EMU_HANA_MIDI_OUT_0202		0x01 /* 0202 MIDI from Alice 2. 0 = A, 1 = B */
+#define EMU_HANA_MIDI_OUT_DOCK1		0x02 /* Audio Dock MIDI1 front, from Alice 2. 0 = A, 1 = B */
+#define EMU_HANA_MIDI_OUT_DOCK2		0x04 /* Audio Dock MIDI2 rear, from Alice 2. 0 = A, 1 = B */
+#define EMU_HANA_MIDI_OUT_SYNC2		0x08 /* Sync card. Not the actual MIDI out jack. 0 = A, 1 = B */
+#define EMU_HANA_MIDI_OUT_LOOP		0x10 /* 0 = bits (3:0) normal. 1 = MIDI loopback enabled. */
 
 #define EMU_HANA_DAC_PADS	0x13	/* 00xxxxx  5 bit  DAC 14dB attenuation pads */
-#define EMU_HANA_DOCK_DAC_PAD1	0x01	/* 14dB Attenuation on AudioDock DAC 1. Left and Right */
-#define EMU_HANA_DOCK_DAC_PAD2	0x02	/* 14dB Attenuation on AudioDock DAC 2. Left and Right */
-#define EMU_HANA_DOCK_DAC_PAD3	0x04	/* 14dB Attenuation on AudioDock DAC 3. Left and Right */
-#define EMU_HANA_DOCK_DAC_PAD4	0x08	/* 14dB Attenuation on AudioDock DAC 4. Left and Right */
-#define EMU_HANA_0202_DAC_PAD1	0x10	/* 14dB Attenuation on 0202 DAC 1. Left and Right */
+#define EMU_HANA_DOCK_DAC_PAD1		0x01	/* 14dB Attenuation on AudioDock DAC 1. Left and Right */
+#define EMU_HANA_DOCK_DAC_PAD2		0x02	/* 14dB Attenuation on AudioDock DAC 2. Left and Right */
+#define EMU_HANA_DOCK_DAC_PAD3		0x04	/* 14dB Attenuation on AudioDock DAC 3. Left and Right */
+#define EMU_HANA_DOCK_DAC_PAD4		0x08	/* 14dB Attenuation on AudioDock DAC 4. Left and Right */
+#define EMU_HANA_0202_DAC_PAD1		0x10	/* 14dB Attenuation on 0202 DAC 1. Left and Right */
 
 /* 0x14 - 0x1f Unused R/W registers */
 
 #define EMU_HANA_IRQ_STATUS	0x20	/* 00xxxxx  5 bits IRQ Status  */
 					/* Same bits as for EMU_HANA_IRQ_ENABLE */
 					/* Reading the register resets it. */
 
 #define EMU_HANA_OPTION_CARDS	0x21	/* 000xxxx  4 bits Presence of option cards */
-#define EMU_HANA_OPTION_HAMOA	0x01	/* Hamoa (analog I/O) card present */
-#define EMU_HANA_OPTION_SYNC	0x02	/* Sync card present */
+#define EMU_HANA_OPTION_HAMOA		0x01	/* Hamoa (analog I/O) card present */
+#define EMU_HANA_OPTION_SYNC		0x02	/* Sync card present */
 #define EMU_HANA_OPTION_DOCK_ONLINE	0x04	/* Audio/Micro dock present and FPGA configured */
 #define EMU_HANA_OPTION_DOCK_OFFLINE	0x08	/* Audio/Micro dock present and FPGA not configured */
 
@@ -1123,8 +1123,8 @@
 #define EMU_DOCK_MINOR_REV	0x26	/* 0000xxx  3 bit  Audio Dock FPGA Minor rev */
 
 #define EMU_DOCK_BOARD_ID	0x27	/* 00000xx  2 bits Audio Dock ID pins */
-#define EMU_DOCK_BOARD_ID0	0x00	/* ID bit 0 */
-#define EMU_DOCK_BOARD_ID1	0x03	/* ID bit 1 */
+#define EMU_DOCK_BOARD_ID0		0x00	/* ID bit 0 */
+#define EMU_DOCK_BOARD_ID1		0x03	/* ID bit 1 */
 
 #define EMU_HANA_WC_SPDIF_HI	0x28	/* 0xxxxxx  6 bit  SPDIF IN Word clock, upper 6 bits */
 #define EMU_HANA_WC_SPDIF_LO	0x29	/* 0xxxxxx  6 bit  SPDIF IN Word clock, lower 6 bits */
-- 
2.40.0.152.g15d061e6df

