Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4F640924
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148281860;
	Fri,  2 Dec 2022 16:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148281860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994162;
	bh=WiMkRO5jxjZo0CAvNvZXEvDZZaS+yMzwRYUdLqz/yy8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4X7uJME3hg6N5hj1mecrDGZS89y8uCs5mC0faIq0sSH8ltqWkRGqEJpU4o/+Q0WD
	 h2cgnctfUntpsI/fC9o6yyzPiP8kew86IKnHNRSrmplMEls/ca+abq8LofOryG4XrW
	 z9Tl1eknY302kvpCGqsBPMLQgD/cW3SECe7do2Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 003BCF805B2;
	Fri,  2 Dec 2022 16:12:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F9ACF80162; Fri,  2 Dec 2022 16:12:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 341C2F80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341C2F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VE3hFid/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993927; x=1701529927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WiMkRO5jxjZo0CAvNvZXEvDZZaS+yMzwRYUdLqz/yy8=;
 b=VE3hFid/tNyz8Fyl0OSG8ZOXUbxocKOu2T0iJsDZJjUpq7EnXKICYwtj
 U3jMpXyW89d8HPGT1waRQR8bUZ/BaE6lwZQ0cyFu1dmliA8fdGvI1Anh2
 U2B0Y3yR40zk1JEuNJ6kVOK0nnRrPTu+ff5Mop9ye6hlYwOHoLO8nWpQH
 lJ509TccKp1l3/oFjWsmglwbQUFrPkOZw1t76L/L38vTPTtr0fLWlEzM8
 Ro7eDqARXmC1hJkjycCaET7/oROHDy6i7C9eDPa6Lt+TPWrLjkYggi222
 0gon5L11TCZUcpAzwn4nwmAkmsXc7zQg/2T3qYyGRcZIK8Y5JKbTmOqaD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251845"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251845"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:12:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504775"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504775"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:12:03 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 15/16] ASoC: Intel: avs: Allow for dumping FW_REGS area
Date: Fri,  2 Dec 2022 16:28:40 +0100
Message-Id: <20221202152841.672536-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
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

