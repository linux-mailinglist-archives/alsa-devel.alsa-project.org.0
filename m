Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62D853417
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:04:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F473A4D;
	Tue, 13 Feb 2024 16:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F473A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836645;
	bh=qxXy/4C00miKD08z6hE3dWYxSISHDwA054ygcHf/2YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VnDxMJn44Ekiwxm/iszP82zjrmzVIStOzk3+Yo0jHitCgxwcRqz8x9NIBqnDcVyCA
	 9f47ArEcNbfJNmF5Lv8WJSi34T4jzVaxIJT7iI46tC/NwdNk69V8TWDE4bLoLgH0qD
	 n2Z+vVeoLfJriuNFBCPolOO5AjQCSiVRPyvGh7Js=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 938E3F80684; Tue, 13 Feb 2024 16:02:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C48C6F806A1;
	Tue, 13 Feb 2024 16:02:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 658CFF80238; Tue, 13 Feb 2024 12:56:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8356FF80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 12:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8356FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PvI+Ma93
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3cede53710so97236266b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 03:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707825392; x=1708430192;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdZyvgYPBQJDkU+5nXmVSJQwMHfnGYfuPE6w4sZ9NNI=;
        b=PvI+Ma93KB+w/lfqZ+T+Fk+1r/sBjC22pvbch3O2tv5ez4wJvWpiEdPmN4TDP7RmWQ
         rgdkfwa1GN2zOBDxuc/dDE8EJOvbbzsKUmtW7dLlePhOWriPhKPYGT0Zs8iqUnbQLt6o
         pRkr5bhK7IC7e7phSeOXH7qaQbkW+XJ2A2YtYgHmmiYIN1hOelKPZaiYGnkPMmXT3hYt
         7cUXLcbTEL6vu2bU8am8ZgXseQLQLtX0xpNzQRrTKAvFcEkvyR0UPW9XGyTh7nt2VaF4
         VxhM9U/oSO98FpvjvJ9D0U5PmvRZje6fZ5Jb6KN8TY3KOo2ZERDthzE/A6UWV8ezWkWE
         ZuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707825392; x=1708430192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdZyvgYPBQJDkU+5nXmVSJQwMHfnGYfuPE6w4sZ9NNI=;
        b=CIFxXWPMInzLVEuCrXdsKM+KMjPQQ2fBxp2Du0b/2vhdKXMEn++XO65lVjcsla5gLd
         1N9pf6UcdR9rVOr2yDd+aIdtdBNjUnzuP+o/e00i/1f1VkxsKYTMfvhRwbtQ88aX0OYS
         El6fxfC5ibvi4gMYR5InJJ5KYkcLmUs9/CGMUHgrqMkc4udCukWA9VylESI2DpWehybC
         f9qw3NLCmY05UY1rFFAvXGYwZZXn8c4fLH2FFiwt7Vb2L+J8MZRPsfVlAdB6ROafkV+p
         Df3j+5g59FbD4PiLrJQhmDcbmBIq2kKmqc+M98rm00BU5A881ee1oGp6WihlB7cEDv5S
         M/cA==
X-Gm-Message-State: AOJu0Yz6LKJDGQZTretgq+BmER8x0jABJLdydBuKkXPwszGz9vzKh6XO
	eVVpcYmRV7m7CCCC3J1BhbAhxxyl34uWWWv0uYsLh8Efi9UKsNKi
X-Google-Smtp-Source: 
 AGHT+IFJ3mbfGEX2qIRIEu25yk241CjyIBnoIdCtd8nefAcZm7zc6/cYHMBElh5ZVRd+hyp8DWHIKA==
X-Received: by 2002:a17:906:a392:b0:a3c:c97e:7d64 with SMTP id
 k18-20020a170906a39200b00a3cc97e7d64mr3576268ejz.48.1707825392367;
        Tue, 13 Feb 2024 03:56:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWiR4FYMHwWf5HfXJFc5o/vmOXgOdH+m1QxxIMk+tMNt/b0/PEPFeNwzT49q7WLJHVcXpEdBL5qRrfyu04SsgH3Nx7bzCM5ui7pa28OzCBo/NCBYJXYmMNGostuyZ3lBo70R9Y0Y3UIp5EZKq1EWGyWRW2Z20YIEQrtajQU9tyafMchFwib/cN4QVFmsWQIL6hYN94ff6wJMEJc3xyBwwc3ufmHSZAsaEYGlCm4dT9xSGUJmOPauaWart7nitRjNanOpmUd+G+8pwX9qbJPDyxuobBvE18Zdf+VKKPllKI557luRdMllm3qce99BUkhmTWb6iogLSQ5mf4yrVADtIThf7Z4eJqqEZcbMXRZtI/nq1Jp5QgKf0VngjTuWyMsWv5VrBZ0djf8nLDeCDItvNj2JQeWmQjfZiNZZs2oQ+y//tcaD6Z/aal5oJOs615rCwBylYAXceT/oXtHYsnzAaZT2c0deEX2lGqyAb2C+f/l6x5NA2sSsOU2Qngjt4SErQ8SOpxLRu9ZDop80UzGgV9mEpLNjUy0aA==
Received: from tkudela.. (c156-103.icpnet.pl. [85.221.156.103])
        by smtp.gmail.com with ESMTPSA id
 k13-20020a170906a38d00b00a3cb2295aefsm1210723ejz.205.2024.02.13.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:56:32 -0800 (PST)
From: Tomasz Kudela <ramzes005@gmail.com>
To: sbinding@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	andy.chi@canonical.com,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	kailang@realtek.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	luke@ljones.dev,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	ramzes005@gmail.com,
	rf@opensource.cirrus.com,
	ruinairas1992@gmail.com,
	shenghao-ding@ti.com,
	tiwai@suse.com,
	vitalyr@opensource.cirrus.com
Subject: [PATCH v3] Add Lenovo Legion 7i gen7 sound quirk
Date: Tue, 13 Feb 2024 12:56:14 +0100
Message-Id: <20240213115614.10420-1-ramzes005@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <000101da5e63$6a2565e0$3e7031a0$@opensource.cirrus.com>
References: <000101da5e63$6a2565e0$3e7031a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ramzes005@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3WPVPLOPJBBV6SPLWDKW3ACVQNB6II3H
X-Message-ID-Hash: 3WPVPLOPJBBV6SPLWDKW3ACVQNB6II3H
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:02:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WPVPLOPJBBV6SPLWDKW3ACVQNB6II3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Tomasz Kudela" <ramzes005@gmail.com>

Add sound support for the Legion 7i gen7 laptop (16IAX7).

Signed-off-by: Tomasz Kudela <ramzes005@gmail.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 sound/pci/hda/patch_realtek.c        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index d74cf11eef1e..57b21285ab6a 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -95,6 +95,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
@@ -431,6 +432,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
+	{ "CSC3551", "17AA386F", generic_dsd_config },
 	{ "CSC3551", "17AA38B4", generic_dsd_config },
 	{ "CSC3551", "17AA38B5", generic_dsd_config },
 	{ "CSC3551", "17AA38B6", generic_dsd_config },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6994c4c5073c..0029f61d4693 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10260,6 +10260,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC", ALC287_FIXUP_TAS2781_I2C),
-- 
2.34.1

