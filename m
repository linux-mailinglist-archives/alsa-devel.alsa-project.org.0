Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693290985F
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2024 14:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D83AE65;
	Sat, 15 Jun 2024 14:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D83AE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718456149;
	bh=xqtN5Fn2CfmwZ9Vg/3vEVF2gAzSA/aPI+E9xeV07Zq4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KfMUHnkrnWM/+p4wv2eQFTeQ/rSSFG7fFpkzSvxN/wwEiTmltKDCUGeppoN02+KCP
	 4bPQLW3F0MGm/9Rb51omILWfCrfRUCvXfR5PgLtDkLY7BAqytP9Mh+f2AvWw0zxrhz
	 N6vaY9imBaxkt9XkQp4He/3Z8AH3CWRIaYDJbkSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B886F8057A; Sat, 15 Jun 2024 14:55:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB81CF805AE;
	Sat, 15 Jun 2024 14:55:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0DD9F80448; Sat, 15 Jun 2024 14:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B62D9F800FA
	for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2024 14:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B62D9F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sh+JOd3W
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so20985041fa.1
        for <alsa-devel@alsa-project.org>;
 Sat, 15 Jun 2024 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718456100; x=1719060900;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PU/plAUB3pXmtvzzj4mwVKHkG90R6S2BTMRSfWbaliQ=;
        b=Sh+JOd3WA9b8+4nL5kgMpL12tBm15uiq5fcEPsiQoXO4A2fMdRCGENFt/OjfYxEv8Q
         pwdoWZbnAxYq8vKFzfRUinriZl2c63Bx/3bzw1p5h6aInxRvFgqvrLz5U5Bf1XvThhNY
         KfzLcJtzYWNdTlwVoQeiYQxToHN6abhZ+x9PCPPkJq5P0LHbWOuCsqVh0CjzDJLtn6Ej
         lb3eFoSmlMaGOwHzKUKlRNnrC1VPQzYaVI18oSy+C2Y4RdyWqbXl0jPRHVlY891PNEo/
         0IeL1WPSqmIk+E9Bo2WRjNHtACz7s64bfU3lFCNZOeQATbxPNSypgrjoBmrI1qZ+BUfP
         65oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718456100; x=1719060900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PU/plAUB3pXmtvzzj4mwVKHkG90R6S2BTMRSfWbaliQ=;
        b=BmBNS1+2o3rh1Lz/eDPI++IHOHxl636k0sRdMsFIR1NAqVDkmg4SCdGdtIBOt9gnQZ
         s8fOKjjHTMfnodUZjhTnuKaN1jAGXyB1jAJo9xDS3IrdYfwvaJCOoFojRV4J2KOQZ6ph
         5yWJ7VcQaumE3jz8fAQQjWiARzo76oBO8ZipdoF9JElzNFtyx5KbD1gVSbus+lHMqV5m
         TO5jdUJOnlrAv2Chai2uhuLP6IemOzegq/1SZlA6FJ3yo10fa5QGaec/UnyMRfP8nRo9
         MdBP/iMbg7WFYarON4htPZHu0X+iB5UwUBPh4Zp4acuImo1W+38dYFnbohRX3IX0Yrw+
         W7bQ==
X-Gm-Message-State: AOJu0YwfAR9MUjwrCGS9DgRFQuGgPukhFzEwMQVYFsehgGx40y/KeiYg
	gaaekObhkJHziw/uArpMW1hx7oDC8NrpD9INffVf61wA0FPYJSW2X/cRGBly
X-Google-Smtp-Source: 
 AGHT+IFkUf1iBqBRD+AUYYNqJwcR2OAFlTmC2JSGllwYm+hxVyNvW3hpO7WYM1XPZDO9ieWIGEdr3g==
X-Received: by 2002:a2e:3304:0:b0:2eb:e312:5af1 with SMTP id
 38308e7fff4ca-2ec0e5c6e65mr35517231fa.22.1718456099406;
        Sat, 15 Jun 2024 05:54:59 -0700 (PDT)
Received: from ajratkogda.malta.altlinux.ru ([2a0c:88c0:2:805::1f])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c898f7sm7622691fa.101.2024.06.15.05.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 05:54:58 -0700 (PDT)
From: Ajrat Makhmutov <rautyrauty@gmail.com>
X-Google-Original-From: Ajrat Makhmutov <rauty@altlinux.org>
To: alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	simont@opensource.cirrus.com,
	foss@athaariq.my.id,
	rf@opensource.cirrus.com,
	wzhd@ustc.edu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad 330-17IKB
 81DM
Date: Sat, 15 Jun 2024 15:54:57 +0300
Message-Id: <20240615125457.167844-1-rauty@altlinux.org>
X-Mailer: git-send-email 2.33.8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H342ACNNY5IN2HL5C4XADAVVLC4BY42A
X-Message-ID-Hash: H342ACNNY5IN2HL5C4XADAVVLC4BY42A
X-MailFrom: rautyrauty@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H342ACNNY5IN2HL5C4XADAVVLC4BY42A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Headset microphone do not work out of the box with this laptop. This
quirk fixes it. Zihao Wang specified the wrong subsystem id in his patch.

Link: https://lore.kernel.org/all/20220424084120.74125-1-wzhd@ustc.edu/
Fixes: 3b79954fd00d ("ALSA: hda/realtek: Add quirk for Yoga Duet 7 13ITL6 speakers")
Signed-off-by: Ajrat Makhmutov <rauty@altlinux.org>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..5ec95a7903b8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10502,7 +10502,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.33.8

