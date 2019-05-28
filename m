Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF12CA33
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16163183C;
	Tue, 28 May 2019 17:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16163183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056756;
	bh=WY4uyoQnP5TC9jLRwbzmbTNPaMVwctRAtKJ5lMYRp8s=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=a2hrHpqkdWPBqsckO84ZTdUKLqp2tAAr9F9K51K9n3Jm8997q1Ci6YPSv0fGjzf5n
	 tmjkWPNc+LQu8bd6ALJBrBKxA/qtMe6iqztzF8A9RHvZBV34iLb6nh/EWxDqK4Zy9i
	 swmTEmYh4dQbeDn98XF3J/3JpTkQ2eF7zSIBVHMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB3DF89781;
	Tue, 28 May 2019 17:07:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 351EEF89768; Tue, 28 May 2019 17:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A8A7F89706
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A8A7F89706
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fZ20+Vpq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QcJXyAD9gwQB5IwiRhON19GSI9VhCRDezpqQUvurHME=; b=fZ20+VpqJG3u
 DB5QJ0WSUc/rDXiYNwYneJJ7U8APH8RfS+Son99+5st1cn3u2DD+/DaGY0hqQNYhuxfyxIg0922pB
 /HqaZmefQdPQPDUJySDCGi8pja8rZRxQq9DZfZadJ7rOuDsABCYiqipl/mQbPkKt61YyO+FsHkF7L
 gW9YY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgn-0002no-Eo; Tue, 28 May 2019 15:06:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D5A5B440046; Tue, 28 May 2019 16:06:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190524192309.6359-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150656.D5A5B440046@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:06:56 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: force end-of-file for debugfs
	trace at suspend" to the asoc tree
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

   ASoC: SOF: force end-of-file for debugfs trace at suspend

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

From ec9025e5d3c5b5f2027fa74be6afdaad9908b546 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Fri, 24 May 2019 14:23:06 -0500
Subject: [PATCH] ASoC: SOF: force end-of-file for debugfs trace at suspend

Current trace implementation gets out of sync when sof device
is put to suspend. The debugfs file handle is kept open, but
firmware will reset its state. After resume, debugfs client's
read offset will not be synchronized to firmware and this may
result in traces read in incorrect order and/or stale data being
read after resume.

Add logic to signal end-of-file to read() when firmware tracing
has ended, and all trace data has been read. This allows debugfs
client to capture all trace data, and reopen the trace file to
ensure proper synchronization with firmware after reopening
the node.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/sof-priv.h |  2 ++
 sound/soc/sof/trace.c    | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1e85d6f9c5c3..01a6219c326b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -417,6 +417,8 @@ struct snd_sof_dev {
 	u32 host_offset;
 	u32 dtrace_is_enabled;
 	u32 dtrace_error;
+	u32 dtrace_draining;
+
 	u32 msi_enabled;
 
 	void *private;			/* core does not touch this */
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index a2d89d295f0f..b02520f8e595 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -43,6 +43,15 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	if (ret)
 		return ret;
 
+	if (!sdev->dtrace_is_enabled && sdev->dtrace_draining) {
+		/*
+		 * tracing has ended and all traces have been
+		 * read by client, return EOF
+		 */
+		sdev->dtrace_draining = false;
+		return 0;
+	}
+
 	/* wait for available trace data from FW */
 	init_waitqueue_entry(&wait, current);
 	set_current_state(TASK_INTERRUPTIBLE);
@@ -104,10 +113,23 @@ static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
 	return count;
 }
 
+static int sof_dfsentry_trace_release(struct inode *inode, struct file *file)
+{
+	struct snd_sof_dfsentry *dfse = inode->i_private;
+	struct snd_sof_dev *sdev = dfse->sdev;
+
+	/* avoid duplicate traces at next open */
+	if (!sdev->dtrace_is_enabled)
+		sdev->host_offset = 0;
+
+	return 0;
+}
+
 static const struct file_operations sof_dfs_trace_fops = {
 	.open = simple_open,
 	.read = sof_dfsentry_trace_read,
 	.llseek = default_llseek,
+	.release = sof_dfsentry_trace_release,
 };
 
 static int trace_debugfs_create(struct snd_sof_dev *sdev)
@@ -155,6 +177,7 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	params.stream_tag = 0;
 
 	sdev->host_offset = 0;
+	sdev->dtrace_draining = false;
 
 	ret = snd_sof_dma_trace_init(sdev, &params.stream_tag);
 	if (ret < 0) {
@@ -291,6 +314,8 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 			"error: fail in snd_sof_dma_trace_release %d\n", ret);
 
 	sdev->dtrace_is_enabled = false;
+	sdev->dtrace_draining = true;
+	wake_up(&sdev->trace_sleep);
 }
 EXPORT_SYMBOL(snd_sof_release_trace);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
