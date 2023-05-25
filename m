Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A47113F5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786FB200;
	Thu, 25 May 2023 20:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786FB200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039719;
	bh=192nmSMNqq78aoq5WG289hVIu7yTHWbqPFwrYJrXVXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ct1lXIl7s8hcnZdf7ad/Dls+MJP3tkluDH5xOvnKdZs0p5QxdKUSSCIJlHWuyu4Qa
	 v6k4TKmDe9iNYocRlB+n1cB5P2ieWuOTVxlAJ7ALza03uIbfhIKcUbOAWEGhNV8UvA
	 g8L4eB65va1othatG9epta46wI7Zm5QCUaDHAb14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8064F8055C; Thu, 25 May 2023 20:33:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A426F8058C;
	Thu, 25 May 2023 20:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF58BF8055C; Thu, 25 May 2023 20:33:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E24CFF805AB
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 20:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E24CFF805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K6W1WJqx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FBE5648A2;
	Thu, 25 May 2023 18:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CF9C4339C;
	Thu, 25 May 2023 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039579;
	bh=192nmSMNqq78aoq5WG289hVIu7yTHWbqPFwrYJrXVXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6W1WJqx1Dg8KioOQHpz54HWPZ9Fx7gbQ935Qjw/ZZqJ/QUXO7JV+gomGAncOSxmS
	 dbO1mNi+Cd2Lzp4JRfbcIVEyW0hrILpx9pO2MVzvkUpXR1DymHGBd3tjPNwg7uwWi+
	 jrqgsGqKtHkfK0F5rEoUBa8yMtfgiLHfpvtDgg/Wu53a5nRSqKLH6hnz8eOWsaGXXR
	 uxskmejH28Y/Q+pe90LkGn5CtxPOrr6ur1bVkNzppYawXcgk+uyeS+O5wCREAwwFox
	 9eJ5tMEHjWpAuUC6kRmZkYPWCxvPSHQEo4FrC9YNYc9xfo1w/nA+wUyeCPG3/EN5Ob
	 QpAwg3UzU+ejQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandru Sorodoc <ealex95@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	tcrawford@system76.com,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	luke@ljones.dev,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 13/67] ALSA: hda/realtek: Add quirks for ASUS
 GU604V and GU603V
Date: Thu, 25 May 2023 14:30:50 -0400
Message-Id: <20230525183144.1717540-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3HZJCUTEQXAF75D4QFUKIG24RIUBV542
X-Message-ID-Hash: 3HZJCUTEQXAF75D4QFUKIG24RIUBV542
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HZJCUTEQXAF75D4QFUKIG24RIUBV542/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alexandru Sorodoc <ealex95@gmail.com>

[ Upstream commit 4b963ae1df6426f0e51de64133d379d9bde50c48 ]

These models use 2 CS35L41 amplifiers using SPI for down-facing
speakers.

alc285_fixup_speaker2_to_dac1 is needed to fix volume control of the
down-facing speakers.

Pin configs are needed to enable headset mic detection.

Note that these models lack the ACPI _DSD properties needed to
initialize the amplifiers. They can be added during boot to get working
sound out of the speakers:
  https://gist.github.com/lamperez/862763881c0e1c812392b5574727f6ff

Signed-off-by: Alexandru Sorodoc <ealex95@gmail.com>
Link: https://lore.kernel.org/r/20230511161510.315170-1-ealex95@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 172ffc2c332b7..543e0adde3faf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7063,6 +7063,8 @@ enum {
 	ALC225_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC295_FIXUP_DISABLE_DAC3,
 	ALC285_FIXUP_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_HEADSET_MIC,
 	ALC280_FIXUP_HP_HEADSET_MIC,
 	ALC221_FIXUP_HP_FRONT_MIC,
 	ALC292_FIXUP_TPT460,
@@ -8033,6 +8035,22 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
 	},
+	[ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_CS35L41_SPI_2
+	},
+	[ALC285_FIXUP_ASUS_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_SPEAKER2_TO_DAC1
+	},
 	[ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9500,6 +9518,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
+	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.39.2

