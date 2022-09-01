Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351A5A9E4E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 19:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEEE9164F;
	Thu,  1 Sep 2022 19:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEEE9164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662054130;
	bh=QpLq53kDMbsQj6L9fHeAwbwgO0XWugT9uvq/PRVvdGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJInkF3uW9T+mD91nqjQ7EjtE5xRzj+70Nv5fS4hP+frRb5TkTQuNJ7dm1B672Ug2
	 PPUk8BY/ehabbSdo3BwCE6OP3yfbJwxoeNa5nnFxMzbpQdQDGPuEWtQi9FC4/ev1r8
	 6g0C5QyXVrh+DL7Sh2S0skn7q+UzNsuxP8nX1VEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2559FF80527;
	Thu,  1 Sep 2022 19:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBBF4F80525; Thu,  1 Sep 2022 19:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F89CF8026A
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 19:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F89CF8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a0Fjy31w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662054036; x=1693590036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QpLq53kDMbsQj6L9fHeAwbwgO0XWugT9uvq/PRVvdGI=;
 b=a0Fjy31ws1/4hQADh6NwGM9opAHFPMZwojaWBgBQtUgYiWrf38HIwhKH
 mONSOU7ASuhRXbl2rWRS/KfHJ9nSXyt4VKKBb16uE+8740dfEhVyN6SV+
 4RmXeyCSEemBIAI60BN8AhTKInOttcQdwlBejTY2TMG6JgnIcPMmx2djm
 BcGVwzQhUNJBacmAyWByBRJKW/a8SA+9I7y06Eklg4PYAB6660e/PtgYu
 fYryXDfmTQ44QRZvdvdZzdaKG5obBgSdw4Qq4yvFBy2JsgfrmcyuRCbOt
 2mcoQpmwO1E5eb4IfM++4U9IX+/PySaF3VKC0TPyojC/PEzQWSExkCAfI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="295792339"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="295792339"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="680960379"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2022 10:40:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 1/2] lib/string_helpers: Introduce tokenize_user_input()
Date: Thu,  1 Sep 2022 19:50:21 +0200
Message-Id: <20220901175022.334824-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901175022.334824-1-cezary.rojewski@intel.com>
References: <20220901175022.334824-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: andy@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, willy@infradead.org, lgirdwood@gmail.com,
 hdegoede@redhat.com, Andy Shevchenko <andy.shevchenko@gmail.com>,
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
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/string_helpers.h |  2 ++
 lib/string_helpers.c           | 45 ++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 4d72258d42fd..97583dae556f 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -21,6 +21,8 @@ enum string_size_units {
 void string_get_size(u64 size, u64 blk_size, enum string_size_units units,
 		     char *buf, int len);
 
+int tokenize_user_input(const char __user *from, size_t count, int **tkns);
+
 #define UNESCAPE_SPACE		BIT(0)
 #define UNESCAPE_OCTAL		BIT(1)
 #define UNESCAPE_HEX		BIT(2)
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 5ed3beb066e6..f878afccab4c 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -131,6 +131,51 @@ void string_get_size(u64 size, u64 blk_size, const enum string_size_units units,
 }
 EXPORT_SYMBOL(string_get_size);
 
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
 static bool unescape_space(char **src, char **dst)
 {
 	char *p = *dst, *q = *src;
-- 
2.25.1

