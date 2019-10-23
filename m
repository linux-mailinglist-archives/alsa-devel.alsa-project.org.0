Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A22E22FA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BACE31672;
	Wed, 23 Oct 2019 20:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BACE31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571857184;
	bh=gcE3k5YvA0nzoeUtX4DuvVScxlXwi1mpXjyBGDOf4/Y=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p4mfJLYbGRSggZ6cbxXrwvoOXNWLEsRGG9WT2yPlJVttU+/2ON3Y4vDIyYWMyO22W
	 VxTos5Jc5QRF6q5J2zgRaQRs6HyXOFnN/gvzhrZFVyg+pPudHLhZC5Jrx7UpL2Fl7j
	 R7MH1q3IDcd2WZkoqEXHcrHwAsaik+48SQJLDUrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD0DF8060D;
	Wed, 23 Oct 2019 20:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BB87F8060D; Wed, 23 Oct 2019 20:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AA4EF803D7
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AA4EF803D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S2916Ly/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=GE2osdEkB+rRYka4kibi6qZR1kieaPp02+7FgD1hFAo=; b=S2916Ly/yjop
 TCrZK/UbtiaGYFEUgAArvwQLdIceH2gjuN79DgFbs++AB2saS/5htUcRfrN9FGNh2yWev2WuskBQ6
 tfFDaHS1KZNNAK+KVey3dwucCOgCwNzozcojH56LT1SzVC+uGJfm3+PBwCxF8PsJJ/doClB1v5Xjv
 JulIc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNLni-0001B0-Vk; Wed, 23 Oct 2019 18:56:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 693462743021; Wed, 23 Oct 2019 19:56:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736fkyzx8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191023185606.693462743021@ypsilon.sirena.org.uk>
Date: Wed, 23 Oct 2019 19:56:06 +0100 (BST)
Cc: Pavel Machek <pavel@denx.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rsnd: add missing of_node_put()" to the
	asoc tree
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

   ASoC: rsnd: add missing of_node_put()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From ef2c695151df54817f92128f96a920ff888c6920 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 23 Oct 2019 11:10:43 +0900
Subject: [PATCH] ASoC: rsnd: add missing of_node_put()

This patch adds missing of_node_put() for
rsnd_parse_tdm_split_mode()
rsnd_parse_connect_graph()

Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/8736fkyzx8.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 4bed26842095..72924c8b0696 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1075,7 +1075,10 @@ static void rsnd_parse_tdm_split_mode(struct rsnd_priv *priv,
 			j++;
 		}
 
+		of_node_put(node);
 	}
+
+	of_node_put(ssiu_np);
 }
 
 static void rsnd_parse_connect_simple(struct rsnd_priv *priv,
@@ -1093,11 +1096,13 @@ static void rsnd_parse_connect_graph(struct rsnd_priv *priv,
 				     struct device_node *endpoint)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
-	struct device_node *remote_node = of_graph_get_remote_port_parent(endpoint);
+	struct device_node *remote_node;
 
 	if (!rsnd_io_to_mod_ssi(io))
 		return;
 
+	remote_node = of_graph_get_remote_port_parent(endpoint);
+
 	/* HDMI0 */
 	if (strstr(remote_node->full_name, "hdmi@fead0000")) {
 		rsnd_flags_set(io, RSND_STREAM_HDMI0);
@@ -1111,6 +1116,8 @@ static void rsnd_parse_connect_graph(struct rsnd_priv *priv,
 	}
 
 	rsnd_parse_tdm_split_mode(priv, io, endpoint);
+
+	of_node_put(remote_node);
 }
 
 void rsnd_parse_connect_common(struct rsnd_dai *rdai,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
