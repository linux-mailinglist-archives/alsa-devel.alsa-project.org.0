Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB943DBB3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 09:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1615F169F;
	Thu, 28 Oct 2021 09:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1615F169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635405043;
	bh=kUm8LWJjv+dVCrO/KR4jdyacR62707zabeUSy//Cmbk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VKELT9sGWsmE6t7vXchVjciE7jJqWjpSBaH2X1i1j32SKq/PVa+3aG3nWKXc27x0r
	 GeKUw8ZpiJwF2Wa8B5B4LWU10ky2IOB+88fpCnMyVveMYiuWPuVKSWjTl+S+QMX5i8
	 gIkL+giW0x8RFHEVSmXqpiAxh/n6Oemhz6w5dLc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B096F800D1;
	Thu, 28 Oct 2021 09:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5213BF802C8; Thu, 28 Oct 2021 09:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F061F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 09:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F061F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iF+gDX3n"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VWZ/MAag"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A71952196A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635404952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VOQANBWMWo5+gwNAK4nvFUT+uZ0Rdt9roWHmprEb6rI=;
 b=iF+gDX3nCgQCAviavm+pg2d6JPss28kx8Do5aSTdHc3GgpT6WrBO6edsP7Ppv8N0CgxiXP
 vhvUdkB7L1g0metqOJdlCBTf+wMRpPREgBZTGOya3jgeW7riLbSBHC1wWtYNAt86vMJLLX
 Ewp13IoGqny4lR2CZj1UH5PW8yqwmUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635404952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VOQANBWMWo5+gwNAK4nvFUT+uZ0Rdt9roWHmprEb6rI=;
 b=VWZ/MAag4cQk8CL8Kka5Gs49Qlwd9Y3jaX88tnZ8/1/v5nnd0ZbtLRxn5ybmbkct3sQXz1
 SrA7JYs76UceaeBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 96CA3A3B81;
 Thu, 28 Oct 2021 07:09:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add a quirk for HP OMEN 15 mute LED
Date: Thu, 28 Oct 2021 09:09:11 +0200
Message-Id: <20211028070911.18891-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HP OMEN 15 laptop requires the quirk to fiddle with COEF 0x0b bit 2
for toggling the mute LED.  It's already implemented for other HP
laptops, and we just need to add a proper fixup entry.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214735
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e82d756ab850..6322fac9e694 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8634,6 +8634,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8783, "HP ZBook Fury 15 G7 Mobile Workstation",
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
+	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.31.1

