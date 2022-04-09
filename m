Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C15254FA24B
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 06:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFC61849;
	Sat,  9 Apr 2022 06:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFC61849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649477706;
	bh=HXKctxrSYSCY/KLEQpOM7OjJTnVYewjD2a9dzBnQQ/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SnSJKMr+MnUejpdlaP8lObK9F8HWIvTbY1rOakktzN7CIDlPzc99l9VgO6MmnaxvU
	 b+5lZv3TqiMIGLK9oYQMafNckD9/luzSXypWmMBossVlSv422mHvts4d8g4iZDhQSB
	 1lPfHBD1cfuXgMa7zLRrVpszvrmhOT3M9rBsEEsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF5ACF8051F;
	Sat,  9 Apr 2022 06:13:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26037F80519; Sat,  9 Apr 2022 06:13:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A65DEF8011C
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 06:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A65DEF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="APB0YY7I"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TJHeDKpt"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 953413201FED;
 Sat,  9 Apr 2022 00:12:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 09 Apr 2022 00:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=4IOIHeCPahu18m
 XrSxL18izkRq7PcU2ik7+XDSoutzQ=; b=APB0YY7IuFNdX0tRyjaWJ2ji1+8e4H
 oe+DmPaIVCp68N7ERJT2afcFSYTrYuGDOV5/CLdJW4R/M2yqPF2jqYvURSR4XweN
 C4baOJooMG7wKxbmSfOnndIV6q/xlkBey2lGxAoxLFu43NgXGfo4F5k05w+FtjxP
 iG/hHr6mUYLFpTkEzpTHpV9r6GBdL1mrAPpwVE2W4CfjQzxQAHXclOTTne1JkTTJ
 aCAj71nK1sD4KUdQYmGXKSZxfNY8tsCMSku5k1wR3Y+J3lC8yWMuqfXLCtoHoqfK
 fmV6Xl0n8QqZ1WHPQbiZg8lUF2bK9Px2FBNWC+m+seeWxzK6S52dy2IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4IOIHe
 CPahu18mXrSxL18izkRq7PcU2ik7+XDSoutzQ=; b=TJHeDKptwJcAYqlnKQEKGq
 3x48SXXw6MuBE0M7wBwqsuLR8hYZWWKiLx+R527mKqAUcSv+Cqa6dVbiO7Sq2mij
 HJ0eFsj917POjnfiC9tiUqgUL1RftvVsRB0RJ5oV9VSqdL/CvSMgj/B2VewH2aUd
 9pwpM8yw4xZXr4x+YT9yTUr7lQ5BetcFSVYDHW/fto8KmtzAQmLSkJUXHcOgmbDf
 b3VTXH3I3YgoEpJAtyzXppyN581DkyDSrRe3F4Wre0Sk+YytRS0iQn2JpgOAKfU9
 JQPVBlsR8QCKThfUztaqD2Z3yfcRs3ojjWhE+BgpZbGnHBak6dymYUSjJXNcTL2Q
 ==
X-ME-Sender: <xms:yAdRYsKkR6fsXQcy5Ul-ulGk0PckdjjsZjSv4r-sO6VmYQCzsRlVqg>
 <xme:yAdRYsKOVf42OpUF6T5D8WHO3SOCOsoPtyoizN6c9CL2k-kMC1UMXq2qgV-grAg9b
 TGFZ0VNJNYv6MoKyxk>
X-ME-Received: <xmr:yAdRYsts6Pa8J9QJmtZL_QuTl9XzDZzCciJ79REVzzwY33rbadr3RClNdBqTAfl057-5xa4ULu0SX6lJKVe2PR-MEc1cC0DIlg9yYmbqcw_wWbmifH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekuddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeevfefffeektefgveegfeelheffhfeujedtjeevtefh
 keevkedtjeejvddtjefhjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:yAdRYpYgvIxax5GQvs0APY_MjMRZIlPJo48dd2t5_81tdihfjPh52A>
 <xmx:yAdRYjZo7EspOiSbAk4-fJ4c9t0_r1CJpi6Vrgccv3vVPpPNogioCA>
 <xmx:yAdRYlB_9x-rWPvkO8_PNr0RQZlPmFbHlupl4rVgi4oHEfUtRRKIkA>
 <xmx:yAdRYiUyTCcFik1ZRixzVGiNLxErsSoVoOh7G8i4vDHUMtV8kYtSkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Apr 2022 00:12:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/3] firewire: core: extend card->lock in
 fw_core_handle_bus_reset
