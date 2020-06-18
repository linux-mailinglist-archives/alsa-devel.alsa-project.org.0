Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42621FDC29
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E841679;
	Thu, 18 Jun 2020 03:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E841679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443062;
	bh=Xwqp5VeiNd1IsDMeWotZ1nD25aou2uHxHhgfdlOCxX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tTbLj3x6zWCf/lXh3lGYBBZmmJPYSwoezLLXRkW598PnJIodP2Ln2kMf6fDdMPSvP
	 soTKZYjsbIGCZKQBP6jzLj7IrkU3/1nViW8jx8D6X0Zq1l9d6cWMc+7cdRq1h0aI2v
	 zVPJ//QXzQNmo5WK6gLl0j9rcfBVF0b4HQ5xjjrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFE4F8031A;
	Thu, 18 Jun 2020 03:11:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BA9F80323; Thu, 18 Jun 2020 03:11:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F0E7F80306
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F0E7F80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OMxr8U4e"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 54C64221EB;
 Thu, 18 Jun 2020 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442669;
 bh=Xwqp5VeiNd1IsDMeWotZ1nD25aou2uHxHhgfdlOCxX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OMxr8U4eKXvNv/aijPitK1bfPSNS9+VdOrcV5tjZF0PR/ICRR2AUOHYdKp13QhWyc
 J07wxSnmNnJzMPs5+T8jy9zOtjBLmBQ1pH4kG8WecHtzeqsfj+e9q7I9KajAt5AmMK
 JsT4Mxjvj6Ld+54rqVkTP5KMcltmocPN7AJUWpaQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 139/388] ALSA: usb-audio: Fix racy list management
 in output queue
Date: Wed, 17 Jun 2020 21:03:56 -0400
Message-Id: <20200618010805.600873-139-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 5b6cc38f3f3f37109ce72b60bda215a5f6892c0b ]

The linked list entry from FIFO is peeked at
queue_pending_output_urbs() but the actual element pop-out is
performed outside the spinlock, and it's potentially racy.

Do delete the link at the right place inside the spinlock.

Fixes: 8fdff6a319e7 ("ALSA: snd-usb: implement new endpoint streaming model")
Link: https://lore.kernel.org/r/20200424074016.14301-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/endpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index d8dc7cb56d43..50104f658ed4 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -346,17 +346,17 @@ static void queue_pending_output_urbs(struct snd_usb_endpoint *ep)
 			ep->next_packet_read_pos %= MAX_URBS;
 
 			/* take URB out of FIFO */
-			if (!list_empty(&ep->ready_playback_urbs))
+			if (!list_empty(&ep->ready_playback_urbs)) {
 				ctx = list_first_entry(&ep->ready_playback_urbs,
 					       struct snd_urb_ctx, ready_list);
+				list_del_init(&ctx->ready_list);
+			}
 		}
 		spin_unlock_irqrestore(&ep->lock, flags);
 
 		if (ctx == NULL)
 			return;
 
-		list_del_init(&ctx->ready_list);
-
 		/* copy over the length information */
 		for (i = 0; i < packet->packets; i++)
 			ctx->packet_size[i] = packet->packet_size[i];
-- 
2.25.1

