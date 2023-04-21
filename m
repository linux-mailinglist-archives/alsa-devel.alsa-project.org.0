Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3296EAC87
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC22EA4;
	Fri, 21 Apr 2023 16:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC22EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086392;
	bh=B37PdQFWHHNSzAPQYeN+mEQ8vv+uTe4KSoBFBzKbv4M=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ckjfErXkTzdtsdtFEoYqSqye3/k5GmjO90yOzd9KWSBFHUUR7y3ZVZ7vX0vt4/Ss7
	 YpBXYWGlb9SokYhTLiqbdH3AD3Ktl4LmP35qg1pQUHIu4IDdz8huZdgYg2EnvQx2Oo
	 Nlsg9/9v5HHYaA9lqSuoDdBP0dsjaUXI9uEmsXG4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF54F80563;
	Fri, 21 Apr 2023 16:10:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D612EF80563; Fri, 21 Apr 2023 16:10:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 766E0F8052E
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 766E0F8052E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1472D2425B;
	Fri, 21 Apr 2023 10:10:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Dau-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ALSA: emu10k1: stop doing weird things with HCFG in
 snd_emu10k1_emu1010_init()
Date: Fri, 21 Apr 2023 16:10:03 +0200
Message-Id: <20230421141006.1005539-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
References: <20230421141006.1005539-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4OXOQS7UYA65G2FRB6Z4FXMIQPJZN5TZ
X-Message-ID-Hash: 4OXOQS7UYA65G2FRB6Z4FXMIQPJZN5TZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OXOQS7UYA65G2FRB6Z4FXMIQPJZN5TZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This doesn't do anything snd_emu10k1_init() wouldn't do later, and none
of the things it does seem relevant for the function itself (which is
pretty much about setting up the FPGA). It was probably a Windows
driver behavior cargo-culting artifact.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 33 ++++----------------------------
 1 file changed, 4 insertions(+), 29 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index bf1a261547d4..f7908e5a6e0d 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -831,24 +831,10 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 	int err;
 
 	dev_info(emu->card->dev, "emu1010: Special config.\n");
-	/* AC97 2.1, Any 16Meg of 4Gig address, Auto-Mute, EMU32 Slave,
-	 * Lock Sound Memory Cache, Lock Tank Memory Cache,
-	 * Mute all codecs.
-	 */
-	outl(0x0005a00c, emu->port + HCFG);
-	/* AC97 2.1, Any 16Meg of 4Gig address, Auto-Mute, EMU32 Slave,
-	 * Lock Tank Memory Cache,
-	 * Mute all codecs.
-	 */
-	outl(0x0005a004, emu->port + HCFG);
-	/* AC97 2.1, Any 16Meg of 4Gig address, Auto-Mute, EMU32 Slave,
-	 * Mute all codecs.
-	 */
-	outl(0x0005a000, emu->port + HCFG);
-	/* AC97 2.1, Any 16Meg of 4Gig address, Auto-Mute, EMU32 Slave,
-	 * Mute all codecs.
-	 */
-	outl(0x0005a000, emu->port + HCFG);
+
+	/* Mute, and disable audio and lock cache, just in case.
+	 * Proper init follows in snd_emu10k1_init(). */
+	outl(HCFG_LOCKSOUNDCACHE | HCFG_LOCKTANKCACHE_MASK, emu->port + HCFG);
 
 	/* Disable 48Volt power to Audio Dock */
 	snd_emu1010_fpga_write(emu, EMU_HANA_DOCK_PWR, 0);
@@ -1075,17 +1061,6 @@ static int snd_emu10k1_emu1010_init(struct snd_emu10k1 *emu)
 
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &tmp);
 
-	/* AC97 1.03, Any 32Meg of 2Gig address, Auto-Mute, EMU32 Slave,
-	 * Lock Sound Memory Cache, Lock Tank Memory Cache,
-	 * Mute all codecs.
-	 */
-	outl(0x0000a000, emu->port + HCFG);
-	/* AC97 1.03, Any 32Meg of 2Gig address, Auto-Mute, EMU32 Slave,
-	 * Lock Sound Memory Cache, Lock Tank Memory Cache,
-	 * Un-Mute all codecs.
-	 */
-	outl(0x0000a001, emu->port + HCFG);
-
 	/* Initial boot complete. Now patches */
 
 	snd_emu1010_fpga_read(emu, EMU_HANA_OPTION_CARDS, &tmp);
-- 
2.40.0.152.g15d061e6df

