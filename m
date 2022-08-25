Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A15715A1BDB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 00:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34338162F;
	Fri, 26 Aug 2022 00:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34338162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661464977;
	bh=yTMICShaKItY0foPttjRMpwp5850qj1HP5BXSV+qv/E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=erGuo9ADcW2KjssVHI8N0byAfln7K601Qp936IrLst4tppJJBaJqHLNcIJxNcWx0h
	 flBknam7je9cn9B5FmupyRUvetIysJIKUQGjzY2s0IVwpFgf+eSF4lKE/WBc9utc9d
	 8SIjbqVdAOUBOK6nLFSFeW6KUr4yU5B7pRt3cYJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 994C8F80245;
	Fri, 26 Aug 2022 00:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4DB9F80271; Fri, 26 Aug 2022 00:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49B2FF800BD
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 00:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B2FF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="hk4VJ+Ye"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lnk6COYF"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E221E5C0112;
 Thu, 25 Aug 2022 18:01:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Aug 2022 18:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1661464902; x=1661551302; bh=5f8892CWhzB/Oa681ruXsO/BK
 kD7Nk+PX7cFrRgrLVc=; b=hk4VJ+YexUBwOHzG4aA16vzBzPvU+wREaGuKhODwa
 7+BG/ynaoOpykU5tSOtwllnZ9wE/BgveCAdU3QXs3TtXMpfiEbAPtVtZ0CSB+pgA
 zTvMto2fVFnrZ5Fb8WUUrP/EITsH1zmV9oYx2jwNq1bvZ9BKLTtInyFsz2X/dWzi
 JuCO33Ml7aJJgPdrOTkriR3FMsh4lo4zBTN6y1syw+XKSZf/YNO7SYOj4tO2n88p
 KGWU3J2DksqHWo4/wUWICRs1TK5FRrvTORkoCUIM9ZkkWSjhb9dZxMYVPClKJAZ0
 Umk19Iobl3khkShXFtXoJ16L8kfPhbcZOsDatxsFb0vlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1661464902; x=1661551302; bh=5f8892CWhzB/Oa681ruXsO/BKkD7Nk+PX7c
 FrRgrLVc=; b=lnk6COYF3alDsMqezini1tHb933FgoAt8nf1R5cG38IIfuAEDPD
 n2frG1KYwwXNgndUiVk8Clpzc262Mqzr7mRI7qtthrXO+rqBatTVOK77oVDxLZVX
 ybeTpqnBTMXou+2v/SVBOZsu2o12H3J0HKc6o4yaNmwYng0KpR8mM1h09vojIEbM
 tzhQ4qMvYVwCPl+LdX9u81GBN0tY1EQbiSU3ejlmzUYLOJmH2bOpsOO+2CVSIHVG
 UGTsVxMz/oCdKCCcTJn1tyjqs4b5jEBCNmF3496HAhsNPi/gn4/DKlWXm9nBvVXG
 klMgNv8TgcgC32S4QMTqI3FdG7aOD1VjSSw==
X-ME-Sender: <xms:RvEHY6pqqDeCHJCSjsUj6B3IWSqUtE-qwyyn4V16jGH7mSkaax7T5A>
 <xme:RvEHY4pCOAu331NblctThs866oTe3LgkJT1yY7xAMWkv29rl1y7QgZszhyWPHg_R9
 bHQh7-_k3neQw3jUb4>
X-ME-Received: <xmr:RvEHY_OoVE2VldNZxdoRHMx2DO0vfhebBnfCSS6pWX8-5kj-c_nma9noyils>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
 nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
 dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:RvEHY56tvbtIiyLNUbL1NIu4z9xHzdZ0r4MLN-T55LuiLbvugdj4Yg>
 <xmx:RvEHY56kqqcf_S-1dYMIvLXZsGdHbVw08yMlIdZXx0WnbYkRr-hpqQ>
 <xmx:RvEHY5inHPqtu8k9yG_oKCs8E-EmOx_ZNtuqAXavK1Vc7U0PscalHQ>
 <xmx:RvEHYzloaZDGKlS2dWHqa4GmqfJC60BC1qAGsY0jbIG3JSnwZ08arQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 18:01:38 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Subject: [PATCH 1/2] sound: realtek: Add pincfg for ASUS G533Z
Date: Fri, 26 Aug 2022 10:01:29 +1200
Message-Id: <20220825220130.331371-1-luke@ljones.dev>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Luke D. Jones" <luke@ljones.dev>, alsa-devel@alsa-project.org,
 kai.heng.feng@canonical.com, andy.chi@canonical.com,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fixes up the pincfg for ASUS ROG Strix G15 (G533Z) laptop.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index fd630d62b5a0..e9cad49ee2a5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5828,7 +5828,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		alc255_set_default_jack_type(codec);
-	} 
+	}
 	else
 		alc_fixup_headset_mode(codec, fix, action);
 }
@@ -7022,6 +7022,7 @@ enum {
 	ALC294_FIXUP_ASUS_GX502_HP,
 	ALC294_FIXUP_ASUS_GX502_PINS,
 	ALC294_FIXUP_ASUS_GX502_VERBS,
+	ALC285_FIXUP_ASUS_G533Z_PINS,
 	ALC294_FIXUP_ASUS_GU502_HP,
 	ALC294_FIXUP_ASUS_GU502_PINS,
 	ALC294_FIXUP_ASUS_GU502_VERBS,
@@ -8363,6 +8364,17 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_gu502_hp,
 	},
+	[ALC285_FIXUP_ASUS_G533Z_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170120 },
+			{ 0x19, 0x03A11050 }, /* front HP mic */
+			{ 0x1B, 0x03A11C30 }, /* rear external mic */
+			{ 0x21, 0x03211420 }, /* front HP out */
+			{ }
+		},
+		.chained = false,
+	},
 	[ALC294_FIXUP_ASUS_COEF_1B] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9294,6 +9306,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
-- 
2.37.2

