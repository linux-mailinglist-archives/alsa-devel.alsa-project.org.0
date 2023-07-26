Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDA7648FA
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 09:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F413E1E0;
	Thu, 27 Jul 2023 09:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F413E1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690443628;
	bh=taWEfeo0PxfOfR4IxpIUh5n9/Ry8DIw/1bIVp8pZDK8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jIz+O0SrQor7mqua31DWaEImxxqybLElNyuWpjT/3/w6Rtyzwn5qMGh5f/mhLalfQ
	 AsJ3gJyidpPXm8DTbTjnLWNLX+8V2Uh2mwnnYjTY0vPtRN1b0Pe5K8HiI3Xk/aKqVX
	 eivxShD7UkEeZZ2yI716jltto5Z2ijQpA8rHAk9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19E95F805BD; Thu, 27 Jul 2023 09:38:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97CCEF805B3;
	Thu, 27 Jul 2023 09:38:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C81F2F8019B; Thu, 27 Jul 2023 00:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01348F80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 00:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01348F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=S3vkQNY0
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb7373dd35so1948556e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Jul 2023 15:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690411054; x=1691015854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGSL9ovzDnY/qWwvHfekKpbaCjtrY147m2RUqDvJEJw=;
        b=S3vkQNY0jsJjcKrFvp/cfyfPBQ7ENNJyBLEhthOtYWIAs9JDxhVwdNE2GolvfkRqp5
         nN8wQcznG2FS7hiK53CGvOwIkTW14sFIs95MIGfkXWFLxKoYrkvV/HLf71XGKQTmb5He
         FoCNGjQNWUPLDCUsQ6IAlkYQT+zRTXtq/tZJYUpBFlfLd9AGXh/AhFgdArZaWN+/QPNh
         s2VmyNWqEAdWn1s1jR7I4ZSgwWedOttUgDcZLYVydKm8/DXu4AeeKfZIugkvUptEBfxx
         kfmM0aVh1je1bartJ9k1eDyyD8oDlg4LRP170XHhKXItYSEXjrawaq66z5B+kDgskmhk
         X6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690411054; x=1691015854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGSL9ovzDnY/qWwvHfekKpbaCjtrY147m2RUqDvJEJw=;
        b=bxBH5s2QVGzhpoABg5xxWscg63Nh8dNCh+UrRFoBVecbc8tsQCntGnv+ChSPeSQTPI
         sDVx8NJ7qa+NGtWIbDbezKrDnF5IsISG1w1Olmh2Kjz1485QzvJiidRF/2D/D1gyopPA
         V+e04EO5OhSnL9NIqOAYgvLcjkhJ+JmI6XaFh0oyF2gLZG9hhmsIyMUBDll33756ttVG
         auThw5ge8l0bA2cUwtq7lqx6YjlWnJcBn5zHhfr2hrTxPfEalQ3phCr6J6CV6s7naM57
         EDx18zAbK1eU/Wi44Jq61XjuzRdDoI5hikZCkCPFN7jesuWAVPxbzJ+fvOgMWbKoOP41
         2l8A==
X-Gm-Message-State: ABy/qLb0vOPzNWf3xMnkMjSFSCP/2aLoSBGSZ5MYT3VBhW4RpXwFwOSC
	oKaV6gzH1ZHX7vSJqMDNhmk=
X-Google-Smtp-Source: 
 APBJJlF3jnov8dvwO1q1GSxtXvRFx+TC5V6cAhir8w5e68d6x63k8pm2gB2Yj+EXgIP3EoaZVBrJCw==
X-Received: by 2002:a05:6512:304b:b0:4fb:8aca:6bb4 with SMTP id
 b11-20020a056512304b00b004fb8aca6bb4mr113032lfb.20.1690411054343;
        Wed, 26 Jul 2023 15:37:34 -0700 (PDT)
Received: from foka.. (109-252-121-22.nat.spd-mgts.ru. [109.252.121.22])
        by smtp.gmail.com with ESMTPSA id
 q25-20020ac25a19000000b004fe061269edsm17611lfn.249.2023.07.26.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 15:37:33 -0700 (PDT)
From: Pavel Asyutchenko <svenpavel@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	"Luke D . Jones" <luke@ljones.dev>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Support ASUS G713PV laptop
Date: Thu, 27 Jul 2023 01:37:32 +0300
Message-Id: <20230726223732.20775-1-svenpavel@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: svenpavel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SHBHWODLEHU4Z7DDJZ2SEB4EB4SFGU6L
X-Message-ID-Hash: SHBHWODLEHU4Z7DDJZ2SEB4EB4SFGU6L
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:37:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHBHWODLEHU4Z7DDJZ2SEB4EB4SFGU6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This laptop has CS35L41 amp connected via I2C.

With this patch speakers begin to work if the
missing _DSD properties are added to ACPI tables.

Signed-off-by: Pavel Asyutchenko <svenpavel@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7c0f474ea3b3..dff92679ae72 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9680,6 +9680,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JYR/JZR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1d1f, "ASUS ROG Strix G17 2023 (G713PV)", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402", ALC245_FIXUP_CS35L41_SPI_2),
-- 
2.39.2

