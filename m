Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A1E6F14EA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F4B712A0;
	Fri, 28 Apr 2023 12:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F4B712A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676172;
	bh=MA5wgUxkUyBZWkSS3Vf70q/vvkZ0UlQIhnuN2u8kYmc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ibd4lUqtwFaQhG3rm2Xt5FMYLvYajKHqFPGBW42EA5CKEWy7ZJ+sXm5vsnjEOP/SD
	 wpSDe+g/PsPJj/HfNADfGiLxOVJwCo9Manzu1UdWAtGQXShZp6cT7M3+s52ihZlwHX
	 75wVyXxXdlKQImIMXP3NrcdsoeWLxg5zSxqkqSWw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD5AF8025E;
	Fri, 28 Apr 2023 12:02:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0852F8025F; Fri, 28 Apr 2023 12:01:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31EE5F8025E
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31EE5F8025E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C79082421F;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9t3-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ALSA: emu10k1: remove pointless locks from /proc code
Date: Fri, 28 Apr 2023 11:59:37 +0200
Message-Id: <20230428095941.1706278-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
References: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 72B652ZHBAQ6MSKWNAFJIYIHX6TEF3HB
X-Message-ID-Hash: 72B652ZHBAQ6MSKWNAFJIYIHX6TEF3HB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72B652ZHBAQ6MSKWNAFJIYIHX6TEF3HB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

emu_lock locks the card's registers, but that's necessary only for
multi-register access, incl. read-modify-write cycles.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emuproc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index bec72dc60a41..c92253de881e 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -399,31 +399,25 @@ static void snd_emu_proc_io_reg_read(struct snd_info_entry *entry,
 {
 	struct snd_emu10k1 *emu = entry->private_data;
 	unsigned long value;
-	unsigned long flags;
 	int i;
 	snd_iprintf(buffer, "IO Registers:\n\n");
 	for(i = 0; i < 0x40; i+=4) {
-		spin_lock_irqsave(&emu->emu_lock, flags);
 		value = inl(emu->port + i);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
 		snd_iprintf(buffer, "%02X: %08lX\n", i, value);
 	}
 }
 
 static void snd_emu_proc_io_reg_write(struct snd_info_entry *entry,
                                       struct snd_info_buffer *buffer)
 {
 	struct snd_emu10k1 *emu = entry->private_data;
-	unsigned long flags;
 	char line[64];
 	u32 reg, val;
 	while (!snd_info_get_line(buffer, line, sizeof(line))) {
 		if (sscanf(line, "%x %x", &reg, &val) != 2)
 			continue;
 		if (reg < 0x40 && val <= 0xffffffff) {
-			spin_lock_irqsave(&emu->emu_lock, flags);
 			outl(val, emu->port + (reg & 0xfffffffc));
-			spin_unlock_irqrestore(&emu->emu_lock, flags);
 		}
 	}
 }
-- 
2.40.0.152.g15d061e6df

