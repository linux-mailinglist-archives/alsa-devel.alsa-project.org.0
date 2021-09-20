Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5141135A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 13:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77A21696;
	Mon, 20 Sep 2021 13:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77A21696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632136150;
	bh=PgUGc1SWyn7yYZ6Jp8nV2BbeuCrYklqp4q6fwnROAHw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SNAzzaGkDKthchaQ8zAfp6jNKB0gkulXn056X7SkDFwWS6NEcJslITbr2462NHxBf
	 i/lttxCAA+3+NiUQWCh3uxmlo3eFEom0bK/+jzukNk+m8Sr8P1S6CC7t+ueSbRtylR
	 QyhedW1D1MBjOt6C77FlSCOOWqur9I5thzIvHSfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A9AF80279;
	Mon, 20 Sep 2021 13:07:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF585F8025D; Mon, 20 Sep 2021 13:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A45F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 13:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A45F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="giIS6sDg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NFpRM1F1"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 076615C0048;
 Mon, 20 Sep 2021 07:07:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Sep 2021 07:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=1MCndy9cLnlMIcCifBnqzwJc/+
 Zfm3QLxX/qfshnxIM=; b=giIS6sDgRzSwSn+8t9vSyp8FA8blvOcarGEp41GDea
 XOLUI3hsP0s6mIRKJDlqB0f1Tt04RjEZ7UcHnQcT8p1HMTlzPKwnxUZCucXTZqj2
 ILAt+LOBBUrD1xTngkTnmClXReSKinylePKK9GXOC0kFDqOWkkW097bMcY9XzBIo
 XgvGqLzivMFGlZR860eDWb9r0AouLgeKKwCrPC/0uh6vbRKNW7aMwmjwW9Bx8Nbg
 k3XfB6ndPAlqaXvEEPI4wjSEKZoP8B+YLvE9sicfreSmunDdyAQCGibos6YR1Onj
 WvTAUbxpOxNP/+hd0QGwToIX63OzPmD5LMagxSBC9zWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1MCndy9cLnlMIcCif
 BnqzwJc/+Zfm3QLxX/qfshnxIM=; b=NFpRM1F1ztT+Hv6+pKC4XEP2TEkhPdpqN
 vBusmnHVP+qj2l9bb3cRZFspHcKxSeJRXDXnsPQM3BDKgyzCdedeVGpmZ0El0JGu
 CXiVQG+5qkPN86wZ6SCOY8x4tyCPwWwEGNaIxXNe50vjltgAFrGLH3yFgZjqD6j/
 nfxUSneRqfAhoHJyXXk1pV4QrRBOFRe/rLi1Sqalu3mqAbuuV3n8EkdhN1Tk2mcO
 ItU1n29AwV9KVJP/aOYycHvx94nOXfCwFnZnUeUZzpec5lM6tmcg9S5M9NH+jAFv
 HIt5chMAbQopMwLwoRfZdFk4OBC/6waP5cCDWM0FcT9fbSEnfJXAA==
X-ME-Sender: <xms:e2tIYVvDmFINcuJiFK2d_MRyk0XC2Lx8iuxgSyfl7ZZ4A1iXch1CUw>
 <xme:e2tIYecLabQswtpiWAoEUeRLX5qEy5QLRl2rTuJnNBqNl35czPzl-7-fkfnLGZ-0E
 xZGXP6cf_e2wwcBj70>
X-ME-Received: <xmr:e2tIYYzzv3OwSkch2C1p7gC-0CAUD2to6WsgJQI2fvVx37UdWwN2Fkx8j6CFPdxFbJrNtzGPxnHERfTyslyRG_wKRgFhZo5m09c-H0yrlw6InYwtcJ55>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:e2tIYcPmfe_Bww4c149BsVcW6oDPm6Mb1MZnP8VUBFgAnpAZE5W-Nw>
 <xmx:e2tIYV839ie9qBygWjakTWzEUgu90N9k40C65cFW1TNFbkny788zDg>
 <xmx:e2tIYcWJDyi_YJAFMo2ccN5TQZjjjXqietw9jgw9aqG5tGJxj4TpYA>
 <xmx:fGtIYXIxp9H9wO4Ldz6JEAjqXRTVDA5_7DDyCbsSLC0zHOJEgskEnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 07:07:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: fix truncated bytes in message
 tracepoints
Date: Mon, 20 Sep 2021 20:07:34 +0900
Message-Id: <20210920110734.27161-1-o-takashi@sakamocchi.jp>
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

In MOTU protocol v2/v3, first two data chunks across 2nd and 3rd data
channels includes message bytes from device. The total size of message
is 48 bits per data block.

The 'data_block_message' tracepoints event produced by ALSA firewire-motu
driver exposes the sequence of messages to userspace in 64 bit storage,
however lower 32 bits are actually available since current implementation
truncates 16 bits in upper of the message as a result of bit shift
operation within 32 bit storage.

This commit fixes the bug by perform the bit shift in 64 bit storage.

Fixes: c6b0b9e65f09 ("ALSA: firewire-motu: add tracepoints for messages for unique protocol")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 5388b85fb60e..a18c2c033e83 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -276,10 +276,11 @@ static void __maybe_unused copy_message(u64 *frames, __be32 *buffer,
 
 	/* This is just for v2/v3 protocol. */
 	for (i = 0; i < data_blocks; ++i) {
-		*frames = (be32_to_cpu(buffer[1]) << 16) |
-			  (be32_to_cpu(buffer[2]) >> 16);
+		*frames = be32_to_cpu(buffer[1]);
+		*frames <<= 16;
+		*frames |= be32_to_cpu(buffer[2]) >> 16;
+		++frames;
 		buffer += data_block_quadlets;
-		frames++;
 	}
 }
 
-- 
2.30.2

