Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 361D07A94C1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FCE8EA0;
	Thu, 21 Sep 2023 15:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FCE8EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302825;
	bh=Gi7VOIUEx+O9rNETq7jMmEwCAXS7S4UVo5MzRwR8KHc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=avLPkNtk5F/p+8pVfnWO3gTufb+uX/ls8W/QkzDRppNWU6c4kCaUlJy1ergkqDmF5
	 qjqPICmZVMNSrI1V+1KLqR+Jep47Ttc+KeJtR9r57QQoFt5CT4qLHPXrZe6AJ7Vpsh
	 MLaYLKzk0f9gsLe1uSefOedn9PxnLqmEEI7lnvQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EACE6F80619; Thu, 21 Sep 2023 15:23:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07041F80616;
	Thu, 21 Sep 2023 15:23:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B4B9F8025A; Wed, 20 Sep 2023 18:29:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7ACAF800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 18:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7ACAF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J536RXah
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso6681037f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695227334; x=1695832134;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+svc8ya/3hLXtgURW9qrBP4eP/nOp7XiMBrPk5Pez+k=;
        b=J536RXah2roACCfNtvYsXb1bjR1p5qaKVO8B0t1bShc9G/5sjN/GNr+uNK3Pvsq6I/
         4lELe02lxIFr6o5PBa6j8QAm1MC50XyZ3clZAQAq0GJ2ymgIZUB9E3JUGZXX2PMne7rP
         +Y6uDBK+2ddwqLcjRhNVcTnyZ03Qr8EAIdNAxxWoLBWnuo9skQ8K/6+96uD0ytGqY3kT
         foChZgOSvvFbMj8O262aqfTRthV+pJB0QKMugulE3jih8inflapVZu9V5uYszo1vDxi2
         ccD0tpjYczvJHHWQ/ZHM0aN8lGO1kzVTPWDsXSoebcK9SaPaiPtdNII1RyxSR5+CLnQZ
         5Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695227334; x=1695832134;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+svc8ya/3hLXtgURW9qrBP4eP/nOp7XiMBrPk5Pez+k=;
        b=Jg70OUkB++YtBAaB4FhIFS5F8FOrcP7h/DyAhMfHfoI1LQ/3dH0U725XXDcq4Vpqca
         P9jFFPk2rQ4+hb0PRCdoFgNbDH1qyFnC6U3zU3JOeAitS+RvvvWumAnIcA3ZhY7oF2zh
         7oCvHZW5UEQ6XVemy66BRu6ZNXcemWdVL+Nx+3AUe5vtVyhBFM78uhbqBgeJzhmMy2Fs
         nb+OntvhyWZq3pColdIxKsy/WtIyFi20gmhZAn5cbkaAeZaFszhFJUY/LquZwCpkSGYO
         J2saOMHhSIgFE0Eok9xz9i1iwbg49QLS6XocJVyS3cXf21KWesMWiRyNr/sIj659b9wa
         Yw1w==
X-Gm-Message-State: AOJu0YwsEtmlOjAPjPw3sCxfdnmMsr1lwZLZMslVhduiG/+MnVan2OY9
	W+NqdzdFWIeQIIW8Vp8l6V7ZjhxI9G0FjxE9RVWkD9IVT3WYFA==
X-Google-Smtp-Source: 
 AGHT+IHCjQzkDiwVjdq1cmpM3eFdpKVPG1QOQho7PFze/UrSZ6xGis3QsOWY+ZlBZdUcJ/Vyxvo7paOZxqgPAM42DOQ=
X-Received: by 2002:a5d:4c47:0:b0:317:5e91:5588 with SMTP id
 n7-20020a5d4c47000000b003175e915588mr2834234wrt.3.1695227333726; Wed, 20 Sep
 2023 09:28:53 -0700 (PDT)
MIME-Version: 1.0
From: Abby Ricart <aricart@gmail.com>
Date: Wed, 20 Sep 2023 12:28:42 -0400
Message-ID: 
 <CAE+SJcJ+pPob5cMZHoP01XPjU-zZjmku2YuHOWoo9gM0ruCkcQ@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG G533Q
To: linux-kernel@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: aricart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XF3QATO4JWT2IMMLJ3JZOQ7EWYUMXJZG
X-Message-ID-Hash: XF3QATO4JWT2IMMLJ3JZOQ7EWYUMXJZG
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XF3QATO4JWT2IMMLJ3JZOQ7EWYUMXJZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The same quirk applied to the ASUS G533Z is also applicable to the ASUS
G533Q (of which I am an owner and have thus tested).

Signed-off-by: Abelardo Ricart <aricart@gmail.com>
---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b7e78bfcffd8..7bb3c1e05bf2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9781,6 +9781,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
  SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MIC),
  SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A",
ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
  SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
+ SND_PCI_QUIRK(0x1043, 0x1602, "ASUS ROG Strix G15 (G533Q)",
ALC285_FIXUP_ASUS_G533Z_PINS),
  SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
  SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
  SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
