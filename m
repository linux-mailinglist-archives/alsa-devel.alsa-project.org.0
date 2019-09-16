Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE62B37EF
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 12:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAF68166A;
	Mon, 16 Sep 2019 12:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAF68166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568629251;
	bh=vi/JMum9rw9HE8PSTDoObjcf3YwuzS/BhAPhqNCTlYQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P1I7F0ULfAlXGrePFEVN3nKo2aEloXQiuGRpH4jcCk/F32lDKlj/SNt6d+19IURAs
	 d4ZEqyuBkSwvpe05eX8mGSpDDH67e2AStlFwR6NB8FM1e1dNLVsaH5j6xg/a0z8T3L
	 0STiOEsPMWXjNDkL/rZe/prfVqghvP0AhMPiZWIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4755DF80534;
	Mon, 16 Sep 2019 12:19:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62515F80506; Mon, 16 Sep 2019 12:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B574F801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 12:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B574F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ru72na0e"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WV2IjC7U"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 99E3521F14;
 Mon, 16 Sep 2019 06:18:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 16 Sep 2019 06:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=/bWvUivzmNG8RHNsplCy4y5Ys0
 ybNPBibO9YcJrASks=; b=Ru72na0ewJiquIrxWYQoknjIktLmPJ6zOEOuUiyn9z
 T9XZekqwpXiS4VqX2+LpZL75RtdxHwNCe3K+HhATOP1JN8kpS4L4rNdDLDLzSGia
 tV1u4jKg3HWwF/cu6vxyIgn+33/dhGHRAe5pvUvQEaTk5GvPhUurZr3QJmwX4kDq
 y4DNxfL+Ks+SN8fd/fPF8g/y3JbxDaWzG3PaxMp+aja5HrKtdI/eQ9qt5Zh8newY
 RgRMOoKv8NCliM1CjbRFBuVYMvoTJUIc0q+2FkmfkQY7Tc5sWTFb0WImM0xQR1Q/
 G73RKxKkOfTYOurnrAKKXfOk/a7vpU5W4UPNqhJaY/mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/bWvUivzmNG8RHNsp
 lCy4y5Ys0ybNPBibO9YcJrASks=; b=WV2IjC7U78hbpTaGx5p6TRU83hHjXVntb
 BXSsWlFA0L1lHaKErvjP+X/oh6WvXVNgAkdwwS4e+ITIfQ9x2VRFGyVxE9ywWJm5
 eIOZ/fcCdQhy3KayCsZ6pGIqgKMA1mCd4gL44YyLy2nccA58M7vmzaIlH3sYPPNX
 o78o/kAFHtqYXNEh47fbjZHfryvsQ2fF2c+efqBuWnnYu2R9RY9be6qtzCWO/Jk6
 r0w9i2oOEHVqpl2yRIHz3eRBT865wVQh7jQ04GAhb3MG+6TPSLBD5HriH1TP43/2
 nRf3BxY3a6zDMRYMDenRDI36tCYi7vvDVz8JVrMA/jbDR6+NJv2uQ==
X-ME-Sender: <xms:kGF_XbAJmwDS8eTPrT04ABBchlpV5xUv2XcHtUVYV1oSluvCG8MrAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:kGF_XcdeJ6rD8BJjN6hxfXEbyRwgEclkxGVDg_l2Vpgas0NBTHd8hw>
 <xmx:kGF_XVmbZtG85YB9fEYiAzLRvzV-RljErHDEefAxxfEJ-TkkQbqblg>
 <xmx:kGF_XTEfHLsn4TSaI2w_25nDpnlXXaRN5bxBXrXzId2kDP11U_TZCw>
 <xmx:kWF_XfVGqL7yWwxfW-gVaimSQ3OUfD4D0t1mgj6binsb6JfMgGzUVQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32D9DD60067;
 Mon, 16 Sep 2019 06:18:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 16 Sep 2019 19:18:51 +0900
Message-Id: <20190916101851.30409-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: dice: fix wrong packet parameter for
	Alesis iO26
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

At higher sampling rate (e.g. 192.0 kHz), Alesis iO26 transfers 4 data
channels per data block in CIP.

Both iO14 and iO26 have the same contents in their configuration ROM.
For this reason, ALSA Dice driver attempts to distinguish them according
to the value of TX0_AUDIO register at probe callback. Although the way is
valid at lower and middle sampling rate, it's lastly invalid at higher
sampling rate because because the two models returns the same value for
read transaction to the register.

In the most cases, users just plug-in the device and ALSA dice driver
detects it. In the case, the device runs at lower sampling rate and
the driver detects expectedly. For this reason, this commit leaves the
way to detect as is.

Fixes: 28b208f600a3 ("ALSA: dice: add parameters of stream formats for models produced by Alesis")
Cc: <stable@vger.kernel.org> # v4.18+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-alesis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/dice/dice-alesis.c b/sound/firewire/dice/dice-alesis.c
index 218292bdace6..f5b325263b67 100644
--- a/sound/firewire/dice/dice-alesis.c
+++ b/sound/firewire/dice/dice-alesis.c
@@ -15,7 +15,7 @@ alesis_io14_tx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT] = {
 
 static const unsigned int
 alesis_io26_tx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT] = {
-	{10, 10, 8},	/* Tx0 = Analog + S/PDIF. */
+	{10, 10, 4},	/* Tx0 = Analog + S/PDIF. */
 	{16, 8, 0},	/* Tx1 = ADAT1 + ADAT2. */
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
