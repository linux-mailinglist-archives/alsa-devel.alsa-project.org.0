Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E60853412
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:03:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86899DE5;
	Tue, 13 Feb 2024 16:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86899DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836630;
	bh=VHD7V7W4qwRQhqwPSDefa6gX+ovxXlDZA21Vs4ZGEfg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H1u98tkFN63+Ps4/CTFD2mN7JXgvgSIdY5i+feDr2iOGrt0RMXrGh4V1BRVj4rsg+
	 3FG3fSQbzsJ4iZbwF7H/BSL/pBDUy6JDQL6MiiwBZ/lrdHe80A3a4kakmfk4aB9zXi
	 EjLsiRWjWKkrhXXS+XVRsN1MY6dabnK3iztr63ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A92B8F806A6; Tue, 13 Feb 2024 16:02:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 960ECF805F2;
	Tue, 13 Feb 2024 16:02:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5D13F80238; Mon, 12 Feb 2024 20:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20700F800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 20:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20700F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LUOxEfUc
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d0f7585d89so17141051fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 11:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707766422; x=1708371222;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oum1jt+Q8dDAhYrJmUGRUjhcfu3Z0CZYzh6RXzXRq4o=;
        b=LUOxEfUcI0Ds/s5WeSTmnkfTLIKIUAZjZl1MGoexBjeUbbce6Zs5F+spEPMiA9sOlt
         Rs6QkKj9KEkCVdDHk2OaBThay/E06V7cD84+hFSCF8vmsE3KspN2WPp8S8/DVFTuYXb1
         1s9miZo9hIT3zupTKfz/AMjd21USk1e72tFVD0iPjOr6X2SLMqvmJSZ2/DEa2gxwjSef
         g8BDR0lI+lrjkjZxc8bsC9N2M1mW/t73QFH8b+R/56StOHBrpso7kGiuAuszQi1rop5c
         rgTA8yeQU649RSDe7PKTS9JMYdgoHfiZsWVVBqswDIts/eg9Qta/vwnt1erkr/FYgjim
         bNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707766422; x=1708371222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oum1jt+Q8dDAhYrJmUGRUjhcfu3Z0CZYzh6RXzXRq4o=;
        b=c2oQk5rMsTgLSIWT4VRpCyX58ny4EmFvDKLYewtUHrdEmR17TRuiwJBXqUFXbOlS7p
         dHCuI39+lKE6l8TT1L05u44JLhSVt9dWChiXLJw6C6vVris7O+IMAsWiTlIzmXFuBYbq
         VJKMJNzTkDGNj+OCBJl8Bw+GIHQTVpnrhcHh2H36xKUAk10266Nsv/MY0q2wLcsRapl8
         8K1a0E0HM1EFGKw3Dl2z3gG8rEf5FczycxsTYswNNEl/nynFCKJrKp5y49PbVVK6VJQm
         xsPfOexIJlRUZRudRWJdzJYw100BwwYtgIsC9z/mrsCL9Ai6f839sDwjcbiSBE2WlvUd
         Z9CA==
X-Gm-Message-State: AOJu0YwR7lF19YnC54+6kdq9TNV6XILmtGaMAXxJpgWzTO1W/sq7V280
	pWv3V0NI9yNjojWD0rrAK9m/7yMvAk6rdAGAxHZPaJzkf10P4c41
X-Google-Smtp-Source: 
 AGHT+IF4novuZ4Y+eA7hevM2fEuPwi4qeOPqKqpoEiAhRwgn1+MjD52hUUFLrsPXmYD3imwC5WJV+g==
X-Received: by 2002:a2e:9786:0:b0:2d0:7a98:a493 with SMTP id
 y6-20020a2e9786000000b002d07a98a493mr4846826lji.39.1707766422053;
        Mon, 12 Feb 2024 11:33:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoXX0vLop0ktvQhx4o6Q8IadytmX76FfJx/4Dz2GhnX8qNSE9lpa0Fp3T0rMcCPyfLqcRdfwMpebyEsY9Am8HG4orbqp+J1fS0slepcN47i42j07t58Wk3QyXZgqS09uapXkwrjpNsu3dSvATOEuv+fLHfhQZvE8XanUVnzdZucA9lTdOfr5tfQceK53hNGSjcoIeZ06I/JTDEoxEl249x0k51sSPLE6fhgVY6ocLYIRyMjwRTga2q2u7xMWVdJy+ZvGrVWOlzbal/YSqRo+W0wC6UKOTOeHP7j56isxWx9PTPrjtRO5s7i6OUJQFynIN8noEJ0tW6X+o2f1sfLuYZwHsG2JVrlhw73Usfa/mf//bhJAP0uQjNctesk6pI9b4QE2uGBUVFQcYQsoiImh+tpGLLIedkjm+yp3Ze0qoKhlIvpX3nfV1WT7BNjaHyCnA6BVt75Pl8Uk6joTGwYNy+M1mnUO0gaUIRwTOkJ4TDIRUswW2n+9Hv9iZaOSJFQCf6aCr1vhUXwjVuzUH/Dm8LuAbIfmDsHxSAuhES19435g6m5rA=
Received: from tkudela.. (c156-103.icpnet.pl. [85.221.156.103])
        by smtp.gmail.com with ESMTPSA id
 d13-20020a170906370d00b00a3c66ac5146sm501104ejc.120.2024.02.12.11.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 11:33:41 -0800 (PST)
From: "T. Kudela" <ramzes005@gmail.com>
To: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	luke@ljones.dev,
	andy.chi@canonical.com,
	shenghao-ding@ti.com,
	ruinairas1992@gmail.com,
	vitalyr@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "T. Kudela" <ramzes005@gmail.com>
Subject: [PATCH] Add Lenovo Legion 7i gen7 sound quirk
Date: Mon, 12 Feb 2024 20:33:27 +0100
Message-Id: <20240212193327.59507-1-ramzes005@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ramzes005@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BDK2SBT26T7PEDQPTJNJRFOMLVE73W4Y
X-Message-ID-Hash: BDK2SBT26T7PEDQPTJNJRFOMLVE73W4Y
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:01:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDK2SBT26T7PEDQPTJNJRFOMLVE73W4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sound support for the Legion 7i gen7 laptop (16IAX7).

Signed-off-by: T. Kudela <ramzes005@gmail.com>
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

