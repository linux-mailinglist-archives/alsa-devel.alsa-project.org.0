Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA8C524B6B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798F41AC3;
	Thu, 12 May 2022 13:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798F41AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354415;
	bh=KlDPCAy6YEU4yS/gyk2lmB/DLLLtX1ZadcGnjAlqtTA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzueNxioh+mUXVCZWVZZ5P1bnNoSrqUpWNscnn0QdsLtB9MCxHO6vxkxs0l5aByUs
	 jCyV5YzDHNG8I3lpimg6Iy4IZ7uLemaITtjLqZnQW/U9aCvRoduK7CWWncJFBueUi3
	 DrH/rVrt1JG2jTyUyYSXo6l0wY5AMsGvpdu05H7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9536CF8051A;
	Thu, 12 May 2022 13:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CC65F80527; Thu, 12 May 2022 13:18:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 527D9F804FE
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 527D9F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="DQPBlNLp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="D7Cfv6Kf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0ABEF5C018E;
 Thu, 12 May 2022 07:18:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 May 2022 07:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1652354288; x=
 1652440688; bh=H1TGreYI/MRSwNTVTCp09YIeRc7cCCHdO6Rbul0lX/Y=; b=D
 QPBlNLpgDxcfhzylwnHCISh5Zq26QbXe2toOjAd0AcsEfPyJOVB/19HpbTlH32Q9
 eS4c2/WL8ivCYghi48Et6DB8KMbnIGCIgmTUibdfZvQldK3vf68Zh7ZiLXJuA9MV
 Rqt+4aC8knByDdIPvYC57MdVzHBadvnCg3pNr7Cgf4IaEq5CiGpznCI7X5tUZRNd
 4pUMl+DkxIY2vjhBX7J/GZGkaah3W2j5wyvJubR4T3eaP9E8m03Eu2VcUUe5H4VU
 M8D2imGBqXLANOO6TDRTOiuGM8knX/UNzF4HWEJ/mf/XH9AkSftiH93if8XJvN9n
 Hfa2KZuw7JNJY1OdSuckg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652354288; x=1652440688; bh=H1TGreYI/MRSwNTVTCp09YIeRc7cCCHdO6R
 bul0lX/Y=; b=D7Cfv6KflQpskpctFLaH/da4Yoj1Y7zkLjkIEJBjKHCAcRI7Cvh
 gsI/PdJDPCaUnVX87lQBawrqzTmxMGRIo0ioSmcXQkSdGy9b58KlE4XQ+bDwXspZ
 e3ZtBAKNTQjnwNa9BZPhL3rzOfAMiGIvNP5GKJccyLPTv4pcUNEayyldljk9MZzt
 0vF024Asc5Ah11lHARBfJ/qLyBbjNEyNASctsQnt8rnKjLeTxgUNEGbpoTW2qibq
 hZHAeWcG1MXckoomh+gEBvHm2uF2gl+GZMOy3WS3bnx5mFqj7elS3rRKVR8I3DzN
 frZbvjIicIE+I3g1N4ooTquQ/gVqq0dz3wA==
X-ME-Sender: <xms:7-x8YicsjKa4l_Ll94FvDixLf72O0E08l9rk3ILX6-GBi3X5a4jtKA>
 <xme:7-x8YsPyQ6dJyMkLLoesZ06hjd1Cb6JOU0zLvXk0Gw5wddJUq3pSLV4ECtqcl8zL7
 UUtPFs5VYp630oSZLU>
X-ME-Received: <xmr:7-x8YjjnLSF14gkU4Mit6e96tfUT0D6MJaKg9k7_CbkngZkiiRbprHm1LBSUfdT3XwqRQpZuLn7IAjhQiqsxchstw6ECUU6zcuSwMtgiJ_u_TTvnlZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpedvjefgjeeuvdfguddukeelveetgfdtvefhtdfffeei
 gfevueetffeivdffkedvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:7-x8Yv8uy1qbcFGt_GFWcaL505QoXxI3EKbe1vhXlb3Zic3qVitAIw>
 <xmx:7-x8YuvgE-ZhWKgVMoYIZJHDNiPuF4uXDgBytHTUYlTvO2xFD5bNKw>
 <xmx:7-x8YmGCFHagaKWEzSuuOXz3pA_YawXwpYlMrEly8lvcL1g58GNj3w>
 <xmx:8Ox8YgIx6VGhg6qvcs0QWZ80Nulz0yat62onfb6t2o0a6C_Ap3vmRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 07:18:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH 3/3] firewire: Fix using uninitialized value
Date: Thu, 12 May 2022 20:17:56 +0900
Message-Id: <20220512111756.103008-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
References: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Lv Ruyi <lv.ruyi@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

If data is null, request->data wouldn't be assigned value. It is random
value, but we use it in handle_exclusive_region_request() and
handle_fcp_region_request() later. Fix the bug by initializing it.

(Revised by Takashi Sakamoto to rebase to the previous patch.)

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 49657a793e80..d10d890d7d48 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -778,7 +778,7 @@ static struct fw_request *allocate_request(struct fw_card *card,
 		return NULL;
 	}
 
-	request = kmalloc(struct_size(request, data, length), GFP_ATOMIC);
+	request = kzalloc(struct_size(request, data, length), GFP_ATOMIC);
 	if (request == NULL)
 		return NULL;
 
-- 
2.34.1

