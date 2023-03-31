Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE66D1A05
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 10:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 085FE1F9;
	Fri, 31 Mar 2023 10:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 085FE1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680251697;
	bh=bmbqRshF+w9pOxkLee9+BiwRMi+Z84zYwzUzJimG2Yk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=owl7N73OQySQDrH1EjI0DuRnZj5aLJaJKX6DTA9VprsfpB+s5oN2uuZj0mVOctov7
	 iLfE8CQDhIBhqGAfCll7hEgZk63gJDUAzVA8cNu8Vt22cLcGrwY79kVGZ5GC3K6uyw
	 23WJLCet8u/8H8M1l+7qUEsng2DedrZlrH0WpE/I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83AD9F8024E;
	Fri, 31 Mar 2023 10:34:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65162F80272; Fri, 31 Mar 2023 10:34:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B5C6BF800C9
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 10:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C6BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=MB8T8L0q
Received: from localhost.localdomain (unknown [10.101.197.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 4EC7741107;
	Fri, 31 Mar 2023 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1680251633;
	bh=CFI6XYPgXWFJDkGaTH1np9tV4dr9XEncgVShoI4JTjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=MB8T8L0q/1Pp5HWEEhDuygPQ4oO5c1naFiWTgEAnZgNpvM6b5zwrIXkKtMMg6lndV
	 hsi0CUAoZG1cZX/5QVnfyWIs6zKaOyWLXyckHKEqZpBACTXhpLdl3K2fQHQHIKSiI+
	 e9HAcERPwpg7n0+aqgP0l+kZhasSdr3gNHTsS7dlDFFSOrPCXQ9io0c1sxWf+OV9Bp
	 CnVdJDEvWk/oJN/Bx8mWPxVkKYYjC81iokddy1lRvmtDpySNFxtIIh98W0GyBhjubO
	 iUFsX/aEno0aNCBnRea2hj1hQMn0EEAEl+6fgfe0OfP401B5JO07Sjam/Rfcih1QJ9
	 AKtqa44ty0WGg==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
Date: Fri, 31 Mar 2023 16:32:41 +0800
Message-Id: <20230331083242.58416-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NCTKWQE2EWMBR42ZHC546HZCTDF6X54Z
X-Message-ID-Hash: NCTKWQE2EWMBR42ZHC546HZCTDF6X54Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCTKWQE2EWMBR42ZHC546HZCTDF6X54Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a HP ProBook which using ALC236 codec and need the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk to make mute LED and
micmute LED work.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b501f9489fc1..d5d8e33f2e20 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9443,6 +9443,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b47, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b5d, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8b66, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b7d, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b87, "HP", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.34.1

