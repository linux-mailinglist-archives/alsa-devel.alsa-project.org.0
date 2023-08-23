Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E5786AA7
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 10:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B421C83E;
	Thu, 24 Aug 2023 10:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B421C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692866982;
	bh=r5xhESvmjHGHZZX8WUYq/peRaaEBcQde4RXkDT81fYI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NtA2BjNkj9MwH4gwkGP+1e6r+INxxG0vwlhV+VZD2NPy2Y8uBISxh3KIV4Kx1nTDz
	 8MQYJ16XQCR7DSRb5Spa3KMkUgbKffPM0dqoLj7DIVGMvIbAXMgIEsP/mMTPPJacvj
	 BJ+veZyIX6neObQYIhKv1ACq9heYX703hm8VRvrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20436F80074; Thu, 24 Aug 2023 10:48:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6858F8022B;
	Thu, 24 Aug 2023 10:48:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 092F6F80158; Wed, 23 Aug 2023 13:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E68AF800D1
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 13:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E68AF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=fchnrp14
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a68d23f51so1774428b3a.2
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692790860; x=1693395660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Su+EU8s5DmANSaG1XE16qDS9/XMEfX9gISNXjzq27Sw=;
        b=fchnrp14aPW5vsHdbdWYZ7o0T7l0cHhD4iWuO0jpSGcX6Vdi6tjgpttzFEzPdPpXk/
         3brjhEorRO66Mp5CG4uGHRB+0mpTcdxglnBtyA+moHaqv/s4OUYU0ZHvb2TgxeCN6T51
         qbCvcqdwsfsQGPK9Rfv0neIMThfDZ+/Q2oMT8aRri21hSPVhG24aeidLGFjt5HReZDob
         aRWKJImae7+y8Lsa5/Vc380OGzTdloM1Z357Nlsq3TacgdksKLtS2+LN8CfyEGnry5bz
         XXcxjmRvDyd3OPZYh5X+YmBjLuOc2O71yGi42jomiGXss0boiDljMgu+aYk8dF164dq0
         sXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692790860; x=1693395660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Su+EU8s5DmANSaG1XE16qDS9/XMEfX9gISNXjzq27Sw=;
        b=BONJ2mfDEwdexwJ05OVKtTQ+9I125OQiSqWWzs/J/ATc+2ZhN6QguYYch+oPRIZmXM
         OKccZLjm1rbxSI8rjXAxkJKUJJNuxuHtFYFb4fd5JUvalsUDFxIZSQk5pNBZEX7ReOeB
         pMXhUdyp9l63tHv0TQq5RzjWfwO45OHg4yeJnK/M5MvUCg/ecf+V1i9bCLtRwxTwlwRw
         TS4eXHZyyezbfikUK/obegtECU+DIv0VH/LtAS257vXOgqR9MRJpeJvfHdUUf0kMbIUU
         eQEEGTUsqXv24cDKmZDlvvlQWAIdaehsga0Txe5rCMkBXR5b5PVMUwh4vpNV/AiYLaFN
         SzLg==
X-Gm-Message-State: AOJu0YzCahPBG4JWtLsV6AUU1kLivnal9PeuE2ldL6t4YKgXdzS6OGgs
	RHTtE95tWqNL6QEaYCItQ0I=
X-Google-Smtp-Source: 
 AGHT+IHua33zuGAafhWe6RdBA0W5BIQr58Rl41OKq+EqR/CvCx1kr0fIn34fM95VoyE5EwyQpWmSVg==
X-Received: by 2002:a05:6a21:6d9b:b0:14a:b444:dcce with SMTP id
 wl27-20020a056a216d9b00b0014ab444dccemr2544075pzb.4.1692790859703;
        Wed, 23 Aug 2023 04:40:59 -0700 (PDT)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id
 z25-20020aa785d9000000b0068783a2dfdasm4589293pfn.104.2023.08.23.04.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:40:59 -0700 (PDT)
From: SungHwan Jung <onenowy@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: SungHwan Jung <onenowy@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Victus 16-d1xxx to enable
 mute LED
Date: Wed, 23 Aug 2023 20:40:51 +0900
Message-ID: <20230823114051.3921-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: onenowy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7UYSNHEQTAOIRHQZYQLUOWSHAAFTVLKU
X-Message-ID-Hash: 7UYSNHEQTAOIRHQZYQLUOWSHAAFTVLKU
X-Mailman-Approved-At: Thu, 24 Aug 2023 08:48:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UYSNHEQTAOIRHQZYQLUOWSHAAFTVLKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This quirk enables mute LED on HP Victus 16-d1xxx (8A25) laptops, which
use ALC245 codec.

Signed-off-by: SungHwan Jung <onenowy@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dc7b7a407..d8865f467 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4639,6 +4639,22 @@ static void alc236_fixup_hp_mute_led_coefbit2(struct hda_codec *codec,
 	}
 }
 
+static void alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
+					  const struct hda_fixup *fix,
+					  int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mute_led_polarity = 0;
+		spec->mute_led_coef.idx = 0x0b;
+		spec->mute_led_coef.mask = 3 << 2;
+		spec->mute_led_coef.on = 2 << 2;
+		spec->mute_led_coef.off = 1 << 2;
+		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
+	}
+}
+
 /* turn on/off mic-mute LED per capture hook by coef bit */
 static int coef_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -7231,6 +7247,7 @@ enum {
 	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
+	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9309,6 +9326,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
 	},
+	[ALC245_FIXUP_HP_MUTE_LED_COEFBIT] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_mute_led_coefbit,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9582,6 +9603,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.42.0

