Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020B54C84B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 14:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 945751940;
	Wed, 15 Jun 2022 14:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 945751940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655295448;
	bh=2Gq4UK5OFxK6Lx2fXZvgYIdDEtkN7/S6kUQlYlV03Ec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sPqtq1BGUpN+q1bWF1M5vwiPDgaATnryRIZKBuvECmaVkKd3UISQMNJCDUpaRPjI4
	 ZvECSHZKDPNXdGgkbqdp/MP+pe1+eZfRNdzTA1JZn++2ZJhh/LpbYwrnNHLSyn2IRh
	 FC7JdP8H/8wh261p8Y7hdnNcgBnze4aKzO8ArOOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53CF7F80537;
	Wed, 15 Jun 2022 14:15:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC207F80536; Wed, 15 Jun 2022 14:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F861F804B0
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 14:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F861F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="1JEDtJam"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZqsY+kUb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E8E023200A11;
 Wed, 15 Jun 2022 08:15:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Jun 2022 08:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1655295319; x=
 1655381719; bh=mn4bqWxQrWS6iJkrNhpBpakosj8nE7J+QhXoG4Ef3II=; b=1
 JEDtJamCHSnlV4g3ZJPLlIqoNy6qVp8QffkxG3pLNBxSjRIffTBTuW/txl47hbz/
 DWZQTCqA6kvc0HakGZRY1qyZXAx8BHJKk5NSNF/FDQNRsuuSCW+mHR/w1NCHvlWB
 FijunO/JUg6nnmQ751LdvK8qwRgFSYHs2LEsh5KZ2h2OpUF9hnsMLPVqIRQsp9My
 xY1Q8bIT7whN6YPZdKrfHa8AvFHKU4K/lnfamVzNW84IbKDCXVpz+7yzx8mclok/
 3u1LmsGvRdEaJOvvhaaEbXXfHfyy4y5Lh6jqo5NUIXo2Y86AtB/ymbgH03o6F4jB
 hq1yH6LR2kqrstWoa/92g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655295319; x=1655381719; bh=mn4bqWxQrWS6i
 JkrNhpBpakosj8nE7J+QhXoG4Ef3II=; b=ZqsY+kUb8yhkg2xb1THUEAeG1ub24
 z+qTG1sfl/+eVsin+n/MsxKjM4Q2x+7b7KerwrppjuDwdDz6vIc32rfw2tGAOhd/
 UWexrYfBbnwaX5FF6WNW6JPV0sar141zYh0GrKG2+SqVejVW/2qqrW9JuPWP5H6S
 fqC/ErnwRBy6y8ckS2Kl1G/fNwx4+V0GPfM6LgJYPRGwOrMkMS4zAOLnOCcUu0eN
 QZi4ggg9IMz5SES6H0bP0j8Re3lUtuLwpzhy/lEZdFo9sbXN9CJJ5p778LCncN0I
 DThlB5Sz+fvp3YTpML+ollHzaTVnlgQ++iXAxOQW5yz01+4xku43ESKJg==
X-ME-Sender: <xms:Vs2pYkAvi7nPo88wWkMZ9j3Yp9XRSzwhy1Z-sNPGbQFGCIb1oP6CAg>
 <xme:Vs2pYmi6rGMTDqCIzd0sNhti0F_ICM9HiRFH6TgBBXAyiegVyLuFtL9PsxgdxcnyK
 m6Gz-qD5yXDJ2uWGuA>
X-ME-Received: <xmr:Vs2pYnkmRZ-aUatU_ci9a2B9BU5p9ZJxjV6oMDJajx-trOQfExIoXynDifhpU7UCJaJcMre027hyaIkmJyTMG944OqiVWxDa2yyaBFGPObAWLxyrU1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepvdejgfejuedvgfduudekleevtefgtdevhfdtffef
 iefgveeuteffiedvffekvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:V82pYqyDcZuSoqTJSEHW16a6SWl9-uGgx-_Q2e4F7oW6Wc34g_2OeA>
 <xmx:V82pYpRcdfLq2mWr-2B-jwbtvuT3XiGzO5PAmLtBD2A8UeOj2WgEug>
 <xmx:V82pYlb_e97SXlq47L-6ZvR5cEQegFqWtkGKe98xGhV3NnbChOVIOg>
 <xmx:V82pYnMc-WXWfb08GbBT1xsrLpuZvzB0RVrRZOjUPlJ7zJjS28apWQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 08:15:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 3/3] firewire: Fix using uninitialized value
Date: Wed, 15 Jun 2022 21:15:05 +0900
Message-Id: <20220615121505.61412-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
References: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
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
index 4604a9d97fd1..613aff624391 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -779,7 +779,7 @@ static struct fw_request *allocate_request(struct fw_card *card,
 		return NULL;
 	}
 
-	request = kmalloc(struct_size(request, data, length / sizeof(request->data[0])),
+	request = kzalloc(struct_size(request, data, length / sizeof(request->data[0])),
 			  GFP_ATOMIC);
 	if (request == NULL)
 		return NULL;
-- 
2.34.1

