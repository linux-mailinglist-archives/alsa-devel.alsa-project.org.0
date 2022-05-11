Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C735228A7
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 03:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CA618C8;
	Wed, 11 May 2022 03:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CA618C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652231340;
	bh=xrRQ0GJWq+66VCJpymvn0aMnpd4ABWaXmFU4EHXbdrg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZIbavtIYoRk7IcTZjr7FU2vheyKDoPvZ31zQG+hCx5xtn9euMfDK8QxG/34Cdi/QW
	 zpvr/ei9a9MLt/wuJItKOvA781awbAhJPw2ECt19WZX6aI6Ua8DXANPCRuWs9Sqnr3
	 lNTNGHs2SBbgI7cqRMx/ZguB0mg4os9RZ1USyCCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C360FF801F5;
	Wed, 11 May 2022 03:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74F8DF8019D; Wed, 11 May 2022 03:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B01DEF80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 03:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B01DEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=howett-net.20210112.gappssmtp.com
 header.i=@howett-net.20210112.gappssmtp.com header.b="LIEre7zy"
Received: by mail-il1-x131.google.com with SMTP id j12so424480ila.12
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 18:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=howett-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKDzgb7pX+8jdkJlU9jvaZ8AoRxWNdGhkJfVlXnpRsg=;
 b=LIEre7zyDoYEWVUarZq6FHOB/DFNLVDkTcdFAanAgP0v/z90hxZDp/iiiifBDSmtir
 I+jgkHMBdorWmBgVkcQDdO3+ZZ+YWJfPQJ6vOif9BWlrTftuPl3axUZNYbq/gXurxjAA
 UvFaSMK7ITl6CO2xtTLn+CkpLH/YTIIsfbd4J3G+RwssI/EZ6652uaY1CHcDTVs81Jo+
 genasjfqV8DQT4UhxumUcxzjDTZFU1mjA6EC9bXVoc+eGMn+F2UMmyaLsWXERAjej7rL
 qlaBG/mxKLzLIYhtzPC5qXllbkzIZOhCNg/VKR/7J5h87EzPkiEe5OlL+R0357adaGE/
 TcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKDzgb7pX+8jdkJlU9jvaZ8AoRxWNdGhkJfVlXnpRsg=;
 b=nohv8/Zx0kuhQL3izdT8JHzCA9C+ThIbwRS9a/Ex3jZ8q+4AzwxTqGoFo7s2a6Lx+F
 dDtSoDYBuEwBAXJG21/N3mvq/hEddJT8jpFB3EYOTHmmun72PJcQOtJeQA+ICU6/2dTC
 rOnYC9t4YnSKh4Y/wHC3syUWiIt0HvCfeVANx4kn70vDefHFw3frQlKB5YlitPlC0WDD
 nv33pMK/EIdtiHn93RgR6c14frvKjDUkOUC2UGjNcZ+T7bZoZrrvQZ2FFe4PoZAquZWj
 OIK8PTg9as/UCilElNwdcZG9FwvI4243RIyhvG9tdNoOJ4VPGDN5Shliu+LSMNr35t6Y
 jI9w==
X-Gm-Message-State: AOAM533s1rd+8EunfTqeohSy3o+q+UQ7SvSrug8ogNomrzzS/gngSTBo
 RS9xfGhgcJERQ54SAgfJntkOktXGb22kIWAq
X-Google-Smtp-Source: ABdhPJyimDsFW/z5X4qQsJpr8Uew0CKfoUgYdr4965M9kvE2Bk0HMz5fJz7x2J3J/Y5wlRu05lB5gg==
X-Received: by 2002:a05:6e02:17c6:b0:2cd:f999:3dd with SMTP id
 z6-20020a056e0217c600b002cdf99903ddmr10768806ilu.318.1652231266036; 
 Tue, 10 May 2022 18:07:46 -0700 (PDT)
Received: from rigel.delfino.n.howett.net
 (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
 by smtp.googlemail.com with ESMTPSA id
 q13-20020a6bd20d000000b0065a47e16f4bsm237870iob.29.2022.05.10.18.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 18:07:45 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for the Framework Laptop
Date: Tue, 10 May 2022 20:07:59 -0500
Message-Id: <20220511010759.3554-1-dustin@howett.net>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Dustin L. Howett" <dustin@howett.net>
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

Some board revisions of the Framework Laptop have an ALC295 with a
disconnected or faulty headset mic presence detect.

The "dell-headset-multi" fixup addresses this issue, but also enables an
inoperative "Headphone Mic" input device whenever a headset is
connected.

Adding a new quirk chain specific to the Framework Laptop resolves this
issue. The one introduced here is based on the System76 "no headphone
mic" quirk chain.

The VID:PID f111:0001 have been allocated to Framework Computer for this
board revision.

Revision history:
- v2: Moved to a custom quirk chain to suppress the "Headphone Mic"
  pincfg.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4c0c593f3c0a..e00e6d2038a1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7012,6 +7012,7 @@ enum {
 	ALC245_FIXUP_CS35L41_SPI_4,
 	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
+	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8806,6 +8807,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
 	},
+	[ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x02a1112c }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9294,6 +9304,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
+	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.36.0

