Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD56F6509
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 08:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B4C1841;
	Thu,  4 May 2023 08:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B4C1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683181845;
	bh=9HxUsLh0LN/gbc5OfOjW3oy56LsmkFdNyqOVyJl6lWk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V0SZzaAaOa05B0knOPJ+aIUzL8+/teZrAZqTNe1JAJ/hP1f1Y0WdX7/vwOyxW0BeH
	 8Awu9+MoThjqk4jI8SxrrZAriY1xvFhmUY6O5oz8S4tN6LUVjs9Ams7Ah1BLRt4WAy
	 T3ZGBSgDYg0vkb1/TxlGhaXZG5MiWLVkQ+OJG/qM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 796E9F8051B;
	Thu,  4 May 2023 08:29:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B495F8032B; Wed,  3 May 2023 19:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F351EF800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 19:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F351EF800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PvJUTiSE
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3315ccc1ce0so6597355ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 May 2023 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683136252; x=1685728252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7jQbQ2eUTO2h8zVdPJiBBhsIPjfggv9KTykUBwVf3E=;
        b=PvJUTiSE4ubhTBNHRTvDZ1sQJrHSex7/Rv5FqXOcaZgEiKnIN2tTkcvwQDq8BEW1Z3
         mp9w/+C3AwBdcUd7nG7XWC89X2+2L3Xz4xkPGUMUM09GB7c9Y5GthL9kQ7/MumK+Avfv
         +FzMDj4bK335vNFiDX1YVcdyf7BygKm1h0ft2vbotTvYbUIY1vkKY2YVejU3sNN1HjNT
         3vgPs2QfEytKA0rIp4Gpq50rWNJ8IAWCTKTr+U9pz/8ZZfP+nneSpVruSJTNU5YkvIGt
         2oQIeLpISD/znVO7R3cKuhdZJbtzCMcO/qPUP+wd5glBvcPzYvaQHN48jzo8V026CIbR
         hC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683136252; x=1685728252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7jQbQ2eUTO2h8zVdPJiBBhsIPjfggv9KTykUBwVf3E=;
        b=ZzkPPpCyVJhVZ+GjbX+UmUEoX8t0wp/uSW/YEQYImqImexScRvZwIKhj/qKTqAZhT0
         Zt0IMALKtFXUwX5izJjvp9VG77eixFoX+gsBIwQjaJ4N7D3BCeiGtOImSiD7E1HM5nNp
         VVsE+W8lkKV1pNmqdE7OnX7iAepHvgIRl4EUcgo7yM7FKNTktoQZiARAAEbq2FJMZG3b
         c+DkLQelvqk1OspgRxZwRu5N+mv+ElJOzo+p9GXkserOBvCHOtsrle/CyhptIBnP9ZYg
         svLPGRpz5ZxbwvA1uid1P6AKFse8IhsdFFP5YFsQ05UYjC0GOxgpo7+4uXLBdoRNLuL/
         PvKg==
X-Gm-Message-State: AC+VfDyYCbL3WHD3YApW2c6QP+8/2hhPflljQV4tnP9WnP/N/In4RpU9
	5nMPggLYrqvlYjNRtBO5n/k=
X-Google-Smtp-Source: 
 ACHHUZ6ZiYm0NH798Vu2b6Lk/aAPFkYw/kDOndjNfYsHuM6BNYcu9QekT2opB6GKQzar16ekqEDqDA==
X-Received: by 2002:a92:c946:0:b0:331:5284:d6b3 with SMTP id
 i6-20020a92c946000000b003315284d6b3mr2820906ilq.7.1683136251904;
        Wed, 03 May 2023 10:50:51 -0700 (PDT)
Received: from mrcarrot-aero13.rtr.local (fw.rtr.mntm.org. [66.172.165.2])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a92c084000000b003261b6acc8asm667139ile.79.2023.05.03.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:50:51 -0700 (PDT)
From: Caleb Harper <calebharp2005@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alsa: support HP Pavilion Aero 13-be0xxx Mute LED
Date: Wed,  3 May 2023 12:50:26 -0500
Message-Id: <20230503175026.6796-1-calebharp2005@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: calebharp2005@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2CYEAHNU27Y4GV7LVLGCDGQ7XBOXJZDF
X-Message-ID-Hash: 2CYEAHNU27Y4GV7LVLGCDGQ7XBOXJZDF
X-Mailman-Approved-At: Thu, 04 May 2023 06:29:34 +0000
CC: Caleb Harper <calebharp2005@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CYEAHNU27Y4GV7LVLGCDGQ7XBOXJZDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds support for the mute LED on the HP Pavilion Aero Laptop
13-be0xxx. The current behavior is that the LED does not turn on at any
time and does not indicate to the user whether the sound is muted.

The solution is to add a PCI quirk to properly recognize and support the
LED on this device.

This change has been tested on the device in question using modified
versions of kernels 6.0.7-6.2.12 on Arch Linux.

Signed-off-by: Caleb Harper <calebharp2005@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f70d6a33421d..aeffe6bd8b98 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9428,6 +9428,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8902, "HP OMEN 16", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8919, "HP Pavilion Aero Laptop 13-be0xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x896d, "HP ZBook Firefly 16 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x896e, "HP EliteBook x360 830 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8971, "HP EliteBook 830 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.40.1

