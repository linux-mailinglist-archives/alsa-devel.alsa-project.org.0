Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 659C0894C72
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D4E2CC8;
	Tue,  2 Apr 2024 09:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D4E2CC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712042144;
	bh=S0uiI1l+bopCmJ8FboWrkmf9PiNBKaQEV65dZuKRil4=;
	h=Date:To:From:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QTa+NJMUZug3BN1SZO8EcbeQ844zoQwRPJUS4XQsmu3KVH/GpOcSRdwnvbGM1Qa/P
	 dS9eB0pVOXKzADdbMsT+NKK9HzlPhAWl0X81PtwdH8ZgN8iAAuRtcEUf1mcYuSJiAA
	 rXGsW9tBtyFVy2VW5K+7eWzwpz0D6Pi5eaoFCsaE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5D6BF89C6D; Tue,  2 Apr 2024 08:57:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B09F89C2C;
	Tue,  2 Apr 2024 08:57:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14177F80236; Mon,  1 Apr 2024 14:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9173F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9173F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bendiksen.me header.i=@bendiksen.me header.a=rsa-sha256
 header.s=protonmail header.b=J+73k5td
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bendiksen.me;
	s=protonmail; t=1711974376; x=1712233576;
	bh=kxyHDz4wP5C31gmz6bpfh2rAfPvXOIaBKxhpx4lBACw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J+73k5tdAKpfxvYIDSqm5S7feaMf/+lK0/2BwUeulWqszAgdy3CiDBBuTX/rMtKx/
	 etpco59lG6hzBXOuVN/zGEYKvhikzrwJYEp/7yQxmlMjzhOF6KuIImXJZaIZQFsA3N
	 YBOlH0/w0tDqeKsnHtjU1cSR7saRIKD5/ZtynKQcvZBZw78oWQ64arvtc74vSSZ07w
	 5/XQE1WtrdyGhGKZap/TxV3Qa/h7aNMN9B5nGQ/fDzxbRE2A12i4GhYrwUC0IcfagI
	 g0ioyQwQ3brx7vkoeuguYDxKrU9owPrwBiBv+EJXfSIzRjdGoorNdldM4dLYoRXkNl
	 bwqxR8+os4gWA==
Date: Mon, 01 Apr 2024 12:26:10 +0000
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 sbinding@opensource.cirrus.com, kailang@realtek.com, luke@ljones.dev,
 shenghao-ding@ti.com, foss@athaariq.my.id, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Christian Bendiksen <Christian@bendiksen.me>
Cc: Christian Bendiksen <christian@bendiksen.me>
Subject: [PATCH v3] Add sound quirks for Lenovo Legion slim 7 16ARHA7 models.
Message-ID: <20240401122603.6634-1-christian@bendiksen.me>
In-Reply-To: <87y19x5wfs.wl-tiwai@suse.de>
References: <20240329185406.9802-1-christian@bendiksen.me>
 <87r0fsnmky.wl-tiwai@suse.de> <20240330115554.27895-1-christian@bendiksen.me>
 <87y19x5wfs.wl-tiwai@suse.de>
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
Message-ID-Hash: SPCJRTYCW7DPVQFZZ5TYBHSB7SO2EQIR
X-Message-ID-Hash: SPCJRTYCW7DPVQFZZ5TYBHSB7SO2EQIR
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPCJRTYCW7DPVQFZZ5TYBHSB7SO2EQIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
index 72ec872afb8d..d6ea3ab72f75 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -109,6 +109,8 @@ static const struct cs35l41_config cs35l41_config_table=
[] =3D {
 =09{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1=
, 0, 0, 0, 0 },
 =09{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2,=
 0, 0, 0, 0 },
 =09{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1=
, -1, 0, 0, 0 },
+=09{ "17AA3877", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
+=09{ "17AA3878", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
 =09{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2,=
 -1, 0, 0, 0 },
 =09{ "17AA38AB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2,=
 -1, 0, 0, 0 },
 =09{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1,=
 -1, 0, 0, 0 },
@@ -497,6 +499,8 @@ static const struct cs35l41_prop_model cs35l41_prop_mod=
el_table[] =3D {
 =09{ "CSC3551", "10431F1F", generic_dsd_config },
 =09{ "CSC3551", "10431F62", generic_dsd_config },
 =09{ "CSC3551", "17AA386F", generic_dsd_config },
+=09{ "CSC3551", "17AA3877", generic_dsd_config },
+=09{ "CSC3551", "17AA3878", generic_dsd_config },
 =09{ "CSC3551", "17AA38A9", generic_dsd_config },
 =09{ "CSC3551", "17AA38AB", generic_dsd_config },
 =09{ "CSC3551", "17AA38B4", generic_dsd_config },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a17c36a36aa5..124aaaa6cf76 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10333,6 +10333,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D {
 =09SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9=
_14IAP7_BASS_SPK_PIN),
 =09SND_PCI_QUIRK(0x17aa, 0x386f, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_=
I2C_2),
 =09SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA=
7_14ARB7_I2C),
+=09SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FI=
XUP_CS35L41_I2C_2),
+=09SND_PCI_QUIRK(0x17aa, 0x3878, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FI=
XUP_CS35L41_I2C_2),
 =09SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC", ALC287_FIXUP=
_TAS2781_I2C),
 =09SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC", ALC287_FIXUP_=
TAS2781_I2C),
 =09SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual power mode2 YC", ALC287_FIXUP_T=
AS2781_I2C),
--=20
2.44.0


