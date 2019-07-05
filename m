Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0240460AFC
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 19:22:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C061169A;
	Fri,  5 Jul 2019 19:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C061169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562347344;
	bh=xnb6h8GzBO7QOhyZ6UNuPxgl5Ixh4Mi1hM5qMoH8adI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MYI+UyGIDwrCoUqnXxB/OBzx1IXuzuhvwf2IRy1giN888G4uAZI1zmav/7JToc5SC
	 pA5w62lqDP4nqkVH4tFEKKBXqvv6IuJ8JSj7X4XSH+9xjC+/kOOvzMAANT1JxCGmp8
	 mBWEVvnzLCeYhu6RGsnHN3tw53+hbMZNreaHEDIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A89F80134;
	Fri,  5 Jul 2019 19:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A9FF800E6; Fri,  5 Jul 2019 19:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0067F800E6
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 19:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0067F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="w5y81v1T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ePFcoJ5m87EvMr2n+NPJawIqXaDiVgO7emTiCfYxa/c=; b=w5y81v1T0+ac
 1+ok1MB6hi0HaqCQBoU8h2Re9kCl/UXILOhp+D7a+371YTeKfoeEJYYTUuuej3O8vSmZUtn7cJW+O
 UpzJMk/gC9fH4J+I5X+xHd67jGerlq8mL3Byoq/sJwqmf98l0ACGA7PU4xbj5xOy4dXppQmoml5k7
 IhFzQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjRsE-0004ZO-Uw; Fri, 05 Jul 2019 17:19:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 730AE2742A10; Fri,  5 Jul 2019 18:19:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20190705081637.157169-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190705171950.730AE2742A10@ypsilon.sirena.org.uk>
Date: Fri,  5 Jul 2019 18:19:50 +0100 (BST)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: debug: fix possible memory leak in
	sof_dfsentry_write()" to the asoc tree
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

   ASoC: SOF: debug: fix possible memory leak in sof_dfsentry_write()

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

From b90bab3b1b1b6c56dd6f9d5c960932239f36f6d3 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 5 Jul 2019 08:16:37 +0000
Subject: [PATCH] ASoC: SOF: debug: fix possible memory leak in
 sof_dfsentry_write()

'string' is malloced in sof_dfsentry_write() and should be freed
before leaving from the error handling cases, otherwise it will cause
memory leak.

Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for IPC flood test")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20190705081637.157169-1-weiyongjun1@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 54bb53bfc81b..2388477a965e 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -162,7 +162,7 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	else
 		ret = kstrtoul(string, 0, &ipc_count);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	/* limit max duration/ipc count for flood test */
 	if (flood_duration_test) {
@@ -191,7 +191,7 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 				    "error: debugfs write failed to resume %d\n",
 				    ret);
 		pm_runtime_put_noidle(sdev->dev);
-		return ret;
+		goto out;
 	}
 
 	/* flood test */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
