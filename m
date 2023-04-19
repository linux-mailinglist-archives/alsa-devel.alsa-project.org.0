Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B076E74B9
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 10:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92AD5E87;
	Wed, 19 Apr 2023 10:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92AD5E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681891957;
	bh=hzc5UrSfqfxD0aPSexpYRZ9+fx5RczNkBFzur84KmJ0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H4bb89upjfnFfkwuMUYe00oLUEkEZiIiZ6afS4gkaQAmXRuucvVg6XfbDihyXq1gT
	 XyN/ac5T8WtrdCKdvVr8/91guLgx8LPRgvhgkwwnBaLrmiFgTWMgxTdCbLm2dzvois
	 Bs5dJe7NZfbAlj3OlKHD/z4ewI9jlS494ffHDt2I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0178AF80149;
	Wed, 19 Apr 2023 10:11:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A12EF80155; Wed, 19 Apr 2023 10:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABDF1F800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 10:11:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2C32A11F1;
	Wed, 19 Apr 2023 10:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2C32A11F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681891898; bh=nMBtE/2in5skHYfX4Jg58kLHlrkpqZnR9Mt5MHdatGg=;
	h=From:To:Cc:Subject:Date:From;
	b=xmnZYDt32aqAzEP3Kzs3ySUijO8nToGHc7fSPz/XazlmeceB4apC7tEjBhL2ZPm9n
	 9txHlTjaIQg5+RfLM6cmUw9R/zlTXY831gWv2w8C8vjlC3IitwwHvn8r+FR+ddsF1o
	 SDJkN8DWOY+6GW+PbYJrZk2NmIniLTTWD1I3u1N4=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 19 Apr 2023 10:11:35 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/realtek: Remove specific patch for Dell Precision
 3260
Date: Wed, 19 Apr 2023 10:11:21 +0200
Message-Id: <20230419081121.304846-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PSAYTFZMHI4FVA5QYJEWVUWRE7O7FXKQ
X-Message-ID-Hash: PSAYTFZMHI4FVA5QYJEWVUWRE7O7FXKQ
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSAYTFZMHI4FVA5QYJEWVUWRE7O7FXKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Unfortunately, the tester gave a weak feedback (working/non-working) for
this case. After the double confirmation, this change is not really required.
The standard code with alc269_fallback_pin_fixup_tbl should work on this
hardware.

Fixes: 5911d78fabbb ("ALSA: hda/realtek: Improve support for Dell Precision 3260")
Fixes: 5f4efc9dfcfd ("ALSA: hda/realtek: Fix support for Dell Precision 3260")
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_realtek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 26187f5d56b5..50b8573b5206 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9263,7 +9263,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a62, "Dell Precision 5560", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1028, 0x0ac9, "Dell Precision 3260", ALC283_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
-- 
2.39.2