Date: Sat,  9 Apr 2022 13:12:43 +0900
Message-Id: <20220409041243.603210-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409041243.603210-1-o-takashi@sakamocchi.jp>
References: <20220409041243.603210-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Niels Dossche <dossche.niels@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

From: Niels Dossche <dossche.niels@gmail.com>

card->local_node and card->bm_retries are both always accessed under
card->lock.
fw_core_handle_bus_reset has a check whose condition depends on
card->local_node and whose body writes to card->bm_retries.
Both of these accesses are not under card->lock. Move the lock acquiring
of card->lock to before this check such that these accesses do happen
when card->lock is held.
fw_destroy_nodes is called inside the check.
Since fw_destroy_nodes already acquires card->lock inside its function
body, move this out to the callsites of fw_destroy_nodes.
Also add a comment to indicate which locking is necessary when calling
fw_destroy_nodes.

Cc: <stable@vger.kernel.org>
Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c     | 3 +++
 drivers/firewire/core-topology.c | 9 +++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 54be88167c60..f3b3953cac83 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -668,6 +668,7 @@ EXPORT_SYMBOL_GPL(fw_card_release);
 void fw_core_remove_card(struct fw_card *card)
 {
 	struct fw_card_driver dummy_driver = dummy_driver_template;
+	unsigned long flags;
 
 	card->driver->update_phy_reg(card, 4,
 				     PHY_LINK_ACTIVE | PHY_CONTENDER, 0);
@@ -682,7 +683,9 @@ void fw_core_remove_card(struct fw_card *card)
 	dummy_driver.stop_iso		= card->driver->stop_iso;
 	card->driver = &dummy_driver;
 
+	spin_lock_irqsave(&card->lock, flags);
 	fw_destroy_nodes(card);
+	spin_unlock_irqrestore(&card->lock, flags);
 
 	/* Wait for all users, especially device workqueue jobs, to finish. */
 	fw_card_put(card);
diff --git a/drivers/firewire/core-topology.c b/drivers/firewire/core-topology.c
index b63d55f5ebd3..f40c81534381 100644
--- a/drivers/firewire/core-topology.c
+++ b/drivers/firewire/core-topology.c
@@ -375,16 +375,13 @@ static void report_found_node(struct fw_card *card,
 	card->bm_retries = 0;
 }
 
+/* Must be called with card->lock held */
 void fw_destroy_nodes(struct fw_card *card)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&card->lock, flags);
 	card->color++;
 	if (card->local_node != NULL)
 		for_each_fw_node(card, card->local_node, report_lost_node);
 	card->local_node = NULL;
-	spin_unlock_irqrestore(&card->lock, flags);
 }
 
 static void move_tree(struct fw_node *node0, struct fw_node *node1, int port)
@@ -510,6 +507,8 @@ void fw_core_handle_bus_reset(struct fw_card *card, int node_id, int generation,
 	struct fw_node *local_node;
 	unsigned long flags;
 
+	spin_lock_irqsave(&card->lock, flags);
+
 	/*
 	 * If the selfID buffer is not the immediate successor of the
 	 * previously processed one, we cannot reliably compare the
@@ -521,8 +520,6 @@ void fw_core_handle_bus_reset(struct fw_card *card, int node_id, int generation,
 		card->bm_retries = 0;
 	}
 
-	spin_lock_irqsave(&card->lock, flags);
-
 	card->broadcast_channel_allocated = card->broadcast_channel_auto_allocated;
 	card->node_id = node_id;
 	/*
-- 
2.34.1

