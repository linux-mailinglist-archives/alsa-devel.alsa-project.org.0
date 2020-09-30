Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97A27F58A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 00:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF3ED17C5;
	Thu,  1 Oct 2020 00:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF3ED17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601506462;
	bh=J59mO44yAjGIKtQe6GWEvb3rMEL+WbMlrY+9G2UmPEI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VwV4i7JEea0WoHc0Pr/Ec8ydacIQnMh2BBqNfURqmgZhvaEtgKkN3lRvzFHSfQ7wT
	 Izwhyae8IjRXbswT75mPbug4WZZXal/mNmPTnBO+TigJ1OLi0+mkacL+p6bflsI07q
	 BnYEmN0NM9qE7lXuNpjuMzX5gbZa242q3kCzh3S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FFF6F802DC;
	Thu,  1 Oct 2020 00:51:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 662D0F802C3; Thu,  1 Oct 2020 00:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C870BF801ED
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 00:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C870BF801ED
IronPort-SDR: b/3k17aoIrCZPEV7FP2dgzacRcKrd3o9vYj5AzX3cUhukNs5wm+ymb3zqCinCFK2v6kWLtHGkw
 GO1eZ1NopEYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="161811144"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="161811144"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 15:51:33 -0700
IronPort-SDR: RTWLqNUi8VyJOmtiDkGlP+bAmVfIjOJ/8v7Hx5vk/cIFM/NetaAdXcU9DNogp4pcSGOyOXa0la
 8WwKCRP9oOYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="350838144"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2020 15:51:32 -0700
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Date: Wed, 30 Sep 2020 15:50:48 -0700
Message-Id: <20200930225051.889607-4-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930225051.889607-1-david.m.ertman@intel.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, parav@nvidia.com,
 jgg@nvidia.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Create an SOF client driver for IPC flood test. This
driver is used to set up the debugfs entries and the
read/write ops for initiating the IPC flood test that
would be used to measure the min/max/avg response times
for sending IPCs to the DSP.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
---
 sound/soc/sof/Kconfig               |  10 +
 sound/soc/sof/Makefile              |   4 +
 sound/soc/sof/sof-ipc-test-client.c | 314 ++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 sound/soc/sof/sof-ipc-test-client.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index cea7efedafef..55a2a20c3ec9 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -190,6 +190,16 @@ config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
 	  Say Y if you want to enable IPC flood test.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_CLIENT
+	tristate "SOF enable IPC flood test client"
+	depends on SND_SOC_SOF_CLIENT
+	help
+	  This option enables a separate client device for IPC flood test
+	  which can be used to flood the DSP with test IPCs and gather stats
+	  about response times.
+	  Say Y if you want to enable IPC flood test.
+	  If unsure, select "N".
+
 config SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT
 	bool "SOF retain DSP context on any FW exceptions"
 	help
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 5e46f25a3851..baa93fe2cc9a 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -9,6 +9,8 @@ snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
 snd-sof-of-objs := sof-of-dev.o
 
+snd-sof-ipc-test-objs := sof-ipc-test-client.o
+
 snd-sof-nocodec-objs := nocodec.o
 
 obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
@@ -21,6 +23,8 @@ obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_CLIENT) += snd-sof-client.o
 
+obj-$(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST_CLIENT) += snd-sof-ipc-test.o
+
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
 obj-$(CONFIG_SND_SOC_SOF_IMX_TOPLEVEL) += imx/
 obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
