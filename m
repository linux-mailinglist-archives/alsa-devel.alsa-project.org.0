Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515BD4D86E7
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 15:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3CF175C;
	Mon, 14 Mar 2022 15:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3CF175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647267871;
	bh=m0J3jP/1oFF8EQXdjMj+N0aJGWOkbTKiawH2Yd11FM8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ODsA7plQlwplxBY+mG1J7EQe2kUDu8vUliufutwvvJDsLeJpnXCDDhvjVcBmxoPvt
	 O4H86v6jCyYScjasFvw2JUXK26/RB3sKC7hBnl1BVOJR6TIgFiSnqlpt3Pqnm0iWbs
	 wrz0VqRNFNhg9xU34zOK1uWdEuThdUvOsNGPL+OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A903FF8011C;
	Mon, 14 Mar 2022 15:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D09F80139; Mon, 14 Mar 2022 15:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0501BF8011C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 15:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0501BF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="m6AFUwQG"
Received: from localhost.localdomain (unknown [10.101.197.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 573663F7E1; 
 Mon, 14 Mar 2022 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647267791;
 bh=dYP9n+9ZiLQtINhhSZR+LCQtgVyYHHqH/JL5P9eptWA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=m6AFUwQGWaBaGC+cdpSpajath+yktgZlTUEC9UMrSq26IIRj5EOcgVwC47Cyx9pGv
 7IySM5xswIv8Hy1OfIqpGOO4ZviewW9315zLKX9yKG6NR023rwUfNyfQNDeDxuj9hC
 J8V7s0rqYfUt8ITwdCVb2eoWyCCwMttbcG4OJ5FyeEsFFgqTmHS3j6vWDEZlBPE7Xp
 On0RjeNTD2Vh3ykWYaLMvEChH05lyUs9dbrB8vAzEzbwddbu+4ZfuuXszho8bc8gGZ
 HYZJes9g3WIlOxDIRgJgoioDN3+bjhe7E2UbXV4Zd4GNJ6kvkZcrA9evSk0QPHgGaZ
 S5bWVXRZ3DTzQ==
From: Andy Chi <andy.chi@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Hui Wang <hui.wang@canonical.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Cameron Berkenpas <cam@neo-zeon.de>, Kailang Yang <kailang@realtek.com>,
 Sami Loone <sami@loone.fi>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix right sounds and mute/micmute LEDs for
 HP machines
Date: Mon, 14 Mar 2022 22:21:19 +0800
Message-Id: <20220314142122.71602-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: andy.chi@canonical.com
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

* The HP ProBook 440/450 and EliteBook 640/650 are
  using ALC236 codec which used 0x02 to control mute LED
  and 0x01 to control micmute LED. Therefore, add a quirk to make it works.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c34b4888978b..4650ef9110d6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9017,6 +9017,10 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8992, "HP EliteBook 845 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8994, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8995, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x89a4, "HP ProBook 440 G9", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89a6, "HP ProBook 450 G9", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89ac, "HP EliteBook 640 G9", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89ae, "HP EliteBook 650 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c3, "Zbook Studio G9", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
-- 
2.25.1

