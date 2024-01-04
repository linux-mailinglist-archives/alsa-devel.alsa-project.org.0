Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDA823E8C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:24:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C0314A9;
	Thu,  4 Jan 2024 10:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C0314A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704360294;
	bh=I1PEMGQhf6s6T3XGLWXHNW+dj75r/+iQcN27jd8cVQA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kdir/JZTQ3vhUzUDnsnQk/xgSCMN/wEDgNAMavxREiII0a2cNaDnJUjdZ4FMvgXsx
	 jMZMp2nf3M9tmWcMV5qImBqZLsifeBeVXrp4DBqnLzXCYEy4CC0DqS4/FBX7Rly485
	 8XBecXoixBDqhhgFqkutUukSM6YdmVnkZfJOEWEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCDC4F806AB; Thu,  4 Jan 2024 10:22:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57AD0F806A1;
	Thu,  4 Jan 2024 10:22:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA901F804B2; Thu,  4 Jan 2024 07:10:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6967BF80224
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 07:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6967BF80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HP2dock7
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d98ce84e18so114940b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 22:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704348542; x=1704953342;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZvQW0xU+LOb9bzaqP41SYyg4D476cxr1BBMCgwep1I=;
        b=HP2dock72MnQXoc6LAvqR8Lq/UkMBLddWtaR/BGwuTSkEFfnmcR6M69u9oHx1E+AEn
         94LznkCVCq7Zb7WnXtlsIv3qMGlASSKWXK+vjZgIcbGvhV7FjTNxyPudSj8dXcOiXN9e
         dSNSZ1Z4krba/JfQudbn25CDRUVxsxqvQeXenMp+fWlCfCFT6X4+b/E0rwIvhZkK7/nR
         0mbHU2gkVfCWgagWaNrwiWzwZ0zQLGQ5GMZii/tHL0nggWicGL6Xg0APrhN5A8Ow6rJ2
         /Qut6BmdkLNui0IRnnx+Fe2QcyFKhb36nxi508vylfUUnu4GJaz76Of3IsECusN+FJMj
         9UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704348542; x=1704953342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZvQW0xU+LOb9bzaqP41SYyg4D476cxr1BBMCgwep1I=;
        b=vcCKWOBJsejVHldduVG/LINTItQqCo5iq7557eDPIuLTQI1+XdloJIxUCpZSEXbDtu
         MEEw7sxMszg2yY5gWtZJ4dqEel84vyY7F8J8HLhbSMvlI8AusYO0YX+dCx/MV/Hypq6R
         /s2FneZ0fCsTQSIWg9f8jEbmK5XIaNc9yVBiR+27qgzvF+KSIbDTOvD0eALMXW1sQf9O
         H7K8R4g+GLSlXpedyhtTQuehpNqByIbyRkbUuO9IRoWySbMN810fmqn9BwPKiTPWxY+4
         xpp1JHj3F7YiFeEWAuDTi5+WnzwiIktZVg8a2r7kqPbkZ33OvLKBzo1i3hF/9opElamf
         pXVg==
X-Gm-Message-State: AOJu0YyZqhW+pZpwWSVlivXOox8CjiyKT6X39mKjP2ZembLDfi58zn0Y
	FAnCZkuG7xayQs5pJpFUOOQ=
X-Google-Smtp-Source: 
 AGHT+IGPx7ipScYKtOWFT5j0xVd85A3lG6Rch/jPBtZBGlh0XwaA+0QEFOoH++nqD7CibZ/idq9h8g==
X-Received: by 2002:aa7:9e42:0:b0:6da:2898:1d6c with SMTP id
 z2-20020aa79e42000000b006da28981d6cmr142773pfq.51.1704348541947;
        Wed, 03 Jan 2024 22:09:01 -0800 (PST)
Received: from arch-hp.. ([2409:40c2:1059:c189:c8af:e8c3:986e:aea2])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a62f207000000b006d9a846036asm19473072pfh.60.2024.01.03.22.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 22:09:01 -0800 (PST)
From: Siddhesh Dharme <siddheshdharme18@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddhesh Dharme <siddheshdharme18@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP ProBook
 440 G6
Date: Thu,  4 Jan 2024 11:37:36 +0530
Message-ID: <20240104060736.5149-1-siddheshdharme18@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: siddheshdharme18@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IO3NGLAXJQEAY5NJ5TLVX6USVT7K5AXR
X-Message-ID-Hash: IO3NGLAXJQEAY5NJ5TLVX6USVT7K5AXR
X-Mailman-Approved-At: Thu, 04 Jan 2024 09:22:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IO3NGLAXJQEAY5NJ5TLVX6USVT7K5AXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LEDs in 'HP ProBook 440 G6' laptop are controlled by ALC236 codec.
Enable already existing quirk 'ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF'
to fix mute and mic-mute LEDs.

Signed-off-by: Siddhesh Dharme <siddheshdharme18@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c80e2f3ac..1dcfba27e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9825,6 +9825,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_HP_SPECTRE_X360),
+	SND_PCI_QUIRK(0x103c, 0x8537, "HP ProBook 440 G6", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
-- 
2.43.0

