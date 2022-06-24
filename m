Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF9559BC5
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107111866;
	Fri, 24 Jun 2022 16:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107111866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656081748;
	bh=CzSZ3XJ1ZpmdR75HPdxnvdntg5nhuKEYGXkCTT1uZb8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NsvLMDJsLinNXrXgxVuIODXw7EKXYVIkAM5nAzbMvk1vmR+B1nj9hx4VaR06rmS5Z
	 2GXcaoWyFvhSqvDWmsmBi+DWeSKnkPhD21IvP09H4YsMGe5U7KmzWJgG2r3c4EdmfH
	 HeXxIfKCrE2DkqRLYn+ZVtwtApbySUgW2Q3Wg/vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1E0F800CB;
	Fri, 24 Jun 2022 16:41:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20601F80107; Fri, 24 Jun 2022 16:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37908F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37908F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=system76.com header.i=@system76.com
 header.b="e9ZSVyru"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZLrphymI"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 669BE3200708;
 Fri, 24 Jun 2022 10:41:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Jun 2022 10:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1656081670; x=1656168070; bh=T6ykBOkohziMhzJX4ZCTZHCSM
 xDUNfuFs5HEhjzhzhs=; b=e9ZSVyruATpxqmuvQhYBbbIC/m8NOYBE5Yd0JicFB
 Kz5guCqeMOKfKorma75PjF44maoVyoXQcIi5AyRmophBqpP6YbsTWDqbXjRn7USO
 HJLqCgfeR5TzfbLhciSTbCvQxASbb9gGe6JVZTBg8jF/CbNV1+i8qDg/j5EX8Jsn
 tiV8Of4k29V3k5yB9VNvj+gXtigxpw+UEV7CXYl/UdPrXP48yGHuQZzbBWITtz5W
 3iXQRXskjr7KYY4t404VA2vbLQVyDTrRo6oRxKHC/6+XuJ+A5fE26RAX8KOjBMnj
 T5fc9dWho66uNpe/z5ceuLXODLTKpZB0Brxs6EvRUbmNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1656081670; x=1656168070; bh=T6ykBOkohziMhzJX4ZCTZHCSMxDUNfuFs5H
 Ehjzhzhs=; b=ZLrphymIOZcBVOtkibd6v4hZQOg8SsNVkvYDJIhXeThagX/uiy0
 1yOlR+/PMtDxJZ0swbrE1YoXRa4pyjmnPQrImFwv7/Dqh+rz/hywVldhx8laLWOV
 STTDIaOhe+UX9BbQDL4Pp6O/uAjO7sU2L9y7DfdlWElFW2BSLNng1Xjf49pp0lS+
 aA5o9zEc5SUKzICmsiu/w+gL8koEIXsy0qI5JgzaBZTqfN3h8ZStvvyYVU7TZ48F
 Vzpc+AWG4ptRsUqYEShPXxVzsj4KHKX30O9gAgpTHY5b+Rk20RrxNYLIvzJmAKq6
 A+WDhbdWjrxNUeCEPqfuqWPVBi++BZcr9Lw==
X-ME-Sender: <xms:Bs21YvIGen5Y6uualvuas-XC60RU8svffIyfTUFfJoQzRKuSSzLHBw>
 <xme:Bs21YjJ9QAdCNpK1S5AVXXvGBiFkRpXiXG-7MfAqY3tF0A6-qGrH__wSLHBswjbfD
 vhmqmOEUDACw3Rntg>
X-ME-Received: <xmr:Bs21YnuSaMShA1lEQqeH7W15JSJxktuk32rFZks5ss84eqnKynargkE->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefledgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepkefgteefvdeivdfhffdtff
 fgieffhfetgeduudekieefueeutdelfedtveeuheefnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:Bs21YoZMaIyucqus_9TWHe0QuwvQtZSs126zfhSjDdQYSH6C2VzRIg>
 <xmx:Bs21Yma99HgGEmm7_a1yV3Fv_BfMlmOYuCYjlg5KdoNsKRolBfQDIQ>
 <xmx:Bs21YsDkTPHAyfRX0G3EEWzrq5OKNbFKIJwFNilSZWC3ZrQN0XqwPA>
 <xmx:Bs21YpwirkWwbVB1htafcMn_Bth7L-qhythCzZUVvPvpH3RS5xzX6Q>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jun 2022 10:41:10 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Clevo L140PU
Date: Fri, 24 Jun 2022 08:41:09 -0600
Message-Id: <20220624144109.3957-1-tcrawford@system76.com>
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
index cee69fa7e246..007dd8b5e1f2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9212,6 +9212,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x70f4, "Clevo NH77EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f6, "Clevo NH77DPQ-Y", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x7716, "Clevo NS50PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x7718, "Clevo L140PU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8228, "Clevo NR40BU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8520, "Clevo NH50D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8521, "Clevo NH77D[CD]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.35.3

