Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847C5A1BDC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 00:03:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA251638;
	Fri, 26 Aug 2022 00:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA251638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661465007;
	bh=rz7VQqcc1mIQQDSGDM9eF3sfzer9VXiScOM0e2s2f6M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mU11yS8amDm6NlVi392XbtzeIyo4356kdiEIKqAK84GTjEcgrqUi1hlDCzKrJvslf
	 z4QWSQOw1+VOXnXP4tQl/QZRLtGrsqbXGfdN37QpzvhdQL+/gDeWryRWZnVPfFbC/q
	 2slNyE4uwUBHR6FJJJX+Ffhwx5xExz6NJ1sQgPrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2713F80506;
	Fri, 26 Aug 2022 00:01:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A4CAF8027C; Fri, 26 Aug 2022 00:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 422D5F8014B
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 00:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422D5F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="cM9dfZEj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bhHbC78o"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C42825C0056;
 Thu, 25 Aug 2022 18:01:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 25 Aug 2022 18:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1661464906; x=1661551306; bh=vx
 IQYb7384ikUOFL0YYanSZM4BK3Ykys553Rk0TizvY=; b=cM9dfZEj0l2R40gIJx
 046+jU5S1BdBAc/m3p88ls88V1AI+CEgv6RjA0qTMsqRx2t88fQmm0MGE+wIRmkO
 BuhkqEdw4vjj+4YNfaKpCBAL4/pC8pb7Ax9GMjqlrCyr5eibp/cyF1tgea/QlOqq
 BU+qTMHTEZ/tpObSdlVtRGpXl3MzLW30/G4OnU+ug7EXC5/pum698QdIxcdkPwUy
 HkntoOqsVl6NViNV6VPLY6rZIm7FjYeR1P0aEK1m3aXUQwUKG/+mf6bsfBapQM1S
 XbSMEpPHVR/cM2Mw3DQYmyjIeM53fgwHMbP02KVheQdlK2W+/xSMYfTq38Or8x8E
 0KMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661464906; x=1661551306; bh=vxIQYb7384ikU
 OFL0YYanSZM4BK3Ykys553Rk0TizvY=; b=bhHbC78oXHH+PMzfOi+fCKxUuR1CR
 KpSjFgc0k5EUfAsmmZX+PE7DWw02WumP//HhoJWGXFsaubARF0vP78khxHOXhn+Z
 a10FVCdivual/4OjN+wqZx7YdaxzXyDhPTH/PHPgEZIvrO1u/KFa5vnmGTP8YwrK
 Ale4mvrVCPUNXAJUCLjJfsp3yCwl4MJHqz9t/k6Kh+WZ8wTV5OMJ8WMuR5+6wXQZ
 B6zlJUI8e0YY4EOXlzP+LGzx9rVVpDVBplsfzITuiFfPzg0fAjcxAYptIib4PVlc
 gIbPOHibYJ2H/Aj0eXMMpMMFPN182k//VwAIFaAODy2yjaM4NRPtKA7Qg==
X-ME-Sender: <xms:SvEHY1bcLwhXvldm_OG-pIXr3WHS2GukpDuE4G7qHEYtuGSpnSs64w>
 <xme:SvEHY8YwlHeQ4Qoh04FAaIneySYXZUSfDN3NamDEGtQS3QEAujqPICPsNvz1qDdc8
 AmkaVyZCVomGIjHJbs>
X-ME-Received: <xmr:SvEHY38A068HozK_2Mg3LYMf-soVdD_0LI6gzbAjS7lLGb_9BnB2JJfqFZ7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
 jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
 fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:SvEHYzq8QEv89mbD1VSORBK1VxcK1YKTGIbBFu0xuAuzkKrWwdcJlQ>
 <xmx:SvEHYwoFaEFcYYghYHCC3aFIu0TO1_mfNehRhlbNwxv0oTxu7ujGjg>
 <xmx:SvEHY5S97x-Hy-4lYjdt2r5xflFrC6UvEdbYFOQip1MugZCmzEhApg>
 <xmx:SvEHY7XBsjwOVqO-Hc_oF5xK7oSAlP1wbCRCMn5xQIDSMwzA0IpvXw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 18:01:43 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Subject: [PATCH 2/2] sound: realtek: Add pincfg for ASUS G513
Date: Fri, 26 Aug 2022 10:01:30 +1200
Message-Id: <20220825220130.331371-2-luke@ljones.dev>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825220130.331371-1-luke@ljones.dev>
References: <20220825220130.331371-1-luke@ljones.dev>
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

Fixes up the pincfg for ASUS ROG Strix G513

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e9cad49ee2a5..abf3fb50692a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7023,6 +7023,7 @@ enum {
 	ALC294_FIXUP_ASUS_GX502_PINS,
 	ALC294_FIXUP_ASUS_GX502_VERBS,
 	ALC285_FIXUP_ASUS_G533Z_PINS,
+	ALC294_FIXUP_ASUS_G513_PINS,
 	ALC294_FIXUP_ASUS_GU502_HP,
 	ALC294_FIXUP_ASUS_GU502_PINS,
 	ALC294_FIXUP_ASUS_GU502_VERBS,
@@ -8308,6 +8309,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
 	},
+	[ALC294_FIXUP_ASUS_G513_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 }, /* front HP mic */
+			{ 0x1a, 0x03a11c30 }, /* rear external mic */
+			{ 0x21, 0x03211420 }, /* front HP out */
+			{ }
+		},
+		.chained = false
+	},
 	[ALC294_FIXUP_ASUS_GX502_PINS] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9307,6 +9318,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1e5e, "ASUS ROG Strix G513", ALC294_FIXUP_ASUS_G513_PINS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
-- 
2.37.2

