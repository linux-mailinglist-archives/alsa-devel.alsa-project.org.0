Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F09213542
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3782016CC;
	Fri,  3 Jul 2020 09:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3782016CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593762137;
	bh=guwZ3uTVWKwB76ayS4xqkdxbf3lCvN2ndCZaptvz7x0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MGs5npL277VQRinAQs0Z0iEI+CSTcClUsdK0kopOIz59jgG+VYsr3FRF0m6UDZ/+W
	 Ik5C7uyHveE2XCtG3ZwbChcxADMJfLAnCCrhhDuqwhJubKH1KB+L0OBt0PA5PCoZep
	 GSmiUsC+9gXQyGZPs7ZmH1vulX/DUN19ZIXbSbOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4147BF800E2;
	Fri,  3 Jul 2020 09:40:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E917F800E2; Fri,  3 Jul 2020 09:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D824FF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D824FF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="EvVcInpk"
Received: by mail-pj1-x1042.google.com with SMTP id c1so6389545pja.5
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tVzWaBcXcAIcSS8sXY9snxZzqYH+2Rl4YL7e8hJOjM=;
 b=EvVcInpkeOhjEeMwxxbjFeweYq/7WQpf5IMvNjKyHwbhG7npYbsmYZojWzaSIVtCUo
 xBU0/r3kkithJfM2PJuZgSRD2aqIEpLdtR9GEBmzQjZVxzh5A1ovwE75bNptP3dv+BNA
 7r7C4CIRcAmYdEWeTNJkmnt8bt5pGEJ/TySc+fP9i6e/bKzfYHoWmRHiKGAUCEqEp3MZ
 K7EAL7EfzpPXmsEywZuHsCYjSQLnYKMa7CeKXJFduljNCAc4QMDECs0cHpmaidwpyPgO
 ZMhc+dZ9cRh+bfHL5okF4szjDefzvjhisnuOzz2h8sQU2z/rkaH7Ktfiey8f7PVhxash
 wSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1tVzWaBcXcAIcSS8sXY9snxZzqYH+2Rl4YL7e8hJOjM=;
 b=NrRdEdW2OMsJAuTbY5qDD2+OzBpbimfFwDFAYrPRy1mNlN7hDqHYwwkJyJZDma/vuX
 vEeE3LNVsIBSGx1xos5qs9ybM7OWqfklV26xh3bDhk9zHwRAEXZk16fD1Zk9U2oHUBBk
 UkA8mMwMkS97a9J28KyKyLty4GXrUXOmG8+kk1J9aeDakQJ2do2zxmS9gR+MIFjt1YwU
 g0wldSwuLMxfkcGQRppYRpbHVSbDultWWzaA+D6OMLXyD4KkHYreyPovC8SRvGMoB69I
 I+8DUIyhtAWNLMaehmNf6MhSdfdru7v3xhdFwYQoxaPDwYRyyadC+E/Z3akQg2wx+IpS
 5hgA==
X-Gm-Message-State: AOAM533uQm+0UMr037Sq3YAiUng0wDvcPbddlC04dkP7g90ZzLYkHi/J
 McI8HaaTeqhlZ9BI15XQuZ758w==
X-Google-Smtp-Source: ABdhPJwA4wZp1Cf8yC9bcYCuqDvktd5BEWXkeoZNATswhbMJU2n33UULKRwoTSD3iaumftlKzf87Kg==
X-Received: by 2002:a17:902:7611:: with SMTP id
 k17mr29877760pll.255.1593762025131; 
 Fri, 03 Jul 2020 00:40:25 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id b4sm10489862pfo.137.2020.07.03.00.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:40:24 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/3] ALSA: hda/realtek - Enable audio jacks of Acer
 vCopperbox with ALC269VC
Date: Fri,  3 Jul 2020 15:37:52 +0800
Message-Id: <20200703073753.185147-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
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
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 737ef82a75fd..dfb4bca07d3f 100644
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
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
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

