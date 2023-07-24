Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F375E752
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3BFAFA;
	Mon, 24 Jul 2023 03:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3BFAFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162022;
	bh=GxB0HATsm3F2ApFTP3FB7yVVDEKsxs8lPV+ztvhG9iU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MV7kCFhIXOTFHqxIisYgnofysmJY0tJtATY+26caHxhOMROamFb/DOQtVwSEeIHPW
	 R30kF36qhaJ8Yv/okbLW2MH46BPeB24+r6r+ZNXd6BbUoHJbxbQqoBu9Bx+1/r7XqD
	 SxmWxRXuivyKV6Vg981VRllJTztYDZMOWpwDpiyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE143F805BE; Mon, 24 Jul 2023 03:24:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 720E4F805E3;
	Mon, 24 Jul 2023 03:24:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01636F805E3; Mon, 24 Jul 2023 03:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D617DF805B5
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D617DF805B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aiH4FKOH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9AFC60F19;
	Mon, 24 Jul 2023 01:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C669C433C7;
	Mon, 24 Jul 2023 01:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161853;
	bh=GxB0HATsm3F2ApFTP3FB7yVVDEKsxs8lPV+ztvhG9iU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aiH4FKOHQtmAukuCSRK2ahyhteT9JQWHztgXsHQY16qmagSAOpXP+A9YDmGwC03be
	 1ugebkYYqNzTu0UI3obMojf+hFJrtOrLcvDVTABkSaYXIihZAJBOyNBeCUFwCmDqY7
	 w6Y6DFQxKq6AxG5JeNvTIv6ccT9hOyLY1hHjzlhfFhMLvxuwgi8g672pLVgp1ny1ah
	 eL7l4rUGWfwNOT2aajEl7Jd3N0rZC/tFIWOR+GQDkYXavdtB+t6+tbf88A2q3EKQ1T
	 bV11Hwbc6tWj86HaS6fS4G/o3inHuYVBTGJpUvII6wINiQdtob/2sCtQ879ORmmW2O
	 owUlVLVv0TQ1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matthew Anderson <ruinairas1992@gmail.com>,
	Philip Mueller <philm@manjaro.org>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 19/23] ALSA: hda/realtek: Add quirks for ROG ALLY
 CS35l41 audio
Date: Sun, 23 Jul 2023 21:23:30 -0400
Message-Id: <20230724012334.2317140-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012334.2317140-1-sashal@kernel.org>
References: <20230724012334.2317140-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.121
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XRZH3VEBELAI7E2OXSCZAMJIQSUCANIC
X-Message-ID-Hash: XRZH3VEBELAI7E2OXSCZAMJIQSUCANIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRZH3VEBELAI7E2OXSCZAMJIQSUCANIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Matthew Anderson <ruinairas1992@gmail.com>

[ Upstream commit 724418b84e6248cd27599607b7e5fac365b8e3f5 ]

This requires a patched ACPI table or a firmware from ASUS to work because
the system does not come with the _DSD field for the CSC3551.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217550
Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
Tested-by: Philip Mueller <philm@manjaro.org>
Link: https://lore.kernel.org/r/20230621161714.9442-1-ruinairas1992@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 22f0d1b359f0f..42a1446a43eed 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6921,6 +6921,10 @@ enum {
 	ALC294_FIXUP_ASUS_DUAL_SPK,
 	ALC285_FIXUP_THINKPAD_X1_GEN7,
 	ALC285_FIXUP_THINKPAD_HEADSET_JACK,
+	ALC294_FIXUP_ASUS_ALLY,
+	ALC294_FIXUP_ASUS_ALLY_PINS,
+	ALC294_FIXUP_ASUS_ALLY_VERBS,
+	ALC294_FIXUP_ASUS_ALLY_SPEAKER,
 	ALC294_FIXUP_ASUS_HPE,
 	ALC294_FIXUP_ASUS_COEF_1B,
 	ALC294_FIXUP_ASUS_GX502_HP,
@@ -8183,6 +8187,47 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_SPK2_TO_DAC1
 	},
+	[ALC294_FIXUP_ASUS_ALLY] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_two,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_ALLY_PINS
+	},
+	[ALC294_FIXUP_ASUS_ALLY_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1a, 0x03a11c30 },
+			{ 0x21, 0x03211420 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_ALLY_VERBS
+	},
+	[ALC294_FIXUP_ASUS_ALLY_VERBS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x45 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x5089 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x46 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0004 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x47 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xa47a },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x49 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0049},
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x4a },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x201b },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x6b },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x4278},
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_ALLY_SPEAKER
+	},
+	[ALC294_FIXUP_ASUS_ALLY_SPEAKER] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+	},
 	[ALC285_FIXUP_THINKPAD_X1_GEN7] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_thinkpad_x1_gen7,
@@ -9107,6 +9152,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x1740, "ASUS UX430UA", ALC295_FIXUP_ASUS_DACS),
 	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
+	SND_PCI_QUIRK(0x1043, 0x17f3, "ROG Ally RC71L_RC71L", ALC294_FIXUP_ASUS_ALLY),
 	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
-- 
2.39.2

