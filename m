Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E230C633899
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:34:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D92D16BE;
	Tue, 22 Nov 2022 10:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D92D16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109669;
	bh=ZdFIbxjlNGkRT6wqwZpAtn18mPGgEjyAnFS95MnVa/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kUQtVSHc4fCMBsnkmPe1vORIT1/YFi9TcctIQFahB13FuDBr3NPM+susKTdmdOEX+
	 F60Qgnu079YhrkYeJphRhaGn+dcfsjLCTbwHFE39eQmDX1t5XmhwxQarL8+omrqwAk
	 qzuqPsR9n4TJCjxRWLl1U8ar7WWHyLXbm6hunojE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3372F805EC;
	Tue, 22 Nov 2022 10:27:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7585F80149; Tue, 22 Nov 2022 09:21:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=PRX_BODY_26, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-2.mail.aliyun.com (out29-2.mail.aliyun.com [115.124.29.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EFE7F80149
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 09:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EFE7F80149
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08002614|-1;
 BR=01201311R161S84rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00516761-0.000814287-0.994018;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=michael@allwinnertech.com;
 NM=1; PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.QE3zAv6_1669105264; 
Received: from SunxiBot.allwinnertech.com(mailfrom:michael@allwinnertech.com
 fp:SMTPD_---.QE3zAv6_1669105264) by smtp.aliyun-inc.com;
 Tue, 22 Nov 2022 16:21:05 +0800
From: Michael Wu <michael@allwinnertech.com>
To: perex@perex.cz, tiwai@suse.com, aichao@kylinos.cn, wanjiabing@vivo.com,
 ubizjak@gmail.com
Subject: [PATCH] ALSA: usb-audio: fix urb timeout with URB_ISO_ASAP flag
Date: Tue, 22 Nov 2022 16:20:40 +0800
Message-Id: <20221122082040.48591-1-michael@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

When the loglevel is greater than 4, with a long messages printed on the
console while playing or recording audios, the usb controller may become
abnormal.
`usb 1-2: timeout: still 1 active urbs on EP #1`

Fix it by configuring the transfer_flags URB_ISO_ASAP flag.

Signed-off-by: Michael Wu <michael@allwinnertech.com>
---
 sound/usb/endpoint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 310cd6fb0038..df9a91c2fc7d 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1245,7 +1245,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		if (!u->urb->transfer_buffer)
 			goto out_of_memory;
 		u->urb->pipe = ep->pipe;
-		u->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
+		u->urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		u->urb->interval = 1 << ep->datainterval;
 		u->urb->context = u;
 		u->urb->complete = snd_complete_urb;
@@ -1288,7 +1288,7 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 		u->urb->transfer_dma = ep->sync_dma + i * 4;
 		u->urb->transfer_buffer_length = 4;
 		u->urb->pipe = ep->pipe;
-		u->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
+		u->urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		u->urb->number_of_packets = 1;
 		u->urb->interval = 1 << ep->syncinterval;
 		u->urb->context = u;
-- 
2.29.0

