Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE6DD7250
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 11:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D975084C;
	Tue, 15 Oct 2019 11:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D975084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571131771;
	bh=l2OgVEry49GyGNfVeT+iDqMfki22YUURjCIQPTyut+g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TYBr9dF+t+mcbwFq3GLz5uY3sZc+xzBwjT1K48PNLZG1GnpYl+GNAqA2Da8kKl23U
	 Hpn6syhASn8j6NOGgl1ewsrsWjCEOXc+nmUr+Wg4hB21gm2hzkzVFU/HG3P62B6F63
	 wkPs9dqM3ZV/pLKQFDcfiqHO/0Dc2uElDv9CTrFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1694DF805AE;
	Tue, 15 Oct 2019 11:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CDFFF805AA; Tue, 15 Oct 2019 11:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B703F8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 11:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B703F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UC1KKorc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pbgyFUrGByVb607QmHX37yCPtaNnzrrK1PHzCUea1Vo=; b=UC1KKorcl9vf
 vxEoWnj+HYOtBr+56SCW40IBsuYZWpVbxXm03RmFrf3ijBGYwgG0j0kz5fwD4XdpyVYH57g4I+uoI
 C49aLNYN76mWEqK96yGBUOrx8YY/z0ei57SK0sOVsmN3fqayj13vEHx2C+WBlJPiHSXqgO6SvgodT
 SzHvc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKJ6T-0001oc-14; Tue, 15 Oct 2019 09:26:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D088D274291C; Tue, 15 Oct 2019 10:26:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eeze67p7.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191015092651.D088D274291C@ypsilon.sirena.org.uk>
Date: Tue, 15 Oct 2019 10:26:51 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@gmail.com>
Subject: [alsa-devel] Applied "ASoC: audio-graph: fixup
	graph_dai_link_of_dpcm() comment" to the asoc tree
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

   ASoC: audio-graph: fixup graph_dai_link_of_dpcm() comment

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

From 9764beeae7cc477c13ffc451a5edd1ab8891e3ea Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 15 Oct 2019 11:52:52 +0900
Subject: [PATCH] ASoC: audio-graph: fixup graph_dai_link_of_dpcm() comment

The comment is wrong.
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/87eeze67p7.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 6007e6305735..9ad35d9940fe 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -232,7 +232,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (li->cpu) {
 		int is_single_links = 0;
 
-		/* BE is dummy */
+		/* Codec is dummy */
 		codecs->of_node		= NULL;
 		codecs->dai_name	= "snd-soc-dummy-dai";
 		codecs->name		= "snd-soc-dummy";
@@ -263,7 +263,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	} else {
 		struct snd_soc_codec_conf *cconf;
 
-		/* FE is dummy */
+		/* CPU is dummy */
 		cpus->of_node		= NULL;
 		cpus->dai_name		= "snd-soc-dummy-dai";
 		cpus->name		= "snd-soc-dummy";
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
