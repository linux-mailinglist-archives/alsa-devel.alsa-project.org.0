Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCB6EBA40
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:14:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA798F10;
	Sat, 22 Apr 2023 18:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA798F10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180068;
	bh=oOJ7JWWwYisHFe6RvMXxE2o0IKNjXvibtbtlRftULI0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XGScXKxd90rafyso9EZI6E7SGEs12Cu/1OIpOmtc/pbgEnrF+c6Y1VTJ8P6Sw0s5J
	 RrTWPaRlmYr7nF8oia7anzcKV842oNpJMlUkc9sEnqTpadK95O5KpGnl6+LkmAIzYC
	 Z1xPhgLFemzjV6zgR/S3kAeEL2NAfa7std2JaQIg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2085F805AC;
	Sat, 22 Apr 2023 18:11:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E581F8057A; Sat, 22 Apr 2023 18:11:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CD39F80533
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD39F80533
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AE00424220;
	Sat, 22 Apr 2023 12:10:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-nbF-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: emu10k1: use high-level I/O functions also during
 init
Date: Sat, 22 Apr 2023 18:10:20 +0200
Message-Id: <20230422161021.1143967-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ISKANTQ4IWGVZMMMQL6DT7IODN32AYIE
X-Message-ID-Hash: ISKANTQ4IWGVZMMMQL6DT7IODN32AYIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISKANTQ4IWGVZMMMQL6DT7IODN32AYIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

... and also use more pre-defined constants on the way (some of which
required adjustment).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

This patch series needs to be applied on top of the patch titled "ALSA:
emu10k1: use more existing defines instead of open-coded numbers".
---
 include/sound/emu10k1.h          |  9 +++++----
 sound/pci/emu10k1/emu10k1_main.c | 20 ++++++--------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 5958cae819fd..05a09826eef0 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -852,10 +852,11 @@
 #define A_SPDIF_MUTED		0x000000c0
 
 #define A_I2S_CAPTURE_RATE_MASK	0x00000e00	/* This sets the capture PCM rate, but it is    */
-#define A_I2S_CAPTURE_48000	0x00000000	/* unclear if this sets the ADC rate as well.	*/
-#define A_I2S_CAPTURE_192000	0x00000200
-#define A_I2S_CAPTURE_96000	0x00000400
-#define A_I2S_CAPTURE_44100	0x00000800
+#define A_I2S_CAPTURE_RATE	0x03090076	/* unclear if this sets the ADC rate as well.	*/
+#define A_I2S_CAPTURE_48000	0x0
+#define A_I2S_CAPTURE_192000	0x1
+#define A_I2S_CAPTURE_96000	0x2
+#define A_I2S_CAPTURE_44100	0x4
 
 #define A_EHC_SRC48_MASK	0x0000e000	/* This sets the playback PCM rate on the P16V	*/
 #define A_EHC_SRC48_BYPASS	0x00000000
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index e53eb7fd0883..3aca01c70ccb 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -186,10 +186,7 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 	if (emu->card_capabilities->ca0151_chip) { /* audigy2 */
 		/* Hacks for Alice3 to work independent of haP16V driver */
 		/* Setup SRCMulti_I2S SamplingRate */
-		tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, 0);
-		tmp &= 0xfffff1ff;
-		tmp |= (0x2<<9);
-		snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, 0, tmp);
+		snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, 0, A_I2S_CAPTURE_96000);
 
 		/* Setup SRCSel (Enable Spdif,I2S SRCMulti) */
 		snd_emu10k1_ptr20_write(emu, SRCSel, 0, 0x14);
@@ -206,25 +203,20 @@ static int snd_emu10k1_init(struct snd_emu10k1 *emu, int enable_ir)
 		/* Hacks for Alice3 to work independent of haP16V driver */
 		dev_info(emu->card->dev, "Audigy2 value: Special config.\n");
 		/* Setup SRCMulti_I2S SamplingRate */
-		tmp = snd_emu10k1_ptr_read(emu, A_SPDIF_SAMPLERATE, 0);
-		tmp &= 0xfffff1ff;
-		tmp |= (0x2<<9);
-		snd_emu10k1_ptr_write(emu, A_SPDIF_SAMPLERATE, 0, tmp);
+		snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, 0, A_I2S_CAPTURE_96000);
 
 		/* Setup SRCSel (Enable Spdif,I2S SRCMulti) */
-		outl(0x600000, emu->port + 0x20);
-		outl(0x14, emu->port + 0x24);
+		snd_emu10k1_ptr20_write(emu, P17V_SRCSel, 0, 0x14);
 
 		/* Setup SRCMulti Input Audio Enable */
-		outl(0x7b0000, emu->port + 0x20);
-		outl(0xFF000000, emu->port + 0x24);
+		snd_emu10k1_ptr20_write(emu, P17V_MIXER_I2S_ENABLE, 0, 0xFF000000);
 
 		/* Setup SPDIF Out Audio Enable */
 		/* The Audigy 2 Value has a separate SPDIF out,
 		 * so no need for a mixer switch
 		 */
-		outl(0x7a0000, emu->port + 0x20);
-		outl(0xFF000000, emu->port + 0x24);
+		snd_emu10k1_ptr20_write(emu, P17V_MIXER_SPDIF_ENABLE, 0, 0xFF000000);
+
 		tmp = inw(emu->port + A_IOCFG) & ~0x8; /* Clear bit 3 */
 		outw(tmp, emu->port + A_IOCFG);
 	}
-- 
2.40.0.152.g15d061e6df

