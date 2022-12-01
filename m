Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288163F66E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:44:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918E9180F;
	Thu,  1 Dec 2022 18:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918E9180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916678;
	bh=WiMkRO5jxjZo0CAvNvZXEvDZZaS+yMzwRYUdLqz/yy8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wjn/lhiNch4Fg6w31Nlzjx96YEWdsrIg4M7FNgpdxugZGBkPp8Ypa700MyJTfHOTS
	 09lVTGnd+yLH/I0EutV2PJ9gnD6+s9Ypq+ag53p9OytQpE1wjGi3oDxcMaNLlgMf1L
	 fv/bMKT5ilGeuEN015fWxT5qbCKniddAx8q5CsRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 978CEF805DF;
	Thu,  1 Dec 2022 18:39:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8AB3F805D4; Thu,  1 Dec 2022 18:39:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F73CF805C6
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F73CF805C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jRKxzZW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916390; x=1701452390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WiMkRO5jxjZo0CAvNvZXEvDZZaS+yMzwRYUdLqz/yy8=;
 b=jRKxzZW/IJtjTXCIPwVYbMDgfCebrTIEP/2Z83pE1W586BnbtFZ77iw/
 +cUhONPW622us+EqA67SlpQaZ3c2O1fEKafzxZQZSwxbh1PdaDWFKmD3g
 EVQ/ODmINMBTdWkiQ9MS5yUKdOicH5UT/6AxmnWZeI2tzY/+L5/ekELq9
 o4yY+8kjUOi6FEfyKxSaLRCPMObQ4L0+6x71ThHrLJAZ0YYKAxjAQ2hzK
 LXmmfYgeCDBRzrc8KgjCoUkVM+hNI64BBLEjztNxPXtid3WOJNqYt0Omu
 Rc8J3+/S7riGvk+VRrSS9xNd1GmvpX1nbQ1SqrUILIxhX/1EhgdApO6Cr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908503"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908503"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889824115"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889824115"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 15/16] ASoC: Intel: avs: Allow for dumping FW_REGS area
Date: Thu,  1 Dec 2022 18:56:18 +0100
Message-Id: <20221201175619.504758-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

SRAM0 window begins with a block of memory, usually of size PAGE_SIZE,
dedicated to the base firmware registers. When debugging firmware, it is
desirable to be able to dump them at will.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index e7b0b99824aa..e9042d4328c4 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -48,6 +48,29 @@ void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsig
 	wake_up(&adev->trace_waitq);
 }
 
+static ssize_t fw_regs_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	char *buf;
+	int ret;
+
+	buf = kzalloc(AVS_FW_REGS_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, avs_sram_addr(adev, AVS_FW_REGS_WINDOW), AVS_FW_REGS_SIZE);
+
+	ret = simple_read_from_buffer(to, count, ppos, buf, AVS_FW_REGS_SIZE);
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations fw_regs_fops = {
+	.open = simple_open,
+	.read = fw_regs_read,
+	.llseek = no_llseek,
+};
+
 static ssize_t probe_points_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
 {
 	struct avs_dev *adev = file->private_data;
@@ -369,6 +392,7 @@ void avs_debugfs_init(struct avs_dev *adev)
 
 	debugfs_create_file("strace", 0444, adev->debugfs_root, adev, &strace_fops);
 	debugfs_create_file("trace_control", 0644, adev->debugfs_root, adev, &trace_control_fops);
+	debugfs_create_file("fw_regs", 0444, adev->debugfs_root, adev, &fw_regs_fops);
 
 	debugfs_create_u32("trace_aging_period", 0644, adev->debugfs_root,
 			   &adev->aging_timer_period);
-- 
2.25.1

