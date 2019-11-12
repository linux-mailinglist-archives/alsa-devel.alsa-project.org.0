Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77BF96E8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:18:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6F81673;
	Tue, 12 Nov 2019 18:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6F81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579136;
	bh=JrqqZjaOcsC4qQ5n1EIo9fIcfB6o0UB7GYuoIJ1rMbA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HR+CZEB8FFHLheCL9Xx0KD2igXigmayIV6GcWDLucdLzX8Vl05utFZECSi5E8gPqO
	 v2LO/NOcrUs9hBshkPHDKy1p6oP9tl8JQ7+k5G4L50zRK7ufMMX2Mqu2CJsPX0qgsa
	 S+ovZ4Mxuvdse6kr4Ndpxnzu61gmBjR9ueCcwgP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26512F802E0;
	Tue, 12 Nov 2019 18:16:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AABEF805FE; Tue, 12 Nov 2019 18:16:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 149C6F802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 149C6F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="h6zjJ98a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=tz6ivLnBL9tTbZPhRP3xFzpQPJDaGu/hWULhk+UjXQs=; b=h6zjJ98a/Zrg
 jserkOMu9gunWxK1cavJRZUTzgJS4GeGDIoj/uqoAxqGWFT5syfmrECPAD2pCFQa08I+2OOXebuJA
 BH/8yBL1d1obO+59oFIT9/NliVNghp2pz2waqgTCU7CiWQ5/6tAIDXRoJzaDy2TBoBa/AhAlmKyCc
 27/JQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm8-0008Iv-CT; Tue, 12 Nov 2019 17:16:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D967927429D2; Tue, 12 Nov 2019 17:16:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191111223343.19986-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171619.D967927429D2@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:19 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: PM: add state machine to comments"
	to the asoc tree
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

   ASoC: SOF: PM: add state machine to comments

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

From 74b4dd04b19cc03e1cc369d9c371cf4206367df4 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Mon, 11 Nov 2019 16:33:40 -0600
Subject: [PATCH] ASoC: SOF: PM: add state machine to comments

Add Audio DSP state machine with comments. Note that the
'D0<-->runtime D0I3' part is not implemented yet.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191111223343.19986-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pm.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 560a937e0484..3204c92f0e7d 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -428,6 +428,38 @@ int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL(snd_sof_set_d0_substate);
 
+/*
+ * Audio DSP states may transform as below:-
+ *
+ *                                         D0I3 compatible stream
+ *     Runtime    +---------------------+   opened only, timeout
+ *     suspend    |                     +--------------------+
+ *   +------------+       D0(active)    |                    |
+ *   |            |                     <---------------+    |
+ *   |   +-------->                     |               |    |
+ *   |   |Runtime +--^--+---------^--+--+ The last      |    |
+ *   |   |resume     |  |         |  |    opened D0I3   |    |
+ *   |   |           |  |         |  |    compatible    |    |
+ *   |   |     resume|  |         |  |    stream closed |    |
+ *   |   |      from |  | D3      |  |                  |    |
+ *   |   |       D3  |  |suspend  |  | d0i3             |    |
+ *   |   |           |  |         |  |suspend           |    |
+ *   |   |           |  |         |  |                  |    |
+ *   |   |           |  |         |  |                  |    |
+ * +-v---+-----------+--v-------+ |  |           +------+----v----+
+ * |                            | |  +----------->                |
+ * |       D3 (suspended)       | |              |      D0I3      +-----+
+ * |                            | +--------------+                |     |
+ * |                            |  resume from   |                |     |
+ * +-------------------^--------+  d0i3 suspend  +----------------+     |
+ *                     |                                                |
+ *                     |                       D3 suspend               |
+ *                     +------------------------------------------------+
+ *
+ * d0i3_suspend = s0_suspend && D0I3 stream opened,
+ * D3 suspend = !d0i3_suspend,
+ */
+
 int snd_sof_resume(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
