Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD257F961
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 08:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC5C83E;
	Mon, 25 Jul 2022 08:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC5C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658730469;
	bh=9YtjZVpFa59ngsVLvaXvl2ItO0663WdZKZMggWxcdHY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YxUcJ7X9e2KXzZjsh9kWcl1WQiEDRnriPDL0RLjci2Ig5T+inV/hcb74Cct5TzJcg
	 bGG8x2PzFQaruqiQeDhGHRwHq3ygEQmzSs17aYe+jhUZdJN2sWk8DcTJTmTOo9V6rH
	 z67lFoea1NaWf9NhgsUHfgP3ag2LK7dOknGHptCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A39CEF80544;
	Mon, 25 Jul 2022 08:25:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B9CBF8027C; Sun, 24 Jul 2022 09:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg.qq.com (unknown [43.155.67.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60160F8012B
 for <alsa-devel@alsa-project.org>; Sun, 24 Jul 2022 09:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60160F8012B
X-QQ-mid: bizesmtp88t1658647012tvsenpzu
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 15:16:51 +0800 (CST)
X-QQ-SSF: 01000000002000007000B00A0000000
X-QQ-FEAT: CR3LFp2JE4l+x/aUAW/kH4Yeux/esqp51VUCsV6tLvhKa3E7TgFtxZcf+smTw
 MzS5YYLVq4JmNLwgpPuH4xI82M1cx52rhWRfZBadf+Wafilj+3/Y79TbFz1Tt34m8YLtRtx
 /ycVL1gX2rkC0ia75Zdv/maN8b9I5mbfDdQh3noUnQwhBeos4mrtPQvN2KScW+2izZr+BrS
 40AtWAh6lxP/oylxX+4CkKxY4Dl0SPDtlB1pyLKf5AhOiKaudfzlBWfbhNeVQzob7byjzaj
 QNftpWiPOxKFxH+9uhtBSAh1cxbK0X1ARIqT4zi9PdtS8pQybN21rqGGOGEPoLGR88u6Lgj
 bL8yUZlcphd4jZy8XLKDDutku05KiePOa04/FWPyKYuIkABOLI=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] usb/6fire: fix repeated words in comments
Date: Sun, 24 Jul 2022 15:16:44 +0800
Message-Id: <20220724071644.10630-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Mon, 25 Jul 2022 08:25:50 +0200
Cc: wangjianli <wangjianli@cdjrlc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

 Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 sound/usb/6fire/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 7168f1c6a37a..32c39d8bd2e5 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -175,7 +175,7 @@ static int usb6fire_pcm_stream_start(struct pcm_runtime *rt)
 			}
 		}
 
-		/* wait for first out urb to return (sent in in urb handler) */
+		/* wait for first out urb to return (sent in urb handler) */
 		wait_event_timeout(rt->stream_wait_queue, rt->stream_wait_cond,
 				HZ);
 		if (rt->stream_wait_cond)
-- 
2.36.1

