Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19E138D30
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 09:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70438851;
	Mon, 13 Jan 2020 09:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70438851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578905354;
	bh=dshAH0CuNcayudZ8hoRstG7Oartgyh7QFtfdIb14qWs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D66p5TbXAbhEaO2TycmjXPnHJ5R093paX6Nmzm15na6sOTaIUV1Hm2kgTRSV/pMES
	 gG0rropQAZ4Bbd70UjynAvaS6bw4/bq1cI/S5m+cf2EeB5RcuJvds3B6Uu9CCgA25y
	 rB3aecY9w+7rfXBUf9j+9syUaLthUCdVPsgDpZas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 489CAF8026A;
	Mon, 13 Jan 2020 09:46:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DC05F800B9; Mon, 13 Jan 2020 09:46:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22509F80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 09:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22509F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="NY0tLvHk"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CBsSJfk2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BC04021EE9;
 Mon, 13 Jan 2020 03:46:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 03:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=rhuVkKtv5umrP
 EeEXUwkoXh28X3nBK7ZAdb/LzUkY+w=; b=NY0tLvHkIFB737ZP7E1v5mFdboHu/
 FojrK5ciPW69c4Fvvu6vhE5m/bZS6gIhpdtEt+V9olyo5JC+KTGj3/JVXNHUJg00
 +TjkSZYYN0FkDheCanqSx9KGAUvheefvtXgBrNHHZK9VECmfQMgZm8G1sxCkQZ73
 eg1DA7xaT8jKTeCUbpNRjhYwo+/4xdLCU5dWWKM6KGE6hitGCkfp5eFAcVXy9r80
 0rleOcxyTi6u8NHTVtRmpYHPBluQhsj8J/CGWiKjZRbWpLXyn9Q+SUg4SH68Y+Dy
 f8A9u8cKi2DuXHOGM7jhDxtX3Ej+LoOtac46/HVuMUUq2zJAyuUIUQdMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=rhuVkKtv5umrPEeEXUwkoXh28X3nBK7ZAdb/LzUkY+w=; b=CBsSJfk2
 afPbLWsVLtu/IApiXEZ83rVB6Il4ysK6A0tDWJFDTNrNp9URfOpSyFw0shOoM2OD
 sbmmASedIVCB6Qv+OsJehudV+GwuzB1yQFZQpb6yKfHWtPo9RIEbiOVTxbC0AIAE
 b0LKRCESKjBloOjlsM+DVQWvjVww4adxA3lYxZhx2lzqoRdaN9QIZ5RrC+aKH+zM
 5IGDxaA55DkNks/BsyQRVF8QOdgVmiUIVZzF6Xtm7XvXxkRs1QBuzuJdDYDQX/DQ
 w1zpMnsOq+ea81SoUQahZLVBFZCVuOkVVdbTAWMUjD6W89lxQjL792q5i1+Wzfzy
 5b1kMY4kaha2Pw==
X-ME-Sender: <xms:ay4cXtTSFx-631veqB2pMiN2L-TPEZw-PYNW9OuRCzr6lrorDsqTEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ay4cXuST9o-iTJON0YBR2H4ckc3ZkpGVPOUbpey93Xn_Ft_d_rM-qQ>
 <xmx:ay4cXo7mr2wUbFNPprUU3dq3bhdN3kyLvUWfGg8YJfCVrRiZGvEFqw>
 <xmx:ay4cXjHIoU4fncTDW7Vu81ibZRnMYSZ-GjF6vLJYCz4nG5DTYay_SA>
 <xmx:ay4cXg-MXFlYA-rJpTpY8kSChInfY6IpQ-OLByKJHp1-7qn1gjy47g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9DE5530607B4;
 Mon, 13 Jan 2020 03:46:34 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 17:46:28 +0900
Message-Id: <20200113084630.14305-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113084630.14305-1-o-takashi@sakamocchi.jp>
References: <20200113084630.14305-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/3] dice: fix fallback from protocol extension
	into limited functionality
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

At failure of attempt to detect protocol extension, ALSA dice driver
should be fallback to limited functionality. However it's not.

This commit fixes it.

Cc: <stable@vger.kernel.org> # v4.18+
Fixes: 58579c056c1c9 ("ALSA: dice: use extended protocol to detect available stream formats")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-extension.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/dice/dice-extension.c b/sound/firewire/dice/dice-extension.c
index a63fcbc875ad..02f4a8318e38 100644
--- a/sound/firewire/dice/dice-extension.c
+++ b/sound/firewire/dice/dice-extension.c
@@ -159,8 +159,11 @@ int snd_dice_detect_extension_formats(struct snd_dice *dice)
 		int j;
 
 		for (j = i + 1; j < 9; ++j) {
-			if (pointers[i * 2] == pointers[j * 2])
+			if (pointers[i * 2] == pointers[j * 2]) {
+				// Fallback to limited functionality.
+				err = -ENXIO;
 				goto end;
+			}
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
