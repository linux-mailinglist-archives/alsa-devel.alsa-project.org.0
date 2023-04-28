Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAA36F14EE
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:04:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A74EE129B;
	Fri, 28 Apr 2023 12:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A74EE129B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676247;
	bh=T3AELtq9YvC737e4vAJl6gnN4OoWEK3QiBjl6YviC90=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vqn9qhn0H0qr10OLGYxKlaUuWwW3Yr3a6yaZJh1ZCltTSangw3UWJAtwmyzmgtiht
	 JV31IJ/YABiwiriFrDJv+tjAlKOX3B+TpF3x0cPuxJ8spD/PhER2KN7cyRxCpsUlZL
	 90SDf7Aj9W14NQmVG59DK0E1yhIH1jB3pDcAr2nE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EDCF80236;
	Fri, 28 Apr 2023 12:03:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6539F8025E; Fri, 28 Apr 2023 12:03:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29D3BF8032B
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D3BF8032B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C9BBD2422D;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9t9-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ALSA: emu10k1: use the right lock in
 snd_emu10k1_shared_spdif_put()
Date: Fri, 28 Apr 2023 11:59:38 +0200
Message-Id: <20230428095941.1706278-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
References: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LVRWUHQEUF7CF4EK3Y4OT5ZVRQJGDK3M
X-Message-ID-Hash: LVRWUHQEUF7CF4EK3Y4OT5ZVRQJGDK3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVRWUHQEUF7CF4EK3Y4OT5ZVRQJGDK3M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The function does read-modify-write cycles on the card's registers, and
doesn't access mutable members of the emu data structure.

I suppose this might have been a mixup due to the lock names being
logically swapped.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 3ebc7c36a444..24052f17d81c 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1654,7 +1654,7 @@ static int snd_emu10k1_shared_spdif_put(struct snd_kcontrol *kcontrol,
 	sw = ucontrol->value.integer.value[0];
 	if (emu->card_capabilities->invert_shared_spdif)
 		sw = !sw;
-	spin_lock_irqsave(&emu->reg_lock, flags);
+	spin_lock_irqsave(&emu->emu_lock, flags);
 	if ( emu->card_capabilities->i2c_adc) {
 		/* Do nothing for Audigy 2 ZS Notebook */
 	} else if (emu->audigy) {
@@ -1675,7 +1675,7 @@ static int snd_emu10k1_shared_spdif_put(struct snd_kcontrol *kcontrol,
 		reg |= val;
 		outl(reg | val, emu->port + HCFG);
 	}
-	spin_unlock_irqrestore(&emu->reg_lock, flags);
+	spin_unlock_irqrestore(&emu->emu_lock, flags);
 	return change;
 }
 
-- 
2.40.0.152.g15d061e6df

