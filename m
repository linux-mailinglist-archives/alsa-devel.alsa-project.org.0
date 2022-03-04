Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDDD4CD9C8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:10:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C2E21F0B;
	Fri,  4 Mar 2022 18:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C2E21F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646413803;
	bh=GT0Tjz2TAczhYhlgRjK035m/ZHYUE+AudL4MnXEZMM8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FWJSVT4i1Xr6FUsoBCs+3QD8xSt59i//s1tFaio0VyE8JtOPySRhUe2t51qwy9DVO
	 iMRECXxOscKZGy9Nm4bvIvMxVkvnp4Lj6K0ZFkb52f7g+gfZcLxPtGsk5fbrETZ0U3
	 Ys6ZBoINLNA29ieSgCbg/dJBCR0dyNWj3L/nq5Fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F74F801F5;
	Fri,  4 Mar 2022 18:08:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0C33F801EC; Fri,  4 Mar 2022 18:08:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83844F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83844F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Z4dUKNc1"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B3DBB5C0229;
 Fri,  4 Mar 2022 12:08:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 04 Mar 2022 12:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=c2WtgZ4siPvUwz38AjSnENe753kuD
 xforQ7QZqksDTQ=; b=Z4dUKNc1QL9lljs55mrZ1Zv895b0iUVznNr2P7fkwEjz4
 7HIduz1iA/Ue+SLza4qmEx4hvHLteTQKaSmD/aBlvza4D/u2cJAyLWbIKIMbDTM1
 4q0/8BxIMFKEsG45l07cyPePjosvhdPqrYsKe/2gmIuNKP/H9I+Rpxcalnw+lvJO
 NXtBUyn0+rmaDR1aMv2eZhv3vEXXqdK93W+GWo2sCP3BN6ZxrzJCevDNK8wAEWgE
 mzUlJ9TYJxTH8NkICSJJD0+LDukL43a1X72IWs1BHYVZf0soZ//Tu9/VOqG4XWXV
 sSo0VyFmmzxBRB7LbcFOO4onUteFYv+qr3LiRs37Q==
X-ME-Sender: <xms:mkciYo7_pmO93br6J83kNb5E96oyommBOVaVGcntEkf4bpBRQYf8yw>
 <xme:mkciYp5_knoNHUrE-tEZA9u9CbmbGVdiVB3X_EFp5vMEEjhYJzAApNkk4eI9LDYZe
 oEprmC3nUmGJGcPCQ>
X-ME-Received: <xmr:mkciYneiEHCMUGVJDIIWAMeg6_BDTXGMUK9cxlDb68RXwTkqAXVlv7P1i43K7FQvdIEoyUHcdtkR9uWZwNFm1GJz4gni9SMyDInYKOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfhimhcuvehrrgiffhhorhguuceothgtrhgrfihfohhrugesshih
 shhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpeeguefghfeigeelvddutdegtd
 eitedvffekledtjefhjeevgfetgfelteetheefgfenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehttghrrgiffhhorhgusehshihsthgvmhejie
 drtghomh
X-ME-Proxy: <xmx:mkciYtKCo-U6SaiWvgavuyFjmj_UETME9-UpPMDBMMRjXvkuQ51xdA>
 <xmx:mkciYsIjA6DI2ENhD9F1_EYcZYpGBSWucHwB0F4x2tiB83oRYmY3mg>
 <xmx:mkciYuwhNadnvJHa_NdFbeIUqwGD18DYlDtDZyaSqxY2WOy6KVNOeg>
 <xmx:mkciYmhWBZq4BG5Bpke2ny9AAxLFgNZ4LKZeHpLPzRtm19_Qc8MizA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 12:08:42 -0500 (EST)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Clevo NP70PNJ
Date: Fri,  4 Mar 2022 10:08:40 -0700
Message-Id: <20220304170840.3351-1-tcrawford@system76.com>
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

Fixes headset detection on Clevo NP70PNJ.

Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ef70158f88c..7d85989f585b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9144,6 +9144,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x8561, "Clevo NH[57][0-9][ER][ACDH]Q", ALC269_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1558, 0x8562, "Clevo NH[57][0-9]RZ[Q]", ALC269_FIXUP_DMIC),
 	SND_PCI_QUIRK(0x1558, 0x8668, "Clevo NP50B[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x867d, "Clevo NP7[01]PN[HJK]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8680, "Clevo NJ50LU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8686, "Clevo NH50[CZ]U", ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME),
 	SND_PCI_QUIRK(0x1558, 0x8a20, "Clevo NH55DCQ-Y", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.35.1

