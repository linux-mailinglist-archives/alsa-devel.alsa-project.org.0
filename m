Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED13324F43
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:32:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D06116C3;
	Thu, 25 Feb 2021 12:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D06116C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252757;
	bh=H9DEZXYvZ++lyAacz4UVYgoIsTO2p5XUgj8owRYdqo0=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rb8kjW9Bmh0LPI3RftALALYKbW/TRzxqM7WqUopOKsE73cCL3SD286CEr4aKNMkJE
	 DcACCXpZjEY0ZjqFLIkOmQyd8wLPFUVquxAfxkHDD6VtAn6zGalKmuKC5+4WltASOP
	 pTUGZ42lw+pDOdVkDUVVpPUJkiwMpnmqgCteyPXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBBB1F804FB;
	Thu, 25 Feb 2021 12:26:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA3DF8016A; Thu, 25 Feb 2021 10:21:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AF8FF800D2
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 10:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF8FF800D2
Received: from mail-oo1-f71.google.com ([209.85.161.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1lFCpj-000744-A2
 for alsa-devel@alsa-project.org; Thu, 25 Feb 2021 09:21:19 +0000
Received: by mail-oo1-f71.google.com with SMTP id v2so2629498ooj.14
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 01:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=twjGv/8DgTHy0QTq2NWyH703FNvrGECchLAOZ9MyTgc=;
 b=eLUoReenoaeO4m19Q5LEKAEMFgxb/fwEAOy8QAYFP5fMQbdyp7v45y3VBVePMG/iLy
 vURPKc0NaDTRuaIZpsZqqhCRhbHMo2fShBEhWbJCq1CgZtWeEqVXewom60FmDPI2/ChV
 FlKVSJpL/ex3oQQtCh5Zvb0O0A0NylK5oSUXBd7sZiq+/dVW/LHjP3HwvmWP7mPh4yos
 7ca4G7DTESzhOwehPJvi+whAD6NaB4qWRMsnozW+2IAtcpsdm1Vfl6jfheKloS1waJDh
 M0z2obyPosi84HK2AFirpXgaVSW8SkfWc27kBEGaX6CKlx+puXN11Dw++C7vdjDaiqD0
 eUWQ==
X-Gm-Message-State: AOAM530LvoGQjCQKxnFOjiU5tMy7m9GSTRSKIG4nqbGIBf1f7kuCYELt
 A1D4ynR8gm8HF3qAL+sBXDBqYLrTFibyigquBcCWZsPjoDCnrzP8CD7SzjR3MQ7i/ac2YyNymxN
 +GiF0BlX7RVtQKq3p3WgDhd+LelON4u9JMNz2Gpa+d5UFB9MckDRwasxs
X-Received: by 2002:a9d:3a34:: with SMTP id j49mr1482101otc.153.1614244878357; 
 Thu, 25 Feb 2021 01:21:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDwDCbA8Y1lKOajJrLz84FE3mo8EJZPiS/emi1+68APzsus/rzd+ZoxxvYNANhxnD02ZnHhJJGJy9IhWdqpew=
X-Received: by 2002:a9d:3a34:: with SMTP id j49mr1482075otc.153.1614244877982; 
 Thu, 25 Feb 2021 01:21:17 -0800 (PST)
MIME-Version: 1.0
From: Chris Chiu <chris.chiu@canonical.com>
Date: Thu, 25 Feb 2021 17:21:07 +0800
Message-ID: <CABTNMG0O_z1tOqb=dR44zgasSL5m73ABpu+bj2WKK0+QWY-EEw@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable MICs of Acer SWIFT with ALC256
To: tiwai@suse.com, kailang@realtek.com, jhp@endlessos.org, 
 kai.heng.feng@canonical.com, hui.wang@canonical.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The Acer SWIFT Swift SF314-54/55 with ALC256 cannot detect the headset
microphone and suffers the noise problem in audio capture.

This patch enables the headset jack sense and fixes the noise problem with
aamix fixup.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 290645516313..57e4dbcd76a9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6372,6 +6372,8 @@ enum {
        ALC236_FIXUP_DELL_AIO_HEADSET_MIC,
        ALC282_FIXUP_ACER_DISABLE_LINEOUT,
        ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST,
+       ALC256_FIXUP_ACER_SWIFT_NO_MIC_PRESENCE,
+       ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX,
 };

 static const struct hda_fixup alc269_fixups[] = {
@@ -7815,6 +7817,22 @@ static const struct hda_fixup alc269_fixups[] = {
                .chained = true,
                .chain_id = ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
        },
+       [ALC256_FIXUP_ACER_SWIFT_NO_MIC_PRESENCE] = {
+               .type = HDA_FIXUP_PINS,
+               .v.pins = (const struct hda_pintbl[]) {
+                       { 0x19, 0x02a1113c }, /* use as headset mic,
without its own jack detect */
+                       { 0x1a, 0x90a1092f }, /* use as internal mic */
+                       { },
+               },
+               .chained = true,
+               .chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
+       },
+       [ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX] = {
+               .type = HDA_FIXUP_FUNC,
+               .v.func = alc_fixup_disable_aamix,
+               .chained = true,
+               .chain_id = ALC256_FIXUP_ACER_SWIFT_NO_MIC_PRESENCE
+       },
 };

 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7841,9 +7859,11 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500",
ALC299_FIXUP_PREDATOR_SPK),
        SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox",
ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
        SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G",
ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
+       SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54",
ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX),
        SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G",
ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
        SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G",
ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
        SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G",
ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
+       SND_PCI_QUIRK(0x1025, 0x129c, "Acer SWIFT SF314-55",
ALC256_FIXUP_ACER_SWIFT_DISABLE_AAMIX),
        SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890",
ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
        SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21",
ALC233_FIXUP_ACER_HEADSET_MIC),
        SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T",
ALC255_FIXUP_ACER_HEADSET_MIC),
--
2.20.1
