Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043079B36FB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2024 17:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E93B1060;
	Mon, 28 Oct 2024 17:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E93B1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730133939;
	bh=oGPN80qbKjwSppJ/U6TVsMTO1C1mG/KjaipR+Ky4Rus=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f8bp6aT8bd/NmfcD+nUVQKXInanEsBuPJugPnFN/KYUrqpS5q8XmbspSJ/CZIy8JL
	 DRu4VVA+80J1mx+jBZSs7KCGlt7WV8xPQmPxjZsOxQEthNY5Wa+odRX6BSdQGIAvKV
	 gxOcHS9mMZajxC9PuYwvjPYpwzPHh3oWq030JBU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE745F805E5; Mon, 28 Oct 2024 17:43:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3453F805D5;
	Mon, 28 Oct 2024 17:43:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA04DF80269; Mon, 28 Oct 2024 16:55:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2E98F8014C
	for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2024 16:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E98F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eFXi7O2v
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2e2e050b1c3so3848719a91.0
        for <alsa-devel@alsa-project.org>;
 Mon, 28 Oct 2024 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730130923; x=1730735723;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+avY+0FraZezaA2ZJ3j6/+NsGewm/RnEb+AyA9oKYCU=;
        b=eFXi7O2v/S7nCWvQ8tkk3WtiXe+b8AqxWAKRCaA2p+xvQcitJQsniqX4R+kBOsPDZO
         gqkIzREYtn+GMnjSudZv8JUun9aHHgv1wSfUblqCVL2N2NJK6szJrlBX3dMVoVMIP0zm
         W3psQZAnxDD49ET1iWkHnsSAozEXfUz/eErRt3XacnlL32PJ1yfVjBTKg1e2cVFUDpca
         6bS6t/WoYIuIGDwZXnPU81TOEgWSL8w2RBIOAKt2FFungUiJ/T2pQJyq6YOaS/3xfNCG
         D7S9ep/7EHEIco5AT3TA8ijdAcNjvJegxHkHeCGLYNlR1fn/9YW2NK8jU6EmS7cqQl7Z
         5LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130923; x=1730735723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+avY+0FraZezaA2ZJ3j6/+NsGewm/RnEb+AyA9oKYCU=;
        b=c9J1+gE3vTpic3HXZiLPliF4bBFr1GZ78BxUmcCVYHWQNPhsDsYEI6utK1UoZROajX
         XguyGoXykgrErmNn5TD/orvSYFFRBQcyV9ULU7C0EjITwbKU3aLQHT/60fa3F9g4EgEZ
         ErtTurhdRfzoCMGBu30VmGu6gIVehC3bSCUGhVLV/lpv9JuKlnrOKjuaoeTFZFAXc3sm
         ZqG9MEL+gtCHF28tft53lUEN0KACGGWmqayTrIK3Sr+2nktN5OgMUdD8Xvl7VL5/38+f
         tOGu7EYjhhdzfOBtiswe3Bmfiz9l8p0JZu0B2KUH0HISS32NH3eX5KVBhPLak1F1AzWg
         5Tsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3gRrT11KczhbDM9j+B6OdXwBI/OBTobiFvVSP9P52Gr1mJIIORUFC3cHzayqufRLkngnJx7gHKAgZ@alsa-project.org
X-Gm-Message-State: AOJu0Yw4g0S7Tp4/JTCO4r6aRhM/dTwh3+vHnXB46HEOGHj60AtOqiVC
	ArcjOo/7jIcie2+LVYaG7aZ1AFk37f3AO0RC1kxt0rlNRTJ95Lc0
X-Google-Smtp-Source: 
 AGHT+IGf5oOGN6C9vxAsUtBS/oSx/LaZEx7CgMwc3vpxc8EjXI9w7WWE1LAXjpLS5Xt2LWC5TjoBiQ==
X-Received: by 2002:a17:90b:3505:b0:2e2:a5fd:7e4c with SMTP id
 98e67ed59e1d1-2e91e824872mr105242a91.8.1730130923364;
        Mon, 28 Oct 2024 08:55:23 -0700 (PDT)
Received: from
 codespaces-c8bc9f.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net
 ([20.192.21.48])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e37490cesm7431977a91.37.2024.10.28.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 08:55:23 -0700 (PDT)
From: Piyush Raj Chouhan <piyushchouhan1598@gmail.com>
X-Google-Original-From: Piyush Raj Chouhan <piyuschouhan1598@gmail.com>
To: =inux-sound@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Piyush Raj Chouhan <piyushchouhan1598@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add subwoofer quirk for Infinix ZERO BOOK
 13
Date: Mon, 28 Oct 2024 15:55:16 +0000
Message-ID: <20241028155516.15552-1-piyuschouhan1598@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piyushchouhan1598@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2BFE2HKZFU4TBU3NMTKEHDF6CAU7L3K4
X-Message-ID-Hash: 2BFE2HKZFU4TBU3NMTKEHDF6CAU7L3K4
X-Mailman-Approved-At: Mon, 28 Oct 2024 16:43:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BFE2HKZFU4TBU3NMTKEHDF6CAU7L3K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Infinix ZERO BOOK 13 has a 2+2 speaker system which isn't probed correctly.
This patch adds a quirk with the proper pin connections.
Also The mic in this laptop suffers too high gain resulting in mostly fan noise being recorded,
This patch Also limit mic boost.

HW Probe for device; https://linux-hardware.org/?probe=a2e892c47b

Test: All 4 speaker works, Mic has low noise.
Signed-off-by: Piyush Raj Chouhan <piyushchouhan1598@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3567b14b52b7..075935707f8a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7551,6 +7551,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC269_FIXUP_THINKPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
+	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO,
 	ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
 	ALC255_FIXUP_ASUS_MIC_NO_PRESENCE,
@@ -7996,6 +7997,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc269_fixup_pincfg_U7x7_headset_mic,
 	},
+	[ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170151 }, /* use as internal speaker (LFE) */
+			{ 0x1b, 0x90170152 }, /* use as internal speaker (back) */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
+	},
 	[ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10989,6 +11000,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
-- 
2.46.2

