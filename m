Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCAD554E29
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB4FC1EDC;
	Wed, 22 Jun 2022 17:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB4FC1EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655910093;
	bh=X8m0HdW0szEH622YY/dKPJWcd2zG9FVQwm0ZbAmXRco=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oi4DPdRItQdXMBPXMmNamE1wUXYn2aKvPUAO9EqwYq4rpsqMcyCCJVBFMS5VlJ96G
	 KOh1XEnYhmhLUzHlaPHEl/pVJAeKar8j9wvpVhw6XOVzfhJef1gnr7EzWBUwiRSsWt
	 ne8/dRaIqMjOYWS2gwLA7dzUtzaV87VLsfVyKZSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7DCF8032D;
	Wed, 22 Jun 2022 17:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7BCEF802D2; Wed, 22 Jun 2022 17:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82884F80118
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 17:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82884F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=system76.com header.i=@system76.com
 header.b="BLunZIOa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rJ4PZdlW"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 285FB320094F;
 Wed, 22 Jun 2022 11:00:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 11:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1655910019; x=1655996419; bh=OHfERes/iK9BSUjjbm10Zvf8L
 wtNHdD+wNOT/uFcZbc=; b=BLunZIOa4BUoEc9Kc1dz61PmGUR7JKDbtg6hDL6Vn
 03CbdCSSIGVW7XuLqwVFNSE68Bqrd4zfYoF3uRC+LdillNhKSx1rCZeyEqJIAt8N
 UgvF1JrdD9gk7/4QDE6H1Zl7b2ca9HQzo2yEsDWJdwknKJwnLurmIDXCrKqN8EUt
 9S3nyeb5onwcRiINIglh+DBRmZGH+0XWBwmfixcjCFAFSxhFFhWk6d6TeMjpG+MT
 agXdbGdlBwMD796N44XQ1BM7gcSJTWEaD2IfFhfpm3Mj/eZcC8CSxBvnEl05A/Fi
 RkNdjFnSbCzPgBSzDu/cRNmaIjMwChvZZoLVCiwhUtr0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655910019; x=1655996419; bh=OHfERes/iK9BSUjjbm10Zvf8LwtNHdD+wNO
 T/uFcZbc=; b=rJ4PZdlWL1g1ltff8DONBb82yXiaiqE8gm08FDHTKjyJKCFUhqP
 9jkUvSU7Y7umQIsTrBpIrIQAPFCrvijMdfmpIVmqKCtb30uZsjvswfkW/wAVw4km
 //T1lLd/q9jbpvmFWdm47vA8b4uh0mJe379CZVWLiV9p0l6BhF26bwiKr5f82SYx
 E+kilrlnQpLkj0M50P0A0ccoS7qpRQoyujL0g8vxFjEe+NWxQGIr1CA3v4mU5ckm
 66qEi5gKvoPYVIgNlXGvtTGLqpESilfgz2yH1zv79lnwKQDw7tZUNazOu17tkM9B
 9M+Ul6am8yeohTFpgSUMrMXO4rYA099iErA==
X-ME-Sender: <xms:gi6zYmF_PRLYPMe4gqJn4oT-UPRuaA2zb_arKlQVP7OMO6J9y9y0wQ>
 <xme:gi6zYnV-Ath-uOj-3QbahmUYz6AZDJVsoA8_mjf2TXefd4qwGJK2fRCjoz1MfgPL3
 2o7E1yGFeqSrZAhiw>
X-ME-Received: <xmr:gi6zYgJO6TeQwIs41c1KGeJCMGUKnP5Qk3KqVeiZ2YKftdHpB2xWVYEq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepkefgteefvdeivdfhffdtff
 fgieffhfetgeduudekieefueeutdelfedtveeuheefnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:gy6zYgFvJ1U2U1Q-rBPoPtlkWQ2Jq1Bh5QwdG-_4jrgSVzfwbz8lqw>
 <xmx:gy6zYsXttB423n2YY1qv2E2pwU_bUwAObPAh66oXwYkR6rqM6gvyOQ>
 <xmx:gy6zYjPXKikT7VflhQlqpIDZWpVwmpbyM-EJ0QmcZlvmBuN5kn0NnA>
 <xmx:gy6zYnf5gj0x4hZ47IYicSRhUc7IycPi9vikD4HApojlq6qcRq9NtA>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 11:00:18 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NS50PU
Date: Wed, 22 Jun 2022 09:00:17 -0600
Message-Id: <20220622150017.9897-1-tcrawford@system76.com>
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

Fixes headset detection on Clevo NS50PU.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b937f63d0d09..d4f7ce6d84c3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9210,6 +9210,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x70f3, "Clevo NH77DPQ", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f4, "Clevo NH77EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f6, "Clevo NH77DPQ-Y", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x7716, "Clevo NS50PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8228, "Clevo NR40BU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8520, "Clevo NH50D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8521, "Clevo NH77D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.35.3

