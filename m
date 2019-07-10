Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE1642E0
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 09:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5869815E2;
	Wed, 10 Jul 2019 09:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5869815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562743908;
	bh=XNPieg+XhNfPM5vkQe1wDEusk3u7K8bWDSVetvRsTtY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqoH5tvM/2x2fYvFCWcRDGoiAOlDM+I6WCbd+sQS83WHGgBwP8zft0TitjNG9J1K/
	 pQedFjc9sMyJmYNZ+yb7YXz3jqZdFrYRQuEFnul2P5covFYb8RJDMwcu1PIJP7EXSB
	 MQ14SqJTqZwfEJvIIm/bRrV+CEO3jACqrTEuN8tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 186A3F802FB;
	Wed, 10 Jul 2019 09:29:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60ACFF802BD; Wed, 10 Jul 2019 09:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 421B5F802A0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 09:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421B5F802A0
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id F053DEF3F5A4DE7C6AA6;
 Wed, 10 Jul 2019 15:29:10 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x6A7RXEx070833;
 Wed, 10 Jul 2019 15:27:33 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019071015275167-2237132 ;
 Wed, 10 Jul 2019 15:27:51 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: lgirdwood@gmail.com
Date: Wed, 10 Jul 2019 15:25:07 +0800
Message-Id: <1562743509-30496-3-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562743509-30496-1-git-send-email-wen.yang99@zte.com.cn>
References: <1562743509-30496-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-10 15:27:51,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-10 15:27:37, Serialize complete at 2019-07-10 15:27:37
X-MAIL: mse-fl2.zte.com.cn x6A7RXEx070833
Cc: jonathanh@nvidia.com, wang.yi59@zte.com.cn, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH 2/4] ASoC: simple-card: fix an use-after-free
	in simple_for_each_link()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The codec variable is still being used after the of_node_put() call,
which may result in use-after-free.

Fixes: d947cdfd4be2 ("ASoC: simple-card: cleanup DAI link loop method - step1")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/generic/simple-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 4117e54..ef84915 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -364,8 +364,6 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			goto error;
 		}
 
-		of_node_put(codec);
-
 		/* get convert-xxx property */
 		memset(&adata, 0, sizeof(adata));
 		for_each_child_of_node(node, np)
@@ -387,11 +385,13 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 				ret = func_noml(priv, np, codec, li, is_top);
 
 			if (ret < 0) {
+				of_node_put(codec);
 				of_node_put(np);
 				goto error;
 			}
 		}
 
+		of_node_put(codec);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
-- 
2.9.5

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
