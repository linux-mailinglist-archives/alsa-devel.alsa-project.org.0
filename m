Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED2B68FED
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 16:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511931668;
	Mon, 15 Jul 2019 16:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511931668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563200287;
	bh=i+0JY6kkl9DV7MOk1s+xRCcT38s7g6HYOvon07dBd9k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q19vs6nzGIMnzUquErf8pjKfGXn42SvoYw4kFWl6OCStI1p/AEvb90kckHHvpdmXl
	 1cQMKOJPRgzabcondR5xkxPN1e4we+qWm6GhjgoZTx6eDBO96yoVuBoJ8T5V/mYB8j
	 FuLaJwwKF9E7iDrVA/C9ZOB9lVqfuwm3qDkJCGgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 547C0F80367;
	Mon, 15 Jul 2019 16:16:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D5C8F80367; Mon, 15 Jul 2019 16:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15BE2F802BC
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 16:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15BE2F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vKuMqlTr"
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C8D820868;
 Mon, 15 Jul 2019 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563200173;
 bh=QdxkhPNgcZkx+wY+JoZuFgHJzgfudEMIkPwELkwc6D8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vKuMqlTruVNDKNNGZmMOkc8aqYTKwUifwqVpxostOpQPFzRWIO2GDI/shFEJVdYFV
 8DcVeS27FkpayOjZw0mlNguzZnzA6uk+KtU92LOOnxFaJQKANRjufHl3z70DxmW5AO
 6KX9YBTvobKRwXPxTW0mWSGsUaBFFFKxAPWiki4E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 15 Jul 2019 10:03:22 -0400
Message-Id: <20190715140341.6443-201-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715140341.6443-1-sashal@kernel.org>
References: <20190715140341.6443-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH AUTOSEL 5.1 201/219] ASoC: audio-graph-card:
	fix use-after-free in graph_for_each_link
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

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 1bcc1fd64e4dd903f4d868a9e053986e3b102713 ]

After calling of_node_put() on the codec_ep and codec_port variables,
they are still being used, which may result in use-after-free.
We fix this issue by calling of_node_put() after the last usage.

Fixes: fce9b90c1ab7 ("ASoC: audio-graph-card: cleanup DAI link loop method - step2")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/r/1562229530-8121-1-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/generic/audio-graph-card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 69bc4848d787..f730830fb36c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -460,9 +460,6 @@ static int graph_for_each_link(struct graph_priv *priv,
 			codec_ep = of_graph_get_remote_endpoint(cpu_ep);
 			codec_port = of_get_parent(codec_ep);
 
-			of_node_put(codec_ep);
-			of_node_put(codec_port);
-
 			/* get convert-xxx property */
 			memset(&adata, 0, sizeof(adata));
 			graph_get_conversion(dev, codec_ep, &adata);
@@ -482,6 +479,9 @@ static int graph_for_each_link(struct graph_priv *priv,
 			else
 				ret = func_noml(priv, cpu_ep, codec_ep, li);
 
+			of_node_put(codec_ep);
+			of_node_put(codec_port);
+
 			if (ret < 0)
 				return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
