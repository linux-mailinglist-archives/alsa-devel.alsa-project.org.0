Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A0E74F3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:21:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C45206C;
	Mon, 28 Oct 2019 16:20:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C45206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572276101;
	bh=virbjzUQ5N4IM6Wn1/GygfVtf3bnVYgblgU4iZhbaqg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KR/JrU5TZW2Wj9A9Vv19nP6keFU8pGw16eguQbygzDZAdoDWLDGe5gyxgubuJzOaM
	 kVLfEP7t3AF3815LYCN1WFNEm74v/yuY1KLqc5OtJuAzPzrOZJkmDzmK/LAxT3dUuD
	 qGOPR4CSjNtcmT7Ir8mMQ8cFYLr0dfeuLw5BvmPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56556F89619;
	Mon, 28 Oct 2019 15:57:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB873F80724; Mon, 28 Oct 2019 15:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D83DFF8065A
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D83DFF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G0w0eKog"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AFCr3rynD8V4Xu0si+l9pX7hWrr9yeLzz/mOG9Iw2wc=; b=G0w0eKogHrhP
 q8K6V3DrJgZC7vPrVoys+O16CN+nQi6vYsFPu8CvMZEwCu5kkSS4vSxjP3s7vUiAjyT4NK3LXZEyV
 jL/XjtfWFgEw2xMIxEP60y7Y8B3QdjH5BHZfNy8tuaf8+JJbATHxKGqcJUUP1mlVNnb1QD2L2Btzj
 J8NKk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rk-0008Rv-0Q; Mon, 28 Oct 2019 14:56:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6969827403EF; Mon, 28 Oct 2019 14:56:38 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
In-Reply-To: <20191027194856.4056-1-navid.emamdoost@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145638.6969827403EF@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:38 +0000 (GMT)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, kjlu@umn.edu,
 Liam Girdwood <lgirdwood@gmail.com>, emamd001@umn.edu,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, smccaman@umn.edu,
 "Cc:"@sirena.co.uk, linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: SOF: Fix memory leak in
	sof_dfsentry_write" to the asoc tree
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

   ASoC: SOF: Fix memory leak in sof_dfsentry_write

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

From c0a333d842ef67ac04adc72ff79dc1ccc3dca4ed Mon Sep 17 00:00:00 2001
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Sun, 27 Oct 2019 14:48:47 -0500
Subject: [PATCH] ASoC: SOF: Fix memory leak in sof_dfsentry_write

In the implementation of sof_dfsentry_write() memory allocated for
string is leaked in case of an error. Go to error handling path if the
d_name.name is not valid.

Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for IPC flood test")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Link: https://lore.kernel.org/r/20191027194856.4056-1-navid.emamdoost@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 54cd431faab7..5529e8eeca46 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -152,8 +152,10 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	 */
 	dentry = file->f_path.dentry;
 	if (strcmp(dentry->d_name.name, "ipc_flood_count") &&
-	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
-		return -EINVAL;
+	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (!strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
 		flood_duration_test = true;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
