Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F265B3378B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1191686;
	Mon,  3 Jun 2019 20:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1191686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585382;
	bh=wiq4mR1kw+0kL0/zKcweVBGVvyU7rUqLrbw3TE1C6lI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=a4uL/s3EJoZ76gc5ZAlLuOUMEADB224oeu68PAJ1U+0Iut8YLR2TY5x1bhQixBan6
	 ++vBTfkZgBN833dlwZ5X5YxQB38ASS2faAlLwvBuPGnXN9ccDemJEXgIIZ6OzlZ0sX
	 gq3ZvUCZcTw+LEkx0AQpNrVu5Y1o+VRdrBeHXYDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF031F89762;
	Mon,  3 Jun 2019 20:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79248F89742; Mon,  3 Jun 2019 20:02:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D43D2F8972F
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D43D2F8972F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="k5PT8PN7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QhTNW6j+fc8IhTjt04RBdQCG7yGGaduFcKvZmFMfAPg=; b=k5PT8PN73RDt
 s2M/xGFpNLlT4IWBtBkS5iNsSmXzlFz94ASZSIavHToASQ4UMaGyVlscM8tOM8yR8GpaplNCDD+9l
 144MeeEze9vxZBpX3D0d30ubcTjjvsdjig+o62MCIHkb8zp92xwg/Q+HeDTqOERhE2H1k4WPzQB/l
 gFrwI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHP-0003Y6-A1; Mon, 03 Jun 2019 18:01:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AB3B1440046; Mon,  3 Jun 2019 19:01:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jaska Uimonen <jaska.uimonen@intel.com>
In-Reply-To: <20190603161821.7486-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180154.AB3B1440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:54 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: add support for
	mux/demux component" to the asoc tree
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

   ASoC: SOF: topology: add support for mux/demux component

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 663580695611b9c3837cdf596de2194234f0fbd5 Mon Sep 17 00:00:00 2001
From: Jaska Uimonen <jaska.uimonen@intel.com>
Date: Mon, 3 Jun 2019 11:18:21 -0500
Subject: [PATCH] ASoC: SOF: topology: add support for mux/demux component

Add enumerations to support mux/demux processing component.

Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/topology.h | 3 +++
 sound/soc/sof/topology.c     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 46b2a7e63167..4978999fd362 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -35,6 +35,7 @@ enum sof_comp_type {
 	SOF_COMP_KEYWORD_DETECT,
 	SOF_COMP_KPB,			/* A key phrase buffer component */
 	SOF_COMP_SELECTOR,		/**< channel selector component */
+	SOF_COMP_DEMUX,
 	/* keep FILEREAD/FILEWRITE as the last ones */
 	SOF_COMP_FILEREAD = 10000,	/**< host test based file IO */
 	SOF_COMP_FILEWRITE = 10001,	/**< host test based file IO */
@@ -175,6 +176,8 @@ enum sof_ipc_process_type {
 	SOF_PROCESS_KEYWORD_DETECT,	/**< Keyword Detection */
 	SOF_PROCESS_KPB,		/**< KeyPhrase Buffer Manager */
 	SOF_PROCESS_CHAN_SELECTOR,	/**< Channel Selector */
+	SOF_PROCESS_MUX,
+	SOF_PROCESS_DEMUX,
 };
 
 /* generic "effect", "codec" or proprietary processing component */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 745cb875863c..b969686f954f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -394,6 +394,8 @@ static const struct sof_process_types sof_process[] = {
 	{"KEYWORD_DETECT", SOF_PROCESS_KEYWORD_DETECT, SOF_COMP_KEYWORD_DETECT},
 	{"KPB", SOF_PROCESS_KPB, SOF_COMP_KPB},
 	{"CHAN_SELECTOR", SOF_PROCESS_CHAN_SELECTOR, SOF_COMP_SELECTOR},
+	{"MUX", SOF_PROCESS_MUX, SOF_COMP_MUX},
+	{"DEMUX", SOF_PROCESS_DEMUX, SOF_COMP_DEMUX},
 };
 
 static enum sof_ipc_process_type find_process(const char *name)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
