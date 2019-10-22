Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A8E088C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 425C61680;
	Tue, 22 Oct 2019 18:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 425C61680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571761086;
	bh=EwW3F9/LBjykTjIpAG9LoepZ3y0DZBVvmWDyZVBhvC0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rukFXvylqwNcLbbBgkUE9I6X10TFT3QakpNagBmZYN7xEDZ4ID+P7BPvcA0copHV3
	 2FkzbpXlkB91AjZFPmOKe0S6eVp/2PYMX/U/AIH3puNUkUBfX1dsEfSAFv5VqCPp8c
	 KoezpvtGoDuuTTwW8PZxEY4gGbDeItLq87syEn4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F4A7F80635;
	Tue, 22 Oct 2019 18:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F8A2F8031A; Tue, 22 Oct 2019 17:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CFEF800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 17:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CFEF800C0
Received: from [114.245.47.48] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <aaron.ma@canonical.com>)
 id 1iMwFV-0000Ty-BI; Tue, 22 Oct 2019 15:39:05 +0000
From: Aaron Ma <aaron.ma@canonical.com>
To: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
 hui.wang@canonical.com, alsa-devel@alsa-project.org,
 aaron.ma@canonical.com, linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2019 23:38:55 +0800
Message-Id: <20191022153855.14368-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 22 Oct 2019 18:14:15 +0200
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix 2 front mics of codec
	0x623
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

These 2 ThinkCentres installed a new realtek codec ID 0x623,
it has 2 front mics with the same location on pin 0x18 and 0x19.

Apply fixup ALC283_FIXUP_HEADSET_MIC to change 1 front mic
location to right, then pulseaudio can handle them.
One "Front Mic" and one "Mic" will be shown, and audio output works
fine.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b000b36ac3c6..c34d8b435f58 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7186,6 +7186,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x312f, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x17aa, 0x313c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x17aa, 0x3151, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
@@ -9187,6 +9189,7 @@ static const struct hda_device_id snd_hda_id_realtek[] = {
 	HDA_CODEC_ENTRY(0x10ec0298, "ALC298", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0299, "ALC299", patch_alc269),
 	HDA_CODEC_ENTRY(0x10ec0300, "ALC300", patch_alc269),
+	HDA_CODEC_ENTRY(0x10ec0623, "ALC623", patch_alc269),
 	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660", patch_alc861),
 	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
 	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
