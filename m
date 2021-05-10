Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA70137A307
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8341742;
	Tue, 11 May 2021 11:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8341742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724192;
	bh=dLlWR2b9nM+zlbBbSqawogaqd7T7shBRtc2rEiXB/Yw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnBwFya/W8EHfB0e5q/QeJ2LkkbjROlFJin1pi6Fz3FZbcrdlr6fZiODlwGrBaRiq
	 /UTnkFjfnHN1WScHAFtAt34u6ACHI2TuztyDsq8OJEguEEZs34ozPZOnY0yBQvRNMb
	 z/SegzBjeWCnB8/W0yxT2Beq2vLcyebKRNrGZfxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32AEF8016B;
	Tue, 11 May 2021 11:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39C19F80240; Mon, 10 May 2021 19:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F4005F800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 19:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F4005F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uEs9tjg9"
Received: by mail-ej1-x631.google.com with SMTP id gx5so25628191ejb.11
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jIuFuf8Zfs+fmLGUjbEH8ZtGFko41nDRxioSANkA/8=;
 b=uEs9tjg9MZlXMlSQ7QXwugYoZwYcsSKgPLBJw48pSKTBDkNLaPzDPjP1tKjacIzIj6
 ipHnA/6mWnM0PFh+DtNQherH10zY6acIPlf+Q7vsO1RkHp3eodkZaNveaB+juGlfZOyu
 LbZ/H9ytlwMwvkuFV3D4QrEI+EDfyK4S4u5gj0Y/iPR6fh6Cu9ADapSMsbromZ03tOoE
 4y/JRQ2Eiv4lWDDw4Ol8R166s7ywc0oI+h62xHOfkRq5Igx0xft0d7Ic+lNFjIJ0kjF4
 JJ7BFZAJs7x8OktMlIiC8p6Aq09VUgUj7M8GvU0hCJojQODibeL78EaQKquj0CQPPxIv
 p5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jIuFuf8Zfs+fmLGUjbEH8ZtGFko41nDRxioSANkA/8=;
 b=l9++P0YEcR/OB11I94Vo1uzr0aMx+NafCxMdW0/IpL+j4Bqb1SWvbqxG9RWi7Ydo7P
 KUELFSVQTMdl62fYmuqcWkhJWq+R4xG2lNiqnTXp3fDyFVL7R9jlNY6XLy1B+CoQ5n9g
 6tAdEDFFGzkUaK1+/HI16Jh1DDeGXARL6jeSWzbaXR+qEoqrxsrbsf9/MPUES8SMPwkl
 3lztYdGYd0Xip3bO4yLY/U8+xEmGWTir1BVAsXubgbdIdZPcFXEuFdhDqle+QJRgQHQO
 8FODtlO2y31e6iIwfSNswN0HMB07GShlobqA2XS7xXVqNqjdAMKCTWB8fDHHUbP5IK7j
 of9w==
X-Gm-Message-State: AOAM533VSeNgqQVBFbKdYO57U6wa1nM9AfGgBYHjsGteRRY8Bo99kHdo
 NIdraG0ute8dAmXUWbDSF/E=
X-Google-Smtp-Source: ABdhPJzxy9lRCMnYTypkHKsuB+w88pAkFn4LYMnAB+gbRW/+PcMvWX8EpixdKA4dcdK2bjzwLQnVjg==
X-Received: by 2002:a17:907:ab2:: with SMTP id
 bz18mr3169358ejc.150.1620666907134; 
 Mon, 10 May 2021 10:15:07 -0700 (PDT)
Received: from spectre.fritz.box (host-79-47-116-73.retail.telecomitalia.it.
 [79.47.116.73])
 by smtp.gmail.com with ESMTPSA id hz15sm980260ejc.57.2021.05.10.10.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 10:15:06 -0700 (PDT)
From: Elia Devito <eliadevito@gmail.com>
To: 
Subject: [PATCH] ALSA: hda/realtek: Add fixup for HP Spectre x360 15-df0xxx
Date: Mon, 10 May 2021 19:13:33 +0200
Message-Id: <20210510171332.8313-1-eliadevito@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 May 2021 11:08:22 +0200
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>
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

Fixup to enable all 4 speaker on HP Spectre x360 15-df0xxx and probably
on similar models.

0x14 pin config override is required to enable all speakers and
alc285-speaker2-to-dac1 fixup to enable volume adjustment.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=189331
Signed-off-by: Elia Devito <eliadevito@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b4b71609dff1..be2a5cd2875d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6542,6 +6542,7 @@ enum {
 	ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST,
 	ALC295_FIXUP_ASUS_DACS,
 	ALC295_FIXUP_HP_OMEN,
+	ALC285_FIXUP_HP_SPECTRE_X360,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8099,6 +8100,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HP_LINE1_MIC1_LED,
 	},
+	[ALC285_FIXUP_HP_SPECTRE_X360] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170110 }, /* enable top speaker */
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8278,6 +8288,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
+	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_HP_SPECTRE_X360),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
@@ -8665,6 +8676,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
 	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
+	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.31.1

