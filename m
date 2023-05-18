Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56761707CF8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 968EB1FE;
	Thu, 18 May 2023 11:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 968EB1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684402377;
	bh=IKtUXiqjFErbBpTVz1IKxqbqMyd4g79zylrYhZYYcfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=atGoLTx/psWBHFiT+edQT9ZiVsSuOZgwKFTOElLhU2SnuAf9r/PHn8ZYo9zprSOpo
	 LQOxO1PefCyMQKcuz+NwoLYhj1KJT4tbxIC4qlhf5TlqtiATr4+JmQ4JhTKFWIkRzW
	 WO8XHLRQBQv/C1ury9G1zOHZcPRiJZ70sWVKXqjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F187AF80579; Thu, 18 May 2023 11:31:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF92F80579;
	Thu, 18 May 2023 11:31:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53966F80552; Thu, 18 May 2023 11:30:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05F22F802E8
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F22F802E8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7731224208;
	Thu, 18 May 2023 05:30:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZyB-Vzp-00; Thu, 18 May 2023 11:30:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/4] ALSA: emu10k1: fix handling of half-loop interrupts
Date: Thu, 18 May 2023 11:30:47 +0200
Message-Id: <20230518093047.3697887-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518093047.3697887-1-oswald.buddenhagen@gmx.de>
References: <20230518093047.3697887-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VGZMVH3ZZKQOXJPENKC4OZDSL32TSMAU
X-Message-ID-Hash: VGZMVH3ZZKQOXJPENKC4OZDSL32TSMAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGZMVH3ZZKQOXJPENKC4OZDSL32TSMAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We'd try to iterate the voices twice without resetting the pointer.
This went unnoticed, because the code isn't actually in use.

Amends commit 27ae958cf6 ("emu10k1 driver - add multichannel device
hw:x,3 [2-8/8]").

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index 7dc803aaa850..a813ef8c2f8d 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -47,12 +47,13 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 			status &= ~(IPR_VOLINCR|IPR_VOLDECR|IPR_MUTE);
 		}
 		if (status & IPR_CHANNELLOOP) {
+			struct snd_emu10k1_voice *pvoice;
 			int voice;
 			int voice_max = status & IPR_CHANNELNUMBERMASK;
 			u32 val;
-			struct snd_emu10k1_voice *pvoice = emu->voices;
 
 			val = snd_emu10k1_ptr_read(emu, CLIPL, 0);
+			pvoice = emu->voices;
 			for (voice = 0; voice <= voice_max; voice++) {
 				if (voice == 0x20)
 					val = snd_emu10k1_ptr_read(emu, CLIPH, 0);
@@ -68,6 +69,7 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 				pvoice++;
 			}
 			val = snd_emu10k1_ptr_read(emu, HLIPL, 0);
+			pvoice = emu->voices;
 			for (voice = 0; voice <= voice_max; voice++) {
 				if (voice == 0x20)
 					val = snd_emu10k1_ptr_read(emu, HLIPH, 0);
-- 
2.40.0.152.g15d061e6df

