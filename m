Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FB33773
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B181669;
	Mon,  3 Jun 2019 20:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B181669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585024;
	bh=IoVD+K/iMiDTHNcypCho6Xk7nOIqDsdjtK1t1OARIzk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CGGRaon+v3HzJr395/lKKxD32DmUM9j50hSuJ5gYidL/b8UISXmTic6edzJ2iawJZ
	 YGIZSVwkDGp/jhlwxyfu0HCzyXa3cM8cXiBVwDI8szzZpb5P49SBtICc8+d5ZvO+w2
	 v+8co94GztXUK0db7v32CE6VDjul7KQQD62RosU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34C3F8972E;
	Mon,  3 Jun 2019 20:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 389D4F896ED; Mon,  3 Jun 2019 20:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5625DF80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5625DF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qMVdqLez"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PnuOKHlDhc9KF4fnWqtpr6dllb6g03L+i/bBbIp91ZQ=; b=qMVdqLezp5ik
 yqQ1uLUwkMOmHe8ItGa686uRnd9N2LgfZSfRf6tOVM9EixeZKMYck+qiMD+gPgsiVyAtrSRdPx+Ui
 IC2RFM4FTd33u+lKwe8s/lMSOsNK+1Oc1e3ubyckbhMUgVuzQXasZ0zIgcW+VToWP3qd9sU2MZmzF
 QfkSs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHN-0003Xv-Ak; Mon, 03 Jun 2019 18:01:53 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 92BE8440046; Mon,  3 Jun 2019 19:01:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190603180152.92BE8440046@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:01:52 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: debug: add new debugfs entries for
	IPC flood test" to the asoc tree
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

   ASoC: SOF: debug: add new debugfs entries for IPC flood test

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

From 091c12e1f50cce93b1af90e56cad88787ec86dfb Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Mon, 3 Jun 2019 11:18:20 -0500
Subject: [PATCH] ASoC: SOF: debug: add new debugfs entries for IPC flood test

Add a couple of new debugfs entries "ipc_flood_count"
and "ipc_flood_duration_ms" that can be used to
execute the IPC flood test. "ipc_flood_count" floods the DSP
with the number of test IPCs specified and ipc_flood_duration_ms
floods the DSP with test IPC's for the duration(in ms) specified.
The test stats such as average, min and max IPC response times
are logged in the dmesg and saved in the debugfs entry cache buffer.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig    |   8 ++
 sound/soc/sof/debug.c    | 243 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |   6 +-
 3 files changed, 256 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index ca3ad3362478..1d4b4dced4b6 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -131,6 +131,14 @@ config SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE
 	  Say Y if you want to enable caching the memory windows.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
