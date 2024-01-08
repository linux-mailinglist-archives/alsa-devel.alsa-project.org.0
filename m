Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F5827502
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69E2E68;
	Mon,  8 Jan 2024 17:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69E2E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704731062;
	bh=Y8lHlQjUepn0WOMp8xWNS5lS2RAFFxeSEYjkMCew2bo=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dgdT/OSyeb5ZbLQJ3/kH+JeaF0syZ9ZiJN/9JRZpg3hIqj905doo+jPz2pzISp/At
	 kn8oQwuI7jpjwR4iqFUE7l04JzqR/KF4TJpVSPXdkpBJ6a4BTnWmTX/CIVEMSCktyP
	 DpKgMcRovVvbEG/jmcWG1UZIX1BLVw/n3o992W+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8CF7F80588; Mon,  8 Jan 2024 17:22:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C79F805AE;
	Mon,  8 Jan 2024 17:22:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D0DF80254; Mon,  8 Jan 2024 16:15:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.catboys.cloud (mail.catboys.cloud [185.233.107.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8022AF8014B
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 16:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8022AF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=catboys.cloud header.i=@catboys.cloud
 header.a=rsa-sha256 header.s=dkim header.b=J/wBtsoX
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BEDE2C0B01;
	Mon,  8 Jan 2024 16:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catboys.cloud;
	s=dkim; t=1704726924;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=XYe40yUbAp9wLca9aCV+041knviU6Ai80qscE96Dorg=;
	b=J/wBtsoXaj7CU2Ph0PGKCYixSirM1JW/q/M1Fip+0ph9jIjSN4ELaiMZHdoLk/ZriUvwW5
	xsmfrOzhfQhCz0HUcSz5H6mhaf7Z+mGkjX2Lp5GQNfMvQweuAJz0hu/67rxZL03lrMs8LL
	iNTo/Ln/cQ612XdqDJ+vuK8YkdlqZxFj+Aq5r7BT1VH7wzpI1tJcEPj9dSfjF5zzIAjgNv
	4ATgArHCqrsKg3ciOkyuWHDXoLRn8utaXFN/+y0uG4OOM8qpEjEzDOj6/jgirLxACve0lc
	j2wb77ehjOMkCziB40k7er5phPVUBIIDkT6uG1YNlAGVqZWS8RT6K3kzOm+wpw==
Message-ID: <651b26e9-e86b-45dd-aa90-3e43d6b99823@catboys.cloud>
Date: Mon, 8 Jan 2024 16:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tom Jason Schwanke <tom@catboys.cloud>
Subject: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy
 X360 13-ay0xxx
To: perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: tom@catboys.cloud
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YOYNBJJY2ZKMCMW6DTSZ7LEKOA7TDLMQ
X-Message-ID-Hash: YOYNBJJY2ZKMCMW6DTSZ7LEKOA7TDLMQ
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:22:21 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOYNBJJY2ZKMCMW6DTSZ7LEKOA7TDLMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This enables the mute and mic-mute LEDs on the HP Envy X360 13-ay0xxx convertibles.
The quirk 'ALC245_FIXUP_HP_X360_MUTE_LEDS' already exists and is now enabled for this device.
Fixes https://bugzilla.kernel.org/show_bug.cgi?id=216197

Signed-off-by: Tom Jason Schwanke <tom@catboys.cloud>
---
  sound/pci/hda/patch_realtek.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1dcfba27e075..475d7e843ed3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9875,6 +9875,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
         SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
         SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
         SND_PCI_QUIRK(0x103c, 0x887a, "HP Laptop 15s-eq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+       SND_PCI_QUIRK(0x103c, 0x876E, "HP ENVY x360 Convertible 13-ay0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
         SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
         SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
         SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
---

