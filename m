Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB76FE287
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 18:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD39108C;
	Wed, 10 May 2023 18:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD39108C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683736341;
	bh=o+c/IuVOAOhEMt8L10BL9HHf/K7zbUffp4vvMVAE1ZI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IV1SqSRdJ6UKF2A6YjoPpTafJfUPc/RKSKqrUvvwtHcN7C51f7oC8RwUva4e9rtx8
	 rQKHuGn1VWKle7pmqo6vX4W6RUuBiAgOGL1O2lbTqwPPCq4isy1OUq8Gz3ZmBliFE5
	 T3nIyhSsfVnzx4qwqfHQDRc53ESDPZNwOWkChe8A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CC2F802E8;
	Wed, 10 May 2023 18:31:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59323F80534; Wed, 10 May 2023 18:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4A59F8052E
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 18:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4A59F8052E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3B11B2413E;
	Wed, 10 May 2023 12:29:36 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwmh5-r3I-00; Wed, 10 May 2023 18:29:35 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: emu10k1: validate parameters of
 snd_emu10k1_ptr_{read,write}()
Date: Wed, 10 May 2023 18:29:33 +0200
Message-Id: <20230510162935.3063854-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510162935.3063854-1-oswald.buddenhagen@gmx.de>
References: <20230510162935.3063854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5467AHDQQ5CYLKTDIHLLPZZLDZAEWFT6
X-Message-ID-Hash: 5467AHDQQ5CYLKTDIHLLPZZLDZAEWFT6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5467AHDQQ5CYLKTDIHLLPZZLDZAEWFT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rather than applying masks to the provided values, make assertions
about them being valid - otherwise we'd just try to paper over bugs.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/io.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index aee84c3f9f37..ced69165d69a 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -18,14 +18,27 @@
 #include <linux/export.h>
 #include "p17v.h"
 
+static inline bool check_ptr_reg(struct snd_emu10k1 *emu, unsigned int reg)
+{
+	if (snd_BUG_ON(!emu))
+		return false;
+	if (snd_BUG_ON(reg & (emu->audigy ? (0xffff0000 & ~A_PTR_ADDRESS_MASK)
+					  : (0xffff0000 & ~PTR_ADDRESS_MASK))))
+		return false;
+	if (snd_BUG_ON(reg & 0x0000ffff & ~PTR_CHANNELNUM_MASK))
+		return false;
+	return true;
+}
+
 unsigned int snd_emu10k1_ptr_read(struct snd_emu10k1 * emu, unsigned int reg, unsigned int chn)
 {
 	unsigned long flags;
 	unsigned int regptr, val;
 	unsigned int mask;
 
-	mask = emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK;
-	regptr = ((reg << 16) & mask) | (chn & PTR_CHANNELNUM_MASK);
+	regptr = (reg << 16) | chn;
+	if (!check_ptr_reg(emu, regptr))
+		return 0;
 
 	if (reg & 0xff000000) {
 		unsigned char size, offset;
@@ -57,18 +70,20 @@ void snd_emu10k1_ptr_write(struct snd_emu10k1 *emu, unsigned int reg, unsigned i
 	unsigned long flags;
 	unsigned int mask;
 
-	if (snd_BUG_ON(!emu))
+	regptr = (reg << 16) | chn;
+	if (!check_ptr_reg(emu, regptr))
 		return;
-	mask = emu->audigy ? A_PTR_ADDRESS_MASK : PTR_ADDRESS_MASK;
-	regptr = ((reg << 16) & mask) | (chn & PTR_CHANNELNUM_MASK);
 
 	if (reg & 0xff000000) {
 		unsigned char size, offset;
 
 		size = (reg >> 24) & 0x3f;
 		offset = (reg >> 16) & 0x1f;
-		mask = ((1 << size) - 1) << offset;
-		data = (data << offset) & mask;
+		mask = (1 << size) - 1;
+		if (snd_BUG_ON(data & ~mask))
+			return;
+		mask <<= offset;
+		data <<= offset;
 
 		spin_lock_irqsave(&emu->emu_lock, flags);
 		outl(regptr, emu->port + PTR);
-- 
2.40.0.152.g15d061e6df

