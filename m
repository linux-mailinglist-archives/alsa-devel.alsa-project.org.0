Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD44F3D2B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 20:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5242417C8;
	Tue,  5 Apr 2022 20:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5242417C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649182900;
	bh=bmqhj+dQXEzPy8rAY5fr0GpG0DNLJCDWIFX94qTSai0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=go6+rgr9dfXYb7dezyf82/N8o35JAg65iPpHSikakPfbD1/9XnXL13emQwUXWXCH+
	 fyynokUeIBkLERZVpy9KmszA0975R+LRmVJHI9MzChizB3Hr5g3jdH21Okx5IbbejE
	 kiZQIWh9To8hptKEvpBr0d4IyoiSzi225HSUoaW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B459DF800D2;
	Tue,  5 Apr 2022 20:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5526AF800D2; Tue,  5 Apr 2022 20:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5E41F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 20:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E41F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Hy7iZizb"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E6ADF5C0265;
 Tue,  5 Apr 2022 14:20:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Apr 2022 14:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=Ga8/NQRe6ecv/Jchsk+F5fxHBv6FG
 +R9T1sj2w8EIcY=; b=Hy7iZizbj9mmsqClDkYEw140K7wsbhYPuTQFMWoek/e+q
 Cvp4CaoV/C4vbedVf6r21q1m/LYSoepPNsu6ldoAMPl/KsZBm8vmlt3hwLK12Nzu
 0RSz+G+v8TcGcXuoEnGdEt4L7y4xpfoDowJLFj+/5veTVzKfYb8EPhzba8FKVLvX
 QeAsfYWPVMSnjPi4dVSQGT0DwEnswQmarU8Nr/KWP8DIqvVp9Jcnq3BIufcfbDTh
 QABJdd1h3oES/kBpsdwTK2I7YVM/IulGTcwyTOGE/isXKypoG5hX/rhgmuSCW/6w
 L9qG0tmuI9no8OXykkMT6jFmZi5szyLy671AOxR4A==
X-ME-Sender: <xms:bohMYnaniXzpzn_efy84YIyifO5AyFXKveTJtxOE7oGo8ME_iSuIWw>
 <xme:bohMYmZtzq9nhsZ6PPrwv_tG8wIKvWExnncgrmD8HHj0XHMha_VjEiUnheyiR-mI-
 Vh7LvVsBbSh9dubog>
X-ME-Received: <xmr:bohMYp-QlpYCAg_7QxZOCIpMpUYeh5NqBxMk_Dy2oNBLxb3xrUkURoUn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepgeeugffhieegledvuddtge
 dtieetvdffkeeltdejhfejvefgtefgleetteehfefgnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:bohMYtrZgd1hyI3GvHc64TtiqBgelP0t7VLV8UpCFNAArPgpRlooHQ>
 <xmx:bohMYipiPxeCE74gYqvdTbQEfi8QcwleuGroXOZxEdVotiWFLLh2_A>
 <xmx:bohMYjQkzUNnTABYXbw75L89RDKJZrKT07sj6kLbTEqSVmAh3DiSvw>
 <xmx:bohMYnCG5DEkwCUO6T7R3qNFaDz-4vgEKLvEAUIhaxBDroBHsIDHRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Apr 2022 14:20:30 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo PD50PNT
Date: Tue,  5 Apr 2022 12:20:29 -0600
Message-Id: <20220405182029.27431-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, productdev@system76.com
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

Fixes speaker output and headset detection on Clevo PD50PNT.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aace474a899d..61df440fdb61 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2619,6 +2619,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x65e1, "Clevo PB51[ED][DF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65e5, "Clevo PC50D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x65f1, "Clevo PC50HS", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x65f5, "Clevo PD50PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e1, "Clevo PB71[DE][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e5, "Clevo PC70D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
-- 
2.35.1

