Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E12C9B1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE6617FC;
	Tue, 28 May 2019 17:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE6617FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056228;
	bh=lIeZ7Am6wuUVLXaVYEXLSUym3sUzcPmHZm7QV+690Wk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Hlx7wx/lZzk7Ea/l+TgIZT4c+u2iKbtA62GIjcpwOzmt3guh0OOCnD1XBJshcVspH
	 4DwQQqy6cQbriR86ZFvquWRb80obpS2uVNUCkRRrtbb7es/neLHkktesmng3DaSlv1
	 IYVgaPyOpdBRVpkaLdVTK6+9XtMloowNK1ENbUeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB629F89737;
	Tue, 28 May 2019 17:07:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E344F89728; Tue, 28 May 2019 17:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DD7DF8970A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD7DF8970A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wi+4xqqx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=gRhWUpp8UZ1DHs4MfbFfmHMECotpa5H038ElxnH4BDg=; b=wi+4xqqxnhy4
 8cxanW1X8fyVtMnBcIUN7rzIt582OrVPRcQGNQHz6dSEN8yyB7B9LyTOKfNKOAoPZvnBzMdvekQ3P
 m9XjX6KLu5PAEeh0lvWvlyqAI4G8mktCjmwtVzlRGlBFgiV8ztY+wnFluAEXIx3CrpVZpb0gt0p4G
 lukxM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgo-0002nr-2j; Tue, 28 May 2019 15:06:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5B0FC440049; Tue, 28 May 2019 16:06:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190524192309.6359-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150657.5B0FC440049@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:06:57 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: trace: remove code duplication in
	sof_wait_trace_avail()" to the asoc tree
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

   ASoC: SOF: trace: remove code duplication in sof_wait_trace_avail()

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

From f627b0524ccf993b646bd56f9bdacc973c8c39cc Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Fri, 24 May 2019 14:23:05 -0500
Subject: [PATCH] ASoC: SOF: trace: remove code duplication in
 sof_wait_trace_avail()

Move duplicated code in sof_wait_trace_avail() to a helper function.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/trace.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index d588e4b70fad..a2d89d295f0f 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -13,10 +13,9 @@
 #include "sof-priv.h"
 #include "ops.h"
 
-static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
-				   loff_t pos, size_t buffer_size)
+static size_t sof_trace_avail(struct snd_sof_dev *sdev,
+			      loff_t pos, size_t buffer_size)
 {
-	wait_queue_entry_t wait;
 	loff_t host_offset = READ_ONCE(sdev->host_offset);
 
 	/*
@@ -31,6 +30,19 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	if (host_offset > pos)
 		return host_offset - pos;
 
+	return 0;
+}
+
+static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
+				   loff_t pos, size_t buffer_size)
+{
+	wait_queue_entry_t wait;
+	size_t ret = sof_trace_avail(sdev, pos, buffer_size);
+
+	/* data immediately available */
+	if (ret)
+		return ret;
+
 	/* wait for available trace data from FW */
 	init_waitqueue_entry(&wait, current);
 	set_current_state(TASK_INTERRUPTIBLE);
@@ -42,12 +54,7 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	}
 	remove_wait_queue(&sdev->trace_sleep, &wait);
 
-	/* return bytes available for copy */
-	host_offset = READ_ONCE(sdev->host_offset);
-	if (host_offset < pos)
-		return buffer_size - pos;
-
-	return host_offset - pos;
+	return sof_trace_avail(sdev, pos, buffer_size);
 }
 
 static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
