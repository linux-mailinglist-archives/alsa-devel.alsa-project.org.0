Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9B71246B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 12:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C496C820;
	Fri, 26 May 2023 12:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C496C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685096388;
	bh=QlRLOdgYfZ6Y8egnoQxzwhSK6HB/vH4WcD1bWiT6d9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RMCT9JJ/dU20VT98fFHfwfvc55PlMCPIoGA9b6hB68N/gwW9tuFmgKH6YhGkz4NBh
	 x1y0yyn1YMXevlpkjVZ+QVipIqnSBf7M6UF8tHqP2jZGylADEXANHGjXlSc4KlZAgO
	 dEY59csk4IRExETu4NTKwvYUR721Tfr7xQpTM3v4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AFB7F805B1; Fri, 26 May 2023 12:17:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FF2F805AC;
	Fri, 26 May 2023 12:17:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA82F80563; Fri, 26 May 2023 12:17:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99084F80567
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99084F80567
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C14E8241B4;
	Fri, 26 May 2023 06:16:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q2UVH-pwM-00; Fri, 26 May 2023 12:16:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/6] ALSA: emu10k1: hide absent 2nd pointer-offset register
 set from /proc
Date: Fri, 26 May 2023 12:16:54 +0200
Message-Id: <20230526101659.437969-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
References: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QWVZG3G4UJ3AUCT64OL7LQSJNEWXXDRZ
X-Message-ID-Hash: QWVZG3G4UJ3AUCT64OL7LQSJNEWXXDRZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWVZG3G4UJ3AUCT64OL7LQSJNEWXXDRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 2nd register set belongs to the P16V chip (or embedded P17V module),
so there is nothing to show when no such part is present. Gen2 E-MU
cards have a P17V, but it's entirely unused, so we hide it there as
well.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emuproc.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 89ea3adff322..6cf4a7e16b1d 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -561,15 +561,19 @@ int snd_emu10k1_proc_init(struct snd_emu10k1 *emu)
 	snd_card_rw_proc_new(emu->card, "ptr_regs00b", emu,
 			     snd_emu_proc_ptr_reg_read00b,
 			     snd_emu_proc_ptr_reg_write00);
-	snd_card_rw_proc_new(emu->card, "ptr_regs20a", emu,
-			     snd_emu_proc_ptr_reg_read20a,
-			     snd_emu_proc_ptr_reg_write20);
-	snd_card_rw_proc_new(emu->card, "ptr_regs20b", emu,
-			     snd_emu_proc_ptr_reg_read20b,
-			     snd_emu_proc_ptr_reg_write20);
-	snd_card_rw_proc_new(emu->card, "ptr_regs20c", emu,
-			     snd_emu_proc_ptr_reg_read20c,
-			     snd_emu_proc_ptr_reg_write20);
+	if (!emu->card_capabilities->emu_model &&
+	    (emu->card_capabilities->ca0151_chip || emu->card_capabilities->ca0108_chip)) {
+		snd_card_rw_proc_new(emu->card, "ptr_regs20a", emu,
+				     snd_emu_proc_ptr_reg_read20a,
+				     snd_emu_proc_ptr_reg_write20);
+		snd_card_rw_proc_new(emu->card, "ptr_regs20b", emu,
+				     snd_emu_proc_ptr_reg_read20b,
+				     snd_emu_proc_ptr_reg_write20);
+		if (emu->card_capabilities->ca0108_chip)
+			snd_card_rw_proc_new(emu->card, "ptr_regs20c", emu,
+					     snd_emu_proc_ptr_reg_read20c,
+					     snd_emu_proc_ptr_reg_write20);
+	}
 #endif
 	
 	snd_card_ro_proc_new(emu->card, "emu10k1", emu, snd_emu10k1_proc_read);
-- 
2.40.0.152.g15d061e6df

