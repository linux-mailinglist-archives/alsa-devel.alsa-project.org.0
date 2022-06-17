Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032EF54F853
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 15:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49541EFC;
	Fri, 17 Jun 2022 15:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49541EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655472703;
	bh=8twHaqZ/md6nc42SO3/jksI9z7vAwXPh1US3Fcm/Mps=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qj9V/5aeAlgYB962sOhXdVArBsuG/5H/AgPzfUB/o4J9hDoiKE8NikvFyDaiRuBh3
	 ndGXQUtfdKNEJWTOt4WXwbWmfzBx2HlqWm+DMMXCfKsw9pkdoeKW3OTfdsDX5dLodS
	 f5FDI+F6Wp1f5Ls3ui7CkaEqF1BK5ecX/4N6bm+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F361F80528;
	Fri, 17 Jun 2022 15:30:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E89DF80527; Fri, 17 Jun 2022 15:30:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A3DBF804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 15:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A3DBF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=system76.com header.i=@system76.com
 header.b="NLaiZfRg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UTNeoG2f"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 947D95C0176;
 Fri, 17 Jun 2022 09:30:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 17 Jun 2022 09:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1655472630; x=1655559030; bh=4xGA2GBGwJDvIs+SqqRufpmJP
 abbrFui0Vfcb+4UBhI=; b=NLaiZfRgdef6rITmcl5pO8NTskPpTR312Ju/aE9Fn
 oF6AC9/PWXD5PnwM1lDLktqCCrD+jqlc64qEgq7+ogStJp03sMNAUco0Ee6+hBDp
 f7K/ycRKOpxjzrEM0s/NPS2J0Z4V7Q86kKXyTcq7zeCAV3XgJBcyx0zBl26wt8qq
 AWmBLPy7n00dGzGlAt2MhLzPtBSQH1RBNq8I9W9JAUJVg+2GgnDpULbT/XWh2RIs
 DIovb/4+MVb9FlWPtB6FYSL5hnFCnR5HjPn5uRNDUPjkWVCi3M/UBv0xxBDfn/mR
 jcZIHQ1CbbGdV43wq4DSdCj/K4T2qZtSTKAj+SN+XmLEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655472630; x=1655559030; bh=4xGA2GBGwJDvIs+SqqRufpmJPabbrFui0Vf
 cb+4UBhI=; b=UTNeoG2fkstPY1Y58WOou+6vHHdtFu2bulLp+O4XY7XNhqdVYrr
 mSPHb69k274Q4P5osdtAa7sut9mh8AxkRCLyfQW37T6NGEvhcP71ecADFWgfCuPu
 uMQRTmGJluNq7xX0qGdPXHNel91uv3k3uDWXlUs1OXVe1BTnma0QJvf44jbyhybo
 RDiiuzldrmoN+GLDdfMh4UK/XqnSIqrjTiZCcaES34LY4o/LIxacp0P3jeEeCP27
 LJ0iYL6Ei6HAGwLVhan0EY+u+8BFKoyPwivkz4KhPsEecC5ufcpMdNlTwj+3f963
 WIlPj/Qhb+odqwwLm5mtfEbp9yfxSAI3DOg==
X-ME-Sender: <xms:9oGsYn7C8k1o8NeNWm9zLx0UM349sX0pXfwgClvk-TMpVB4dpowpRA>
 <xme:9oGsYs4fOCMe5eCIIWYltUNCuaIli4o1C-BsfNt_n5KgOYYViuHJKyCtY1KEBIdpK
 IVp0-kY_piRf0qrhA>
X-ME-Received: <xmr:9oGsYuf2wFg7uzgv74Mzv7K3bIpIVte_qSzccpGwv-pvRT6q59_xs87S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvhedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepkefgteefvdeivdfhffdtff
 fgieffhfetgeduudekieefueeutdelfedtveeuheefnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:9oGsYoIW1FvMUJPxP1RyikmoRNrQlPxqQPo-e-su6OXpOLYhsdRd5g>
 <xmx:9oGsYrIlol1R3lYdLKcJq_NqunCy6aIpax8SEY1nCrLud91V642CXw>
 <xmx:9oGsYhyV5ihrYZF2FcFA944nn8aotmS1i1fKS4KxKap8pcAYzYnQYQ>
 <xmx:9oGsYhiwcqo_q5NBBmjgRp1mDQpqrOPsPS9Qox-YghwQtcz-dsKvRQ>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 09:30:29 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo PD70PNT
Date: Fri, 17 Jun 2022 07:30:28 -0600
Message-Id: <20220617133028.50568-1-tcrawford@system76.com>
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

Fixes speaker output and headset detection on Clevo PD70PNT.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b937f63d0d09..ff9a09a670ed 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2634,6 +2634,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x67e1, "Clevo PB71[DE][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67e5, "Clevo PC70D[PRS](?:-D|-G)?", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x67f1, "Clevo PC70H[PRS]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x67f5, "Clevo PD70PN[NRT]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x70d1, "Clevo PC70[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x7714, "Clevo X170SM", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK(0x1558, 0x7715, "Clevo X170KM-G", ALC1220_FIXUP_CLEVO_PB51ED),
-- 
2.35.3

