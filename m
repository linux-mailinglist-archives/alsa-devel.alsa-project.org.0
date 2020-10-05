Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE52283FBB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 21:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80FB217DA;
	Mon,  5 Oct 2020 21:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80FB217DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601926514;
	bh=DqWeoQn0l0xFGVjVNhHqsrA+RJqAgH8fi62yf7PvpH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GLjokQkngMr7x9wqWTkGYeteYVcBUILRM5i6OWW9EgfnVxTMhO9ffMFgBxTt76cp7
	 m1vQOZQDJyZXxX+gDGaBDfLqyu/NR2FmlaVfRSsHQGLW1wz66EESLSQHAquHVOgEVr
	 G5AMdPXiITyNyLstNwWfJxLKfqwLEJ32JFrqY10Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 886A0F802E2;
	Mon,  5 Oct 2020 21:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC3BBF802A0; Mon,  5 Oct 2020 21:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C45F80260
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 21:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C45F80260
IronPort-SDR: UYp1iGdyym2Er73dAhyoe1dhjpo9kVlyXpIX4E4W2x56DLfnCzgWMpno8oFN1vC2HQEp8S51Hb
 +z7WwzAiHeKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="225493096"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="225493096"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 12:19:40 -0700
IronPort-SDR: z+Qeek17kbbV1JcPCYGo4VDTFcPwpA/q64+Sb5mWmqAevtSNzdbxBftfHIxg3X8NKi2M7ATaLq
 zNWeH8LwLs0w==
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="341303029"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 11:27:27 -0700
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 6/6] ASoC: SOF: debug: Remove IPC flood test support in SOF
 core
Date: Mon,  5 Oct 2020 11:24:46 -0700
Message-Id: <20201005182446.977325-7-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005182446.977325-1-david.m.ertman@intel.com>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 fred.oh@linux.intel.com, linux-rdma@vger.kernel.org, dledford@redhat.com,
 broonie@kernel.org, jgg@nvidia.com, gregkh@linuxfoundation.org,
 kuba@kernel.org, dan.j.williams@intel.com, shiraz.saleem@intel.com,
 davem@davemloft.net, kiran.patil@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

Remove the IPC flood test support in the SOF core as it is
now added in the IPC flood test client.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
---
 sound/soc/sof/Kconfig    |   8 --
 sound/soc/sof/debug.c    | 230 ---------------------------------------
 sound/soc/sof/sof-priv.h |   6 +-
 3 files changed, 1 insertion(+), 243 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 55a2a20c3ec9..4046e96eed92 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -182,14 +182,6 @@ config SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE
 	  module parameter (similar to dynamic debug)
 	  If unsure, select "N".
 
