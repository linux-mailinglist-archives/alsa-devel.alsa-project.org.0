Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EE7174A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A681684;
	Tue, 23 Jul 2019 13:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A681684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882142;
	bh=k9BeIk9r0OICF+fssPElJKz0xw9TPf+h+1q6BnXkuew=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jJRiAxz1YypDFCs93c4vfNAPYeca4kh2kw4dOlahoxfirNEO2RrjEqVEXbv5TtUaS
	 nPE7J3l72Wk9Er+cPtcjoN45vaaVJUI8zYjGj3xyUV7w8TPcnmcJzA1aR8VEDXzV7A
	 lXw38OGUwNAF5YWpjRBkVzjE7oAaIn01C9Pqwuz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA81BF8065E;
	Tue, 23 Jul 2019 13:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19AADF804A9; Tue, 23 Jul 2019 13:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAB0DF8048F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAB0DF8048F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xj5DJdEx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=aXrMV1O3VmKqe4x2AEecMdsYsJJTS4hcNZbzqCYNshU=; b=xj5DJdExth1F
 igud7V7OPVqRh2VQ2L6WX5a5qUbmZpYAJX2czQXbQ2NdcFm6Vp27xKfylUCQpksyNmeCsLIYiVAiK
 Ul87HINyDL4p+vxMDN5vixLW9Nr+UNCLgL5XbT+T6PC4YX65L82IVfoiZ/yre0EDMYYc9zUzfWWFY
 XJ/zg=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyp-0003K0-8J; Tue, 23 Jul 2019 11:29:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 977952742B60; Tue, 23 Jul 2019 12:29:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190722141402.7194-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112914.977952742B60@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:14 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: use timeout configured at
	probe" to the asoc tree
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

   ASoC: SOF: ipc: use timeout configured at probe

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 6dd78b310b8d4ab5d0b851e369b5b3d46c6a32a9 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Mon, 22 Jul 2019 09:13:45 -0500
Subject: [PATCH] ASoC: SOF: ipc: use timeout configured at probe

Do not hardcode IPC timeout value in ipc.c, but rather use the timeout
value configured during device probe. For platforms that do not override
the IPC timeout, default value TIMEOUT_DEFAULT_IPC_MS has already been
defined in core.c.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 20dfca9c93b7..b2f359d2f7e5 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -17,12 +17,6 @@
 #include "sof-priv.h"
 #include "ops.h"
 
-/*
- * IPC message default size and timeout (ms).
- * TODO: allow platforms to set size and timeout.
- */
-#define IPC_TIMEOUT_MS		300
-
 static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id);
 static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd);
 
@@ -211,7 +205,7 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 
 	/* wait for DSP IPC completion */
 	ret = wait_event_timeout(msg->waitq, msg->ipc_complete,
-				 msecs_to_jiffies(IPC_TIMEOUT_MS));
+				 msecs_to_jiffies(sdev->ipc_timeout));
 
 	if (ret == 0) {
 		dev_err(sdev->dev, "error: ipc timed out for 0x%x size %d\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
