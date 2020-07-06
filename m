Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0E215342
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 09:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5FD165D;
	Mon,  6 Jul 2020 09:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5FD165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594020170;
	bh=NosedA3sgCV5A/Ijuk9EWnT0CVr++nmdgtSajFJE0Pc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QioNxrb/3Aun9A1ei/Vf1enHFu4/XBc8Bw3rA8rgikPcOjJeN3SEP3mKysV8/hIQP
	 zf4xLbHL06Qu5v377KoGKmLl3k6iB3u+N5+FlSY5b1UV/IYiegzVsIOOPHXy2Ct9Ql
	 sMleRU4jh19jKUHXqLw8sVAaF+Z8ioaKEqP9Kdyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55683F802BC;
	Mon,  6 Jul 2020 09:20:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47D00F802A9; Mon,  6 Jul 2020 09:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A1FAF801D8
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 09:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A1FAF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="usBlw4O/"
Received: by mail-pl1-x643.google.com with SMTP id w17so528713ply.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Jul 2020 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUjOCBzJzHZGlbM/LYArmMgBHJ4SZ/ZCIHU1HiTNVeA=;
 b=usBlw4O/gmejQLVUZZlYw0kQnxq4GauNQ154hpOYplmmBgH+QjlS6wW1MCyNmQAEYc
 VgIJ87k6wMU/LRBRAiPVrG4Mq+eHOV5bpnplpssw97Ebcp8en/Vmbzk3IC+S2xaCmchd
 B4fQWSGeccoxsuff7VOEcOm12+xTR2jIVQF31iL2uzpq1Sn4eRM+aQJHRdRJubxStA2G
 oZRZv2nSflASVFIImduypO2rx/VrGLrAmRaCDI6lzcKtygmbCIf7mLkrAZqGZzeij04k
 +JcoaAS3owh3T1TlnQCny5X2RRceUQX482FBGjugBrBkGFi+6+57Fl8wq8K0XCNAAdtv
 IK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUjOCBzJzHZGlbM/LYArmMgBHJ4SZ/ZCIHU1HiTNVeA=;
 b=IpoIvoV2q7jX5ufCE5/OLEaUT8BEYQ5pJC9/t5lZ4gu3o2adcTEibtR8gpPqPJ1iRf
 JMfvTNxCJaVh3sbhENBHSiVEUAWmOrRkV6Rd+r+rF2h5Y0OvTn9Hv4mJts7rLvAHe0XK
 clAK8ZIxDrelp4Qx+AdCoQL7L3TXgeQ38AtJK6395aH4w3/ZZOtbZplx6gu/OQqpuY2l
 9cVWCc5wBem7vT91JfG128GEDQjnVuLssgDSe1oraol8+DN1WsiloCM+RqrOfcnCG7Mi
 PF4BGTUzRPzRnUkgawo9idr4gdkNHWMyqopbBb4PoSF7OWAJQVv75RYyh6qQX33HZ3bu
 V8Xw==
X-Gm-Message-State: AOAM533GF/vh8s9yeOVqyAo64Af1tEdV43og+z5l78ocEoybFkAlFugC
 1tp7OOGAKhXF8m4mjE+cTAfUVQ==
X-Google-Smtp-Source: ABdhPJyGDFe4YRXz9gpczWaXXbPvo1uMz8oukjySBx3ZILFkG2vsakTo2pzJAur0RmMp3klhqK2s5A==
X-Received: by 2002:a17:902:728c:: with SMTP id
 d12mr40859452pll.155.1594020031088; 
 Mon, 06 Jul 2020 00:20:31 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id f18sm17825210pgv.84.2020.07.06.00.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 00:20:30 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 3/3] ALSA: hda/realtek: Enable headset mic of Acer Veriton
 N4660G with ALC269VC
Date: Mon,  6 Jul 2020 15:18:29 +0800
Message-Id: <20200706071826.39726-3-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
References: <aa62a43d4f1f458fb11794c26d373528@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux@endlessm.com,
 linux-kernel@vger.kernel.org
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

The Acer Veriton N4660G desktop's audio (1025:1248) with ALC269VC cannot
detect the headset microphone until ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE
quirk maps the NID 0x18 as the headset mic pin.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
v3: Change the chained ID to ALC269_FIXUP_HEADSET_MIC according to
    Realtek's suggestion

 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index be18b304e731..c2e6a6b7ea5b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6151,6 +6151,7 @@ enum {
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
+	ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7349,6 +7350,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
+	[ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, 0x01a11130 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7370,6 +7380,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
 	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
+	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x128f, "Acer Veriton Z6860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
-- 
2.27.0

