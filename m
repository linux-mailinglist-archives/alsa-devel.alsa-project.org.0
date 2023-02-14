Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9016965B8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 15:05:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89517832;
	Tue, 14 Feb 2023 15:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89517832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676383541;
	bh=RN0IGKg75RyuuAItY3VXtlUy/UiOG2QzTLEZNMnbfLo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b/ngsD+509gu2mBlkxzZ7altRtnXZWEu/LPiUco5SQ+qvEl4HcxsArdq+twZEcBM4
	 PNwFz/QpbcIacZm4dA+7d8bxA0CPwVkYsqkRdBOC85qSPetwV4BWShLoKjMXWS3pAG
	 So5foDhfxrdrjX4ccAS6ZdlDXP9yg+VeCvHLzeDg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75471F800F0;
	Tue, 14 Feb 2023 15:04:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C12AF801C0; Tue, 14 Feb 2023 15:04:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1810F800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 15:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1810F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=TT+o/Ohl
Received: from andch-XPS-15-9520.. (1-163-107-120.dynamic-ip.hinet.net
 [1.163.107.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 63B83416DC;
	Tue, 14 Feb 2023 14:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676383482;
	bh=3vW/TOuUOyoNxoCl0gdvqpkN36BLIBSGjQTU1hx8s50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=TT+o/OhlyZCq/jifuByjYCYW5TZZAKIrvmG9+WPwyIKq0JycZxUZAFKmMT9IMtZL6
	 uEnT5smQ3W4HOl1L+ay+ud1URILoVtfNBjCDV7ejVTTLWmmsuct5KAphEsGUggm7It
	 Bdggieu4JM8lV5XxxIyUrN8AiuuLxKL6Q1qZmM8oCzN/2mLU4GiiZjgVyDSPIz7GNX
	 1k+Sv+lz+jPbFhlvH6C6jReJYFxIcPpg3gxtlNMlou8zrt9mYXM7W1YBOYdeGYu6/l
	 K7Oya70M5t4j8BBcmmk6HT4FRrdtwIB/+vIow/44Ie08sqYtD2IuMABixsuJhdhObG
	 2b3n5YiQ+f2TQ==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH v3] ALSA: hda/realtek: Enable mute/micmute LEDs and speaker
 support for HP Laptops
Date: Tue, 14 Feb 2023 22:04:31 +0800
Message-Id: <20230214140432.39654-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87sff88p2c.wl-tiwai@suse.de>
References: <87sff88p2c.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V62RVD6WRJ3U2KQA47RO5AEFTCRBZDNF
X-Message-ID-Hash: V62RVD6WRJ3U2KQA47RO5AEFTCRBZDNF
X-MailFrom: andy.chi@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: andy.chi@canonical.com, Takashi Iwai <tiwai@suse.com>,
 Tim Crawford <tcrawford@system76.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Meng Tang <tangmeng@uniontech.com>, Philipp Jungkamp <p.jungkamp@gmx.net>,
 =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 Yuchi Yang <yangyuchi66@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V62RVD6WRJ3U2KQA47RO5AEFTCRBZDNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On HP Laptops, requires the ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED quirk to
make its audio LEDs and speaker work.

Signed-off-by: Andy Chi <andy.chi@canonical.com>

v3: mentioned that this quirk also fix speaker in commit message
---
 sound/pci/hda/patch_realtek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7b9fb38ff732..e2cd5456f2a6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9432,6 +9432,12 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	 SND_PCI_QUIRK(0x103c, 0x8abb, "HP ZBook Firefly 14 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad1, "HP EliteBook 840 14 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b42, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b43, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b44, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b45, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b46, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b47, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b5d, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.34.1

