Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 822096E88F3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 06:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D8BEF8;
	Thu, 20 Apr 2023 06:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D8BEF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681963363;
	bh=uuhzrTnvgbOU5pyJQV1q8HrODPrrk642mhVJE/oU7X4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WQn8k/wZizO0U/GTRzSrqL3+gYEjD/99moInJV3MnwubrungDO6it86iPnABU9NfJ
	 O4RcEG5evB4PTIo5PToxvJQB/xQHHMGiKV1XEpWIdXvwgA4uOHlvxgQ+IaI46aOq4n
	 XPrgV/dGfxtcYvXGN4nY95X2KOadCniB/gJ1iXF8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87ED4F80053;
	Thu, 20 Apr 2023 06:01:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3E9F80155; Thu, 20 Apr 2023 06:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 051D6F80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 06:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 051D6F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=nJosSvyi
Received: from localhost.localdomain (unknown [10.101.197.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 217653F316;
	Thu, 20 Apr 2023 04:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681963238;
	bh=6psH63ArG4D9FynqWeATpwYr+6b6TwPtAyy9U4Y/MVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=nJosSvyiADnqBSsZ0RcHN9j6XHf49O7SLqyYxQAn287DJHDHIRJyrSA8UFpwqGIXF
	 hFppOPz/9RWkPLQRdXv1YhDhwCoEYeUpHgnqeRiXorNb4dICR7oZg5gvlY0eGaJkj+
	 37wlplSSachkmZwKOto+tTXfIOeZ8GKkiFtuc0Y44SWPJ8ICUejRWt5Fg1VF034S4X
	 u51OMv790rw4axbOiMdfh+eimgGrJqLe2mpzrWkTTgY3w96cgHaSms85c+JC5YNu5F
	 +NN5UstTGEQzKEvw6MAtKzCl5LSjWTgarXqRsd4Xo6jfAXkg82wB/QVjtMhCC/zE7S
	 hB+UHTJUmfjug==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
Date: Thu, 20 Apr 2023 11:59:41 +0800
Message-Id: <20230420035942.66817-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5NIDXTGETP2QLBVGNZUOZVUSVYZF3EPL
X-Message-ID-Hash: 5NIDXTGETP2QLBVGNZUOZVUSVYZF3EPL
X-MailFrom: andy.chi@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: andy.chi@canonical.com, Takashi Iwai <tiwai@suse.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Tim Crawford <tcrawford@system76.com>, Meng Tang <tangmeng@uniontech.com>,
 Philipp Jungkamp <p.jungkamp@gmx.net>,
 =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 Gabriele Mazzotta <gabriele.mzt@gmail.com>,
 Yuchi Yang <yangyuchi66@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NIDXTGETP2QLBVGNZUOZVUSVYZF3EPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a HP ProBook 455 G10 which using ALC236 codec and need the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk to make mute LED and
micmute LED work.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6a6c72b5ea26..f70d6a33421d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9468,6 +9468,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b47, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b5d, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8b65, "HP ProBook 455 15.6 inch G10 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b66, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b7d, "HP", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.34.1

