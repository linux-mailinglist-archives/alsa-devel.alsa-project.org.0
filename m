Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7A68D17A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 09:32:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF86F832;
	Tue,  7 Feb 2023 09:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF86F832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675758735;
	bh=oBXBvOXk3wOERFeUI3KqXN5jvBrlSly8gjeBLoQh8aQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HBTz78DtVNW6InDE4I1596dCRcSiMQFmz+ew+f8xKEYh/aLzPDbxganzgTzxGLWsD
	 0gW3HlYcVXde6b56f4U34UBu+ofxbtzEpmbq9Hxv65HQ+2jSxy07fd3UFH3vMFvWu9
	 MFk64/dykm5RSEskaOb1UDXlFHO52DXoKtb6wcbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2BF0F804AA;
	Tue,  7 Feb 2023 09:31:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C40F8045D; Tue,  7 Feb 2023 09:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 352AFF8014C
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 09:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 352AFF8014C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=AOGLN2M5
Received: from localhost.localdomain (unknown [10.101.197.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0425D428D4; 
 Tue,  7 Feb 2023 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1675758661;
 bh=RX8W3mFnoYHX95Y8s7hMAv7+ZHWXmRl7KuYFA5MlRDY=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=AOGLN2M5Ni06I7JCK+xzYUqtS38r+SuE5bCXX6mWylwZ6n5CieOUTkexGOiuiFlDd
 JRmihm4od3jkpJY5uKHuVvfHn324Lz7va8bM7dzg0VIsWBteprxCN8cNqes7V9Khot
 8Ps/JyL4ov8h+dg7KxWXwTmvfbA0cq2HPHTxJEE/5u67Qwj17818OOSzQ8mT6PC0zs
 J1sZp9z+hgatpWlTuPMzJziZXqviUiwaTSCLvPKKKE6HecRQESJU6F7jLekQL8bqXh
 6XG1oK9UM4CAYh2KQkGQ+ocbTcyk1qKLfSwnCAJdZkBMKggAI7AdJqcY2U6v++S8Uz
 oxbL6e/D2awhw==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for a HP
 platform.
Date: Tue,  7 Feb 2023 16:30:09 +0800
Message-Id: <20230207083011.100189-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, Yuchi Yang <yangyuchi66@gmail.com>,
 Meng Tang <tangmeng@uniontech.com>, Philipp Jungkamp <p.jungkamp@gmx.net>,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tim Crawford <tcrawford@system76.com>, andy.chi@canonical.com,
 =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is a HP platform needs ALC236_FIXUP_HP_GPIO_LED quirk to
make mic-mute/audio-mute working.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4055a8f5880a..d1258dd803e8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9433,6 +9433,11 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b5d, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b7d, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b8a, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b8b, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b8d, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-- 
2.34.1

