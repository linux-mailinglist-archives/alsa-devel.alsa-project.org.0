Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF136EB91E
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 14:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295C5EC2;
	Sat, 22 Apr 2023 14:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295C5EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682165811;
	bh=iKbKiJxyosGCV0+M8Ub17USXzi5eh2QK8mXCFpA2MeI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=clqLg08fuqcKiF2zdPv3lxTY24KHjmnaUIb1zEdClrAfPa+E1UQWEYegKMhX+YJt5
	 s/YmP1zyeRRuFftJfcCJ7qJWMrzpbCSTDHi4ABbJf7IXoLTobaQamGmyEPDMvBjoSK
	 ll9ZWfTklLfDY+hoEOCxQ808U2BvvICsnWwpwOOc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B01DF80149;
	Sat, 22 Apr 2023 14:16:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64FB2F80155; Sat, 22 Apr 2023 14:15:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0342FF80053
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 14:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0342FF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 6B2F523F58;
	Sat, 22 Apr 2023 08:15:19 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqC99-Pt0-00; Sat, 22 Apr 2023 14:15:19 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: emu10k1: minor optimizations
Date: Sat, 22 Apr 2023 14:15:19 +0200
Message-Id: <20230422121519.1052813-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I5DTGTLSWXIYAQPKSWXKJW3SRJRYIFEX
X-Message-ID-Hash: I5DTGTLSWXIYAQPKSWXKJW3SRJRYIFEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5DTGTLSWXIYAQPKSWXKJW3SRJRYIFEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- In snd_emu10k1_look_for_ctl(), evaluate the cheap condition first
- In _snd_emu10k1_{audigy_,}init_efx(), don't use expensive bit setting
  loops to fill arrays
- In snd_emu_proc_ptr_reg_read(), remove useless condition - iobase can
  be only 0 or 0x20

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- fix fill sizes for sblive by using the previous hard-coded numbers.
  it might be a good idea to introduce constants for that, but that's
  for another patch.
---
 sound/pci/emu10k1/emufx.c   | 18 +++++++-----------
 sound/pci/emu10k1/emuproc.c |  5 +----
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6cf7c8b1de47..66f450377888 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -641,8 +641,8 @@ snd_emu10k1_look_for_ctl(struct snd_emu10k1 *emu,
 	list_for_each_entry(ctl, &emu->fx8010.gpr_ctl, list) {
 		kcontrol = ctl->kcontrol;
 		if (kcontrol->id.iface == id->iface &&
-		    !strcmp(kcontrol->id.name, id->name) &&
-		    kcontrol->id.index == id->index)
+		    kcontrol->id.index == id->index &&
+		    !strcmp(kcontrol->id.name, id->name))
 			return ctl;
 	}
 	return NULL;
@@ -1213,7 +1213,7 @@ static int snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 
 static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 {
-	int err, i, z, gpr, nctl;
+	int err, z, gpr, nctl;
 	int bit_shifter16;
 	const int playback = 10;
 	const int capture = playback + (SND_EMU10K1_PLAYBACK_CHANNELS * 2); /* we reserve 10 voices */
@@ -1245,12 +1245,10 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	icode->code = icode->tram_addr_map + 256;
 
 	/* clear free GPRs */
-	for (i = 0; i < 512; i++)
-		set_bit(i, icode->gpr_valid);
+	memset(icode->gpr_valid, 0xff, 512 / 8);
 		
 	/* clear TRAM data & address lines */
-	for (i = 0; i < 256; i++)
-		set_bit(i, icode->tram_valid);
+	memset(icode->tram_valid, 0xff, 256 / 8);
 
 	strcpy(icode->name, "Audigy DSP code for ALSA");
 	ptr = 0;
@@ -1886,12 +1884,10 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	icode->code = icode->tram_addr_map + 160;
 	
 	/* clear free GPRs */
-	for (i = 0; i < 256; i++)
-		set_bit(i, icode->gpr_valid);
+	memset(icode->gpr_valid, 0xff, 256 / 8);
 
 	/* clear TRAM data & address lines */
-	for (i = 0; i < 160; i++)
-		set_bit(i, icode->tram_valid);
+	memset(icode->tram_valid, 0xff, 160 / 8);
 
 	strcpy(icode->name, "SB Live! FX8010 code for ALSA v1.2 by Jaroslav Kysela");
 	ptr = 0; i = 0;
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 6e20cca9c98f..bec72dc60a41 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -477,10 +477,7 @@ static void snd_emu_proc_ptr_reg_read(struct snd_info_entry *entry,
 	for(i = offset; i < offset+length; i++) {
 		snd_iprintf(buffer, "%02X: ",i);
 		for (j = 0; j < voices; j++) {
-			if(iobase == 0)
-                		value = snd_ptr_read(emu, 0, i, j);
-			else
-                		value = snd_ptr_read(emu, 0x20, i, j);
+			value = snd_ptr_read(emu, iobase, i, j);
 			snd_iprintf(buffer, "%08lX ", value);
 		}
 		snd_iprintf(buffer, "\n");
-- 
2.40.0.152.g15d061e6df

