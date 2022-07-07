Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9884569E3F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CF7715E0;
	Thu,  7 Jul 2022 11:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CF7715E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657184669;
	bh=ceV8WWS1WuygJZNoiljZTPQwSaSd2stWwDoPG/Wi1F8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MUXh2yLbjzAbBlRfGSrm3wyhvtQsi+59NqXvxKUE7sJzkXpnnjGitK0++4WVrptEy
	 uaPZIYfHfTcBpRzsj/iWws/fUzVunw7+4uVspXaiJzgU3qg/mehamRGyIpToWLzp08
	 7YkS5fCt1nEU/xoP2bnyxEyulsaWx+u9gWrx/JvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF360F800DF;
	Thu,  7 Jul 2022 11:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41D0AF80137; Thu,  7 Jul 2022 11:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5858F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5858F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AnlYlUaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657184601; x=1688720601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ceV8WWS1WuygJZNoiljZTPQwSaSd2stWwDoPG/Wi1F8=;
 b=AnlYlUaaLCMskeEigepdWAHcz0WZQ2py0a592v6OQbGIDXcKQaMGsTZp
 Ppoco2LXz6nElQ63/PjxipXuAOdYsMKiJW8mymkaYpnWe3yydGfESwwTA
 sUsQsscrIsQOJsMh4FnhCZ9+l/JvanfvyBANQLn8OuYONuCaBub1Thycc
 OI6CVPtP5IdY5sWo/5ayoZ2m9sg0xRC6+JEU/kpK86VJSQlyAVtM/y0BG
 7cfGVe9fFXNQkeOyYbcq4snAlqdkgOpNG64rcbH+5zO/ggsLooy/FRu1z
 98lvA2by5Z5pdDPHnD1WPRgMI8BMVSVdW+oWIJpek9PUOOvEzt73eP3jB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="347957706"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="347957706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 02:02:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="770361143"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2022 02:02:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: andy@kernel.org,
	broonie@kernel.org
Subject: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Date: Thu,  7 Jul 2022 11:13:00 +0200
Message-Id: <20220707091301.1282291-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, peter.ujfalusi@linux.intel.com
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

Add strsplit_u32() and its __user variant to allow for splitting
specified string into array of u32 tokens.

Originally this functionality was added for the SOF sound driver. As
more users are on the horizon, relocate it so it becomes a common good.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/linux/string_helpers.h    |  3 +
 lib/string_helpers.c              | 96 +++++++++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c | 51 +---------------
 3 files changed, 100 insertions(+), 50 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 4d72258d42fd..a4630ddfca27 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -126,4 +126,7 @@ static inline const char *str_enabled_disabled(bool v)
 	return v ? "enabled" : "disabled";
 }
 
+int strsplit_u32(const char *str, const char *delim, u32 **tkns, size_t *num_tkns);
+int strsplit_u32_user(const char __user *from, size_t count, loff_t *ppos, const char *delim,
+		      u32 **tkns, size_t *num_tkns);
 #endif
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 5ed3beb066e6..bb24f0c62539 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -984,3 +984,99 @@ void fortify_panic(const char *name)
 }
 EXPORT_SYMBOL(fortify_panic);
 #endif /* CONFIG_FORTIFY_SOURCE */
