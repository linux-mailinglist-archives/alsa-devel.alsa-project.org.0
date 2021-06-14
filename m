Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2C3A5E6E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 10:33:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7100417A7;
	Mon, 14 Jun 2021 10:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7100417A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623659599;
	bh=XRz37XWJr7cwJpaou1VDw4RdY7ZJQRa4Hs4U5FCbKwI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TuptOO/IcCKpvQu/H6gvx2srYjcec2fo43h6TIXkfDe66kB2jVD0iomvVfYmidg6t
	 JrEIrW3glGcSzkHSm0pBs+bLHra1wvj1IDvXornjVL7uvXr57eWj/Bm7NGg7jnMjKv
	 Fq16l4MJQlcUCh3fXJZGsqLZr0RXnKsuJfuOzF3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6401F8021C;
	Mon, 14 Jun 2021 10:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 109C1F8023C; Mon, 14 Jun 2021 10:31:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19109F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 10:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19109F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Mg+T9H7m"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hO9II/ts"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B49665C00D2;
 Mon, 14 Jun 2021 04:31:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 14 Jun 2021 04:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=5eSTmm+NAW9ROR1XOx1dA3b+IS
 DGGRiqhEv9BxcYwv0=; b=Mg+T9H7mcehoBsmp0WLEMTZnxtUzXI8e5tCMxmYbER
 uMRyjCQYpprbNouIysXTDACaTTP8dawlVSx8D2MoL2IPEuIbeA+gmgbR1FDvBXnD
 J6b3B0MFKFADP+RkKJjkPS6janVCEPoP4M7/mXDm3ALru40KS0fpPxWZ6ww60OA1
 cBOB1Ciu3ZizE1u3Yxxyk09kWyps6c0r34WwRf2b3mvkbrbMBSeCAjyvMAT4tVPw
 svW//P6M0lt9TNAAEhW43tL3WP/R/VC3otKpXNFfBbr+5mBUJ34B+Q+Jx8NEKMwW
 Ivy+vMN3brusOlg6WfY+uKgNWMBENYcuiNF1J31FjSPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5eSTmm+NAW9ROR1XO
 x1dA3b+ISDGGRiqhEv9BxcYwv0=; b=hO9II/tsPGswi49CU6rMX5xYpS0VgepIO
 VEpKtj1QBN8adimp65PAUoxNTq9h25AEi5RcHUNdvE1BbzLbcHP92KsQS6NBS1eT
 5Tjkyy26GvdvwGYxJKWcGTWaY2G3WqAKTGj9Y3kMhCvFhNTL34pDxkuMOeFiQJMh
 mod4OgsMRH+1TU/UBvqUG1coDYD9/YEeMfhx1t2L980M3dNS8zwwrCJ3mfHxAijI
 9ET4NAD7xFZRo+BSJT6kFKzvcN9+HRzVBC106NEvojXD0b/ZlR4xo4vzSiD0SDgu
 KFbmNSeOIlkEmQevSgMV+WWglSRszYsazeIzY994b9FL7tTIHlCUA==
X-ME-Sender: <xms:6RPHYHe-PhHsdiP9CUktGQzLuEUuAziibXjPCvWETtSfazDRUKDcHQ>
 <xme:6RPHYNMegMb2sdo9mWjQz7lT2F9uoaEJVMNMzL8qafq8_lf1vxXbMokplbpa_LJzH
 VIlIBBn-FDPiKvrbps>
X-ME-Received: <xmr:6RPHYAgKI_x5Y4Hz88BgKwa3xOfzH9An7SGsa6mCMtVTwHpymi2K3bw2isUSp7EWoYfglC8Xxa8OntOkdHi1epFozwFnuUYS74UW6_7HKo489KKlXu8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6RPHYI_hMUrIXDEgGBybp0017cD97TZDYFyG72GrqgGAduCaCqMtCA>
 <xmx:6RPHYDtI-5VWmM4qjqayObiIIv65L_XO5m2eGLQe887XkzUiCpFeXw>
 <xmx:6RPHYHFfLeCIZ0S3V3R0UNAOyxi6lKg4WI0CVKlr8YGGDXjKc7Kwwg>
 <xmx:6hPHYM4BkzkO6ISQqfWPPJPcocTrNxeTOdabRG1M1GOpyqQSwq55Cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 04:31:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: fix stream format for MOTU 8pre FireWire
Date: Mon, 14 Jun 2021 17:31:33 +0900
Message-Id: <20210614083133.39753-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

My previous refactoring for ALSA firewire-motu driver brought regression
to handle MOTU 8pre FireWire. The packet format is not operated correctly.

Cc: <stable@vger.kernel.org>
Fixes: dfbaa4dc11eb ("ALSA: firewire-motu: add model-specific table of chunk count")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index e59e69ab1538..784073aa1026 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -353,6 +353,7 @@ const struct snd_motu_spec snd_motu_spec_8pre = {
 	.protocol_version = SND_MOTU_PROTOCOL_V2,
 	.flags = SND_MOTU_SPEC_RX_MIDI_2ND_Q |
 		 SND_MOTU_SPEC_TX_MIDI_2ND_Q,
-	.tx_fixed_pcm_chunks = {10, 6, 0},
-	.rx_fixed_pcm_chunks = {10, 6, 0},
+	// Two dummy chunks always in the end of data block.
+	.tx_fixed_pcm_chunks = {10, 10, 0},
+	.rx_fixed_pcm_chunks = {6, 6, 0},
 };
-- 
2.30.2

