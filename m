Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1B707CE5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A661F9;
	Thu, 18 May 2023 11:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A661F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684402305;
	bh=71FQ8uMWqXwR4whOfPL5ACsTxATZROJwqc5lo7Fn7Ng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OhQCbfIER3o/9m9fvO19WBc0ujnYmUJpTL9/V7pyQteSNljpQTVoWQAW0eLFA3noa
	 3Iau+Bc1e/btoUQVw5a1+uCDjfCQTfA30hjYAl2uxpkHVG/hpj9QSguQQjt2gRq44f
	 hdlN1BxgrnLTSVX8Z1XRPsD48qau62z6odsVyI3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 112B1F8016A; Thu, 18 May 2023 11:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84933F8016A;
	Thu, 18 May 2023 11:30:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F296F8053D; Thu, 18 May 2023 11:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91C72F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C72F80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 74895241CA;
	Thu, 18 May 2023 05:30:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZyB-Vzj-00; Thu, 18 May 2023 11:30:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/4] ALSA: emu10k1: simplify interrupt handler, part 3
Date: Thu, 18 May 2023 11:30:46 +0200
Message-Id: <20230518093047.3697887-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518093047.3697887-1-oswald.buddenhagen@gmx.de>
References: <20230518093047.3697887-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LF7XUCI3UM7Y2QSV7FT63HCP6IVY37CA
X-Message-ID-Hash: LF7XUCI3UM7Y2QSV7FT63HCP6IVY37CA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LF7XUCI3UM7Y2QSV7FT63HCP6IVY37CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Handle the "timeout" (actually the retry counter) such that it's more
obvious and causes less cost in the normal case.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/irq.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/pci/emu10k1/irq.c b/sound/pci/emu10k1/irq.c
index 312511300053..7dc803aaa850 100644
--- a/sound/pci/emu10k1/irq.c
+++ b/sound/pci/emu10k1/irq.c
@@ -22,15 +22,18 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 	int handled = 0;
 	int timeout = 0;
 
-	while (((status = inl(emu->port + IPR)) != 0) && (timeout < 1000)) {
-		timeout++;
-		orig_status = status;
+	while ((status = inl(emu->port + IPR)) != 0) {
 		handled = 1;
 		if ((status & 0xffffffff) == 0xffffffff) {
 			dev_info(emu->card->dev,
 				 "Suspected sound card removal\n");
 			break;
 		}
+		if (++timeout == 1000) {
+			dev_info(emu->card->dev, "emu10k1 irq routine failure\n");
+			break;
+		}
+		orig_status = status;
 		if (status & IPR_PCIERROR) {
 			dev_err(emu->card->dev, "interrupt: PCI error\n");
 			snd_emu10k1_intr_disable(emu, INTE_PCIERRORENABLE);
@@ -151,8 +154,6 @@ irqreturn_t snd_emu10k1_interrupt(int irq, void *dev_id)
 		}
 		outl(orig_status, emu->port + IPR); /* ack all */
 	}
-	if (timeout == 1000)
-		dev_info(emu->card->dev, "emu10k1 irq routine failure\n");
 
 	return IRQ_RETVAL(handled);
 }
-- 
2.40.0.152.g15d061e6df

