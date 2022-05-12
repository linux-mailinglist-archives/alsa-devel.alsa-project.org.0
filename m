Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1E524B6E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903B71AA9;
	Thu, 12 May 2022 13:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903B71AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354508;
	bh=Lk9uj1xbHFDojk0Vz617wIxJ6WKhY/yj7alJ+ki14Rk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vrOLZT4INgnRmmBh/A1ezYoGNBHT3mrZuQ+ndH4GINC9vhlkRlhs0EhUs0PyILArv
	 QDPPQvGjRQUx+4HpMXxxRakuHT4sHTiu7s0qW4C5TzSaQzr6RoqvoXB+gmKjWPrenP
	 +cat9syon00q2r2GHVBGHeDosOmumUpnNyiaSCLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B6CDF8010B;
	Thu, 12 May 2022 13:20:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85D3F80245; Thu, 12 May 2022 13:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7022F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7022F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="AtRQRrHw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rXIknwet"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CCCC5C010D;
 Thu, 12 May 2022 07:20:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 12 May 2022 07:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1652354441; x=1652440841; bh=sY0qpOQXPg
 mJFgvkNCEQIW8UjRDURZNp7xYymx3dOoI=; b=AtRQRrHwTS+NvHV/uP+id/cHHq
 hNDx8pbwyo2UdyBlxttjzjI8gUSEWnWWrt2Jq68ogddYhJPy8klFDb2R8FlCY8Aj
 MDQ8McA8JNFQdHkXQHcgaRtGMy9RLX2W0oYGOu54722s23aygZJBzAT3d0pIkAL6
 tIiY3MWbnvnYK7mcZVBgryBYDkd6xisJbnkA7XuKZoYCIHA2yu0AKWNjqT3FWl11
 zCvECgcMuZ2QmZM7S9nPFcKn6Z+XVVHTnJpx2pfZPgaBMZ9fXFg5iyBBp7FjIn6B
 DJTZCJdpEe2jyM9EHfkCs3+iUK70s8Pp4NRpNuYiQZp5sCu1m7rLOAXc4GJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1652354441; x=1652440841; bh=s
 Y0qpOQXPgmJFgvkNCEQIW8UjRDURZNp7xYymx3dOoI=; b=rXIknwetozsmqir+0
 ljyIE4Har33F35h4sKqyWm/RjjDbQZlHB1rhF1qRxB1uQGTBI5bTEnqixLCVw3RL
 tzXaaRviqr2iU9+HlDKM2DnxmlaysUDf1GZNpIe7YeTCYTV9/9EHuVuhWd3dvSq0
 AzsY1EEtD8FG5pkTHVYci/J9135+l78Ml44jq6JirKhdmeWb2Ofd9SrLMojoKMOG
 2m+VPCd7QSZUXasTOfQab89/7rq4d7PMrxRkPON7hYynN9NRac5ocYpQ32ekam6b
 HkX7dxr2nG92bnMKUDPk60pOnJ7Qet85CLjuds2XhatrbRwLQkevsRgRHHDr7TIW
 vtTgQ==
X-ME-Sender: <xms:ie18YvU-7RBjUasm-RycEcZQA0XQV7eS6EwXmPrpe0gPgLtV-TdSYg>
 <xme:ie18YnkIZiNkPXu1LP12B8qWlhkP0I__OrtEbaNFsyYilQL0zUc1dr7sPxw91S4Xe
 SnOJHBE5wbOG-esIeo>
X-ME-Received: <xmr:ie18Yrap-nLoMGup3cjWLjftJlVj8o66OLmRBuFUXoUtRV5JVYt60Vp4RvUP_wdGEKOKmZMVzeo4SWuTBjj6tpCOm8YbYA45CQ3jA24fAreLAxH4YXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhi
 ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
 enucggtffrrghtthgvrhhnpeffvdeuleffveekudfhteejudffgefhtedtgfeutdfgvdfg
 ueefudehveehveekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ie18YqUy37WDXts9UUOjHnzfpYEZlrGdi2rl7Z1ukRPNiDv0zmd-jA>
 <xmx:ie18YpmS6Pn1Q0mZW9EJivwE8EY8vB7ebZCtKLD_KN7SER6Q0aHJog>
 <xmx:ie18Ynd9rq8JUwYueXUplwDsYt-EAMea44g5EXh1D-eTr_xcT52A1w>
 <xmx:ie18Yvh6RvZ5rnZLHdFBcYgvF-x_4QL1LsKsYKc3C-ExANqSllG6PA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 07:20:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH] firewire: cdev: fix potential leak of kernel stack due to
 uninitialized value
Date: Thu, 12 May 2022 20:20:37 +0900
Message-Id: <20220512112037.103142-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Recent change brings potential leak of value on kernel stack to userspace
due to uninitialized value.

This commit fixes the bug.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: baa914cd81f ("firewire: add kernel API to access CYCLE_TIME register")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 8e9670036e5c..032ee56c34a3 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1211,7 +1211,7 @@ static int ioctl_get_cycle_timer2(struct client *client, union ioctl_arg *arg)
 	struct fw_cdev_get_cycle_timer2 *a = &arg->get_cycle_timer2;
 	struct fw_card *card = client->device->card;
 	struct timespec64 ts = {0, 0};
-	u32 cycle_time;
+	u32 cycle_time = 0;
 	int ret = 0;
 
 	local_irq_disable();
-- 
2.34.1

