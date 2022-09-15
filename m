Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D489D5B95FA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 10:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72337190D;
	Thu, 15 Sep 2022 10:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72337190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663229490;
	bh=vG50Re6UFQxaqDUv6BcplABo867aE64vsDMQpA43rPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R7ht9N5xPjDaJmUpG/bctxOm35c7JZ/6OVaqaTY+vI2WScH/Pedt+5WFom/klVj+0
	 kqTSWbdquDXUuTmBa7nu3CkOFbX/I9mKRd/tCrmwXzlNXLQzTW5dKJIi7y07klqyJP
	 scd1YHlNHrAmROF2KzmeffOTy+x1WfsTL6v2q/n4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A86BDF8053C;
	Thu, 15 Sep 2022 10:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7113AF80535; Thu, 15 Sep 2022 10:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C333CF80238
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 10:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C333CF80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev
 header.b="BHZ2E2uf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lvCIz+A9"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 797353200B50;
 Thu, 15 Sep 2022 04:09:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 15 Sep 2022 04:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1663229382; x=1663315782; bh=vF
 9yk8jSGcOUiyf4eGbShAgD4UX6iWj8uUKlajrxg1Q=; b=BHZ2E2ufgGuQ/CnZV5
 jqNOHRY2EvO0VVnzxP0hSUnk2YaLG61j6Zvc3M2Xd7+CUX191HdJZt3aybSxBgB1
 JyjE557sJ4VT0cunOEzxJ1IwgOCPXlvc+UshyEMZKMw1V6Lx52Wot9Vnc0Z+NpC7
 uZqjeW1/oMBWvAyXJ8F/8MWnwzxEqeQNkU/yCTtdwRiX9LQiJPPX+EBakG2/DwRS
 3POKy3XZCdEFXbPilS0IKOuf5t1S774YOoSBxAvBh0FS+kawUjsJxlifAZPPKEMB
 q+2XwmyjFNa3v5l0eCR4M0jF28FZqXrMrhUUGCJ/ESS/bEwRBvv/oywn24jq0yGu
 y3LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1663229382; x=1663315782; bh=vF9yk8jSGcOUi
 yf4eGbShAgD4UX6iWj8uUKlajrxg1Q=; b=lvCIz+A9RuT29UYvG5FUjGQ+5fr9W
 /qjyhZ5gS5871Ds3KJlU5IHeA6kVzSBL22qtVHmSPIer++DmAai3el4u4u30r6mj
 o1zGritPYjxfB4BkZrmpJlEFlQh0FOZjRUTaKUkQ9zk2VGFTihP64YxasIwo+yVW
 20UKqL4zuGy7Se1VeQIPfL/lXYFgbRNKuoAU6OLuXbkK7ypyJ3zUFWXcCgiBFntp
 oywNuAii2kbVYecfG6Gmxvn6kGDHRtbAwwOgQJgTr33UIqfjf1cc6iDqBSynM52W
 GFKt++VgNGm4wNAbXj0k6kaRv73yDvplcFCGZh+bCGnSgIAOTeOPYyNtg==
X-ME-Sender: <xms:xt0iY4x6pRhaBiWTgxB1YNtXIJGV5d7UbuE7FV8INpChS5-g9KWHfA>
 <xme:xt0iY8QRldOyQ6AJaasOkg9AAQiqVbYyTqg9iobjVa8aQvo0zWrc9XhLJDM4Mg9hg
 sSw8cs3oyJyT_JNPSE>
X-ME-Received: <xmr:xt0iY6UAf1S4QNzOZc6JlEuW9h-K58N-7iUGQ-KCq2LP6yoJCrcqc1GXMrRX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedukecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtre
 dttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhn
 vghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgle
 eltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:xt0iY2jwpgdTuqon4CY-z5KviESsg4WJi2w8XVSqivxsCBguTPgB1A>
 <xmx:xt0iY6CQNUqsHWhh9NcKGvbR-6SWHX63PQYl9GnQmYkzZ0EP-mPlBw>
 <xmx:xt0iY3LwJE0ol-0uryhvP32R40rmiNuq662PApbJ0ey-_v81cnYGug>
 <xmx:xt0iY9MRptkWzDS4tXM5dXSFXINHYTqy7iF_5MI8R1K9q_H-1D6lLw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Sep 2022 04:09:39 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Subject: [PATCH v2 2/3] sound: realtek: Add pincfg for ASUS G533Z HP jack
Date: Thu, 15 Sep 2022 20:09:20 +1200
Message-Id: <20220915080921.35563-3-luke@ljones.dev>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915080921.35563-1-luke@ljones.dev>
References: <20220915080921.35563-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "Luke D. Jones" <luke@ljones.dev>,
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

Fixes up the pincfg for ASUS ROG Strix G15 (G533Z) headphone combo jack

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1485dea712d8..a44a55619144 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7026,6 +7026,7 @@ enum {
 	ALC294_FIXUP_ASUS_GU502_PINS,
 	ALC294_FIXUP_ASUS_GU502_VERBS,
 	ALC294_FIXUP_ASUS_G513_PINS,
+	ALC285_FIXUP_ASUS_G533Z_PINS,
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_GPIO_LED,
@@ -8373,6 +8374,15 @@ static const struct hda_fixup alc269_fixups[] = {
 				{ }
 		},
 	},
+	[ALC285_FIXUP_ASUS_G533Z_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170120 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_G513_PINS,
+	},
 	[ALC294_FIXUP_ASUS_COEF_1B] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9325,6 +9335,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1e5e, "ASUS ROG Strix G513", ALC294_FIXUP_ASUS_G513_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
-- 
2.37.3

