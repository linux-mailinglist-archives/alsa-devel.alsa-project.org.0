Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD13A4B3
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Jun 2019 12:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E07166E;
	Sun,  9 Jun 2019 12:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E07166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560076273;
	bh=rmBlJbaoQ+8AGgmZ13yP4I/Df2TQmjy26NHeqOB0RYk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C1mJfQ/moBvngzOZLf7JdkxCMiuwX2YVvCdHFqiHY+iEeTVhOYI+66ApDeGqoZ3zi
	 xC/WBlROpU4ySy6OxjGbC4S0xrYNla6rbAbbqXVX28hmkUObCl1UExikks0GaQ/zXp
	 +VwKP+TJ7xZ+KL6osyPVnsV2sNtkepDEJRdSsh/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29BAAF8970F;
	Sun,  9 Jun 2019 12:29:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24077F8970F; Sun,  9 Jun 2019 12:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64628F807C3
 for <alsa-devel@alsa-project.org>; Sun,  9 Jun 2019 12:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64628F807C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n5DKxvFb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wU98CDIE"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5425621E3E;
 Sun,  9 Jun 2019 06:29:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 09 Jun 2019 06:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=QLRpEhb6FyE9oJCXalev4ADuAG
 sI7bOmvY4IuabcQxQ=; b=n5DKxvFbq+rS0JSvFx89N7e7inTkqGVBeineJFMfFs
 KNm7aXe5V7lo+OJYSzgZ1b3slHz2rUrk0eL1jWudTflrPoWVXqcJZzPwiFgNxCRW
 lczWhNAC/+5tpumaEeYYogVCkz3n0kwwgFa03tCTbX/sXw5X0GAY8wLXl5Et38Gk
 8/us/B/Lj0nYUzn/YXQ71Hmb7oYAy0YwbgPSphkulDzzd1HZ+bzy/tpAi/7F4Rf8
 MUZ9s6Zo3RA7T5iVWoQTeFg5wh53kk31oufRhISEYQB525hZHt2AylNTGM/DznNO
 D57Q6yn46RmK8e/7cC33eiaYUsiy9o0P8P1MusTST5Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=QLRpEhb6FyE9oJCXa
 lev4ADuAGsI7bOmvY4IuabcQxQ=; b=wU98CDIEjKQYfpi6JXcgeSh/LYacz5KNR
 BtxB7xoDumvIFSQQ/U5RSxP2k1qxKlGlNrIB/UJR+vatm9PkzlbOnSGC6SUwpLC3
 +SwF/fKkDUAbs2i92EqGnD1KhgebarlJnY4x6yJ3W8Ab0zU089/c0qCY/yjIj17A
 0nkYeJ32fROHewXXH3qX9+RhU08cq+0CxMj5EXf8IhzkfMnNW4Bv1lBlQtkGWqgp
 0Pu56geORCtZgpaU/GpeS/Ru11ebZg3puD+hblZQG0UCsBWJTH3XarJUZk950Wlm
 U/DKfyc8t4kgQOBP2/Ar34QjUtQPF32/J8XFxEPjluN9TSYMvscGQ==
X-ME-Sender: <xms:fN_8XHGsIGlYi3_nIxbFWv4M3jkWPHMbV9qDru44wwDf27KfRRk6EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehtddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:fN_8XInnJ7Ui1OBVWKU7zRO97JxiDaSMxOA00ghVipaT-FOifhcf0g>
 <xmx:fN_8XEKY-f3YgQLvgwpZNrN3yUFXFftK0FckjCmOUayhlF6P9aor4A>
 <xmx:fN_8XJYp6Anvkv-7yTeqHI0onk4Ttu1BWgj6g2PDQsftL0bHpPX2zQ>
 <xmx:ft_8XD3Q70lGEN7ZmHFZJQOdWzLyCLf4Nr9IaB70_1Mvd4Kl2BfpLw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C0A780065;
 Sun,  9 Jun 2019 06:29:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  9 Jun 2019 19:29:12 +0900
Message-Id: <20190609102912.9717-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: oxfw: allow PCM capture for Stanton
	SCS.1m
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

Stanton SCS.1m can transfer isochronous packet with Multi Bit Linear
Audio data channels, therefore it allows software to capture PCM
substream. However, ALSA oxfw driver doesn't.

This commit changes the driver to add one PCM substream for capture
direction.

Fixes: de5126cc3c0b ("ALSA: oxfw: add stream format quirk for SCS.1 models")
Cc: <stable@vger.kernel.org> # v4.5+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 3d27f3378d5d..b4bef574929d 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -148,9 +148,6 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 		oxfw->midi_input_ports = 0;
 		oxfw->midi_output_ports = 0;
 
-		/* Output stream exists but no data channels are useful. */
-		oxfw->has_output = false;
-
 		return snd_oxfw_scs1x_add(oxfw);
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