-config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
-	bool "SOF enable IPC flood test"
-	help
-	  This option enables the IPC flood test which can be used to flood
-	  the DSP with test IPCs and gather stats about response times.
-	  Say Y if you want to enable IPC flood test.
-	  If unsure, select "N".
-
 config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_CLIENT
 	tristate "SOF enable IPC flood test client"
 	depends on SND_SOC_SOF_CLIENT
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 8e15f105d1d5..d224641768da 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -232,120 +232,10 @@ static int snd_sof_debugfs_probe_item(struct snd_sof_dev *sdev,
 }
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-#define MAX_IPC_FLOOD_DURATION_MS 1000
-#define MAX_IPC_FLOOD_COUNT 10000
-#define IPC_FLOOD_TEST_RESULT_LEN 512
-
-static int sof_debug_ipc_flood_test(struct snd_sof_dev *sdev,
-				    struct snd_sof_dfsentry *dfse,
-				    bool flood_duration_test,
-				    unsigned long ipc_duration_ms,
-				    unsigned long ipc_count)
-{
-	struct sof_ipc_cmd_hdr hdr;
-	struct sof_ipc_reply reply;
-	u64 min_response_time = U64_MAX;
-	ktime_t start, end, test_end;
-	u64 avg_response_time = 0;
-	u64 max_response_time = 0;
-	u64 ipc_response_time;
-	int i = 0;
-	int ret;
-
-	/* configure test IPC */
-	hdr.cmd = SOF_IPC_GLB_TEST_MSG | SOF_IPC_TEST_IPC_FLOOD;
-	hdr.size = sizeof(hdr);
-
-	/* set test end time for duration flood test */
-	if (flood_duration_test)
-		test_end = ktime_get_ns() + ipc_duration_ms * NSEC_PER_MSEC;
-
-	/* send test IPC's */
-	while (1) {
-		start = ktime_get();
-		ret = sof_ipc_tx_message(sdev->ipc, hdr.cmd, &hdr, hdr.size,
-					 &reply, sizeof(reply));
-		end = ktime_get();
-
-		if (ret < 0)
-			break;
-
-		/* compute min and max response times */
-		ipc_response_time = ktime_to_ns(ktime_sub(end, start));
-		min_response_time = min(min_response_time, ipc_response_time);
-		max_response_time = max(max_response_time, ipc_response_time);
-
-		/* sum up response times */
-		avg_response_time += ipc_response_time;
-		i++;
-
-		/* test complete? */
-		if (flood_duration_test) {
-			if (ktime_to_ns(end) >= test_end)
-				break;
-		} else {
-			if (i == ipc_count)
-				break;
-		}
-	}
-
-	if (ret < 0)
-		dev_err(sdev->dev,
-			"error: ipc flood test failed at %d iterations\n", i);
-
-	/* return if the first IPC fails */
-	if (!i)
-		return ret;
-
-	/* compute average response time */
-	do_div(avg_response_time, i);
-
-	/* clear previous test output */
-	memset(dfse->cache_buf, 0, IPC_FLOOD_TEST_RESULT_LEN);
-
-	if (flood_duration_test) {
-		dev_dbg(sdev->dev, "IPC Flood test duration: %lums\n",
-			ipc_duration_ms);
-		snprintf(dfse->cache_buf, IPC_FLOOD_TEST_RESULT_LEN,
-			 "IPC Flood test duration: %lums\n", ipc_duration_ms);
-	}
-
-	dev_dbg(sdev->dev,
-		"IPC Flood count: %d, Avg response time: %lluns\n",
-		i, avg_response_time);
-	dev_dbg(sdev->dev, "Max response time: %lluns\n",
-		max_response_time);
-	dev_dbg(sdev->dev, "Min response time: %lluns\n",
-		min_response_time);
-
-	/* format output string */
-	snprintf(dfse->cache_buf + strlen(dfse->cache_buf),
-		 IPC_FLOOD_TEST_RESULT_LEN - strlen(dfse->cache_buf),
-		 "IPC Flood count: %d\nAvg response time: %lluns\n",
-		 i, avg_response_time);
-
-	snprintf(dfse->cache_buf + strlen(dfse->cache_buf),
-		 IPC_FLOOD_TEST_RESULT_LEN - strlen(dfse->cache_buf),
-		 "Max response time: %lluns\nMin response time: %lluns\n",
-		 max_response_time, min_response_time);
-
-	return ret;
-}
-#endif
 
 static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 				  size_t count, loff_t *ppos)
 {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	struct snd_sof_dfsentry *dfse = file->private_data;
-	struct snd_sof_dev *sdev = dfse->sdev;
-	unsigned long ipc_duration_ms = 0;
-	bool flood_duration_test = false;
-	unsigned long ipc_count = 0;
-	struct dentry *dentry;
-	int err;
-#endif
 	size_t size;
 	char *string;
 	int ret;
@@ -357,78 +247,6 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	size = simple_write_to_buffer(string, count, ppos, buffer, count);
 	ret = size;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	/*
-	 * write op is only supported for ipc_flood_count or
-	 * ipc_flood_duration_ms debugfs entries atm.
-	 * ipc_flood_count floods the DSP with the number of IPC's specified.
-	 * ipc_duration_ms test floods the DSP for the time specified
-	 * in the debugfs entry.
-	 */
-	dentry = file->f_path.dentry;
-	if (strcmp(dentry->d_name.name, "ipc_flood_count") &&
-	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (!strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
-		flood_duration_test = true;
-
-	/* test completion criterion */
-	if (flood_duration_test)
-		ret = kstrtoul(string, 0, &ipc_duration_ms);
-	else
-		ret = kstrtoul(string, 0, &ipc_count);
-	if (ret < 0)
-		goto out;
-
-	/* limit max duration/ipc count for flood test */
-	if (flood_duration_test) {
-		if (!ipc_duration_ms) {
-			ret = size;
-			goto out;
-		}
-
-		/* find the minimum. min() is not used to avoid warnings */
-		if (ipc_duration_ms > MAX_IPC_FLOOD_DURATION_MS)
-			ipc_duration_ms = MAX_IPC_FLOOD_DURATION_MS;
-	} else {
-		if (!ipc_count) {
-			ret = size;
-			goto out;
-		}
-
-		/* find the minimum. min() is not used to avoid warnings */
-		if (ipc_count > MAX_IPC_FLOOD_COUNT)
-			ipc_count = MAX_IPC_FLOOD_COUNT;
-	}
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: debugfs write failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		goto out;
-	}
-
-	/* flood test */
-	ret = sof_debug_ipc_flood_test(sdev, dfse, flood_duration_test,
-				       ipc_duration_ms, ipc_count);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: debugfs write failed to idle %d\n",
-				    err);
-
-	/* return size if test is successful */
-	if (ret >= 0)
-		ret = size;
-out:
-#endif
 	kfree(string);
 	return ret;
 }