+
+/**
+ * strsplit_u32 - Split string into sequence of u32 tokens
+ * @str:	The string to split into tokens.
+ * @delim:	The string containing delimiter characters.
+ * @tkns:	Returned u32 sequence pointer.
+ * @num_tkns:	Returned number of tokens obtained.
+ *
+ * On success @num_tkns and @tkns are assigned the number of tokens extracted
+ * and the array itself respectively.
+ * Caller takes responsibility for freeing @tkns when no longer needed.
+ */
+int strsplit_u32(const char *str, const char *delim, u32 **tkns, size_t *num_tkns)
+{
+	size_t max_count = 32;
+	size_t count = 0;
+	char *s, **p;
+	u32 *buf, *tmp;
+	int ret = 0;
+
+	p = (char **)&str;
+	*tkns = NULL;
+	*num_tkns = 0;
+
+	buf = kcalloc(max_count, sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	while ((s = strsep(p, delim)) != NULL) {
+		ret = kstrtouint(s, 0, buf + count);
+		if (ret)
+			goto free_buf;
+
+		if (++count > max_count) {
+			max_count *= 2;
+			tmp = krealloc(buf, max_count * sizeof(*buf), GFP_KERNEL);
+			if (!tmp) {
+				ret = -ENOMEM;
+				goto free_buf;
+			}
+			buf = tmp;
+		}
+	}
+
+	if (!count)
+		goto free_buf;
+	*tkns = kmemdup(buf, count * sizeof(*buf), GFP_KERNEL);
+	if (*tkns == NULL) {
+		ret = -ENOMEM;
+		goto free_buf;
+	}
+	*num_tkns = count;
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL(strsplit_u32);
+
+/**
+ * strsplit_u32_user - Split string into sequence of u32 tokens
+ * @from:	The user space buffer to read from
+ * @ppos:	The current position in the buffer
+ * @count:	The maximum number of bytes to read
+ * @delim:	The string containing delimiter characters.
+ * @tkns:	Returned u32 sequence pointer.
+ * @num_tkns:	Returned number of tokens obtained.
+ *
+ * On success @num_tkns and @tkns are assigned the number of tokens extracted
+ * and the array itself respectively.
+ * Caller takes responsibility for freeing @tkns when no longer needed.
+ */
+int strsplit_u32_user(const char __user *from, size_t count, loff_t *ppos, const char *delim,
+		      u32 **tkns, size_t *num_tkns)
+{
+	char *buf;
+	int ret;
+
+	buf = kmalloc(count + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(buf, count, ppos, from, count);
+	if (ret != count) {
+		ret = (ret < 0) ? ret : -EIO;
+		goto free_buf;
+	}
+
+	buf[count] = '\0';
+	ret = strsplit_u32(buf, delim, tkns, num_tkns);
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+EXPORT_SYMBOL(strsplit_u32_user);
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 1f1ea93a7fbf..48ebbe58e2b9 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -12,6 +12,7 @@
 #include <linux/debugfs.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_helpers.h>
 #include <sound/soc.h>
 #include <sound/sof/header.h>
 #include "sof-client.h"
@@ -410,56 +411,6 @@ static const struct snd_compress_ops sof_probes_compressed_ops = {
 	.copy = sof_probes_compr_copy,
 };
 
-/**
- * strsplit_u32 - Split string into sequence of u32 tokens
- * @buf:	String to split into tokens.
- * @delim:	String containing delimiter characters.
- * @tkns:	Returned u32 sequence pointer.
- * @num_tkns:	Returned number of tokens obtained.
- */
-static int strsplit_u32(char *buf, const char *delim, u32 **tkns, size_t *num_tkns)
-{
-	char *s;
-	u32 *data, *tmp;
-	size_t count = 0;
-	size_t cap = 32;
-	int ret = 0;
-
-	*tkns = NULL;
-	*num_tkns = 0;
-	data = kcalloc(cap, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	while ((s = strsep(&buf, delim)) != NULL) {
-		ret = kstrtouint(s, 0, data + count);
-		if (ret)
-			goto exit;
-		if (++count >= cap) {
-			cap *= 2;
-			tmp = krealloc(data, cap * sizeof(*data), GFP_KERNEL);
-			if (!tmp) {
-				ret = -ENOMEM;
-				goto exit;
-			}
-			data = tmp;
-		}
-	}
-
-	if (!count)
-		goto exit;
-	*tkns = kmemdup(data, count * sizeof(*data), GFP_KERNEL);
-	if (!(*tkns)) {
-		ret = -ENOMEM;
-		goto exit;
-	}
-	*num_tkns = count;
-
-exit:
-	kfree(data);
-	return ret;
-}
-
 static int tokenize_input(const char __user *from, size_t count,
 			  loff_t *ppos, u32 **tkns, size_t *num_tkns)
 {
-- 
2.25.1

