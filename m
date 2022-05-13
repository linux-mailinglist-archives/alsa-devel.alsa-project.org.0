Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438AA5261AC
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 14:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D043B174D;
	Fri, 13 May 2022 14:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D043B174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652444293;
	bh=y+jVJopxfeH6pubBjYqQ+L5dOn4O0Cmps1Ehy6vtsmI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jCV6U1GrJaYB1TLOpQ19k45uRxYRJRXKPOt6+G+IEytixAm+OK/WolbduXuSqTogx
	 86M+kmMtKtnRnUj8SbC0HoK/lPOm5k9LNbjFrYgafilDfdDlSVf8tlYy+KSc5GGH7S
	 8snnanFj152wsnHNw9sj8XAmp+q5BLNsap/vWr4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34056F8025E;
	Fri, 13 May 2022 14:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1439F80083; Fri, 13 May 2022 14:17:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4CAF80083
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 14:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4CAF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="uOBgy7or"
Received: from localhost.localdomain (36-224-20-13.dynamic-ip.hinet.net
 [36.224.20.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id AC8B140EA3; 
 Fri, 13 May 2022 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1652444219;
 bh=zpPamNIe5x7qFXF/OVnZBnuSxsglTL0lZevhE7aPyP0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=uOBgy7oruCX+Q3UEOLr5T167LksjkHajySIkHNDNDAwx0FcBUuDY1iA9Qg8c8Ebuo
 3KYzzXjQv+uFDI4X/cKRruHTs3qbtQyOB7P99ItqeKCwuGtiAdY/gwmoNxnukwFG9X
 pCrYgSz6GhfYFhrvKHjPcw4FLhCGmgC4kAIkCLJ5dVwg5Nbn45YFJIullolOq3P+H5
 wcFNdKxjBjqKh1XDYnqzcZYp/EBlM7HEmKseFy0upGPK9V/amFUe1axVwG+KYJrS4s
 4alRJBppRpI7hShEL2PwEb08gLpXTPOieaDcsjjczuDmv7OP1ARH9tahbfLQfbl/37
 R6b9AlnQr/e1Q==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for
 HP machine
Date: Fri, 13 May 2022 20:16:45 +0800
Message-Id: <20220513121648.28584-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, andy.chi@canonical.com,
 Cameron Berkenpas <cam@neo-zeon.de>, Yong Wu <yong.wu@mediatek.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

* The HP EliteBook 630 is using ALC236 codec which used 0x02 to control mute LED
  and 0x01 to control micmute LED. Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 33c439578a61..3a1500e487eb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9091,6 +9091,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8995, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x89a4, "HP ProBook 440 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89a6, "HP ProBook 450 G9", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89aa, "HP EliteBook 630 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ac, "HP EliteBook 640 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ae, "HP EliteBook 650 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c3, "Zbook Studio G9", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
-- 
2.25.1

