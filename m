Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DD6F14F0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:05:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C03712AA;
	Fri, 28 Apr 2023 12:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C03712AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676300;
	bh=bzrZoU0lDciRLTC1BKF8eSt0Z2F7HDGTUpm///GbqFg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aiXIeacqko+mpBXG5C82HxDqBkUVP7z3kWoaToSmGBNTR/0OwAktr5lXmLXsGI+iR
	 BL4Jx3Kr+YRIeHojajekFtFDU1rw4VyCBGAuYGL2GUwuymvQudi8TvO5hTDVcGSKOV
	 rLICwG33EB/SQo1RfIbXTkN8Q6xcDOnoOENYhlIw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2286F8052D;
	Fri, 28 Apr 2023 12:03:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E77EF8052D; Fri, 28 Apr 2023 12:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPOOFED_FREEMAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DCDEF80529
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCDEF80529
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 080342426F;
	Fri, 28 Apr 2023 05:59:42 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9tg-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: minor E-MU naming fixups
Date: Fri, 28 Apr 2023 11:59:41 +0200
Message-Id: <20230428095941.1706335-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MOCTPU72ETPG66HT64Z46BGEWWSF53JT
X-Message-ID-Hash: MOCTPU72ETPG66HT64Z46BGEWWSF53JT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOCTPU72ETPG66HT64Z46BGEWWSF53JT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Fix mixer source port names. These will require some users to
  re-adjust their mixer settings, which seems acceptable:
  - The S/PDIF port is on the main 1010 card, not the 0202 daughter card
  - The 1616m CardBus card has all inputs on the dock, so there is
    no point in specifying it
  - Conversely, the 1010 card has "dispersed" inputs, so say where the
    ADAT port is, consistently with the S/PDIF port
- The 1616m CardBus card is actually named E-MU 02 (due to the headphone
  output jack it has)
- Fix capitalization of "E-MU"

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 16 +++++++-------
 sound/pci/emu10k1/emumixer.c     | 36 ++++++++++++++++----------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 3abdaf1b9624..5d9d772e3a13 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1310,7 +1310,7 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	/* Does NOT support sync daughter card (obviously). */
 	/* Tested by James@superbug.co.uk 4th Nov 2007. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x42011102,
-	 .driver = "Audigy2", .name = "E-mu 1010 Notebook [MAEM8950]",
+	 .driver = "Audigy2", .name = "E-MU 02 CardBus [MAEM8950]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
@@ -1323,7 +1323,7 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 * MicroDock[M] to make it an E-MU 1616[m]. */
 	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40041102,
-	 .driver = "Audigy2", .name = "E-mu 1010b PCI [MAEM8960]",
+	 .driver = "Audigy2", .name = "E-MU 1010b PCI [MAEM8960]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
@@ -1337,48 +1337,48 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 * still work. */
 	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40071102,
-	 .driver = "Audigy2", .name = "E-mu 1010 PCIe [MAEM8986]",
+	 .driver = "Audigy2", .name = "E-MU 1010 PCIe [MAEM8986]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010B}, /* EMU 1010 PCIe */
 	/* Tested by James@superbug.co.uk 8th July 2005. */
 	/* This is MAEM8810 "Hana", 0202 is MAEM8820 "Hamoa" */
 	/* Attach 0202 daughter card to make it an E-MU 1212m, OR an
 	 * AudioDock[M] to make it an E-MU 1820[m]. */
 	/* Supports sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x40011102,
-	 .driver = "Audigy2", .name = "E-mu 1010 [MAEM8810]",
+	 .driver = "Audigy2", .name = "E-MU 1010 [MAEM8810]",
 	 .id = "EMU1010",
 	 .emu10k2_chip = 1,
 	 .ca0102_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU1010}, /* EMU 1010 old revision */
 	/* This is MAEM8852 "HanaLiteLite" */
 	/* Supports sync daughter card. */
 	/* Tested by oswald.buddenhagen@gmx.de Mar 2023. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40021102,
-	 .driver = "Audigy2", .name = "E-mu 0404b PCI [MAEM8852]",
+	 .driver = "Audigy2", .name = "E-MU 0404b PCI [MAEM8852]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 new revision */
 	/* This is MAEM8850 "HanaLite" */
 	/* Supports sync daughter card. */
 	/* Tested by James@superbug.co.uk 20-3-2007. */
 	{.vendor = 0x1102, .device = 0x0004, .subsystem = 0x40021102,
-	 .driver = "Audigy2", .name = "E-mu 0404 [MAEM8850]",
+	 .driver = "Audigy2", .name = "E-MU 0404 [MAEM8850]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0102_chip = 1,
 	 .spk71 = 1,
 	 .emu_model = EMU_MODEL_EMU0404}, /* EMU 0404 */
 	/* EMU0404 PCIe */
 	/* Does NOT support sync daughter card. */
 	{.vendor = 0x1102, .device = 0x0008, .subsystem = 0x40051102,
-	 .driver = "Audigy2", .name = "E-mu 0404 PCIe [MAEM8984]",
+	 .driver = "Audigy2", .name = "E-MU 0404 PCIe [MAEM8984]",
 	 .id = "EMU0404",
 	 .emu10k2_chip = 1,
 	 .ca0108_chip = 1,
@@ -1645,7 +1645,7 @@ static const struct snd_emu_chip_details emu_chip_details[] = {
 	 .ac97_chip = 1,
 	 .sblive51 = 1} ,
 	{.vendor = 0x1102, .device = 0x0002, .subsystem = 0x40011102,
-	 .driver = "EMU10K1", .name = "E-mu APS [PC545]",
+	 .driver = "EMU10K1", .name = "E-MU APS [PC545]",
 	 .id = "APS",
 	 .emu10k1_chip = 1,
 	 .ecard = 1} ,
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 8fce3413f4ae..a101fe7598c4 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -81,16 +81,16 @@ static const char * const emu1010_src_texts[] = {
 	"Dock ADC3 Right",
 	"0202 ADC Left",
 	"0202 ADC Right",
-	"0202 SPDIF Left",
-	"0202 SPDIF Right",
-	"ADAT 0",
-	"ADAT 1",
-	"ADAT 2",
-	"ADAT 3",
-	"ADAT 4",
-	"ADAT 5",
-	"ADAT 6",
-	"ADAT 7",
+	"1010 SPDIF Left",
+	"1010 SPDIF Right",
+	"1010 ADAT 0",
+	"1010 ADAT 1",
+	"1010 ADAT 2",
+	"1010 ADAT 3",
+	"1010 ADAT 4",
+	"1010 ADAT 5",
+	"1010 ADAT 6",
+	"1010 ADAT 7",
 	"DSP 0",
 	"DSP 1",
 	"DSP 2",
@@ -129,14 +129,14 @@ static const char * const emu1010_src_texts[] = {
 
 static const char * const emu1616_src_texts[] = {
 	"Silence",
-	"Dock Mic A",
-	"Dock Mic B",
-	"Dock ADC1 Left",
-	"Dock ADC1 Right",
-	"Dock ADC2 Left",
-	"Dock ADC2 Right",
-	"Dock SPDIF Left",
-	"Dock SPDIF Right",
+	"Mic A",
+	"Mic B",
+	"ADC1 Left",
+	"ADC1 Right",
+	"ADC2 Left",
+	"ADC2 Right",
+	"SPDIF Left",
+	"SPDIF Right",
 	"ADAT 0",
 	"ADAT 1",
 	"ADAT 2",
-- 
2.40.0.152.g15d061e6df

