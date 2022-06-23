Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85349557E8B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 17:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D649B1A6C;
	Thu, 23 Jun 2022 17:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D649B1A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655997966;
	bh=do6thWfSfjG7MlqgZB4G5+LxM+Hvxyjh9T2+03hRnSg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LCpEbUNtTRw+bL70j4hr1Q7TJRDsKRRdb0/EfWz/p2dLa1DxyAbpuiXuGAX/LOhiw
	 m8b3ouvcjpk7EAYF9L1QYUvMrgQbmt/qa+T1Oq9D8FB4qfsv/2U78DrY2FsdjM413P
	 7inF4V8EFC5GHHdT5gWhnGte6QFQQ+X9BTNdVxY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C233F800BD;
	Thu, 23 Jun 2022 17:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB7DF804C1; Thu, 23 Jun 2022 17:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA38F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 17:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA38F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=system76.com header.i=@system76.com
 header.b="Gwtl/R2O"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JRWFZtvs"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 79C80320094F;
 Thu, 23 Jun 2022 11:24:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 23 Jun 2022 11:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1655997895; x=1656084295; bh=NTDtFEWNOFxmL90vGlkD8IkBE
 RkqA1TbOkk0I7Su7uY=; b=Gwtl/R2Owj6X9D4ABdUVnmLZ26diCOL940/k9mTdJ
 XFCdsdDQpg7wjh4M/aPwO3FekMxtIT49/knCF7F5N5N18JaMzIzxncJtkTJ9b9eu
 d7uDNA6+yyQNCtcQe/dQxBHLm5uloPLfYLvjeCN2PuS10Ksb+nN7+ML2FYntcjfq
 tetJg3NLEeMFWiexZYG26NJMUl9mJkP8v8VNt96ly0M8JgKxizFToZMiRc0Djgy7
 +imI1dTCsD8Ivs+XSWbyqgUr+2RJB795uSui+ra1GAmxG4OEUVtDXT6Z8VEKuVoh
 ZHfc7oWni3sqcVZGZ6E83UCbXCEYE+uga+AWrE9zXKwGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655997895; x=1656084295; bh=NTDtFEWNOFxmL90vGlkD8IkBERkqA1TbOkk
 0I7Su7uY=; b=JRWFZtvs5ddwYpMEPGUxnu7rLvGxaL5lGAJmj3LQHz51ylV7H4q
 iqFsfmHiTKNSWZ9zUKc6nHW9aGbWpfNZe2uQWP2+KrQCWdXJIeu0nmlBRWgZqkCU
 W06u9cOmxGkclsn/RtY4JkZvlzGKttT/6XRjuaCzgsPx5OMHBUw3OPWR+gdsIhv7
 KBEh6Oz2aslntlqDhSLdmKlo0KVQd/GyFEen3rfRXXqEllGDN+oIMyAgJfYo18xs
 0n+Xyr1eSb+McaH/n37jJBzrj7RL2LkQz63ez95wbshZwPC46UxnXnPurbySjAEf
 y6jswXuJkeBPL8mKBoZ7wNm4OfncZ7roTNA==
X-ME-Sender: <xms:x4W0YrSn_CXoEzkyWC8imC0HiXMJfr93MlRrjMQ0UHq4foyOvFILaA>
 <xme:x4W0Ysw7JSVSiy2_qEeQxxPXaYYciB4rLKiNNw1d0KTySVXz1TCDNLSM2U9wT66zf
 fRCX9yYslllcqLnMg>
X-ME-Received: <xmr:x4W0Yg0WBEQAKz1roxYYwCbLngr9pxg1l2c4ta5HT80Q6bN4aKEyJxLZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepkefgteefvdeivdfhffdtff
 fgieffhfetgeduudekieefueeutdelfedtveeuheefnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:x4W0YrB9bICFlTHR0TltaCcz3UAnNSb-4-BA2FAcES_VSEyIX7LobA>
 <xmx:x4W0YkhooeFvc76zvMyqS6rbmSdKqTUOJX-VDIrPFBiUbzBK-iVbQQ>
 <xmx:x4W0YvqysCgIYa7mPW1Eblp7m-ibvKXzz0zwIWciXUXftotmb0-Kaw>
 <xmx:x4W0YgaP04XShTK8DdOrcAMukiOcJMGSeTCJGC-ulDkASEA3WrLbLw>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 11:24:55 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo L140PU
Date: Thu, 23 Jun 2022 09:24:54 -0600
Message-Id: <20220623152454.7991-1-tcrawford@system76.com>
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

Fixes headset detection on Clevo L140PU.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b937f63d0d09..55d74c546250 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9210,6 +9210,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x70f3, "Clevo NH77DPQ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f4, "Clevo NH77EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f6, "Clevo NH77DPQ-Y", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x7718, "Clevo L140PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8228, "Clevo NR40BU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8520, "Clevo NH50D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8521, "Clevo NH77D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.35.3

