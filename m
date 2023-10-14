Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1B7C93EC
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06FB5E95;
	Sat, 14 Oct 2023 11:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06FB5E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275967;
	bh=MHKIR+LrDWKHe4w6lKUx6dZsCRjur9m8CCjfoVWyrAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b+UyTHsj02Y9uw3Ei5jml5Xx8KyM8W0h86wDVqK4+if4BQr3OS2+8Vme7z3/w11c/
	 jodIHCCWKRw7cZlObAIq+BdSfGwApjuJPbOOGoPm1k/Ki8glgKVxzVnjPyRK04kFh0
	 UMVRcrMQIQIglerreik+wBoE8BwuF/QMSUIhvNJA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B51F80624; Sat, 14 Oct 2023 11:28:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E28AF8062E;
	Sat, 14 Oct 2023 11:28:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 407F2F802BE; Sat, 14 Oct 2023 09:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 103F4F8015B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 09:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 103F4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Mcebu/LI
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so3748992e87.2
        for <alsa-devel@alsa-project.org>;
 Sat, 14 Oct 2023 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697269864; x=1697874664;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAkNMSkQh+HvBKSoXbMlmypmzhkJRtfMqEDqxnFHt7g=;
        b=Mcebu/LIDuHz907G9LhO+bKpLKSULYsWDM8XWPOelkhQzSDCNyP0++zxyjyEIVDQHG
         fAgCjGQmDs4Xsw1mDdnXiixWfNAUX6G0LoQNvRO1GiGgVhZy95PGCxKXa5GYHYoEHqZ8
         BgEBGkmjC9b4fFtxvFkd1vHN5A/0JooT8VwH6tVwDmwrXt717BEpmzPnpn1pQ+Vko25G
         uiogEd62MyWtkiV6Q93MZS/Vkrojy8A4k/SjV3hgzXrOgaTwt6tDljkgHyfM9zJl48TP
         eGV8oJAPuc5zSnYPx/gvrTxYYS8JQXjgVkZUjQenEGhnBT1HQZGbtEQ3K5CnfUpEsmMB
         TMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697269864; x=1697874664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAkNMSkQh+HvBKSoXbMlmypmzhkJRtfMqEDqxnFHt7g=;
        b=DHKONbBthmzaEBe0Gz0VXjI5jfMrqHtqUyUvfVmSlYN35nDQBSjUBfPzK9G0zYMoXn
         JDJ2/WCkrwUUqn6CVB7gXwot5XzDOK067wH7xkufo3N5IXJrdytWw+fegs/4Swb5ZpKs
         x++aqx/oRCDVwxYjSNWCVIczCRIIyBzT9EdCWfFBboV+29/lKhSxpK+1yONFAGA1hZAY
         4TcErkUstsh/0jAmAmsGFTzwKhaeBhVV8/F4uY1Lasu+52D5gMoM/1IPU+xoCPk0eUhi
         8QwZjJ2FGzU+MXWumROyLCJrpwxY23GtxqN2GBcqtr3sg3gWitXbpkpSJ7BTK689+kzA
         XRpw==
X-Gm-Message-State: AOJu0YwYqqweQ2SzGkW7nYxpBbJjN88C3gbl64ritMIJB0syVWXO3yFb
	Hce04UoYZIkaWFq4/7elzuQ=
X-Google-Smtp-Source: 
 AGHT+IHsuK/Nk9iKAhUC1I31QMSbJkHYF+ZoPMbFtuPmMv9zQ3vPJUkdc7N/1Jw43iEM+nLw4Y6oYw==
X-Received: by 2002:a05:6512:b99:b0:503:2623:7cfa with SMTP id
 b25-20020a0565120b9900b0050326237cfamr30129817lfv.35.1697269863755;
        Sat, 14 Oct 2023 00:51:03 -0700 (PDT)
Received: from flex1911-laptop.. ([85.172.95.194])
        by smtp.googlemail.com with ESMTPSA id
 m12-20020a056512358c00b004fe333128c0sm467685lfr.242.2023.10.14.00.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 00:51:03 -0700 (PDT)
From: Artem Borisov <dedsa2002@gmail.com>
To: 
Cc: perex@perex.cz,
	Artem Borisov <dedsa2002@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for ASUS ROG GU603ZV
Date: Sat, 14 Oct 2023 10:50:42 +0300
Message-ID: <20231014075044.17474-1-dedsa2002@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231014063458.13474-1-dedsa2002@gmail.com>
References: <20231014063458.13474-1-dedsa2002@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dedsa2002@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UDTNBT5T7VV52IWY6F766VVVFLYHQWXL
X-Message-ID-Hash: UDTNBT5T7VV52IWY6F766VVVFLYHQWXL
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:27:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDTNBT5T7VV52IWY6F766VVVFLYHQWXL/>
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
index 3eeecf67c..e92b3083a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9791,6 +9791,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
+	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
-- 
2.41.0

