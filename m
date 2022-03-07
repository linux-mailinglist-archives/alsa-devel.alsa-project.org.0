Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D25994D07C6
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 20:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6465F173B;
	Mon,  7 Mar 2022 20:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6465F173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646681631;
	bh=M/NcpOGVJ2Zstj+fI0P2rFMmYrCc6+ZNn54FXkfburc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=taE4AuqqE6fuPPLc9mqefYU57RF9y/ETPQxpBBSkqTbgjZl9VxKxLNnYfQjHqhOMe
	 jJLcaqkfG33RXc19JOxgpBxRUSlOBu3vKdFWLhwRCNkrfl+FQmY6tcAB5p5JM6/kST
	 +eg11vOD1Iowsg6V6NKlW30oh2fmGVC80UEDPLzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA7BF80159;
	Mon,  7 Mar 2022 20:32:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5EC9F8013F; Mon,  7 Mar 2022 20:32:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE12F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 20:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE12F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ApahjPuB"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id ED2F35C01EA;
 Mon,  7 Mar 2022 14:32:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Mar 2022 14:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=hmahUXsrS2Uj+Hpnw0/bhjs0sCKpI
 9oBprUA12z390A=; b=ApahjPuBs/wCkXYVpq5ReebYfSqrKNvNLrUJE7ZWi2QHc
 UDlPzce+6JDWUHUgZpa7rpmUkCmc4LOSI/1KdkYYeoGs9jbZudqVg/YnDH4QybqU
 rGstXyJyBGpY06VBtoX+Opozf5MDsx0kd1cLNYUn44H3bhUq8TYxBSsHvCWhUCZP
 FWyp7C2+kutEAL3vRG+6oHUykWdbQOj1Z3uI+6l8wcOnWsnOUtiYQpXY9dDjOT5q
 S2vAzTa6a8mmSX2qnUBN/IMhF+AtDIJEnBpt6ARsDWrjFYMGGMbpI8W5J2b6J/KL
 V+aAqoztjqDNtH+hK87un8O31LHBQyJsia7ptptnQ==
X-ME-Sender: <xms:z10mYn90FfYkeUlgBvShWiCE1vclKbd-1kTr7lRNMuXCXbyilevJrQ>
 <xme:z10mYjvQ1tx-yD7_EMAYtE6cNwpd01RMsPgNjtZQcUIjhM7OqytDOhOhPQV0Lq7q2
 Dl9p4HgOby2_-6kJA>
X-ME-Received: <xmr:z10mYlADUB4VV4YAO0YInjuPTenfgtro3hd-zjbsgHwhjHjLpAFEPiqPFjpX3tHxq5GpWQ4bfYw0IPzLT_knd-O0mfACq5654C4l3Y0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvihhmucevrhgrfihfohhrugcuoehttghrrgiffhhorhgusehs
 hihsthgvmhejiedrtghomheqnecuggftrfgrthhtvghrnhepgeeugffhieegledvuddtge
 dtieetvdffkeeltdejhfejvefgtefgleetteehfefgnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthgtrhgrfihfohhrugesshihshhtvghmje
 eirdgtohhm
X-ME-Proxy: <xmx:z10mYje1rn3Nl2KNWsJTyEnjB295o2QTn2wom2ajMdMrodph5zZikQ>
 <xmx:z10mYsNWKneD_tZCe_HDt-z4QtabzQR_-INKD4wAxYLNV6UqRSErIQ>
 <xmx:z10mYlm_pF2GjyyVBpXlmf_bBuzUX5-JvMHzx4VzURFP2m1p9X-e9Q>
 <xmx:z10mYm2QXCvwXOJDIyGh1RBVj5spjBwUzY4XqMB1C-cdQmmWDpZCpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Mar 2022 14:32:31 -0500 (EST)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NP50PNJ
Date: Mon,  7 Mar 2022 12:32:29 -0700
Message-Id: <20220307193229.5141-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.32.0
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

Fixes headset detection on Clevo NP50PNJ.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7d85989f585b..595f492c0268 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9144,6 +9144,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x8561, "Clevo NH[57][0-9][ER][ACDH]Q", ALC269_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x8562, "Clevo NH[57][0-9]RZ[Q]", ALC269_FIXUP_DMIC),
 	SND_PCI_QUIRK(0x1558, 0x8668, "Clevo NP50B[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x866d, "Clevo NP5[05]PN[HJK]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x867d, "Clevo NP7[01]PN[HJK]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8680, "Clevo NJ50LU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8686, "Clevo NH50[CZ]U", ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME),
-- 
2.35.1

