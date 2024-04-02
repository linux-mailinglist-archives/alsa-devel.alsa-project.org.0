Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2649C894905
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 03:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649AD22A8;
	Tue,  2 Apr 2024 03:52:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649AD22A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712022747;
	bh=yVklnQZkvuukUb5TI3+wA5MCAtaQ8hORKgo5k4bzUCI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KiI2cm3L9CNJcxrkYokS8cntmrSaInakyBCg6bNMScx2VWXE74n13pnvHY7Mv6mIh
	 3Hd06G7uShpw4s2RF/dhj2vYTTpbShi9MQoWONXO6Wdz7srkwU9j3FCW+VFspJEabO
	 xbtg/acqBhgMUym2dUdDXTfNfHoU7UxRbvGbqmQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8911F8059F; Tue,  2 Apr 2024 03:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11494F8057A;
	Tue,  2 Apr 2024 03:51:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70CBEF80236; Tue,  2 Apr 2024 03:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wfhigh3-smtp.messagingengine.com
 (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0840EF80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 03:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0840EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=X4y7ooI/;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=By5EdEgK
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2A143180008F;
	Mon,  1 Apr 2024 21:51:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 01 Apr 2024 21:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1712022698; x=1712109098; bh=wKpiPWBbBrJfJ1GZmz9eV
	aeSFAsiH0SYmwmSOg718gI=; b=X4y7ooI/Mv4GEBIMWodAe/qTWZYvyJnqAXYMG
	SXmupajCMzJRSnrr4CIU7N6epm1aFKUjk28STQq3rpi6sXMi0Jn9FcP3jUEdhDuV
	ttBlhQUhqtIGX8eJyTDn/qGd+nk063hqt422m1/4tYLKIGkLVJMhOk7TYZvGE0ht
	kjVSLVaCqLjt75G/WDJ6CtivM+8SppNnWRxPhtdPPlfvmVjhHLugUVRXyZWMksZa
	+CufLRcnxFrIYab08YJSIfZ93JLaxxTqN3Qt90C0nO0fxdJMX2GXS50HdljzT4ju
	XAkRAU4ibUjABXAR0PDckCHynJTyLWM/4p5p2eVfLWhp31cGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712022698; x=1712109098; bh=wKpiPWBbBrJfJ1GZmz9eVaeSFAsi
	H0SYmwmSOg718gI=; b=By5EdEgKA991Sut2s1QMithRDFoUUuSthQZvNMJk3ZjZ
	I+C8Ctb2P58cCN94GYBK9DO4f4xJoI8kQ/Rd+hI4OeKD/UfGDV5aIywmDvouf9jE
	jLH+/KF7hQ/PdNxK5OqjyRkTGDIa7i+NiAvmuv5K9soQ1WcXQMmAqPKHGt1mVgA2
	DnhSm/3iiQL42EOcgMhkuW7RQZ3ka4OUxnek8kkXJ3czOmdRP65N0ZMPNMLw/L/7
	8c5ch1YHxcNLqtAwdudqdqA+upcdau0GPpNCbFruOaD1SSMw+5RtAdTbjthCeUXg
	2EjGTAXmP4MC5qXvV4MLm+JzzNOaIBQO1kz8tAqRAQ==
X-ME-Sender: <xms:qGQLZntOi2jHlO4ynoYwRh_Y0_v_t1gKo9q43jYufo_f0P5GRlq25A>
    <xme:qGQLZocILfesoGYJNQ0UvaGjWb3ZUk6P5cpIqz21FzQdLDbpgl1bP74uy-z9XVHKx
    -38CjjsaQDGTF5Aw9c>
X-ME-Received: 
 <xmr:qGQLZqxDqplJFZXvcG-ZpGP4fdeWfonXjxxlb_FHvwKcFZoh-meQfbqMB6Mc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrudefuddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:qGQLZmPEvjU2R71cMKi-xsDn3_TIvfkR8zI5_yW2wLJLNBERIpGVjw>
    <xmx:qGQLZn9UMmgtJ2JkcVAw2M7fJYXYQiHv4ki40TapBA2gszG5MfbhOQ>
    <xmx:qGQLZmWwUh0rGm-qqwaGekDbG9CCS2gwsLFpU46d0hdBZBmQcc7TsQ>
    <xmx:qGQLZodqaWxZCArrQLvsZ3bsJyG2bCzRcckGyvKjXfDxbyIADemAHA>
    <xmx:qmQLZtcRll8JUMgVHPgbydl6a4IjDHL6v4MA9BzBGFHUPg6vOLmoknSz4jg>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Apr 2024 21:51:32 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kailang@realtek.com,
	shenghao-ding@ti.com,
	foss@athaariq.my.id,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] ALSA: hda/realtek: cs35l41: Support ASUS ROG G634JYR
Date: Tue,  2 Apr 2024 14:51:26 +1300
Message-ID: <20240402015126.21115-1-luke@ljones.dev>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UPV2OALTEATG6MFU463XNH2FLLZNEFYA
X-Message-ID-Hash: UPV2OALTEATG6MFU463XNH2FLLZNEFYA
X-MailFrom: luke@ljones.dev
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPV2OALTEATG6MFU463XNH2FLLZNEFYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes the realtek quirk to initialise the Cirrus amp correctly and adds
related quirk for missing DSD properties. This model laptop has slightly
updated internals compared to the previous version with Realtek Codec
ID of 0x1caf.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/cs35l41_hda_property.c | 2 ++
 sound/pci/hda/patch_realtek.c        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 72ec872afb8d..25c117db3317 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -108,6 +108,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
 	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 0, 0, 0 },
+	{ "10433A60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA38AB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
@@ -496,6 +497,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10431F12", generic_dsd_config },
 	{ "CSC3551", "10431F1F", generic_dsd_config },
 	{ "CSC3551", "10431F62", generic_dsd_config },
+	{ "CSC3551", "10433A60", generic_dsd_config },
 	{ "CSC3551", "17AA386F", generic_dsd_config },
 	{ "CSC3551", "17AA38A9", generic_dsd_config },
 	{ "CSC3551", "17AA38AB", generic_dsd_config },
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a17c36a36aa5..8da2827bb3c3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10133,7 +10133,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x3a30, "ASUS G814JVR/JIR", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3a40, "ASUS G814JZR", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3a50, "ASUS G834JYR/JZR", ALC245_FIXUP_CS35L41_SPI_2),
-	SND_PCI_QUIRK(0x1043, 0x3a60, "ASUS G634JYR/JZR", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x3a60, "ASUS G634JYR/JZR", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x8398, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
-- 
2.44.0