+	bool "SOF enable IPC flood test"
+	help
+	  This option enables the IPC flood test which can be used to flood
+	  the DSP with test IPCs and gather stats about response times.
+	  Say Y if you want to enable IPC flood test.
+	  If unsure, select "N".
+
 endif ## SND_SOC_SOF_DEBUG
 
 endif ## SND_SOC_SOF_OPTIONS
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 219c3becf670..54bb53bfc81b 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -17,6 +17,203 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+#define MAX_IPC_FLOOD_DURATION_MS 1000
+#define MAX_IPC_FLOOD_COUNT 10000
+#define IPC_FLOOD_TEST_RESULT_LEN 512
+
+static int sof_debug_ipc_flood_test(struct snd_sof_dev *sdev,
+				    struct snd_sof_dfsentry *dfse,
+				    bool flood_duration_test,
+				    unsigned long ipc_duration_ms,
+				    unsigned long ipc_count)
+{
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_reply reply;
+	u64 min_response_time = U64_MAX;
+	ktime_t start, end, test_end;
+	u64 avg_response_time = 0;
+	u64 max_response_time = 0;
+	u64 ipc_response_time;
+	int i = 0;
+	int ret;
+
+	/* configure test IPC */
+	hdr.cmd = SOF_IPC_GLB_TEST_MSG | SOF_IPC_TEST_IPC_FLOOD;
+	hdr.size = sizeof(hdr);
+
+	/* set test end time for duration flood test */
+	if (flood_duration_test)
+		test_end = ktime_get_ns() + ipc_duration_ms * NSEC_PER_MSEC;
+
+	/* send test IPC's */
+	while (1) {
+		start = ktime_get();
+		ret = sof_ipc_tx_message(sdev->ipc, hdr.cmd, &hdr, hdr.size,
+					 &reply, sizeof(reply));
+		end = ktime_get();
+
+		if (ret < 0)
+			break;
+
+		/* compute min and max response times */
+		ipc_response_time = ktime_to_ns(ktime_sub(end, start));
+		min_response_time = min(min_response_time, ipc_response_time);
+		max_response_time = max(max_response_time, ipc_response_time);
+
+		/* sum up response times */
+		avg_response_time += ipc_response_time;
+		i++;
+
+		/* test complete? */
+		if (flood_duration_test) {
+			if (ktime_to_ns(end) >= test_end)
+				break;
+		} else {
+			if (i == ipc_count)
+				break;
+		}
+	}
+
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: ipc flood test failed at %d iterations\n", i);
+
+	/* return if the first IPC fails */
+	if (!i)
+		return ret;
+
+	/* compute average response time */
+	do_div(avg_response_time, i);
+
+	/* clear previous test output */
+	memset(dfse->cache_buf, 0, IPC_FLOOD_TEST_RESULT_LEN);
+
+	if (flood_duration_test) {
+		dev_dbg(sdev->dev, "IPC Flood test duration: %lums\n",
+			ipc_duration_ms);
+		snprintf(dfse->cache_buf, IPC_FLOOD_TEST_RESULT_LEN,
+			 "IPC Flood test duration: %lums\n", ipc_duration_ms);
+	}
+
+	dev_dbg(sdev->dev,
+		"IPC Flood count: %d, Avg response time: %lluns\n",
+		i, avg_response_time);
+	dev_dbg(sdev->dev, "Max response time: %lluns\n",
+		max_response_time);
+	dev_dbg(sdev->dev, "Min response time: %lluns\n",
+		min_response_time);
+
+	/* format output string */
+	snprintf(dfse->cache_buf + strlen(dfse->cache_buf),
+		 IPC_FLOOD_TEST_RESULT_LEN - strlen(dfse->cache_buf),
+		 "IPC Flood count: %d\nAvg response time: %lluns\n",
+		 i, avg_response_time);
+
+	snprintf(dfse->cache_buf + strlen(dfse->cache_buf),
+		 IPC_FLOOD_TEST_RESULT_LEN - strlen(dfse->cache_buf),
+		 "Max response time: %lluns\nMin response time: %lluns\n",
+		 max_response_time, min_response_time);
+
+	return ret;
+}
+#endif
+
+static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
+				  size_t count, loff_t *ppos)
+{
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	unsigned long ipc_duration_ms = 0;
+	bool flood_duration_test = false;
+	unsigned long ipc_count = 0;
+	int err;
+#endif
+	size_t size;
+	char *string;
+	int ret;
+
+	string = kzalloc(count, GFP_KERNEL);
+	if (!string)
+		return -ENOMEM;
+
+	size = simple_write_to_buffer(string, count, ppos, buffer, count);
+	ret = size;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+	/*
+	 * write op is only supported for ipc_flood_count or
+	 * ipc_flood_duration_ms debugfs entries atm.
+	 * ipc_flood_count floods the DSP with the number of IPC's specified.
+	 * ipc_duration_ms test floods the DSP for the time specified
+	 * in the debugfs entry.
+	 */
+	if (strcmp(dfse->dfsentry->d_name.name, "ipc_flood_count") &&
+	    strcmp(dfse->dfsentry->d_name.name, "ipc_flood_duration_ms"))
+		return -EINVAL;
+
+	if (!strcmp(dfse->dfsentry->d_name.name, "ipc_flood_duration_ms"))
+		flood_duration_test = true;
+
+	/* test completion criterion */
+	if (flood_duration_test)
+		ret = kstrtoul(string, 0, &ipc_duration_ms);
+	else
+		ret = kstrtoul(string, 0, &ipc_count);
+	if (ret < 0)
+		return ret;
+
+	/* limit max duration/ipc count for flood test */
+	if (flood_duration_test) {
+		if (!ipc_duration_ms) {
+			ret = size;
+			goto out;
+		}
+
+		/* find the minimum. min() is not used to avoid warnings */
+		if (ipc_duration_ms > MAX_IPC_FLOOD_DURATION_MS)
+			ipc_duration_ms = MAX_IPC_FLOOD_DURATION_MS;
+	} else {
+		if (!ipc_count) {
+			ret = size;
+			goto out;
+		}
+
+		/* find the minimum. min() is not used to avoid warnings */
+		if (ipc_count > MAX_IPC_FLOOD_COUNT)
+			ipc_count = MAX_IPC_FLOOD_COUNT;
+	}
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: debugfs write failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* flood test */
+	ret = sof_debug_ipc_flood_test(sdev, dfse, flood_duration_test,
+				       ipc_duration_ms, ipc_count);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: debugfs write failed to idle %d\n",
+				    err);
+
+	/* return size if test is successful */
+	if (ret >= 0)
+		ret = size;
+out:
+#endif
+	kfree(string);
+	return ret;
+}
+
 static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 				 size_t count, loff_t *ppos)
 {
@@ -28,6 +225,22 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 	int size;
 	u8 *buf;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+	if ((!strcmp(dfse->dfsentry->d_name.name, "ipc_flood_count") ||
+	     !strcmp(dfse->dfsentry->d_name.name, "ipc_flood_duration_ms")) &&
+	    dfse->cache_buf) {
+		if (*ppos)
+			return 0;
+
+		count = strlen(dfse->cache_buf);
+		size_ret = copy_to_user(buffer, dfse->cache_buf, count);
+		if (size_ret)
+			return -EFAULT;
+
+		*ppos += count;
+		return count;
+	}
+#endif
 	size = dfse->size;
 
 	/* validate position & count */
@@ -107,6 +320,7 @@ static const struct file_operations sof_dfs_fops = {
 	.open = simple_open,
 	.read = sof_dfsentry_read,
 	.llseek = default_llseek,
+	.write = sof_dfsentry_write,
 };
 
 /* create FS entry for debug files that can expose DSP memories, registers */
@@ -177,6 +391,17 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 	dfse->size = size;
 	dfse->sdev = sdev;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+	/*
+	 * cache_buf is unused for SOF_DFSENTRY_TYPE_BUF debugfs entries.
+	 * So, use it to save the results of the last IPC flood test.
+	 */
+	dfse->cache_buf = devm_kzalloc(sdev->dev, IPC_FLOOD_TEST_RESULT_LEN,
+				       GFP_KERNEL);
+	if (!dfse->cache_buf)
+		return -ENOMEM;
+#endif
+
 	dfse->dfsentry = debugfs_create_file(name, mode, sdev->debugfs_root,
 					     dfse, &sof_dfs_fops);
 	if (!dfse->dfsentry) {
@@ -221,6 +446,24 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 			return err;
 	}
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
+	/* create read-write ipc_flood_count debugfs entry */
+	err = snd_sof_debugfs_buf_item(sdev, NULL, 0,
+				       "ipc_flood_count", 0666);
+
+	/* errors are only due to memory allocation, not debugfs */
+	if (err < 0)
+		return err;
+
+	/* create read-write ipc_flood_duration_ms debugfs entry */
+	err = snd_sof_debugfs_buf_item(sdev, NULL, 0,
+				       "ipc_flood_duration_ms", 0666);
+
+	/* errors are only due to memory allocation, not debugfs */
+	if (err < 0)
+		return err;
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index ce22240cd93a..17f3d2a5a701 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -56,6 +56,10 @@
 #define SOF_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
 	SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_FLOAT)
 
+#define ENABLE_DEBUGFS_CACHEBUF \
+	(IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE) || \
+	 IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST))
+
 struct snd_sof_dev;
 struct snd_sof_ipc_msg;
 struct snd_sof_ipc;
@@ -226,7 +230,7 @@ struct snd_sof_dfsentry {
 	 * or if it is accessible only when the DSP is in D0.
 	 */
 	enum sof_debugfs_access_type access_type;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+#if ENABLE_DEBUGFS_CACHEBUF
 	char *cache_buf; /* buffer to cache the contents of debugfs memory */
 #endif
 	struct snd_sof_dev *sdev;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
