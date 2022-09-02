Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9315AB15A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 15:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825C21651;
	Fri,  2 Sep 2022 15:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825C21651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662125116;
	bh=qwD2MnFCCPaeWqxY3gsH7fYiNvcGic+bi1IDybKnebc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uImdIz6kr9IVX3DM51Ty3tGDKVrdRWla9CDOwI4kiEzuPJtogKn9vR95W9c/PS9dj
	 zp+iCBKtp7dOt9CEpEDlCT/rPjxzgaVBJm15wLg4OXbOEhml+iEVYe0+vfy8xlMNCG
	 IpKgr3DAHWthzwNpcMnw+O+lZLPCpEWlrEJlA5Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66595F8020D;
	Fri,  2 Sep 2022 15:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 042E7F804E6; Fri,  2 Sep 2022 15:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E72F80125
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 15:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E72F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ci06ZuW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662125052; x=1693661052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qwD2MnFCCPaeWqxY3gsH7fYiNvcGic+bi1IDybKnebc=;
 b=Ci06ZuW8ci/u7s3v8PIM1Dw56EHK5TWqN6Max9uygfVE2vlK0aNpPtzp
 gxs/3yoIMpr/0uzcK8PopW7W8hYIKmhvquIDP6MbRDh7fqG5B38S3WM6S
 1KImz7Weh8drW38axbNq0gsjS96+IvaExY5AIlMrujokI4u1M/l3ikQwC
 sZQrFArdVCHCB4aOXioknyMx1c4dtdf8kZq6qS3EGVbEKEk3NoT86m48c
 RcrXlbXXIMMGUaVcWv2gz8jlviNMmp0Uogq1o+2hoWpOLqS9Eb/FrXuED
 7KS1g0YwdrNMWwiH3oeJY8qvOq1hDf8na/W6eEdpBy/CS9k007Tmn1fqo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="357694849"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="357694849"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674352566"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2022 06:23:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v5 1/2] lib/string_helpers: Introduce parse_int_array_user()
Date: Fri,  2 Sep 2022 15:32:55 +0200
Message-Id: <20220902133256.789165-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902133256.789165-1-cezary.rojewski@intel.com>
References: <20220902133256.789165-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: andy@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 intel-poland@eclists.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, willy@infradead.org, lgirdwood@gmail.com,
 hdegoede@redhat.com, andy.shevchenko@gmail.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/string_helpers.h |  2 ++
 lib/string_helpers.c           | 44 ++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 4d72258d42fd..dc2e726fd820 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -21,6 +21,8 @@ enum string_size_units {
 void string_get_size(u64 size, u64 blk_size, enum string_size_units units,
 		     char *buf, int len);
 
+int parse_int_array_user(const char __user *from, size_t count, int **array);
+
 #define UNESCAPE_SPACE		BIT(0)
 #define UNESCAPE_OCTAL		BIT(1)
 #define UNESCAPE_HEX		BIT(2)
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 5ed3beb066e6..230020a2e076 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -131,6 +131,50 @@ void string_get_size(u64 size, u64 blk_size, const enum string_size_units units,
 }
 EXPORT_SYMBOL(string_get_size);
 
+/**
+ * parse_int_array_user - Split string into a sequence of integers
+ * @from:	The user space buffer to read from
+ * @count:	The maximum number of bytes to read
+ * @array:	Returned pointer to sequence of integers
+ *
+ * On success @array is allocated and initialized with a sequence of
+ * integers extracted from the @from plus an additional element that
+ * begins the sequence and specifies the integers count.
+ *
+ * Caller takes responsibility for freeing @array when it is no longer
+ * needed.
+ */
+int parse_int_array_user(const char __user *from, size_t count, int **array)
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
+	*array = ints;
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL(parse_int_array_user);
+
 static bool unescape_space(char **src, char **dst)
 {
 	char *p = *dst, *q = *src;
-- 
2.25.1

