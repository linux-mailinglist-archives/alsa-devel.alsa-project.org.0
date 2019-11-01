Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D577EEC393
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 14:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D15E218D;
	Fri,  1 Nov 2019 14:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D15E218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572614231;
	bh=NBYAMqARmNGV0pGuo/8USA7GV+G5oxMkxIOJNZZ5eOw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VX/AXMFu1Mxp5V4jgOKDedLRJNjcOlPnDeem7zrNFHKqXi5oWi8TrEnkB+ssZPB8/
	 NR14ui5TqCjtewoZ1D2mmvL4hmPwnOVmZ3OJf9bbHVvGwrtaABxjs7oxtTuwdHNVPc
	 gvxuUTP5tz0vfYogc9kVkrhQk/RTlCTX4cIhlMwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC98BF80363;
	Fri,  1 Nov 2019 14:13:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA49CF80610; Fri,  1 Nov 2019 14:13:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C995BF80363
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 14:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C995BF80363
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="R4Z+OMPy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O6Bgcfv6"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E97FE51A;
 Fri,  1 Nov 2019 09:13:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Nov 2019 09:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lRezLPOVDrLBj
 K9efvAw9sNrIn/q/TOPBhKJ6DDrteU=; b=R4Z+OMPyPshghI00qvGYWRnqBGSis
 hS4td+QdV+X97NeV8X8GlFl4wWhCS/MHs5LUR3TBdEqMOdKmmN0m+lVpyb3nfFoH
 pgCJTgUdpsvHDjHFDvQzUsmDtCit90FLpdkK/kt/Sn7v6xJmDLg/eES+Uvqpe2qr
 P5LzuNwUnzOJ/LBMR0z0fafIx7mQYaR0kSL0aqR6RMh4XQoYY8BKUEKbPCyPGYjg
 Pd7lZXhxx6AEHK6ZNp1flx+p2J4kSVavB1815JUXn8I9I+rJNceWxJkBTuq44yJr
 DUg3fmgoRnLYfeekr+qXTBj/43ItZ7KQznqJv35cL/tJWRIVTbYiNUGpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lRezLPOVDrLBjK9efvAw9sNrIn/q/TOPBhKJ6DDrteU=; b=O6Bgcfv6
 9mMqUO6GnZIjhXLNoc2cGTWZaDkTdF3DHPaYkmlJMxnMyAxc9DIAbIRszgAxOeIE
 GpVrQ1rbelY0sHkWfAu5zMxvXlhzgdVHdnogXYzBB+IKnUjwcCnTiK3hZIB/w70/
 qDsNswjfLXop4GyqWlKkIvuf22bKqPFn3XwtCtOdRmCM/Chvm+ANIspne7CM8smC
 t/sZO8/wWGPyUgfti/HUxlU5aVMfIBt8moEecSpfwRzqc1QpkxN+UroOYCNosuYn
 zebsAxbxV2mVOxY+CRQHsTbDH5kO+OGHjJAS/3170xAalzpdcX4La79SyXgVnO91
 I5mIkvYbEBRc/w==
X-ME-Sender: <xms:eS-8XS0vzQoTfN3cVy1mwRNV0dtiOMkCZxAzo9TcI5mesOG1TDGQ2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:eS-8Xes20FBAayjSFMOu2zDQphG1WpKqv0emFNT9ODrb6hdw9eZ18g>
 <xmx:eS-8Xa57dJbNVZj46zEFdtxhJahSbwaMmI3q9KewWWeGY1loJ3BYIg>
 <xmx:eS-8XXIFndNjdabb-FX8rGdQhz77yP6wByqXPdDD7_Dz8liF7y1b2A>
 <xmx:eS-8Xe1k_L1wr3v1_iMBg3yPYuNwqm32V1PL0bhW8gdsW8ZAPO50ZQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A2E13060062;
 Fri,  1 Nov 2019 09:13:28 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri,  1 Nov 2019 22:13:21 +0900
Message-Id: <20191101131323.17300-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
References: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/3] ALSA: bebob: expand sleep just after
	breaking connections for protocol version 1
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

As long as I investigated, some devices with BeBoB protocol version 1
can be freezed during several hundreds milliseconds after breaking
connections. When accessing during the freezed time, any transaction
is corrupted. In the worst case, the device is going to reboot.

I can see this issue in:
 * Roland FA-66
 * M-Audio FireWire Solo

This commit expands sleep just after breaking connections to avoid
the freezed time as much as possible. I note that the freeze/reboot
behaviour is similar to below models:
 * Focusrite Saffire Pro 10 I/O
 * Focusrite Saffire Pro 26 I/O

The above models certainly reboot after breaking connections.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index f7f0db5aa811..1b264d0d63eb 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -415,15 +415,16 @@ static int make_both_connections(struct snd_bebob *bebob)
 	return 0;
 }
 
-static void
-break_both_connections(struct snd_bebob *bebob)
+static void break_both_connections(struct snd_bebob *bebob)
 {
 	cmp_connection_break(&bebob->in_conn);
 	cmp_connection_break(&bebob->out_conn);
 
-	/* These models seems to be in transition state for a longer time. */
-	if (bebob->maudio_special_quirk != NULL)
-		msleep(200);
+	// These models seem to be in transition state for a longer time. When
+	// accessing in the state, any transactions is corrupted. In the worst
+	// case, the device is going to reboot.
+	if (bebob->version < 2)
+		msleep(600);
 }
 
 static int
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
