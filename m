Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0408309F5
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 16:43:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3DE7F4;
	Wed, 17 Jan 2024 16:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3DE7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705506190;
	bh=PIaNYP7tKeLz3DbZoaeyg/wZV1PgwT/q0h8pnJkFj8A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IFVUYF279C1fG+PjDQi23v5KOyYqUQKltolmsFJWQThFZ0Nktx7lufRPSwzddb+Nh
	 3TM/R32tb37FMIbUMkuUTRanNcB3fyvtoYLYacUlwqmGKbYbjXOnI1y8adlrlL18mB
	 i7lhojoBg7c7BYW+KuBU69+wmspaJRzOJY2MG2bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE253F80563; Wed, 17 Jan 2024 16:42:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B69DF80520;
	Wed, 17 Jan 2024 16:42:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09FABF801F5; Wed, 17 Jan 2024 16:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5625BF800F5
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 16:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5625BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=SksRX1d6
Received: from localhost.localdomain (2.general.binli.uk.vpn [10.172.193.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E5AEB3F6E1;
	Wed, 17 Jan 2024 15:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1705506144;
	bh=AoyQYoWLWFR0VSl3BzntiZASNvn8wxYLWDvkVYPdumk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=SksRX1d69ZG1ixWKGjJKDZYVQsvJqjcTlUJf3ldGK0f/uTHYrjw7ClcTe2BOy/Mzh
	 5TCQmwIo83Tl/bYTFqnfNL/wRzRDUOepYLeAV5yZRPzvdSs3FxCi8Sxa1z8x4EjzQg
	 sdEQqzh2swiWeQY59FW7osBZwctZF6C1PBFy9rOTaviunRAxmiVFHny1ZiyHP5a8u4
	 6hwGOfzjLrkcJzmR27er98UOdUIof/VzochhSXS/fVU7XoNbXfVYK1R3MA5gY3TC+s
	 ec6/h+9XVrvt6vqX8oefoEDtVHtW+uuhWP9q4eez6na80B1HYjT2zNZ4/Hk6zx1ngT
	 6SWcRxPwyB2KQ==
From: Bin Li <bin.li@canonical.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	aaron.ma@canonical.com,
	libin.charles@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic on Lenovo M70 Gen5
Date: Wed, 17 Jan 2024 23:41:23 +0800
Message-Id: <20240117154123.21578-1-bin.li@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UHGDQNZWPJ526G6ETI3WA63V2D4ZMV2C
X-Message-ID-Hash: UHGDQNZWPJ526G6ETI3WA63V2D4ZMV2C
X-MailFrom: bin.li@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHGDQNZWPJ526G6ETI3WA63V2D4ZMV2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lenovo M70 Gen5 is equipped with ALC623, and it needs
ALC283_FIXUP_HEADSET_MIC quirk to make its headset mic work.

Signed-off-by: Bin Li <bin.li@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b68c94757051..7057e888d373 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10231,6 +10231,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
+	SND_PCI_QUIRK(0x17aa, 0x334b, "Lenovo ThinkCentre M70 Gen5", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
-- 
2.34.1

