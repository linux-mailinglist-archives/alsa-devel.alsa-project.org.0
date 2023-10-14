Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2C7C93EB
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71564EB6;
	Sat, 14 Oct 2023 11:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71564EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275950;
	bh=Qiml3W9UvPfOkKKYCK7USTbhDEvTF/R3THCSPCZgD2E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=geArhsK9m7uUEemTbG0LllBfG66yPbNp+JSBPCTSQPsQmf4Svkdlf85eiM95HfGHy
	 bCvtD/wQgbmLpKe/78T8DlnMf6BZBiU2Bp/AdQFMmfhVRJo3RLGRM2ciKUvu4h7/S1
	 8rDHEe8qES/YdCq8FR1tpRhni06bVLe+RoYcFrf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A4B2F8061E; Sat, 14 Oct 2023 11:28:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB3EAF80552;
	Sat, 14 Oct 2023 11:28:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 681A1F802BE; Sat, 14 Oct 2023 08:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 200B6F80130
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 08:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 200B6F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hB58/zVM
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5045cb9c091so3564934e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Oct 2023 23:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697265349; x=1697870149;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJyWt/G9UgfvUHmmjADyY97GEgcUxAnVJZD4ohf6ujU=;
        b=hB58/zVMeczGq4tplpgvKom8v7E8qnGODkL3Wy8YZloS3VH/U2BAj64aVJDOPq5I53
         97YAURH6OwD383s6ndlJVy0xGv++pvg77CDeY0DhI0fWOOspZNhxcm4u2D16ytkABnMN
         hX0U0l1v8jZJgO2m7tNB1GE43Lx4LkUwdFoP9HzLAH1A7xpkAnCKY+R3LuCzcXHiKltU
         WJZQKb8uS+SUYsUoNFTnA8Nj0wlK9dDD3Z5dW3X604BiVVcCBmscP4wfhs7vaHh7v9p3
         oitBbYCJrLMo2NN6+rU5Rk1PBtlHBdUqYiTgkKr6HuWiqs5grfptRFO8V4IViPMyFCPr
         DW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697265349; x=1697870149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJyWt/G9UgfvUHmmjADyY97GEgcUxAnVJZD4ohf6ujU=;
        b=wS2q+JtUNRlqgfR6aFmkaZGyx96uWn7Za7tK6HZYOACsPzKu451njAQlimrNRiNUSX
         J3yJgjvw7Z/ognmEBNDO1eC9As/wtEJ+6OsZ+w6/IoZUgvWh4g9BNeqenbt2gqGXs1LD
         NGViE9gHb2iCq6fsjoJW1Nmvtw9nZ0Vozb5cHRS+Enbedp0+mwzL/wfxIXP0C/sxpjoP
         SJh8SpWH0OC/ffsQeDxQY7CNFMsBPBEXwVMlTv9QwdF/wnhMYurg3RFRzR53sgFPWBxQ
         39FTfsnC2Qe3WYOVbRHd4R6ZKyci5YZv9nFu7mwvzkj/7weBG8muAleXdjL+jWUKsNI3
         CANQ==
X-Gm-Message-State: AOJu0YzPeFJX6qfn8STgNgYhtTVSiMbKs/txsCtLERMJS/D8Q8trTAga
	OmFPRVvfhXflqq7F7WnYdOU=
X-Google-Smtp-Source: 
 AGHT+IEy1YVM+k76/k7sHjrEvJ2I9VtPmniChxu10UiPmEh5XOEZX1I4i/sNqFMuzVTFUlqoFOy4rQ==
X-Received: by 2002:ac2:4199:0:b0:506:8d2a:e31f with SMTP id
 z25-20020ac24199000000b005068d2ae31fmr14219474lfh.46.1697265348575;
        Fri, 13 Oct 2023 23:35:48 -0700 (PDT)
Received: from flex1911-laptop.. ([85.172.95.194])
        by smtp.googlemail.com with ESMTPSA id
 x9-20020a056512078900b00507a0098424sm302560lfr.109.2023.10.13.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 23:35:48 -0700 (PDT)
From: Artem Borisov <dedsa2002@gmail.com>
To: 
Cc: perex@perex.cz,
	Artem Borisov <dedsa2002@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG GU603ZV
Date: Sat, 14 Oct 2023 09:34:46 +0300
Message-ID: <20231014063458.13474-1-dedsa2002@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dedsa2002@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MXWLRITYZKZPNRR4BBVOZIZ3PXNENEZU
X-Message-ID-Hash: MXWLRITYZKZPNRR4BBVOZIZ3PXNENEZU
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:27:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXWLRITYZKZPNRR4BBVOZIZ3PXNENEZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enables the SPI-connected Cirrus amp and the required pins
for headset mic detection.

As of BIOS version 313 it is still necessary to modify the
ACPI table to add the related _DSD properties:
  https://gist.github.com/Flex1911/1bce378645fc95a5743671bd5deabfc8

Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3eeecf67c..29c267ea3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9787,6 +9787,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1463, "Asus GA402X", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.41.0

