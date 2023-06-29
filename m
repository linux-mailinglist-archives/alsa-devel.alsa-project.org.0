Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE495743756
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A29683B;
	Fri, 30 Jun 2023 10:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A29683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114119;
	bh=aaFYiPC92sCXHu9RrbrQeazvpJulxA+dXFELPl5yJgI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mgeB3W0ec/nD8qwnNZ6MMya42I7YOcSvVjPQD2LBAcB4l0mLcViX0/KMl0oAwAaoR
	 o68naqu0SBTatLifSAiBr1Kl4/wDtdmewKvLcqER9GNG6KWD8uImABmydcP+70geyM
	 f2JUKyIS31wZFK+0FmQfZjKEnft1fZ/2nbNE0hKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3503FF80549; Fri, 30 Jun 2023 10:33:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29BFEF80431;
	Fri, 30 Jun 2023 10:33:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37585F80246; Thu, 29 Jun 2023 14:36:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC8ADF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 14:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC8ADF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=a/n7a52b
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-262e04a6f66so319545a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688042166; x=1690634166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewkyga5jWrBIrRzjRNQ0kt+SnJFF9Xml4dXQcN2EQhs=;
        b=a/n7a52bRuhn9upZsTqFpiSSaog/awsdPngQx0nRwLqb939pQwSEsDJRilUUJKCAVT
         2xHWQaB2i6CuNCU3S5BR3p8oyW9Fqshw+2mINi+ONwP/goFY48iWt6Dlq6o66k5GmU/b
         OPt9z8Z7mGKLqKJHm+ZwUitOohXovc1AiXY+KJBcIP9HQKT8VD3oeuN2MmMecFbKFwzT
         Dn6stxqJ3x3tMe8CtiCcwgTZaJg8SI71zTOFKfzy/Ptp7qnRAv5lRf1t8RNIh3IpB4cK
         vSbh+dWr08SrIkKZ7rcT6Kl6A/EKMMUzvhhDZU0kkmd+W7dl4fNSN4mNx0i7RMA7xZYp
         6u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688042166; x=1690634166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ewkyga5jWrBIrRzjRNQ0kt+SnJFF9Xml4dXQcN2EQhs=;
        b=JUjbFO1X5uHxt9v6u8Ayivg4HRDetSIFdD/gJj/r6BBfrdPRzVu9SacnOjVN0h6wQl
         prVs8+uZJ0YauC5uOyA+z1TpbWOIIudCzczNHilAfOYKDLxh/Pui2uQhCKUztyyCw27O
         sVCzjiujWVHb4EiTsyAkTkD6nKOVHvvpGim0jQde001ZRGBdPp+ILvYwjhjzcC90GeiY
         xV5z3qrAKZQQZLk/pg1Oad+Vt2P13/7GyMTudsVXgyyNyAy/bRmpIeGM08TldPWhsw0M
         9+aBCwH5DOe7DDVe8O51TgFD6Iw8HoZ4S51qFzcxCNHMPWWuoTgbbYHi/Xd1ByMRq5Sm
         PHYA==
X-Gm-Message-State: ABy/qLa3WxoAc7cusHKc7+gJXI/VIj2fpY+vSu4OPJqwuidWQVl0Sab5
	vlR0SBnzpUf+g+C2wMC+nvg=
X-Google-Smtp-Source: 
 APBJJlGBLnd7gjJdm87WA4wCa8zgoc8Ra7eNct8HOvxnpQ+i5cMra8J6Yw56T+FsknWe7Oak1nSamw==
X-Received: by 2002:a17:902:c94f:b0:1b8:5541:9d32 with SMTP id
 i15-20020a170902c94f00b001b855419d32mr1374018pla.68.1688042165758;
        Thu, 29 Jun 2023 05:36:05 -0700 (PDT)
Received: from localhost.localdomain ([107.148.241.191])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a170902760c00b001b246dcffb7sm9026181pll.300.2023.06.29.05.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 05:36:05 -0700 (PDT)
From: Huang Rui <vowstar@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	vitalyr@opensource.cirrus.com,
	Huang Rui <vowstar@gmail.com>
Subject: [PATCHv2] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook
 G10
Date: Thu, 29 Jun 2023 20:35:57 +0800
Message-ID: <20230629123557.3627401-1-vowstar@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: vowstar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XNAMBQYC2KMSMP2SDMSF4AQO2YBJYEUB
X-Message-ID-Hash: XNAMBQYC2KMSMP2SDMSF4AQO2YBJYEUB
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:33:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNAMBQYC2KMSMP2SDMSF4AQO2YBJYEUB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the commit 3e10f6ca76c4 ("ALSA: hda/realtek: Add quirk for
HP EliteBook G10 laptops"), speakers are fixed but mute/micmute
LEDs does not lit. Need the ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED
to get all mute/micmute LEDs working.

Signed-off-by: Huang Rui <vowstar@gmail.com>
Fixes: 3e10f6ca76c4 ("ALSA: hda/realtek: Add quirk for HP EliteBook G10 laptops")
---
V1 -> V2: Add fixes to link a previously committed issue
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dabfdecece26..425c87733e79 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9491,7 +9491,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b65, "HP ProBook 455 15.6 inch G10 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b66, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b70, "HP EliteBook 835 G10", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8b72, "HP EliteBook 845 G10", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8b72, "HP EliteBook 845 G10", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b74, "HP EliteBook 845W G10", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8b77, "HP ElieBook 865 G10", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.41.0

