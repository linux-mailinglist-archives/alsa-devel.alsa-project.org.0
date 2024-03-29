Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDD4894C1B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DAE2D2C;
	Tue,  2 Apr 2024 09:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DAE2D2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712041495;
	bh=nyFd1gVD6IOaOkZxv+ijhnFzzD+61fz5CSxFthsNV08=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vjWhmMQew2CzfB7j5mOCGjkC9RwyavYOKZS+1ZQjKO3AJ1Vf7cvXZd2bCUjLU/WMJ
	 cBKlJ8+S+L9ymSwIsiZSQjhbCsT9C9cqTYnwD+xj1O8CShEE0V5972stbWJrcy30PH
	 cU0JFri5ENBuA5ubz5ERnaDRsBai9ujFEfFlAS+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC48AF89973; Tue,  2 Apr 2024 08:54:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1845EF89983;
	Tue,  2 Apr 2024 08:54:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16565F8025F; Fri, 29 Mar 2024 19:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE697F801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 19:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE697F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bendiksen.me header.i=@bendiksen.me header.a=rsa-sha256
 header.s=protonmail header.b=g3oQXPAi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bendiksen.me;
	s=protonmail; t=1711738459; x=1711997659;
	bh=PbTlUZvfyW5EEgU8CtWt38HrMcQmW9XR3nwwcixiO80=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=g3oQXPAiCbXjswnX844LZUf4oeXU9jlHBfne70b0iKbXNkHOnm9woeDFRjisSLfQR
	 RMAkPxLujCTyAbDZ8xGQyuIR44FNS3fb7V8CYnPSJK06F6HbYlMs95e066DkB58pOB
	 jOYBwFwOoy5i/kVQcgRXQ/OuF92X8G2ZvtJPF9SoR05RnrkYacfsRXlvVkDIvF4tRp
	 NebpEGV67yxan0KVxiD/TFK6QUlcW40Y4fs9b77C1OOwHkiUgmfUxmJDU+Nvt1LecF
	 Hmze1cpO4Y9j3ZMS3yyHynVUH0n9LW8J5a7Xg71TCXkGug9RaphqBwM9EZFyi+BmKv
	 8jSL/MbDMW7MQ==
Date: Fri, 29 Mar 2024 18:54:14 +0000
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 sbinding@opensource.cirrus.com, kailang@realtek.com, luke@ljones.dev,
 shenghao-ding@ti.com, foss@athaariq.my.id, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
From: Christian@bendiksen.me
Cc: Christian Bendiksen <christian@bendiksen.me>
Subject: [PATCH] Add sound quirks for Lenovo Legion slim 7 16ARHA7 models.
Message-ID: <20240329185406.9802-1-christian@bendiksen.me>
Feedback-ID: 100541561:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: Christian@bendiksen.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y2C2ZS46UKTPHZ2NQXVELE2X6STA6LTG
X-Message-ID-Hash: Y2C2ZS46UKTPHZ2NQXVELE2X6STA6LTG
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:52:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2C2ZS46UKTPHZ2NQXVELE2X6STA6LTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Christian Bendiksen <christian@bendiksen.me>

This fixes the sound not working from internal speakers on
Lenovo Legion Slim 7 16ARHA7 models. The correct subsystem ID
have been added to cs35l41_hda_property.c and patch_realtek.c.

Signed-off-by: Christian Bendiksen <christian@bendiksen.me>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 ++++
 sound/pci/hda/patch_realtek.c        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_h=
da_property.c
index 72ec872afb8d..959864994eca 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -115,6 +115,8 @@ static const struct cs35l41_config cs35l41_config_table=
[] =3D {
 =09{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
 =09{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
 =09{ "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
+=09{ "17AA3877", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
+=09{ "17AA3878", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
 =09{}
 };
=20
@@ -503,6 +505,8 @@ static const struct cs35l41_prop_model cs35l41_prop_mod=
el_table[] =3D {
 =09{ "CSC3551", "17AA38B5", generic_dsd_config },
 =09{ "CSC3551", "17AA38B6", generic_dsd_config },
 =09{ "CSC3551", "17AA38B7", generic_dsd_config },
+=09{ "CSC3551", "17AA3877", generic_dsd_config },
+=09{ "CSC3551", "17AA3878", generic_dsd_config },
 =09{}
 };
=20
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a17c36a36aa5..540868d6c602 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10347,6 +10347,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D {
 =09SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35=
L41_I2C_2),
 =09SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35=
L41_I2C_2),
 =09SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35=
L41_I2C_2),
+=09SND_PCI_QUIRK(0x17aa, 0x3877, "Legion Slim 7 16ARHA7", ALC287_FIXUP_CS3=
5L41_I2C_2),
+=09SND_PCI_QUIRK(0x17aa, 0x3878, "Legion Slim 7 16ARHA7", ALC287_FIXUP_CS3=
5L41_I2C_2),
 =09SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC", ALC287_=
FIXUP_TAS2781_I2C),
 =09SND_PCI_QUIRK(0x17aa, 0x38bb, "Yoga S780-14.5 Air AMD quad AAC", ALC287=
_FIXUP_TAS2781_I2C),
 =09SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual", ALC287_FIX=
UP_TAS2781_I2C),
--=20
2.44.0


