Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F44327E8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 21:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1301689;
	Mon, 18 Oct 2021 21:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1301689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634586350;
	bh=tUP+jz+lH0E5yXRLwAKM5umc97qUKn0tUZf6sJd638Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WvHndfFs4apeu46dUVIDxaXZZLa29fiYVtP1VpxnYeaJRlA2isWuBKEKNdGaXCOqO
	 0HwAAp/jutd7dc/QgpKcn8U/6ufrrQNtb4PyMWGDueaTjyvn0TVrWYZr8EegwAFp1Y
	 xSgfaeX/TfBYYkJXedVrpkIzm5tIQGoIM+/9UqgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6FD0F801DB;
	Mon, 18 Oct 2021 21:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39413F80224; Mon, 18 Oct 2021 21:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
 [80.12.242.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73943F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 21:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73943F801DB
Received: from pop-os.home ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id cYYUmZVOg1UGBcYYUmpEyj; Mon, 18 Oct 2021 21:44:22 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 18 Oct 2021 21:44:22 +0200
X-ME-IP: 92.140.161.106
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, mikhail_durnev@mentor.com,
 joe@perches.com, pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: rsnd: Fix an error handling path in 'rsnd_node_count()'
Date: Mon, 18 Oct 2021 21:44:16 +0200
Message-Id: <4c0e893cbfa21dc76c1ede0b6f4f8cff42209299.1634586167.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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

If we return before the end of the 'for_each_child_of_node()' iterator, the
reference taken on 'np' must be released.

Add the missing 'of_node_put()' call.

Fixes: c413983eb66a ("ASoC: rsnd: adjust disabled module")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/sh/rcar/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 978bd0406729..6a8fe0da7670 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1225,6 +1225,7 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 		if (i < 0) {
 			dev_err(dev, "strange node numbering (%s)",
 				of_node_full_name(node));
+			of_node_put(np);
 			return 0;
 		}
 		i++;
-- 
2.30.2

