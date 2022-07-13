Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D758572B4F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 04:28:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DFEC16DF;
	Wed, 13 Jul 2022 04:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DFEC16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657679325;
	bh=Y1himRsvNVmW5zMXGm2J9nY1y6a5CWaIRCaWIR1ScNA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VjYp2M6RoWMc08GRRrNR2VHgRv9pUbcBfd5nCYZTWvquqN12HOtbROFXgrdrTJHJz
	 +UW8GumDus1Mg+HPgJgdZGYSa7CH/SvdglmcQjgtO6RaiUlBE8icM5A76z+8U2UPb2
	 taS1r1GdcuCxbWlrkBQ0wK3BodTkTG+oRAVA2dNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2E7F80254;
	Wed, 13 Jul 2022 04:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A85D3F80249; Wed, 13 Jul 2022 04:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AD50F800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 04:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD50F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="mL8hyRcy"
Received: from localhost (36-226-173-138.dynamic-ip.hinet.net [36.226.173.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id B2D6B3F1AC; 
 Wed, 13 Jul 2022 02:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1657679255;
 bh=6wuZ+KJ616kYQkmRxbOA3+CCdrb1zXoGEni8dF7l4O4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=mL8hyRcyidq5YODYmV9SELRw2Ols5ehCwaQVqqTX2IAQQxTdlLPd0X/MXU9R9W9CG
 R+qeenl11EtvGBCmJam59OkCsJtZCambyMUPn1DOOJbJ/6W3u9RhZ9p3ynm2SsQofm
 K4TYb2JNDhT3zPtXOI+1sLI6UjJY5DOutrn4OcOHLpu+rruKnOaAOvdWZkKELFkCBb
 53WOx0V7wxfB3kTNNVhDmgcJ40yP98szoI/O+WE7VvsL2FqmoWrgh14g7mjz61n6Kn
 WWzaw7wPNI71Fr9Bl0J6JlyMWGa+OiiAUlD8Ve0x1Z2oZGNwggIEWxY3qAKVxyvy+O
 cSMOpyiBCwAew==
From: Jeremy Szu <jeremy.szu@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP machines
Date: Wed, 13 Jul 2022 10:27:04 +0800
Message-Id: <20220713022706.22892-1-jeremy.szu@canonical.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 Kailang Yang <kailang@realtek.com>, open list <linux-kernel@vger.kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Tim Crawford <tcrawford@system76.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Andy Chi <andy.chi@canonical.com>,
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

 * The HP ProBook 440/450 G9 and EliteBook 640/650 G9 have multiple
 motherboard design and they are using different subsystem ID of audio
 codec. Add the same quirk for other MBs.

Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 007dd8b5e1f2..483c5f49af5d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9096,6 +9096,10 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8aab, "HP EliteBook 650 G9 (MB 8AA9)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.25.1

