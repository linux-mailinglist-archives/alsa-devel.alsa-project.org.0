Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74A853418
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40AB5E94;
	Tue, 13 Feb 2024 16:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40AB5E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836652;
	bh=EvesecZhCS+F8B4ydJvfk8KC+jJVk5kwfen9WAPTcVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gqHZEC7Rsn9ftmXC7phUVFqPz1yDNgFiwZOYIwHY8ey6jgY8TX5p7GDRxoum+CX8C
	 A3hcfiqjMJLnNQ4OOFe3WZBV8N1it6tMPCLJ0HwIcrDuSy/HBPmTuafT81emOIyVcr
	 EnhZ7Ad7qjmxPnsoswcTG3EZ5tBVttHiI66KlG38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00052F805FF; Tue, 13 Feb 2024 16:02:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F14F805FF;
	Tue, 13 Feb 2024 16:02:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 712E2F80238; Tue, 13 Feb 2024 09:21:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0597AF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 09:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0597AF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B3nn/jKZ
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3c1a6c10bbso318286866b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 00:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707812511; x=1708417311;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hww4KX6AuerRDewZUOzhuppFnbJN24s7IBnlzI92hEg=;
        b=B3nn/jKZ6IQy1F8maVZmdXkK9sv14VwwYtoBpGBm3OaNKmFokDhkWWfZWrZVqX2fnU
         uZNlTAa3LrhE39Ctqp3WxTaKbdEvQnTVDYe9fy5bVNVwk0sRZhy0VeKN12JHrQOrF1Wf
         VpWJiheuSZDpsdhcyWHA5RG26pfB9s5gUoVBHgN7+rdnLC4Dblo/Xds+eV00rCHVKzcL
         1ldepT+QkzOf1Kumu5SNkOJXsu02iqCajZrlgHtCIJvXoAj6oLADxhkevEPKJH7LniH9
         r7uE7hYyENikXq95cJKEsXtBMlyXWUT/Hzguk/EDz4PyCPaub1WiVMHT3B73g+JLyVL8
         K+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707812511; x=1708417311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hww4KX6AuerRDewZUOzhuppFnbJN24s7IBnlzI92hEg=;
        b=Bzvd1wFViym+ZX+deoMGLrH/POYW1gL06RxcQ38SmFUwbAapbXdOUEU00l6WQPSoan
         g3Fz0pPgsLQmLC4hqj8DWxYuI7aQnwpYPu+mfJdzPGbSUaa6HEr+e/9b6FBXRB8979kd
         8J1LprETg7THwwp4NtH8R24Dtx1IL/AUzOOHebeBeNIWuDcnuXQ2DR4wvRQ4OJUEAEEm
         ebx+yLSX85+YPV72lP0p0FNepeRvzC1v1mNdb7VmBvqY6gG3O762rAuFSo/CaN2jT7le
         mW3M9rTTLOy3DhncBLzmygAaMuxLSYthAU+nNHinRlkIArHWnba/6K5ddgRUwZFBbHxP
         0aJw==
X-Gm-Message-State: AOJu0Yy9N0xmCDrIlxL7KvOzINvK1qmI8K/aqEMigF6BZle4I3wEs53g
	IuJDdkxhPyZu+obCwQM+mvaFnuVL5yJFf8EC+ipvpPbOaekhk76u
X-Google-Smtp-Source: 
 AGHT+IEtbOgAQCr2q9wNkojH1FVB5yqlZL4vx2tEJYwJ0iwk5cxr4EarSrt3PNOwz/J1gIq7ItlMMQ==
X-Received: by 2002:a17:906:3755:b0:a3c:9ad4:b8ff with SMTP id
 e21-20020a170906375500b00a3c9ad4b8ffmr4179109ejc.49.1707812510698;
        Tue, 13 Feb 2024 00:21:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUsW2MBxSOX85UTqI3VynXX3cao1HNaEQjG8oN1kRIdQqMfckBiAidkpBjgOk3hEe0AWVG5To5wB0IaewSmr+n+mSe6soBntPCGASJngzEHoTxp7u+Fq61wWHw3lx4H8uOKzHbKsAISoXq30d5iL90WBf/IujhptnRvkWpj2bY3tuYCWXeCAPnVbjOV0BSDSUdhaqRpWpb0WEcRZ0Qx0r/KcE030I6+qwErlOMDDF4KmJB25NQZZ4Ph4PyQUmnB8vaJCfD2HS6aHbMHzrxwV1Q6nd7Ml+Oh10LMLC7U1+gSufr7vnCnc+K2vPFWRV9xxLsaPcgzjH0YW+PlhPpoEw7lJN4wUI2BSA2SbpijbjHIQHEnaT3wAU9OUw19CbaIKk/B1usYDzhIFMy9y8C7F6C2eKjiyj5mWG8+6PQj9qHlNVp5LoCjLjWc+JKO5jEH2ErRMiU6Gk4rK8uR510MPoJHaiSHbA0O25ihOeG/ep/qnl8fqCWJGEqU4jIwq5Gv6llMsq1dX2t25wseG/gHiPQ8XhCLhHVye5Rg0P8vhMdCNpzY
Received: from tkudela.. (c156-103.icpnet.pl. [85.221.156.103])
        by smtp.gmail.com with ESMTPSA id
 hw13-20020a170907a0cd00b00a3cf2f71408sm594983ejc.152.2024.02.13.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 00:21:50 -0800 (PST)
From: Tomasz Kudela <ramzes005@gmail.com>
To: ramzes005@gmail.com
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
	rf@opensource.cirrus.com,
	ruinairas1992@gmail.com,
	sbinding@opensource.cirrus.com,
	shenghao-ding@ti.com,
	tiwai@suse.com,
	vitalyr@opensource.cirrus.com
Subject: [PATCH v2] Add Lenovo Legion 7i gen7 sound quirk
Date: Tue, 13 Feb 2024 09:21:16 +0100
Message-Id: <20240213082116.15049-1-ramzes005@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212193327.59507-1-ramzes005@gmail.com>
References: <20240212193327.59507-1-ramzes005@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ramzes005@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CEM3XXZAU7RIYQQ3LL3NQKLSOKENKW6U
X-Message-ID-Hash: CEM3XXZAU7RIYQQ3LL3NQKLSOKENKW6U
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:01:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEM3XXZAU7RIYQQ3LL3NQKLSOKENKW6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "T. Kudela" <ramzes005@gmail.com>

Add sound support for the Legion 7i gen7 laptop (16IAX7).

Signed-off-by: Tomasz Kudela <ramzes005@gmail.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 sound/pci/hda/patch_realtek.c        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index d74cf11eef1e..8a6b484b2184 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -95,6 +95,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
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

