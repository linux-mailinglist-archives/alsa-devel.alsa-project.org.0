Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD3649C8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 17:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04195169C;
	Wed, 10 Jul 2019 17:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04195169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562773036;
	bh=zcACOIZs3ZQM4vVzt49UEi/AL7KsbRUzVuNuIlb6QKI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SA5BlL/kASWJoyjk6jW3eyf8mlQvR0AiD6zhgw4BLK8wxFrbsOhbwzkEsZfBDG+Js
	 RocAPW5k4URbwMA0+ZS3ot3tj7V3phUFSQGsz8e325aJ5gRTTsmUUep+LXwiFrJRcD
	 59j5cFpjOiGXWtgHvmjuIUMCN2upHRtnhbqx9iQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4E0DF80308;
	Wed, 10 Jul 2019 17:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC570F802A2; Wed, 10 Jul 2019 17:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71E35F800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E35F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jAd/Ps0/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=V91pmBsf6kxdFHew84eBND8S52MilJzfqdSmspUhTJo=; b=jAd/Ps0/iZHi
 BE2144LdPYYIb3qiC4sqEAcaUL+ip753Mlxb04YZrQxVAXbKuAmAkhgAg/qlYuHUR9EF01UFhlwci
 LbgX+a/lK5m4Be37ykGiwQPiUjTxAFeOhKtjiLhry1bFf9wnD6sUMy2QYao5G2YDUOc0k65HQv0Gn
 D/Cj0=;
Received: from [217.140.106.53] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlEcB-00082j-6P; Wed, 10 Jul 2019 15:34:39 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 99AAED02D7C; Wed, 10 Jul 2019 16:34:38 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Wen Yang <wen.yang99@zte.com.cn>
In-Reply-To: <1562743509-30496-5-git-send-email-wen.yang99@zte.com.cn>
X-Patchwork-Hint: ignore
Message-Id: <20190710153438.99AAED02D7C@fitzroy.sirena.org.uk>
Date: Wed, 10 Jul 2019 16:34:38 +0100 (BST)
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 jonathanh@nvidia.com, Mark Brown <broonie@kernel.org>, xue.zhihong@zte.com.cn,
 cheng.shengyu@zte.com.cn
Subject: [alsa-devel] Applied "ASoC: audio-graph-card: fix an use-after-free
	in graph_get_dai_id()" to the asoc tree
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

The patch

   ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c152f8491a8d9a4b25afd65a86eb5e55e2a8c380 Mon Sep 17 00:00:00 2001
From: Wen Yang <wen.yang99@zte.com.cn>
Date: Wed, 10 Jul 2019 15:25:09 +0800
Subject: [PATCH] ASoC: audio-graph-card: fix an use-after-free in
 graph_get_dai_id()

After calling of_node_put() on the node variable, it is still being
used, which may result in use-after-free.
Fix this issue by calling of_node_put() after the last usage.

Fixes: a0c426fe1433 ("ASoC: simple-card-utils: check "reg" property on asoc_simple_card_get_dai_id()")
Link: https://lore.kernel.org/r/1562743509-30496-5-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index bddfcfd7bedf..343ede8042c3 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -63,6 +63,7 @@ static int graph_get_dai_id(struct device_node *ep)
 	struct device_node *endpoint;
 	struct of_endpoint info;
 	int i, id;
+	u32 *reg;
 	int ret;
 
 	/* use driver specified DAI ID if exist */
@@ -83,8 +84,9 @@ static int graph_get_dai_id(struct device_node *ep)
 			return info.id;
 
 		node = of_get_parent(ep);
+		reg = of_get_property(node, "reg", NULL);
 		of_node_put(node);
-		if (of_get_property(node, "reg", NULL))
+		if (reg)
 			return info.port;
 	}
 	node = of_graph_get_port_parent(ep);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
