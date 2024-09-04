Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B296C18C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F8AE8E;
	Wed,  4 Sep 2024 16:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F8AE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461964;
	bh=KKXN6bVHQyvQe5DAEryYyZ3CiVfbinIUAkpj59tKEmA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fE49v4LKy/BmfdR4hD5up6zlDyo8GcgUcyKvPQGmf8WHvNSYOr369Iua8zn+mCTrt
	 jW/nIqfgwqAOUS5Igx9jYxa03IJ0wYkm+vnNTbhjdjzDo3fdMASrDSYqdCvwv/zzn6
	 4QEiqV8gXYtgehwexMTsGT6G3k3kMoxomlxnSsbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B52DF8060C; Wed,  4 Sep 2024 16:58:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57407F80604;
	Wed,  4 Sep 2024 16:58:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0F8F80199; Wed,  4 Sep 2024 05:12:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2A16F80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 05:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A16F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nf8I4Iro
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-714226888dfso333876b3a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Sep 2024 20:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725419565; x=1726024365;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BuUOiBL+3Emr7CBJB9z2PmaAlePmvtgF30QbjTVjrJE=;
        b=nf8I4Iroke2C+Vb/Fkry3EbHrMEY9a+liLJO3yXPe1ihEE6QMeBr42tb5YMfMr7uZI
         0DTXugxBOFWRXynhAQ8rwPAJ7BIel3X4aVKhiDnE2guCVVfMTAUGwmqv7HQEpiN60Y+l
         oii0eQEywDTgEkgxE3/m4solRD7CNzgV2zLPac60PxDV3csDNhxMgwUNywJK1EYBexnq
         f21iN9l3kyYuDaUklalE5Jv3HLQXBBWqSDecBlxKwJiNFWhp3fVtxfVmfgI/UBlNk34e
         7/5Lg4y+cC90NvRIvFAT7Tz9hKB6v7eZozkpytq3V9qG19fTzOFId5XNGWZ9mDPjvV/3
         f1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725419565; x=1726024365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuUOiBL+3Emr7CBJB9z2PmaAlePmvtgF30QbjTVjrJE=;
        b=uXookgwk1T30FAr9VahChz/93sG1UlEk68lUuxG9tHLHvVwtk+baKbbGgfI/qf1tLB
         5H02vaAJJn5hKiiemKE5or6jMmonDJT5XZ8Hz2GjybP2mfUM/vbEfE2Y9G3g/YmJDhFe
         7oVSgazMYBiIN/OlaNpETITU2XF7yp2QtvOUAYZFdh8LW+BaLeCW8FA2dnLQakEfIQxK
         yp+fLnxcYeXUyE1LGaMf0gI6B4DdTvSu0dO6L7YZ+G6qlrSfSExIOhiDFkcpS4I1Jb9F
         L0kwq8ma2ExVhktoLhLk7lChdKccVtiur1Krf1HFMUrSxx9LoN4jQmJj4djybapzvo0d
         o7Yw==
X-Gm-Message-State: AOJu0YwJxSLCsNyuTD+5Le3Vw5nYNwa1meTwvyv/hbqbQdwlFnWsue5W
	led1SiEBHrSHdE6qpbjgx3L7JMYKdKk/HeZQhCYdMDyUUkFXjZO9PNCC3IA0
X-Google-Smtp-Source: 
 AGHT+IFkBwhwna1C6OUckJKYjQ7/c7pFK29F1zoMHBB/xkq3DDr/EAdhgN9LZBND06jEOSrY39SRrw==
X-Received: by 2002:a05:6a20:9f47:b0:1ce:f752:46ad with SMTP id
 adf61e73a8af0-1cef7524723mr5695798637.42.1725419565150;
        Tue, 03 Sep 2024 20:12:45 -0700 (PDT)
Received: from imac2011.vn.shawcable.net ([2604:3d08:5c87:300::2e49])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206ae90cf63sm4817695ad.43.2024.09.03.20.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 20:12:44 -0700 (PDT)
From: Maximilien Perreault <maximilienperreault@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilien Perreault <maximilienperreault@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop 14-dq2xxx
Date: Tue,  3 Sep 2024 20:10:13 -0700
Message-ID: <20240904031013.21220-1-maximilienperreault@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: maximilienperreault@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GUBRCBOGOAN7FBZPEJ4FZKR54VZVQNRZ
X-Message-ID-Hash: GUBRCBOGOAN7FBZPEJ4FZKR54VZVQNRZ
X-Mailman-Approved-At: Wed, 04 Sep 2024 14:58:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUBRCBOGOAN7FBZPEJ4FZKR54VZVQNRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The mute LED on this HP laptop uses ALC236 and requires a quirk to function. This patch enables the existing quirk for the device.

Signed-off-by: Maximilien Perreault <maximilienperreault@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f67190a8c..6f96c0c67 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10183,6 +10183,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f6, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
+	SND_PCI_QUIRK(0x103c, 0x87fd, "HP Laptop 14-dq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87fe, "HP Laptop 15s-fq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8805, "HP ProBook 650 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.46.0

