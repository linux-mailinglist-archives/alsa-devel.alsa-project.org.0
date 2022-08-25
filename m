Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A1F5A16CC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 18:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5483B161D;
	Thu, 25 Aug 2022 18:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5483B161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661445608;
	bh=liGkXhlAm+VXFh8bREExCiBE1UTrJqRblYdv6sZW+iA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQcwObodBWn7eQKFqF7k+Kro2S1AJPEK2l1H02PEyQBQJYIF2rtaj1oDcVBGuZ4Im
	 4XvY8qa2kFRTtfLpbTugXmbigS3G/GrTZZsDZ/T/q6jQHFjWSrOzAzKxIg1R+g27gU
	 POqGirWmJXaIQwV+gs7PE9Gbsx2HVtIZSCBqy2A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF475F80271;
	Thu, 25 Aug 2022 18:39:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F394F80271; Thu, 25 Aug 2022 18:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91B93F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 18:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B93F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LZ7EyQHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661445541; x=1692981541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=liGkXhlAm+VXFh8bREExCiBE1UTrJqRblYdv6sZW+iA=;
 b=LZ7EyQHgsC2YxJ/ozSOV3rQfZyT8Q+bXj5qZsPxb93yBaUGIMlscyFMS
 hToduK0ryYHHMwafNe/FmcbEYR3UC6BhU06AvvCXb/VfdOlmo33WK6BKa
 ifreGRJBBkLMERt0QiJ9IuVeZTe1npeBJUFVkQwlhsKid+6s4TmInQmef
 j5Tw9FuE1475+Z3ymdsNrm20wqmnHpEry5LYGytyr5n7/cDv6E2zWhGP3
 kxZmhkqTH2K9cgm2NtLAi1vwWlBLA37YiAkMNbGTIzGB7ObUbWmfewTGJ
 Spc6ju+v7oc6MhFRfgfAEgg2nUNPINw5T/+mgvaTo2nLCD5kqOAfuAzjZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="356013033"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="356013033"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 09:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="671070433"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2022 09:38:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 1/2] libfs: Introduce tokenize_user_input()
Date: Thu, 25 Aug 2022 18:48:32 +0200
Message-Id: <20220825164833.3923454-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825164833.3923454-1-cezary.rojewski@intel.com>
References: <20220825164833.3923454-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, hdegoede@redhat.com,
 andy.shevchenko@gmail.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, linux-fsdevel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
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

Add new helper function to allow for splitting specified user string
into a sequence of integers. Internally it makes use of get_options() so
the returned sequence contains the integers extracted plus an additional
element that begins the sequence and specifies the integers count.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 fs/libfs.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  1 +
 2 files changed, 46 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 31b0ddf01c31..078b23e26741 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -809,6 +809,51 @@ ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *ppos,
 }
 EXPORT_SYMBOL(simple_write_to_buffer);
 
+/**
+ * tokenize_user_input - Split string into a sequence of integers
+ * @from:	The user space buffer to read from
+ * @ppos:	The current position in the buffer
+ * @count:	The maximum number of bytes to read
+ * @tkns:	Returned pointer to sequence of integers
+ *
+ * On success @tkns is allocated and initialized with a sequence of
+ * integers extracted from the @from plus an additional element that
+ * begins the sequence and specifies the integers count.
+ *
+ * Caller takes responsibility for freeing @tkns when it is no longer
+ * needed.
+ */
+int tokenize_user_input(const char __user *from, size_t count, int **tkns)
+{
+	int *ints, nints;
+	char *buf;
+	int ret = 0;
+
+	buf = memdup_user_nul(from, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	get_options(buf, 0, &nints);
+	if (!nints) {
+		ret = -ENOENT;
+		goto free_buf;
+	}
+
+	ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
+	if (!ints) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+
+	get_options(buf, nints + 1, ints);
+	*tkns = ints;
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL(tokenize_user_input);
+
 /**
  * memory_read_from_buffer - copy data from the buffer
  * @to: the kernel space buffer to read to
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 9eced4cc286e..ab04cc7f9efa 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3345,6 +3345,7 @@ extern ssize_t simple_read_from_buffer(void __user *to, size_t count,
 			loff_t *ppos, const void *from, size_t available);
 extern ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *ppos,
 		const void __user *from, size_t count);
+extern int tokenize_user_input(const char __user *from, size_t count, int **tkns);
 
 extern int __generic_file_fsync(struct file *, loff_t, loff_t, int);
 extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
-- 
2.25.1

