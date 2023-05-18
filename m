Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C55707CF0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:32:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501CB6C0;
	Thu, 18 May 2023 11:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501CB6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684402361;
	bh=ECUEZfG3MdCFA17Nm6IbRypLqhO7qoK1PvEGmDDnhmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GgvBwuHgsSwsYEwybtb9f3hbpVZYfBp95Sgf0CHm7k7/GHkMndB1cYLkQgXHNveYr
	 Sy0ge7r6recHhsZchoW8qE/bIleG0/B4xFwMimLPhWp+GaLJlXWacbjowLF69fveJU
	 FtMo5JQKJ9XKQj+nILw4eEcs/3phYtzPqLtA4zbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7E4F80564; Thu, 18 May 2023 11:30:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F080F80564;
	Thu, 18 May 2023 11:30:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E4E7F80431; Thu, 18 May 2023 11:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B237F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B237F8025A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 728DF241B5;
	Thu, 18 May 2023 05:30:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZyB-Vzd-00; Thu, 18 May 2023 11:30:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/4] ALSA: emu10k1: simplify interrupt handler, part 2
Date: Thu, 18 May 2023 11:30:45 +0200
Message-Id: <20230518093047.3697887-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518093047.3697887-1-oswald.buddenhagen@gmx.de>
References: <20230518093047.3697887-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 62WD5CVNFSVRNZZW7GABRZYQDI3Z2U2V
X-Message-ID-Hash: 62WD5CVNFSVRNZZW7GABRZYQDI3Z2U2V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62WD5CVNFSVRNZZW7GABRZYQDI3Z2U2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove weird INTE_* clearing code. The bits were a subset of the
actually handled interrupts, which kind of contradicted the stated
purpose. I suppose it would make sense to complete the set and negate
it, but interrupts being enabled out of the blue is neither something
that happens a lot, nor should it result in just one error message, IMO.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/irq.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index 0cb89bd8c16b..312511300053 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -146,26 +146,8 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 		}
 
 		if (status) {
-			unsigned int bits;
 			dev_err(emu->card->dev,
 				"unhandled interrupt: 0x%08x\n", status);
-			//make sure any interrupts we don't handle are disabled:
-			bits = INTE_FXDSPENABLE |
-				INTE_PCIERRORENABLE |
-				INTE_VOLINCRENABLE |
-				INTE_VOLDECRENABLE |
-				INTE_MUTEENABLE |
-				INTE_MICBUFENABLE |
-				INTE_ADCBUFENABLE |
-				INTE_EFXBUFENABLE |
-				INTE_GPSPDIFENABLE |
-				INTE_CDSPDIFENABLE |
-				INTE_INTERVALTIMERENB |
-				INTE_MIDITXENABLE |
-				INTE_MIDIRXENABLE;
-			if (emu->audigy)
-				bits |= INTE_A_MIDITXENABLE2 | INTE_A_MIDIRXENABLE2;
-			snd_emu10k1_intr_disable(emu, bits);
 		}
 		outl(orig_status, emu->port + IPR); /* ack all */
 	}
-- 
2.40.0.152.g15d061e6df

