Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7201F500
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DCC516AD;
	Wed, 15 May 2019 15:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DCC516AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557925461;
	bh=h90hhrO5idRLmbgL43x+tGN72JjPo6q6LWTF+ng0wrU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwWIZnzQ0K+KRkP5LQk75vNIo2oWdKw/WDxgZd0TqJV81HpmNlBvuHjBgKXYHUJt4
	 20VWSfx4Cheqe+abPg+pU4zH/K91gK1uzwrlIc9heRy90DpL5kAiSZ4Rx54sbRy7Si
	 i5DfkE9sjxVoiPF7OmaZ4+/HzA5erz61u5WvQ2s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B66F8972E;
	Wed, 15 May 2019 15:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C92F896B8; Mon, 13 May 2019 22:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63DEF8072A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 22:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63DEF8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E8nFyRFa"
Received: by mail-vs1-xe44.google.com with SMTP id d128so8864609vsc.10
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 13:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVLUCuvIkgHf1PJRweruJ3z4sfjR/n08csEPSkBQeiA=;
 b=E8nFyRFa7hSDOzGPngvfVrHBMQ2geS+vTTr2QU0F1v2MFpx9RQK0A9P/q2QU2k2f+v
 oP6iUKNKQsWRnqoMef92zWQ57knOTjw0RFBtPsDsRPSFsCj+OIEYcWNLMzOK40OlUc9C
 WnkB7BNPFdpixtqtchVJpgXXrHxF9AJ2ySOQBKUxWygQWzAvqRznM7RJJ6yv2int/1sd
 YOhed0gcnpVvkFVG/r6Ah9ji5TvcqKNEFqouVTxHt+E1PoAWj5cZNGTJiRTC0fNgpBiw
 8ZAj9GdJ5szvHwDXb25JHB8tnilFN3zdUYZJe700sC+SwGwJhgXU6scFluoRoPNQtAZf
 z88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jVLUCuvIkgHf1PJRweruJ3z4sfjR/n08csEPSkBQeiA=;
 b=WtFO0gHvZ4PBlmDrUsk9tpayOAUr3/ojJ2MBBMlTMWmDs0Q5NPLS3+g+kO+4yEenq8
 TgGGemKjIhYibidw1Mze58habcrbxJM47B5o60XBXsbfcnWfVLp6ijJ5oD0stocIMFHV
 8E7/h3OW3oGKs+XhX8eDve443jiMrFEGGkF0MeLLO23dcZZ5B5Om85lNmAAU2PHqDZtx
 FOPbx67GNWSQ0kDhclLprRikmxkty/5DJCR7pjB7F/gYuPYI/235MOlONgw8ev9blcCM
 irubWiMgKy66g8nRBFHKq1KORSq7vunr7CBCo97FudsCmjKxgJ7LQj4LhXaYh69srEDT
 qUQw==
X-Gm-Message-State: APjAAAVPwGrGryX+PkX9U0bPwCMmCQ9dAq7d20YlK3BhiGoQQF0XVgZj
 NWOs0RCvubscCkrL1SQ0Yg==
X-Google-Smtp-Source: APXvYqwMryfqgImbiP13+/arDvUYMQDSct2MI76bgMrirL+kFL49BVKMSV1BVgRcsHsqBsKujSk0wA==
X-Received: by 2002:a67:d71d:: with SMTP id p29mr16059536vsj.223.1557779430915; 
 Mon, 13 May 2019 13:30:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:902:c200:6512:37bd:d695:3a39:ceb9])
 by smtp.gmail.com with ESMTPSA id 143sm1285120vkj.44.2019.05.13.13.30.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 13 May 2019 13:30:30 -0700 (PDT)
From: Ayman Bagabas <ayman.bagabas@gmail.com>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kailang Yang <kailang@realtek.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>,
 Hui Wang <hui.wang@canonical.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Mon, 13 May 2019 16:30:06 -0400
Message-Id: <20190513203009.28686-3-ayman.bagabas@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513203009.28686-1-ayman.bagabas@gmail.com>
References: <20190513203009.28686-1-ayman.bagabas@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 May 2019 15:01:10 +0200
Cc: ayman.bagabas@gmail.com
Subject: [alsa-devel] [PATCH v1 2/2] sound: Enable micmute led for Huawei
	laptops
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

Since this LED is found on huawei laptops, we can hook it to
huawei-wmi platform driver which uses the common WMI interface present
in these laptops to control the LED.

I've also made some renames and used product name instead of common name
to avoid confusion.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 42cd3945e0de..3661470766ba 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5684,7 +5684,7 @@ enum {
 	ALC298_FIXUP_TPT470_DOCK,
 	ALC255_FIXUP_DUMMY_LINEOUT_VERB,
 	ALC255_FIXUP_DELL_HEADSET_MIC,
-	ALC256_FIXUP_HUAWEI_MBXP_PINS,
+	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
 	ALC295_FIXUP_HP_X360,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
@@ -5975,7 +5975,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
-	[ALC256_FIXUP_HUAWEI_MBXP_PINS] = {
+	[ALC256_FIXUP_HUAWEI_MACH_WX9_PINS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
 			{0x12, 0x90a60130},
@@ -6996,9 +6996,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
-	SND_PCI_QUIRK(0x19e5, 0x3200, "Huawei MBX", ALC255_FIXUP_MIC_MUTE_LED),
-	SND_PCI_QUIRK(0x19e5, 0x3201, "Huawei MBX", ALC255_FIXUP_MIC_MUTE_LED),
-	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MBXP", ALC256_FIXUP_HUAWEI_MBXP_PINS),
+	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
 
 #if 0
@@ -7057,6 +7055,7 @@ static const struct snd_pci_quirk alc269_fixup_vendor_tbl[] = {
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
