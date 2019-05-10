Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289B19EDC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 16:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D48261A96;
	Fri, 10 May 2019 16:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D48261A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557497820;
	bh=KAV19MvhC2N0x/y5hJQG579NwbXk3kD8PBa+sw7/wW4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uD+6EY7VtbSOg7fXnomxynw2ROPj6tymsEKbMYSpxh86o5FA7EUoGooE8TH3TjX0c
	 jv2RZFZRSlUToa6efvmFzXNUWdPJoO8g8fOx+aO+9qLE+UV9MSNqxb9/CuKu5y5Lo6
	 8s5kvhF0XBgvrY/j2I28Epg7auZE2AReV55Z7eTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50164F896F0;
	Fri, 10 May 2019 16:15:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3BD6F896FD; Fri, 10 May 2019 16:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C40A7F8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40A7F8073C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NPnX1pLG"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 21BC33CB
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 10:15:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute1.internal (MEProxy); Fri, 10 May 2019 10:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=WTfAhOpXeDU7XfVp49Ad4Dgx5lEcA
 YrapqAYuCcH7fc=; b=NPnX1pLG0rz/Zw2S3CnLzS0/nbPaFOm4j6/i0vmQP/PbN
 CCyq0/5UjPrSUZ+tc16wHAC4cSR8g/aigASvlUwjWtw1osPcFLX38FxfdAFmpg5N
 joIze4sfAeiZL8VBLII+lj1wC1jretNRnp4OPdwIk9DiEnzGembX8whVJBA2w4F1
 HiMUUQJK6E1vjidISe4Z0M43h39NFr9u9OKwAiAw6Bb5T7D4c44w3Yok56FEYHzP
 fxCfAcbSedtjC2SCr03Avhf3lmQdrLvJE1D5piEb3zY74dMPJ3o4DOA/kcDRuc/S
 6a3CdpOehpShGP5NdIwkNAUl/i9CKlRS+ybKQMJTw==
X-ME-Sender: <xms:a4fVXDfx8qdtcfGSI5fQQVv8CzEiwPybim06whlMGQGQSBq-27dTww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeekgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
 ertdenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghmhiesshih
 shhtvghmjeeirdgtohhmqeenucfrrghrrghmpehmrghilhhfrhhomhepjhgvrhgvmhihse
 hshihsthgvmhejiedrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:a4fVXPo_puGg40VZP28f5__PTIuiVVXRdkH8leX3D6MOp03eE3Ddrw>
 <xmx:a4fVXKCNygF_nMbrDc8jrUvvWDetc60WkwECZfwtpT7tpTMqZLuAQQ>
 <xmx:a4fVXNUatoxWxKj21-c2vrv09OzRa5PAT66as4NqiI_u9qamtUO0Ug>
 <xmx:bIfVXDCzeFQfq-6XDgCibICd8eHQOOGXWHPv1d10IM3miBkkQgEbiw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C8E2D7C54E; Fri, 10 May 2019 10:15:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <bce69280-a1df-4de4-ae4e-89de2d464e23@www.fastmail.com>
Date: Fri, 10 May 2019 10:15:07 -0400
From: "Jeremy Soller" <jeremy@system76.com>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] Headset fixup for System76 Gazelle (gaze14)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A mistake was made in the identification of the four variants of the System76
Gazelle (gaze14). This patch corrects the PCI ID of the 17-inch, GTX 1660 Ti
variant from 0x8560 to 0x8551. This patch also adds the correct fixups for the
15-inch and 17-inch GTX 1650 variants with PCI IDs 0x8560 and 0x8561.

Tests were done on all four variants ensuring full audio capability.

Signed-off-by: Jeremy Soller <jeremy@system76.com>

---
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b3712d87e98b..3e790b49c1c0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6901,7 +6901,9 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x1325, "System76 Darter Pro (darp5)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8550, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1558, 0x8560, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8551, "System76 Gazelle (gaze14)", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8560, "System76 Gazelle (gaze14)", ALC269_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1558, 0x8561, "System76 Gazelle (gaze14)", ALC269_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC233_FIXUP_LENOVO_MULTI_CODECS),
 	SND_PCI_QUIRK(0x17aa, 0x20f2, "Thinkpad SL410/510", ALC269_FIXUP_SKU_IGNORE),
 	SND_PCI_QUIRK(0x17aa, 0x215e, "Thinkpad L512", ALC269_FIXUP_SKU_IGNORE),
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
