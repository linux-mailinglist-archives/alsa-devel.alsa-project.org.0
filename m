Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5C6EAC8D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55BEE94;
	Fri, 21 Apr 2023 16:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55BEE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682086439;
	bh=Msj1x16VIkpHnRn7X9naTr0kITTTFDn1b6x9DzsHtQc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VlfbEwNkxDwh3ChMZx2c5YHexW/1RzZoc1oSrhes3lo43KUb7z95BZolv+FlJ7zOD
	 wHQX2KbeQwzZl6X+ECukMxfd9l83a5f5pXXoyPfC3WqsZcn6uqn86t8xJl7byR6VIQ
	 Wn4b18lP+T+4xcIU71MtNXdGQsXucShK0E8aSrCE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C87BF80580;
	Fri, 21 Apr 2023 16:10:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38FC1F80563; Fri, 21 Apr 2023 16:10:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 69611F8052D
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69611F8052D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B504F24256;
	Fri, 21 Apr 2023 10:10:06 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pprSg-Da2-00; Fri, 21 Apr 2023 16:10:06 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: clarify various fx8010.*_mask fields
Date: Fri, 21 Apr 2023 16:10:06 +0200
Message-Id: <20230421141006.1005509-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7WB4N7GVJ3ZOCK4GNOJLGRPJVA4555VN
X-Message-ID-Hash: 7WB4N7GVJ3ZOCK4GNOJLGRPJVA4555VN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WB4N7GVJ3ZOCK4GNOJLGRPJVA4555VN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

extin_mask and extout_mask are used only by the SbLive! microcode, so
they have no effect on Audigy.

Eliminate fxbus_mask entirely, as it wasn't actually used for anything.

As a drive-by, remove the pointless pad1 field from struct
snd_emu10k1_fx8010 - it is not visible to user space, so it has no
binary compatibility constraints.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          | 6 ++----
 sound/pci/emu10k1/emu10k1_main.c | 7 ++++---
 sound/pci/emu10k1/emufx.c        | 9 ++++-----
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 39787fecc8d9..3407ca4a1210 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1599,10 +1599,8 @@ struct snd_emu10k1_fx8010_pcm {
 };
 
 struct snd_emu10k1_fx8010 {
-	unsigned short fxbus_mask;	/* used FX buses (bitmask) */
-	unsigned short extin_mask;	/* used external inputs (bitmask) */
-	unsigned short extout_mask;	/* used external outputs (bitmask) */
-	unsigned short pad1;
+	unsigned short extin_mask;	/* used external inputs (bitmask); not used for Audigy */
+	unsigned short extout_mask;	/* used external outputs (bitmask); not used for Audigy */
 	unsigned int itram_size;	/* internal TRAM size in samples */
 	struct snd_dma_buffer etram_pages; /* external TRAM pages and size */
 	unsigned int dbg;		/* FX debugger register */
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 3880f359e688..65fd6b62bc9c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1901,11 +1901,12 @@ int snd_emu10k1_create(struct snd_card *card,
 
 	pci_set_master(pci);
 
-	emu->fx8010.fxbus_mask = 0x303f;
+	// The masks are not used for Audigy.
+	// FIXME: these should come from the card_capabilites table.
 	if (extin_mask == 0)
-		extin_mask = 0x3fcf;
+		extin_mask = 0x3fcf;  // EXTIN_*
 	if (extout_mask == 0)
-		extout_mask = 0x7fff;
+		extout_mask = 0x7fff;  // EXTOUT_*
 	emu->fx8010.extin_mask = extin_mask;
 	emu->fx8010.extout_mask = extout_mask;
 	emu->enable_ir = enable_ir;
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6cf7c8b1de47..c74e66e03ae0 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -2523,19 +2523,18 @@ static void snd_emu10k1_fx8010_info(struct snd_emu10k1 *emu,
 				   struct snd_emu10k1_fx8010_info *info)
 {
 	const char * const *fxbus, * const *extin, * const *extout;
-	unsigned short fxbus_mask, extin_mask, extout_mask;
+	unsigned short extin_mask, extout_mask;
 	int res;
 
 	info->internal_tram_size = emu->fx8010.itram_size;
 	info->external_tram_size = emu->fx8010.etram_pages.bytes / 2;
 	fxbus = fxbuses;
 	extin = emu->audigy ? audigy_ins : creative_ins;
 	extout = emu->audigy ? audigy_outs : creative_outs;
-	fxbus_mask = emu->fx8010.fxbus_mask;
-	extin_mask = emu->fx8010.extin_mask;
-	extout_mask = emu->fx8010.extout_mask;
+	extin_mask = emu->audigy ? ~0 : emu->fx8010.extin_mask;
+	extout_mask = emu->audigy ? ~0 : emu->fx8010.extout_mask;
 	for (res = 0; res < 16; res++, fxbus++, extin++, extout++) {
-		copy_string(info->fxbus_names[res], fxbus_mask & (1 << res) ? *fxbus : NULL, "FXBUS", res);
+		copy_string(info->fxbus_names[res], *fxbus, "FXBUS", res);
 		copy_string(info->extin_names[res], extin_mask & (1 << res) ? *extin : NULL, "Unused", res);
 		copy_string(info->extout_names[res], extout_mask & (1 << res) ? *extout : NULL, "Unused", res);
 	}
-- 
2.40.0.152.g15d061e6df

