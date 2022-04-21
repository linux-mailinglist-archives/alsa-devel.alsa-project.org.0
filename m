Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E877B50A689
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92AEA169E;
	Thu, 21 Apr 2022 19:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92AEA169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650560724;
	bh=UgJuWIHEHA2mr40o9NTZeHb+CxhzAS3O/FL7iOPlaTY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SFiD8MOdB+E5m+NlnNsh//djKXwzumih4UvQukgFzgpBSU5FFqrm1A3Cwz4eBe5rc
	 FSh8zqqC4rWz61n8Ns/msRNAZFajvFUb/QG6UDkxInQp4ZEWQ/8BHoMziGpsiJQbjz
	 th8PsrrFsQAzayUfqTPrBR8+HGzvX9Vakv8RmtnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C3EF800F4;
	Thu, 21 Apr 2022 19:04:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA77F8032D; Thu, 21 Apr 2022 19:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A38F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A38F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=system76.com header.i=@system76.com
 header.b="he9pMkN7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uB/aETs7"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 456A85C01F7;
 Thu, 21 Apr 2022 13:04:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 21 Apr 2022 13:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1650560655; x=1650647055; bh=GAP2pBpYIARefoTrhKrg6TbWO
 bjZkTgzanJzjS/SNlI=; b=he9pMkN7/WSekoGGynwhCNR6j92igjXsUl7kfbeDU
 h7dMmcnsLYl8fa3N1m+5gnFLmpNXsSQxFaBYmqZF7JdyYKjBj6mC00W4dJcfbYqo
 A1w6VNGQGKUHkqB6iYHMk9sBukYVrohEWfpNrZAr9Yk2AVEcJHWnxAqrwJjJleaL
 uwA00bWfpxzgpqeE/3Ejf8u0Ah94/UWaV/fd17kvUKuF4sL9thtImGm0oxu1my7O
 oTIisK09IgZsWL9+kpm71yy5QxShlbjT7KUVgRFWd3Nc/Zn38z/ri3p3X2AMpCnc
 O4b5B+gZAQ6ThLHHATeNRocQs19aks1xInk6lZ5fgiz6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1650560655; x=1650647055; bh=G
 AP2pBpYIARefoTrhKrg6TbWObjZkTgzanJzjS/SNlI=; b=uB/aETs7ShWETCups
 wOOjlp6x+cQP6mtBFjWBU/Z9JR+NSpB+U7PNWnkHd0F7cMpDQfvOVk0TiWdOwRhL
 HloDpH/VTvyUj3Gl+JhCXGvC5c2ByLFX31lx4DbhiIeXFUu7cdRCiSsxkD1mID+d
 63/x/Pna7mzEiqWlXLBrNLfRD1CIJpDvwz/NE1rI/+SJ5yBc3YjJqNkuJIan1oaN
 mRFSemzaagQzQoROKertHS+eNq/U8aN3JdmbGQulKjI9P9mV+S46eyWOVoB38y9m
 LvtTdSkh7iZAUe26LeSApyO8RiqKZqfst+G6M9YrBjnFu66YMtyoYFN927n99XWV
 ZidmA==
X-ME-Sender: <xms:jo5hYnaGyiqRwRoVDTb6wQ3wMrY6v7ouotKVEXGGf6jctXdlkwslxw>
 <xme:jo5hYmZgx71qDwWqwHiLUvGE3F2PJCbWKpMSNZLypVERT6_uNlk0tLMYkks7W4XGR
 _l3-nrAkCycRU1sQQ>
X-ME-Received: <xmr:jo5hYp8H6Dfgh5u6QBaDPk3PcnTKv26OnUwzvZC_vu7x-53QbVB7-Pd_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddvgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepkefgteefvdeivdfhffdtff
 fgieffhfetgeduudekieefueeutdelfedtveeuheefnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:jo5hYtqEG3I-u9zunfGsMspAgJ_6rtqIbqKWXTPv5tIeFatS8IJUlA>
 <xmx:jo5hYioxTxBOis2KJSNXmErnptsqyrhc2jRpoTEGvurA7rJsP_ExRg>
 <xmx:jo5hYjRHglcRA4VS8m0O4Y_aHjDCDMm1iL6lWi70IHc-iTekBG4k4Q>
 <xmx:j45hYnCR6IFlQVJf0wbsYNuW8iSaTCGO1jjVkfNe4LXZodVAkpE94w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 13:04:14 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NP70PNP
Date: Thu, 21 Apr 2022 11:04:12 -0600
Message-Id: <20220421170412.3697-1-tcrawford@system76.com>
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

Fixes headset detection on Clevo NP70PNP.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 62fbf3772b41..f0f95e25f3f1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9163,6 +9163,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x8562, "Clevo NH[57][0-9]RZ[Q]", ALC269_FIXUP_DMIC),
 	SND_PCI_QUIRK(0x1558, 0x8668, "Clevo NP50B[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x866d, "Clevo NP5[05]PN[HJK]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x867c, "Clevo NP7[01]PNP", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x867d, "Clevo NP7[01]PN[HJK]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8680, "Clevo NJ50LU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8686, "Clevo NH50[CZ]U", ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME),
-- 
2.35.1

