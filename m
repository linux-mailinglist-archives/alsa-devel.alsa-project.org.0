Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205B1712468
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 12:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E41920C;
	Fri, 26 May 2023 12:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E41920C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685096337;
	bh=rTpq1SaW38m/llZF1omQDwgwKD8+wS62B6SNPP6imTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mXAuzOYaoByQklzosPbm10mlJsDMJRGkPRT8a8uLbMAIpG5Vdtj39nQlEjOS4nIGr
	 bK1lHjPKyB+WoEimHEw+60ke16mTxGBDcRGzufNVezJGqa58jCOIBw0xD6k6Y1qQFi
	 I/tU+bl9aIY5EsBAFCmtYncpdgQHaRB6yvn/Bo0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001FEF80249; Fri, 26 May 2023 12:17:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C1DEF80548;
	Fri, 26 May 2023 12:17:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B61CF8056F; Fri, 26 May 2023 12:17:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 15800F80548
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15800F80548
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C406224220;
	Fri, 26 May 2023 06:16:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q2UVH-pwS-00; Fri, 26 May 2023 12:16:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/6] ALSA: emu10k1: fix writing 1st pointer-offset register
 set through /proc
Date: Fri, 26 May 2023 12:16:55 +0200
Message-Id: <20230526101659.437969-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5A53CKT5X5PRRDVYFY55XUUD7RBEQKNF
X-Message-ID-Hash: 5A53CKT5X5PRRDVYFY55XUUD7RBEQKNF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A53CKT5X5PRRDVYFY55XUUD7RBEQKNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The limits were appropriate only for the 2nd set.

FWIW, the channel count 4 for the 2nd set is suspicious as well - at
least P17V_PLAYBACK_FIFO_PTR actually has 8 channels, and comments on
HCFG2 hint at that as well. But all bitmasks are documented only for 4
channels. Anyway, rectifying that is out of scope for this patch.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emuproc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 6cf4a7e16b1d..81d48cd478b7 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -483,29 +483,32 @@ static void snd_emu_proc_ptr_reg_read(struct snd_info_entry *entry,
 }
 
 static void snd_emu_proc_ptr_reg_write(struct snd_info_entry *entry,
-				       struct snd_info_buffer *buffer, int iobase)
+				       struct snd_info_buffer *buffer,
+				       int iobase, int length, int voices)
 {
 	struct snd_emu10k1 *emu = entry->private_data;
 	char line[64];
 	unsigned int reg, channel_id , val;
 	while (!snd_info_get_line(buffer, line, sizeof(line))) {
 		if (sscanf(line, "%x %x %x", &reg, &channel_id, &val) != 3)
 			continue;
-		if (reg < 0xa0 && val <= 0xffffffff && channel_id <= 3)
+		if (reg < length && channel_id < voices)
 			snd_ptr_write(emu, iobase, reg, channel_id, val);
 	}
 }
 
 static void snd_emu_proc_ptr_reg_write00(struct snd_info_entry *entry,
 					 struct snd_info_buffer *buffer)
 {
-	snd_emu_proc_ptr_reg_write(entry, buffer, 0);
+	snd_emu_proc_ptr_reg_write(entry, buffer, 0, 0x80, 64);
 }
 
 static void snd_emu_proc_ptr_reg_write20(struct snd_info_entry *entry,
 					 struct snd_info_buffer *buffer)
 {
-	snd_emu_proc_ptr_reg_write(entry, buffer, 0x20);
+	struct snd_emu10k1 *emu = entry->private_data;
+	snd_emu_proc_ptr_reg_write(entry, buffer, 0x20,
+				   emu->card_capabilities->ca0108_chip ? 0xa0 : 0x80, 4);
 }
 	
 
-- 
2.40.0.152.g15d061e6df

