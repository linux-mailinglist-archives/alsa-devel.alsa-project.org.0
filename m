Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310176FE288
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 18:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999611092;
	Wed, 10 May 2023 18:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999611092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683736342;
	bh=1+EDvRnZqRM9CDPvvy5rJjN4BrYGjAPrdf5efgSiKp0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rzQYkUyR+gXLrT1h8wZMLS15TgKbU8UJ/uVZm2w8752gozH7l2PZ9ImkkRz1R5IFg
	 R5YULducFGP00vZPSmaoHJkvD0Hb/Yvlur4RHezbAYHvIm+zLmC3iTNjOYUgaFAMRo
	 wFSLl5CM0FwRpwPJDiwya5GLabnYzzeuSRGLth4s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A9A4F80534;
	Wed, 10 May 2023 18:31:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C8CF80310; Wed, 10 May 2023 18:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDC8CF804B1
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 18:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC8CF804B1
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3DCF624172;
	Wed, 10 May 2023 12:29:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwmh5-r3O-00; Wed, 10 May 2023 18:29:35 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: emu10k1: merge common paths in
 snd_emu10k1_ptr_{read,write}()
Date: Wed, 10 May 2023 18:29:34 +0200
Message-Id: <20230510162935.3063854-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510162935.3063854-1-oswald.buddenhagen@gmx.de>
References: <20230510162935.3063854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OKGFVHRMN7GV4YFSGXDYR3M3UIZQ62LO
X-Message-ID-Hash: OKGFVHRMN7GV4YFSGXDYR3M3UIZQ62LO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKGFVHRMN7GV4YFSGXDYR3M3UIZQ62LO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Avoids some code duplication.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/io.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index ced69165d69a..2d6bbb77c961 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -40,24 +40,20 @@ unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, un
 	if (!check_ptr_reg(emu, regptr))
 		return 0;
 
+	spin_lock_irqsave(&emu->emu_lock, flags);
+	outl(regptr, emu->port + PTR);
+	val = inl(emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
+
 	if (reg & 0xff000000) {
 		unsigned char size, offset;
 		
 		size = (reg >> 24) & 0x3f;
 		offset = (reg >> 16) & 0x1f;
 		mask = ((1 << size) - 1) << offset;
 		
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		val = inl(emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
-		
 		return (val & mask) >> offset;
 	} else {
-		spin_lock_irqsave(&emu->emu_lock, flags);
-		outl(regptr, emu->port + PTR);
-		val = inl(emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
 		return val;
 	}
 }
@@ -88,14 +84,12 @@ void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned i
 		spin_lock_irqsave(&emu->emu_lock, flags);
 		outl(regptr, emu->port + PTR);
 		data |= inl(emu->port + DATA) & ~mask;
-		outl(data, emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);		
 	} else {
 		spin_lock_irqsave(&emu->emu_lock, flags);
 		outl(regptr, emu->port + PTR);
-		outl(data, emu->port + DATA);
-		spin_unlock_irqrestore(&emu->emu_lock, flags);
 	}
+	outl(data, emu->port + DATA);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
 
 EXPORT_SYMBOL(snd_emu10k1_ptr_write);
-- 
2.40.0.152.g15d061e6df

