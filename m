Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9586957A7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 05:00:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38DC420F;
	Tue, 14 Feb 2023 04:59:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38DC420F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676347209;
	bh=eWbcB+iX4LCnyc6pRYigXgULXC+e2Xl50BbSE5+YwDc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RLxEnxfExbP4YB61HKfX8JKIjNiIWIB29aEPsqFxnm1q5lmpAYFlnOepcRE7HLefk
	 IIYMqeIEma8jPQhofK7azkjgToVZkxHVmapKf7AhUVVn0V4CoN9TAyQyAT6tzYpE5a
	 zoNeV703HtCYPLQq3OSXri/tdrMNBnpXL8zsHDjA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E4BF800F0;
	Tue, 14 Feb 2023 04:59:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1665CF8047C; Tue, 14 Feb 2023 04:59:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 69F2EF8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 04:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F2EF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=d5EIozJQ
Received: from andch-XPS-15-9520.. (118-163-61-247.hinet-ip.hinet.net
 [118.163.61.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 06ACA41FD7;
	Tue, 14 Feb 2023 03:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676347141;
	bh=xJrwXvOvxe8komFXsQJneyvX69+3l58+HMj2dD2umuw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=d5EIozJQTXvA3DTiIYR3JsW3zSDnxwHVfqQ2sDWIV2XH95YCcLd1djIQpHa04DSQj
	 1AD9PSmKh3FV7ljziuzXYwAFVWUX/06S396uNSG/HfMny+RySpN80dvs+N5GxXZNdY
	 dFZdXFZY7snBHDNyzZhDyd0EgOoUgDIrYq0HcfDWojYhtBGIZ/DtJ6tVESFWE0qIc/
	 88a8Dafl6LsaqFJhWLkI6jYHDngH6J8LejPfA1ht0M5BRukF0AwdaKLUuCw7ahpng9
	 heShRNCjIXBUlpvvSDt9s5bSW2ASBRKA8lALyvgGFF6FKcYHnqnUopTUYQ6TU6u38h
	 tMo4lX+1fQVfA==
From: Andy Chi <andy.chi@canonical.com>
To: 
Subject: [PATCH 1/2] ALSA: hda/realtek: fix mute/micmute LEDs don't work for a
 HP platform.
Date: Tue, 14 Feb 2023 11:58:51 +0800
Message-Id: <20230214035853.31217-1-andy.chi@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2RDWQ5UG7GPFTGCD5RFAXWMM6LFQDPHQ
X-Message-ID-Hash: 2RDWQ5UG7GPFTGCD5RFAXWMM6LFQDPHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RDWQ5UG7GPFTGCD5RFAXWMM6LFQDPHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a HP platform needs ALC236_FIXUP_HP_GPIO_LED quirk to
make mic-mute/audio-mute working.

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1134a493d225..7b9fb38ff732 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9436,6 +9436,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b5e, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b7d, "HP", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b87, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8a, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8b, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8d, "HP", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.34.1

