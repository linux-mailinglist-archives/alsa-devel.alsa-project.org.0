Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BC65623C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 12:44:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C3F5BF5;
	Mon, 26 Dec 2022 12:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C3F5BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672055065;
	bh=vfAQ6Njsp/w+dMEVMjR5bAE0GOKsXDyzjbR7MmP3euI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QHb6ZGWv2hRJjVVrq4pj9RXGQhX6jxvk7XDDjgv2PKadvAEyvIm6DwV5RDs4YSGhz
	 0OolSBbMisdBYv/3/o2jPWPXzQINoC1PBRuwSYr6dgWOlGib0YpzRtAzbXtuTa1Czz
	 d03XIRgb4JFy9qr3pt4zxVsBVXUThDs8rm7X6APs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E40BEF802A0;
	Mon, 26 Dec 2022 12:43:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B9D9F80535; Mon, 26 Dec 2022 12:43:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CB4F80535
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 12:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CB4F80535
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=SVjiPfNK
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 12D9E4151C
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1672054995;
 bh=aRfghd24Gxy9oAEt3+RAeQ8YV+5xbmg27rAC6+YQkYs=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=SVjiPfNKLmnXagJ4gD/b7zb7Ftd14OZlchPczfX/57d49cgbhMej37MEf/C3/AyYi
 IKLOqj5fC7IP+rGVyQDonZt2uSGucGLqJh//YlELcmHEd/otHX11kb457J4KwlVuCZ
 5S+RzWYDYasYj6nENgcLslQmXXqpTkVs4GQDRvQZ62iFJqBZkSTy81jFwVLSKNR+mS
 uFNvNaflpBk7KmH4ESEVuYG1Wgfm3O2ykixdmcq2W1sCAVGYH8MFSpetBvVaZLVo0X
 iU+5sNdNCsXR7bBccSpw17iimUNcH3itOmw9f93vMM7vb84BEelfTa4+g2/+Tk5J3U
 pzEj0yVwtEWlA==
Received: by mail-pg1-f197.google.com with SMTP id
 d10-20020a631d4a000000b00491da16dc44so5553060pgm.16
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 03:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aRfghd24Gxy9oAEt3+RAeQ8YV+5xbmg27rAC6+YQkYs=;
 b=gqZWbDAcZAK+vzXrAnci1uy8v1IXcoXKrE4H36qCsN19fdVNZl/qtp+vtS2OcJFseh
 gvI0dvyo0wrFa7CxhhW6JaZkMcT4tZ1J7Neyn/R8pUN/ooampe/pX6nI1u3JTlMFuJw5
 RchTvna7ngGRop3bMmN7X+v+2ySC2TFxgv9D7M1TVg5UFDdIg7kAEtsoen3o0FrmI6ek
 Lwp5RIBIHJJwB68qqSvCatCNnbc77mLUYK5vlGr7K4XL7htXYCQBE1K159Bwy/SwBP2y
 vcHjvoPTw8XgreTjq9sVcR1PvaayLlrU1je0EKjS9i5SvoSp3UCW6JLE73T2fOB1b6JC
 R8XQ==
X-Gm-Message-State: AFqh2kqUBURR+86NW2hzW0WVBMUCD8HT0u53g3hO4+gY0NqyPFgLw92k
 HTbDX3Ldu51vLdEJqXMWkiWSsPgRI8PIXb9oh3V546oETk+nokR1m9nNGFR6NweZR1L/J7djnXP
 UjhK/bom3oCM0WTPw3NmZp/0OuMpWY+8/9yq8A6Fj
X-Received: by 2002:a62:5801:0:b0:574:a541:574a with SMTP id
 m1-20020a625801000000b00574a541574amr18945843pfb.0.1672054992242; 
 Mon, 26 Dec 2022 03:43:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtUWSNiNVFkLMG6D3Z4UCGI5b6rucyXh1t6mqLduEu1ydiDkK2K8v2I//g7Qa7OLHyYXcwiew==
X-Received: by 2002:a62:5801:0:b0:574:a541:574a with SMTP id
 m1-20020a625801000000b00574a541574amr18945827pfb.0.1672054991803; 
 Mon, 26 Dec 2022 03:43:11 -0800 (PST)
Received: from localhost.localdomain (220-136-203-167.dynamic-ip.hinet.net.
 [220.136.203.167]) by smtp.gmail.com with ESMTPSA id
 t12-20020aa7946c000000b005769ccca18csm6739267pfq.85.2022.12.26.03.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 03:43:11 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Apply dual codec fixup for Dell Latitude
 laptops
Date: Mon, 26 Dec 2022 19:43:03 +0800
Message-Id: <20221226114303.4027500-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Dell Latiture 3340/3440/3540 laptops with Realtek ALC3204 have
dual codecs and need the ALC1220_FIXUP_GB_DUAL_CODECS to fix the
conflicts of Master controls. The existing headset mic fixup for
Dell is also required to enable the jack sense and the headset mic.

Introduce a new fixup to fix the dual codec and headset mic issues
for particular Dell laptops since other old Dell laptops with the
same codec configuration are already well handled by the fixup in
alc269_fallback_pin_fixup_tbl[].

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e443d88f627f..3794b522c222 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7175,6 +7175,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
 	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
+	ALC236_FIXUP_DELL_DUAL_CODECS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9130,6 +9131,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 	},
+	[ALC236_FIXUP_DELL_DUAL_CODECS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.func = alc1220_fixup_gb_dual_codecs,
+		.chained = true,
+		.chain_id = ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9232,6 +9239,12 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+	SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c1b, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c1c, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c1d, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c1e, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.25.1