diff --git a/sound/soc/sof/sof-ipc-test-client.c b/sound/soc/sof/sof-ipc-test-client.c
new file mode 100644
index 000000000000..c39d5009c75b
--- /dev/null
+++ b/sound/soc/sof/sof-ipc-test-client.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//
+
+#include <linux/completion.h>
+#include <linux/debugfs.h>
+#include <linux/ktime.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/ancillary_bus.h>
+#include <sound/sof/header.h>
+#include "sof-client.h"
+
+#define MAX_IPC_FLOOD_DURATION_MS 1000
+#define MAX_IPC_FLOOD_COUNT 10000
+#define IPC_FLOOD_TEST_RESULT_LEN 512
+#define SOF_IPC_CLIENT_SUSPEND_DELAY_MS 3000
+
+struct sof_ipc_client_data {
+	struct dentry *dfs_root;
+	char *buf;
+};
+
+/* helper function to perform the flood test */
+static int sof_debug_ipc_flood_test(struct sof_client_dev *cdev, bool flood_duration_test,
+				    unsigned long ipc_duration_ms, unsigned long ipc_count)
+{
+	struct sof_ipc_client_data *ipc_client_data = cdev->data;
+	struct device *dev = &cdev->ancildev.dev;
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_reply reply;
+	u64 min_response_time = U64_MAX;
+	u64 avg_response_time = 0;
+	u64 max_response_time = 0;
+	ktime_t cur = ktime_get();
+	ktime_t test_end;
+	int i = 0;
+	int ret = 0;
+
+	/* configure test IPC */
+	hdr.cmd = SOF_IPC_GLB_TEST_MSG | SOF_IPC_TEST_IPC_FLOOD;
+	hdr.size = sizeof(hdr);
+
+	/* set test end time for duration flood test */
+	test_end = ktime_get_ns() + ipc_duration_ms * NSEC_PER_MSEC;
+
+	/* send test IPC's */
+	for (i = 0; flood_duration_test ? ktime_to_ns(cur) < test_end : i < ipc_count; i++) {
+		ktime_t start;
+		u64 ipc_response_time;
+
+		start = ktime_get();
+		ret = sof_client_ipc_tx_message(cdev, hdr.cmd,
+						&hdr, hdr.size, &reply,
+						sizeof(reply));
+		if (ret < 0)
+			break;
+		cur = ktime_get();
+
+		/* compute min and max response times */
+		ipc_response_time = ktime_to_ns(ktime_sub(cur, start));
+		min_response_time = min(min_response_time, ipc_response_time);
+		max_response_time = max(max_response_time, ipc_response_time);
+
+		/* sum up response times */
+		avg_response_time += ipc_response_time;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	/* return if the first IPC fails */
+	if (!i)
+		return ret;
+
+	/* compute average response time */
+	DIV_ROUND_CLOSEST(avg_response_time, i);
+
+	/* clear previous test output */
+	memset(ipc_client_data->buf, 0, IPC_FLOOD_TEST_RESULT_LEN);
+
+	if (flood_duration_test) {
+		dev_dbg(dev, "IPC Flood test duration: %lums\n", ipc_duration_ms);
+		snprintf(ipc_client_data->buf, IPC_FLOOD_TEST_RESULT_LEN,
+			 "IPC Flood test duration: %lums\n", ipc_duration_ms);
+	}
+
+	dev_dbg(dev,
+		"IPC Flood count: %d, Avg response time: %lluns\n", i, avg_response_time);
+	dev_dbg(dev, "Max response time: %lluns\n", max_response_time);
+	dev_dbg(dev, "Min response time: %lluns\n", min_response_time);
+
+	/* format output string and save test results */
+	snprintf(ipc_client_data->buf + strlen(ipc_client_data->buf),
+		 IPC_FLOOD_TEST_RESULT_LEN - strlen(ipc_client_data->buf),
+		 "IPC Flood count: %d\nAvg response time: %lluns\n", i, avg_response_time);
+
+	snprintf(ipc_client_data->buf + strlen(ipc_client_data->buf),
+		 IPC_FLOOD_TEST_RESULT_LEN - strlen(ipc_client_data->buf),
+		 "Max response time: %lluns\nMin response time: %lluns\n",
+		 max_response_time, min_response_time);
+
+	return ret;
+}
+
+/*
+ * Writing to the debugfs entry initiates the IPC flood test based on
+ * the IPC count or the duration specified by the user.
+ */
+static ssize_t sof_ipc_dfsentry_write(struct file *file, const char __user *buffer,
+				      size_t count, loff_t *ppos)
+{
+	struct dentry *dentry = file->f_path.dentry;
+	struct sof_client_dev *cdev = file->private_data;
+	struct device *dev = &cdev->ancildev.dev;
+	unsigned long ipc_duration_ms = 0;
+	bool flood_duration_test;
+	unsigned long ipc_count = 0;
+	char *string;
+	size_t size;
+	int err;
+	int ret;
+
+	string = kzalloc(count, GFP_KERNEL);
+	if (!string)
+		return -ENOMEM;
+
+	size = simple_write_to_buffer(string, count, ppos, buffer, count);
+
+	flood_duration_test = !strcmp(dentry->d_name.name, "ipc_flood_duration_ms");
+
+	/* set test completion criterion */
+	ret = flood_duration_test ? kstrtoul(string, 0, &ipc_duration_ms) :
+			kstrtoul(string, 0, &ipc_count);
+	if (ret < 0)
+		goto out;
+
+	/* limit max duration/ipc count for flood test */
+	if (flood_duration_test) {
+		if (!ipc_duration_ms) {
+			ret = size;
+			goto out;
+		}
+
+		ipc_duration_ms = min_t(unsigned long, ipc_duration_ms, MAX_IPC_FLOOD_DURATION_MS);
+	} else {
+		if (!ipc_count) {
+			ret = size;
+			goto out;
+		}
+
+		ipc_count = min_t(unsigned long, ipc_count, MAX_IPC_FLOOD_COUNT);
+	}
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(dev, "error: debugfs write failed to resume %d\n", ret);
+		pm_runtime_put_noidle(dev);
+		goto out;
+	}
+
+	/* flood test */
+	ret = sof_debug_ipc_flood_test(cdev, flood_duration_test, ipc_duration_ms, ipc_count);
+
+	pm_runtime_mark_last_busy(dev);
+	err = pm_runtime_put_autosuspend(dev);
+	if (err < 0) {
+		ret = err;
+		goto out;
+	}
+
+	/* return size if test is successful */
+	if (ret >= 0)
+		ret = size;
+out:
+	kfree(string);
+	return ret;
+}
+
+/* return the result of the last IPC flood test */
+static ssize_t sof_ipc_dfsentry_read(struct file *file, char __user *buffer,
+				     size_t count, loff_t *ppos)
+{
+	struct sof_client_dev *cdev = file->private_data;
+	struct sof_ipc_client_data *ipc_client_data = cdev->data;
+	size_t size_ret;
+
+	if (*ppos)
+		return 0;
+
+	/* return results of the last IPC test */
+	count = min_t(size_t, count, strlen(ipc_client_data->buf));
+	size_ret = copy_to_user(buffer, ipc_client_data->buf, count);
+	if (size_ret)
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+static const struct file_operations sof_ipc_dfs_fops = {
+	.open = simple_open,
+	.read = sof_ipc_dfsentry_read,
+	.llseek = default_llseek,
+	.write = sof_ipc_dfsentry_write,
+};
+
+/*
+ * The IPC test client creates a couple of debugfs entries that will be used
+ * flood tests. Users can write to these entries to execute the IPC flood test
+ * by specifying either the number of IPCs to flood the DSP with or the duration
+ * (in ms) for which the DSP should be flooded with test IPCs. At the
+ * end of each test, the average, min and max response times are reported back.
+ * The results of the last flood test can be accessed by reading the debugfs
+ * entries.
+ */
+static int sof_ipc_test_probe(struct ancillary_device *ancildev,
+			      const struct ancillary_device_id *id)
+{
+	struct sof_client_dev *cdev = ancillary_dev_to_sof_client_dev(ancildev);
+	struct sof_ipc_client_data *ipc_client_data;
+
+	/*
+	 * The ancillary device has a usage count of 0 even before runtime PM
+	 * is enabled. So, increment the usage count to let the device
+	 * suspend after probe is complete.
+	 */
+	pm_runtime_get_noresume(&ancildev->dev);
+
+	/* allocate memory for client data */
+	ipc_client_data = devm_kzalloc(&ancildev->dev, sizeof(*ipc_client_data), GFP_KERNEL);
+	if (!ipc_client_data)
+		return -ENOMEM;
+
+	ipc_client_data->buf = devm_kzalloc(&ancildev->dev, IPC_FLOOD_TEST_RESULT_LEN, GFP_KERNEL);
+	if (!ipc_client_data->buf)
+		return -ENOMEM;
+
+	cdev->data = ipc_client_data;
+
+	/* create debugfs root folder with device name under parent SOF dir */
+	ipc_client_data->dfs_root = debugfs_create_dir(dev_name(&ancildev->dev),
+						       sof_client_get_debugfs_root(cdev));
+
+	/* create read-write ipc_flood_count debugfs entry */
+	debugfs_create_file("ipc_flood_count", 0644, ipc_client_data->dfs_root,
+			    cdev, &sof_ipc_dfs_fops);
+
+	/* create read-write ipc_flood_duration_ms debugfs entry */
+	debugfs_create_file("ipc_flood_duration_ms", 0644, ipc_client_data->dfs_root,
+			    cdev, &sof_ipc_dfs_fops);
+
+	/* enable runtime PM */
+	pm_runtime_set_autosuspend_delay(&ancildev->dev, SOF_IPC_CLIENT_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&ancildev->dev);
+	pm_runtime_set_active(&ancildev->dev);
+	pm_runtime_enable(&ancildev->dev);
+	pm_runtime_mark_last_busy(&ancildev->dev);
+	pm_runtime_put_autosuspend(&ancildev->dev);
+
+	return 0;
+}
+
+static int sof_ipc_test_cleanup(struct ancillary_device *ancildev)
+{
+	pm_runtime_disable(&ancildev->dev);
+
+	return 0;
+}
+
+static int sof_ipc_test_remove(struct ancillary_device *ancildev)
+{
+	return sof_ipc_test_cleanup(ancildev);
+}
+
+static void sof_ipc_test_shutdown(struct ancillary_device *ancildev)
+{
+	sof_ipc_test_cleanup(ancildev);
+}
+
+static const struct ancillary_device_id sof_ipc_ancilbus_id_table[] = {
+	{ .name = "snd_sof_client.ipc_test" },
+	{},
+};
+MODULE_DEVICE_TABLE(ancillary, sof_ipc_ancilbus_id_table);
+
+/*
+ * No need for driver pm_ops as the generic pm callbacks in the ancillary bus type are enough to
+ * ensure that the parent SOF device resumes to bring the DSP back to D0.
+ */
+static struct sof_client_drv sof_ipc_test_client_drv = {
+	.name = "sof-ipc-test-client-drv",
+	.ancillary_drv = {
+		.driver = {
+			.name = "sof-ipc-test-ancilbus-drv",
+		},
+		.id_table = sof_ipc_ancilbus_id_table,
+		.probe = sof_ipc_test_probe,
+		.remove = sof_ipc_test_remove,
+		.shutdown = sof_ipc_test_shutdown,
+	},
+};
+
+module_sof_client_driver(sof_ipc_test_client_drv);
+
+MODULE_DESCRIPTION("SOF IPC Test Client Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
-- 
2.26.2

