Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA153748E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 09:22:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3098B1A7D;
	Mon, 30 May 2022 09:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3098B1A7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653895338;
	bh=amxCenVYKFLLjgQKoWqRPAtEiyptJybLF6SX7O27awo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mF+QwmJDfhh8iPAxfaOKgl9SJCsV5xp2AhioL+hl6yWNP51zmzuYBmlBhtLdLVwVD
	 5+68L5NTLU/qz2TD6Ok1/25rmEzvIJfe4Dax0jVQj9RMhdxl6OAJ+wRz/F7PnNY+fa
	 puwmMyZziCx3dQ+8F5AogkIhBvuDDonkWwIvbPTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D8C8F80516;
	Mon, 30 May 2022 09:20:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5552F8024C; Mon, 30 May 2022 00:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84822F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 00:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84822F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J5pOk7YA"
Received: by mail-ed1-x52c.google.com with SMTP id v25so3326970eda.6
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28grDNGVVwgvkgCPe3HFvEYkJipC2Cb3fnAVX4fq0Lg=;
 b=J5pOk7YAN5RiRnaTEd5KNJyjKchIaoV/9ff0ljMqAgtajGMDjG8KcERrFloK1EIMkR
 SyIl5qdg/OzIYTqNk/DmY3FDbsJh+pAUJu2h7kHYD2qMC17GDJkAMIzq+MuB7ACiRJdy
 KYUwNGYiXTLtVsT5NBGsJdqE4fUMIR19VQOn3XrZ8N0hT9V5gzA4ekE4rzsvJVWsRORy
 KqVhhqLLCLxlKBPf8xHkt5J/ya+Vr24XCrNHnJuaDLMF9QsPeMGrihSe990IOanm5c1Y
 KPdFo/Wer5nAb1eDbCwilyzjUljbMNwdiVIj0L5+FcVv3OECj4LPkBUYZPFoqsXtGycA
 IfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28grDNGVVwgvkgCPe3HFvEYkJipC2Cb3fnAVX4fq0Lg=;
 b=UmeSebSnzojRDs0RfYPHI76n37dj8G40ugFKLUAFmbiOF+VDtGg1UkchiMSR/G/HNH
 WPR3aEHqmsIgczeY05MClGtFR9s7lWAAob6JMH4/wZL5fFNzO8eUi+vAn5QTA8znW69i
 RFQ94VQHo+SAZEdMZh/kFtc8sHfPEsRNAI9GMlh0Jevh/gZ7XPxGyHGX44/D3xbTHe39
 5EjnomEcC1Ni9G1kOctbRQyLQ9lt9Zm8X4ufgwcRN9VW803Fkv0aBit3a8YG9gDcrwc6
 NzPILhjF1cFkgeyw6I2QiqVTdHZHIAd8n9GarmrxNkhMRc8QTm2jC26qxGeZd13ygMLJ
 7Cjg==
X-Gm-Message-State: AOAM531zgAWtZZvQR6nIhC1Mq9+vngXLJt17csL6jBVqpsazjnbi/8pU
 LEKMbJwdUmnEX1pjOM8nnA8=
X-Google-Smtp-Source: ABdhPJy36gFtvxZXqd/ef4i7J/Vur7da2Ugd78lWMuv8NEHUzvMn6fT0GPLCrZE9jkhNYCiNYTZePA==
X-Received: by 2002:a05:6402:a42:b0:42b:c5e9:1495 with SMTP id
 bt2-20020a0564020a4200b0042bc5e91495mr25576734edb.323.1653863756112; 
 Sun, 29 May 2022 15:35:56 -0700 (PDT)
Received: from marios-pc.home.mlevogiannis.gr
 (194.219.107.43.dsl.dyn.forthnet.gr. [194.219.107.43])
 by smtp.gmail.com with ESMTPSA id
 u28-20020a50c05c000000b0042dc882c823sm697456edd.70.2022.05.29.15.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 15:35:55 -0700 (PDT)
From: Marios Levogiannis <marios.levogiannis@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Fix microphone noise on ASUS TUF
 B550M-PLUS
Date: Mon, 30 May 2022 01:35:24 +0300
Message-Id: <20220529223524.9057-1-marios.levogiannis@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 09:20:34 +0200
Cc: Marios Levogiannis <marios.levogiannis@gmail.com>
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

Set microphone pins 0x18 (rear) and 0x19 (front) to VREF_50 to fix the
microphone noise on ASUS TUF B550M-PLUS which uses the ALCS1200A codec.
The initial value was VREF_80.

The same issue is also present on Windows using both the default Windows
driver and all tested Realtek drivers before version 6.0.9049.1. Comparing
Realtek driver 6.0.9049.1 (the first one without the microphone noise) to
Realtek driver 6.0.9047.1 (the last one with the microphone noise)
revealed that the fix is the result of setting pins 0x18 and 0x19 to
VREF_50.

This fix may also work for other boards that have been reported to have
the same microphone issue and use the ALC1150 and ALCS1200A codecs, since
these codecs are similar and the fix in the Realtek driver on Windows is
common for both. However, it is currently enabled only for ASUS TUF
B550M-PLUS as this is the only board that could be tested.
---
 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 89d610afa..f3ad454b3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1981,6 +1981,7 @@ enum {
 	ALC1220_FIXUP_CLEVO_PB51ED_PINS,
 	ALC887_FIXUP_ASUS_AUDIO,
 	ALC887_FIXUP_ASUS_HMIC,
+	ALCS1200A_FIXUP_MIC_VREF,
 };
 
 static void alc889_fixup_coef(struct hda_codec *codec,
@@ -2526,6 +2527,14 @@ static const struct hda_fixup alc882_fixups[] = {
 		.chained = true,
 		.chain_id = ALC887_FIXUP_ASUS_AUDIO,
 	},
+	[ALCS1200A_FIXUP_MIC_VREF] = {
+		.type = HDA_FIXUP_PINCTLS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, PIN_VREF50 }, /* rear mic */
+			{ 0x19, PIN_VREF50 }, /* front mic */
+			{}
+		}
+	},
 };
 
 static const struct snd_pci_quirk alc882_fixup_tbl[] = {
@@ -2563,6 +2572,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x835f, "Asus Eee 1601", ALC888_FIXUP_EEE1601),
 	SND_PCI_QUIRK(0x1043, 0x84bc, "ASUS ET2700", ALC887_FIXUP_ASUS_BASS),
 	SND_PCI_QUIRK(0x1043, 0x8691, "ASUS ROG Ranger VIII", ALC882_FIXUP_GPIO3),
+	SND_PCI_QUIRK(0x1043, 0x8797, "ASUS TUF B550M-PLUS", ALCS1200A_FIXUP_MIC_VREF),
 	SND_PCI_QUIRK(0x104d, 0x9043, "Sony Vaio VGC-LN51JGB", ALC882_FIXUP_NO_PRIMARY_HP),
 	SND_PCI_QUIRK(0x104d, 0x9044, "Sony VAIO AiO", ALC882_FIXUP_NO_PRIMARY_HP),
 	SND_PCI_QUIRK(0x104d, 0x9047, "Sony Vaio TT", ALC889_FIXUP_VAIO_TT),
-- 
2.36.1

