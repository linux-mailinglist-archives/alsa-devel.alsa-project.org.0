Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B063F674
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:44:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E7A1816;
	Thu,  1 Dec 2022 18:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E7A1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916693;
	bh=ZUO2Xh3/mt/TDW+MY4Lc0/z+D/4ZkLLW6lTtunZ01fw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiQcGL1UgH4Vivw/u5ab6fWROfgGr3usIws9iNp24jgMIrwvroE3eUp841R7nNfjH
	 ap1PQEoNIsQnS+k3RKaZRICtIcF71Rb6HR4dwRQVleE3Gbpzig34aJPPE6HlDEIUO+
	 nj1QTM5MYncm1Rc03TaEqX0KYd9Hl0UtZ2blwtwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CD8F805E7;
	Thu,  1 Dec 2022 18:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA5D7F805E6; Thu,  1 Dec 2022 18:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF118F804D0
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF118F804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hgMZwLhV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916393; x=1701452393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZUO2Xh3/mt/TDW+MY4Lc0/z+D/4ZkLLW6lTtunZ01fw=;
 b=hgMZwLhV9ajhiqg84sIxfTCzm9yXkxaG6++y8lQ+y+q9sBgH0Bs1inIV
 6DJF5GDREUk34vt+uxYrg+X2PL1GHPqO7cAXQH5IdRNyCkCMMuIvZPxN1
 dTMlZyDH42fMSqwj2e9JjjL6/vvqzyYeUDzaYuGPZ7P3nc09ZpISX1i3t
 t73h2Hc8zfryxHdz3PFFTL+Q2/7N36izGhrUBgosesiooJqgIzLbJmL8u
 D5N5+M+8hz/YyRIsVqOQg+dzDFK79w97/G93K7sO/nFJ0TOOUUps98C1t
 rItciilcWthT3oyh90gQF3eQZzJrmV6ldZPgN2BjkoxAK+sUddtH2ZebS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908511"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908511"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889824145"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889824145"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 16/16] ASoC: Intel: avs: Allow for dumping debug window
 snapshot
Date: Thu,  1 Dec 2022 18:56:19 +0100
Message-Id: <20221201175619.504758-17-cezary.rojewski@intel.com>
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

Add new read-only debugfs entry which dumps entire content of the SRAM
window 2 i.e.: the debug window.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c   | 26 ++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index e9042d4328c4..bdd388ec01ea 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -71,6 +71,31 @@ static const struct file_operations fw_regs_fops = {
 	.llseek = no_llseek,
 };
 
+static ssize_t debug_window_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	size_t size;
+	char *buf;
+	int ret;
+
+	size = adev->hw_cfg.dsp_cores * AVS_WINDOW_CHUNK_SIZE;
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, avs_sram_addr(adev, AVS_DEBUG_WINDOW), size);
+
+	ret = simple_read_from_buffer(to, count, ppos, buf, size);
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations debug_window_fops = {
+	.open = simple_open,
+	.read = debug_window_read,
+	.llseek = no_llseek,
+};
+
 static ssize_t probe_points_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
 {
 	struct avs_dev *adev = file->private_data;
@@ -393,6 +418,7 @@ void avs_debugfs_init(struct avs_dev *adev)
 	debugfs_create_file("strace", 0444, adev->debugfs_root, adev, &strace_fops);
 	debugfs_create_file("trace_control", 0644, adev->debugfs_root, adev, &trace_control_fops);
 	debugfs_create_file("fw_regs", 0444, adev->debugfs_root, adev, &fw_regs_fops);
+	debugfs_create_file("debug_window", 0444, adev->debugfs_root, adev, &debug_window_fops);
 
 	debugfs_create_u32("trace_aging_period", 0644, adev->debugfs_root,
 			   &adev->aging_timer_period);
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 95be86148cf3..2b464e466ed5 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -59,7 +59,8 @@
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
 #define AVS_FW_REG_ERROR_CODE(adev)	(AVS_FW_REG_BASE(adev) + 0x4)
 
-#define AVS_FW_REGS_SIZE		PAGE_SIZE
+#define AVS_WINDOW_CHUNK_SIZE		PAGE_SIZE
+#define AVS_FW_REGS_SIZE		AVS_WINDOW_CHUNK_SIZE
 #define AVS_FW_REGS_WINDOW		0
 /* DSP -> HOST communication window */
 #define AVS_UPLINK_WINDOW		AVS_FW_REGS_WINDOW
-- 
2.25.1

