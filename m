Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1828221
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 18:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F5A1665;
	Thu, 23 May 2019 18:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F5A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558627582;
	bh=dAj6lVhtNZAcKtnl3KOIV4/zo0ubYOn0LvSHOi8q8S4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YglYOKkYzlSM9NsEfB4Cw+F4+Q+dCCYUDftpBZQhHuia2/8/HCh9mHR9Afs3tGs7w
	 takn2Ha7EYrHEun6XAuJFvmle+AW45Yi8KTwGme/0h/oO40S+lD1d7MXtCsCDFe3JR
	 BPZaRjckgRHexxt3rGeesdBRKQRht1iAE0j6gaX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF5FF8972E;
	Thu, 23 May 2019 18:03:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5954DF8972C; Thu, 23 May 2019 11:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D255F80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 11:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D255F80C0F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ya3dE6SY"
Received: by mail-vs1-xe41.google.com with SMTP id x8so3144283vsx.13
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PO80VBuLn5GypHKjx6dTB2iF8DAusDk59M6dfGDzXDk=;
 b=Ya3dE6SYMaV5uMVVgWaLUOSutPdll/CCuFOCaSpTLj/x3cwbY7CKDsTfFY0I7hLCa/
 +pdPi8rwvDbBtqsMKBh/8Oq/fP0KBmci5VFxdd5+9qQyMzlDsVY3Oii28y7QWHqoniLK
 Fus4hQGi9aiCmPccs0r1xLrV4pHyI/4/ETLVQiy7M08h/gXdmPD14B1XNF5VGd6+a23j
 Zw+TszY3jHZjDHaX/K2vYho0/U6OnAvLXM7ukCln36dZ0y3RHEJqjaYk5HaG8rTbLm0o
 MxseDIvUWhNz0eWoeN3YLdJHU+GqoR3gPFioq/ks9jFLaZAU0Zm5Sqj7gI8k/K2o3wwk
 GqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PO80VBuLn5GypHKjx6dTB2iF8DAusDk59M6dfGDzXDk=;
 b=HKe5v2HmRKkKLXymLGhQ33+7ltPoBu0I6n5Y0ifg8Z0cHkWm5bm5agDxxdmql2llKd
 dy3Z2txGsvPHLTFKfp3/0mLQd3QW1MZj7wR/pmHc7C/RNsEyiwwIi/Dvxv5KrPFNj2/5
 i8gu5sLMZbPO9cjGxo9QKBaxnyKjMXNIqB7AtOFcdF6Wva5AFfAP6Zx3qRvJCDLtaXdR
 gllH0xfaW7FGBV36P3XeHD0MmyZYIqJYp9RddYUUqDDpNQXBl1rEzI/cTL08oEi6xsV1
 YH1XqQmq2qOgc44dOJkPVg/87OzsfVRJsiVOJBQm3b5rMJg2+K/Hit3+ddP37frrBSNI
 GwqQ==
X-Gm-Message-State: APjAAAUGOJqDBGR70jf4Vo8jbc1tgN0iiC14RQWNujP64DzNA8v+C4ZL
 JOSK/oDnyXHZqlqddVpbSQ==
X-Google-Smtp-Source: APXvYqz0jG6UhEDV42viWsxnbkgBC/9NhE3R2GAylfMg4GSs6zcoDKERuDOvknwcZ9hpcTB5F4eMKg==
X-Received: by 2002:a05:6102:388:: with SMTP id
 m8mr20117271vsq.53.1558603841126; 
 Thu, 23 May 2019 02:30:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:902:c200:6512:a50b:fc5d:3604:d966])
 by smtp.gmail.com with ESMTPSA id d81sm7809112vkf.39.2019.05.23.02.30.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 23 May 2019 02:30:40 -0700 (PDT)
From: Ayman Bagabas <ayman.bagabas@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kailang Yang <kailang@realtek.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>,
 Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Thu, 23 May 2019 05:30:11 -0400
Message-Id: <20190523093014.21019-1-ayman.bagabas@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 May 2019 18:03:14 +0200
Cc: ayman.bagabas@gmail.com
Subject: [alsa-devel] [PATCH] ALSA: Enable micmute LED for Huawei laptops
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since this LED is found on all Huawei laptops, we can hook it to
huawei-wmi platform driver to control it.

Also, some renames have been made to use product name instead of common
name to avoid confusions.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f83f21d64dd4..ab6a856ec614 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5747,7 +5747,7 @@ enum {
 	ALC298_FIXUP_TPT470_DOCK,
 	ALC255_FIXUP_DUMMY_LINEOUT_VERB,
 	ALC255_FIXUP_DELL_HEADSET_MIC,
-	ALC256_FIXUP_HUAWEI_MBXP_PINS,
+	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
 	ALC295_FIXUP_HP_X360,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
@@ -6038,7 +6038,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
-	[ALC256_FIXUP_HUAWEI_MBXP_PINS] = {
+	[ALC256_FIXUP_HUAWEI_MACH_WX9_PINS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
 			{0x12, 0x90a60130},
@@ -7063,9 +7063,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
-	SND_PCI_QUIRK(0x19e5, 0x3200, "Huawei MBX", ALC255_FIXUP_MIC_MUTE_LED),
-	SND_PCI_QUIRK(0x19e5, 0x3201, "Huawei MBX", ALC255_FIXUP_MIC_MUTE_LED),
-	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MBXP", ALC256_FIXUP_HUAWEI_MBXP_PINS),
+	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
 
 #if 0
@@ -7124,6 +7122,7 @@ static const struct snd_pci_quirk alc269_fixup_vendor_tbl[] = {
 	SND_PCI_QUIRK_VENDOR(0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK_VENDOR(0x104d, "Sony VAIO", ALC269_FIXUP_SONY_VAIO),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad", ALC269_FIXUP_THINKPAD_ACPI),
+	SND_PCI_QUIRK_VENDOR(0x19e5, "Huawei Matebook", ALC255_FIXUP_MIC_MUTE_LED),
 	{}
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
