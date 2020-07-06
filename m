Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80221533D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 09:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1AC1678;
	Mon,  6 Jul 2020 09:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1AC1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594020106;
	bh=tOS9If+1eRAGyimEUKeqKbvl2683gPElWGQrze0dIBU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEjLQloqlkm+r9CKfdOIpihd9ETky8iaZeCaV2sO9WwiWhz3PrRqM8/ZPcOFqlnaW
	 KsxbTzufdIsGhI2On82TPyZ5wrqgrsDPQgbLNe5iPKOiOwpAdmbNIU0hx3g2IoLGpB
	 heCRgfOfShhcX4BPki5gKsNGnhEIhWWMGVieio4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1697AF80125;
	Mon,  6 Jul 2020 09:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52269F8015A; Mon,  6 Jul 2020 09:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B75AF8011F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 09:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B75AF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="sgSnX4Bv"
Received: by mail-pf1-x443.google.com with SMTP id m9so6345144pfh.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Jul 2020 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O74Nuai4i0SLX5VBGfHYZHCvuzscSOHQ2q6kAb3CK+Q=;
 b=sgSnX4BvnCsHbxM0A5WWFsmuE95MfmeQXIjkXZbR2BNWgcCW1NKpULF4OKiZwMPf2F
 SkM7pF7DPNg+vYebyjW8hcfK/wLQvoRq8NDdij03laNTuA/b0770dCQrB9Sal4EyYLgV
 YdRhA0c/egElceVCWwUTJI5re6E2kthSlvIAaEIOWCRjD5G3YPHELvH7WFlivgQbJswP
 ErLpEU4nnu0sZg68ioKM3Tf4RdO6DAaaO/ybGyTahRQZI8lmCpEZMAPlDoGRoAhNz4cU
 XxOWXJg9ydKvmgsX0zaiUnu2Rv45vfUmfHcFhxxqgAfYImQ2TqZ6sLU0FvU5ESorX9D/
 +XAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O74Nuai4i0SLX5VBGfHYZHCvuzscSOHQ2q6kAb3CK+Q=;
 b=D4zYDA2LCuekTt1DBvHaiZrzU8jaq6ASTYLcjwSa2SDgERmXg2mOWAfbM1qJHr4gPT
 pmOJoSzC1jHl9x0RxTgx29IOlrDxu2q9FJz1d8HmtdA1V3/urlgRL0Ec478L64Ob3YSf
 v1BSPu//L4m2DUMnAZBWJ6xI/OSNskjB/j16VhUPvZEdlsGq3eKbJo6IAQv316yZg/Nx
 0d8QwUHFPRENzpyiCHHN8++nc4B2K36A9EoTC6lX00k4gDQhWbrFsWAN6rZ8ECEUbRTL
 ICV9DSe35TPq1vs8WS4IVSLhumnkdCRqCPFnvLtjBmsJgbsZAgT4L/suDyKt1YhB9k0A
 nn1g==
X-Gm-Message-State: AOAM530+ohIwRH4LhAbMgTYgDeNIIfwMi8NEV3oRob9+XdtMXZgeieWD
 btLApCDOtMbAEuByqnvEFBdrtA==
X-Google-Smtp-Source: ABdhPJy97C5d00A/1zRlOr0gcTDJG1/xcPA2z9ugXTaAcrfTaHjW/vgXKJw1+14TyG8kSOVZet0P2Q==
X-Received: by 2002:aa7:848b:: with SMTP id u11mr28920909pfn.72.1594019991291; 
 Mon, 06 Jul 2020 00:19:51 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id f18sm17825210pgv.84.2020.07.06.00.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:19:50 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/3] ALSA: hda/realtek - Enable audio jacks of Acer
 vCopperbox with ALC269VC
Date: Mon,  6 Jul 2020 15:18:25 +0800
Message-Id: <20200706071826.39726-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
References: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Chris Chiu <chiu@endlessm.com>, linux-kernel@vger.kernel.org,
 Jian-Hong Pan <jian-hong@endlessm.com>, linux@endlessm.com
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

The Acer desktop vCopperbox with ALC269VC cannot detect the MIC of
headset, the line out and internal speaker until
ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS quirk applied.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
v3: Change the chained ID to ALC269_FIXUP_HEADSET_MIC according to
    Realtek's suggestion

 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 737ef82a75fd..13c32655df44 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6149,6 +6149,7 @@ enum {
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
+	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7327,6 +7328,17 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE
 	},
+	[ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90100120 }, /* use as internal speaker */
+			{ 0x18, 0x02a111f0 }, /* use as headset mic, without its own jack detect */
+			{ 0x1a, 0x01011020 }, /* use as line out */
+			{ },
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7346,6 +7358,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
+	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
-- 
2.27.0