@@ -444,25 +262,6 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 	int size;
 	u8 *buf;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	struct dentry *dentry;
-
-	dentry = file->f_path.dentry;
-	if ((!strcmp(dentry->d_name.name, "ipc_flood_count") ||
-	     !strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) &&
-	    dfse->cache_buf) {
-		if (*ppos)
-			return 0;
-
-		count = strlen(dfse->cache_buf);
-		size_ret = copy_to_user(buffer, dfse->cache_buf, count);
-		if (size_ret)
-			return -EFAULT;
-
-		*ppos += count;
-		return count;
-	}
-#endif
 	size = dfse->size;
 
 	/* validate position & count */
@@ -606,17 +405,6 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 	dfse->size = size;
 	dfse->sdev = sdev;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	/*
-	 * cache_buf is unused for SOF_DFSENTRY_TYPE_BUF debugfs entries.
-	 * So, use it to save the results of the last IPC flood test.
-	 */
-	dfse->cache_buf = devm_kzalloc(sdev->dev, IPC_FLOOD_TEST_RESULT_LEN,
-				       GFP_KERNEL);
-	if (!dfse->cache_buf)
-		return -ENOMEM;
-#endif
-
 	debugfs_create_file(name, mode, sdev->debugfs_root, dfse,
 			    &sof_dfs_fops);
 	/* add to dfsentry list */
@@ -662,24 +450,6 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 		return err;
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	/* create read-write ipc_flood_count debugfs entry */
-	err = snd_sof_debugfs_buf_item(sdev, NULL, 0,
-				       "ipc_flood_count", 0666);
-
-	/* errors are only due to memory allocation, not debugfs */
-	if (err < 0)
-		return err;
-
-	/* create read-write ipc_flood_duration_ms debugfs entry */
-	err = snd_sof_debugfs_buf_item(sdev, NULL, 0,
-				       "ipc_flood_duration_ms", 0666);
-
-	/* errors are only due to memory allocation, not debugfs */
-	if (err < 0)
-		return err;
-#endif
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1c29199132c5..a20870900a76 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -50,10 +50,6 @@ extern int sof_core_debug;
 #define SOF_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
 	SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_FLOAT)
 
-#define ENABLE_DEBUGFS_CACHEBUF \
-	(IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE) || \
-	 IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST))
-
 /* DSP power state */
 enum sof_dsp_power_states {
 	SOF_DSP_PM_D0,
@@ -298,7 +294,7 @@ struct snd_sof_dfsentry {
 	 * or if it is accessible only when the DSP is in D0.
 	 */
 	enum sof_debugfs_access_type access_type;
-#if ENABLE_DEBUGFS_CACHEBUF
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 	char *cache_buf; /* buffer to cache the contents of debugfs memory */
 #endif
 	struct snd_sof_dev *sdev;
-- 
2.26.2

