Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 498FF5A16CD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 18:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E740D1637;
	Thu, 25 Aug 2022 18:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E740D1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661445639;
	bh=jW1+QJrbm2Ue8kto7vl18xbElhRMDwx0g4NeT2s/jqI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vSYz1w/6PCXOVXcjk/hbpHjeiW895LHPsm5OD8ZMjqcEmQbRn2lzKdMtjo4XmWeZ6
	 OTY+AUTPseb9kTKeDtLzSR9mMcSDnBu3o5AH5nI8lEJDFe0EM/t1AVGHuoVHq4q65C
	 jpK4XpJB44cxqpbTQ1WBg1UH6X6u9ZaOf3bxznRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4778AF8014B;
	Thu, 25 Aug 2022 18:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A40A8F804FD; Thu, 25 Aug 2022 18:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7019F80245
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 18:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7019F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gcw0LEK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661445543; x=1692981543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jW1+QJrbm2Ue8kto7vl18xbElhRMDwx0g4NeT2s/jqI=;
 b=gcw0LEK+fvpQ6xbqaOQwRxCxyuXbfIZ8Ov0rOStZ1OAi7SJTDa+9K4ug
 0TGO52p6pkd+NoiGW1kztw+fAaI7s2ZHUb41Qkw4DhL7XJEuyyJ/CbkW/
 214/IeU3jEa3d0JVXGsN9CmV2KjxcH8pp9yT9ZP0d6/Xi66x+wCZNTH0g
 j3Vxoa0yz3zwniSZHVRrjusSaz/PgYdb+9aH2rl4BAHUgHd0Ns36JHIK3
 HE3MSA3ZxcMi/Q/Fn0oNNCkAaocCtvadXx73V9UL7oNu/W1X1MxF60PLr
 95Ha+CiYtdCXtBx8pq1z3GHglFPNEJhG/0WoieFtBn5ubMRnZq9hLhYg0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="356013043"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="356013043"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 09:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="671070457"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2022 09:38:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: SOF: Remove strsplit_u32() and tokenize_input()
Date: Thu, 25 Aug 2022 18:48:33 +0200
Message-Id: <20220825164833.3923454-3-cezary.rojewski@intel.com>
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

Make use of global user input tokenization helper instead of the
internal one as both serve same purpose. With that, both strsplit_u32()
and tokenize_input() become unused so remove them.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/sof-client-probes.c | 92 ++++---------------------------
 1 file changed, 11 insertions(+), 81 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index eb246b823461..3bab54cac07b 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -410,79 +410,6 @@ static const struct snd_compress_ops sof_probes_compressed_ops = {
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
-static int tokenize_input(const char __user *from, size_t count,
-			  loff_t *ppos, u32 **tkns, size_t *num_tkns)
-{
-	char *buf;
-	int ret;
-
-	buf = kmalloc(count + 1, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = simple_write_to_buffer(buf, count, ppos, from, count);
-	if (ret != count) {
-		ret = ret >= 0 ? -EIO : ret;
-		goto exit;
-	}
-
-	buf[count] = '\0';
-	ret = strsplit_u32(buf, ",", tkns, num_tkns);
-exit:
-	kfree(buf);
-	return ret;
-}
-
 static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 					  size_t count, loff_t *ppos)
 {
@@ -548,8 +475,8 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 	struct sof_probes_priv *priv = cdev->data;
 	struct device *dev = &cdev->auxdev.dev;
 	struct sof_probe_point_desc *desc;
-	size_t num_tkns, bytes;
-	u32 *tkns;
+	size_t bytes;
+	u32 num_tkns, *tkns;
 	int ret, err;
 
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
@@ -557,16 +484,18 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 		return -ENOENT;
 	}
 
-	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	ret = tokenize_user_input(from, count, (int **)&tkns);
 	if (ret < 0)
 		return ret;
+
+	num_tkns = *tkns;
 	bytes = sizeof(*tkns) * num_tkns;
 	if (!num_tkns || (bytes % sizeof(*desc))) {
 		ret = -EINVAL;
 		goto exit;
 	}
 
-	desc = (struct sof_probe_point_desc *)tkns;
+	desc = (struct sof_probe_point_desc *)&tkns[1];
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0 && ret != -EACCES) {
@@ -603,8 +532,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_probes_priv *priv = cdev->data;
 	struct device *dev = &cdev->auxdev.dev;
-	size_t num_tkns;
-	u32 *tkns;
+	u32 num_tkns, *tkns;
 	int ret, err;
 
 	if (priv->extractor_stream_tag == SOF_PROBES_INVALID_NODE_ID) {
@@ -612,9 +540,11 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		return -ENOENT;
 	}
 
-	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	ret = tokenize_user_input(from, count, (int **)&tkns);
 	if (ret < 0)
 		return ret;
+
+	num_tkns = *tkns;
 	if (!num_tkns) {
 		ret = -EINVAL;
 		goto exit;
@@ -626,7 +556,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		goto exit;
 	}
 
-	ret = sof_probes_points_remove(cdev, tkns, num_tkns);
+	ret = sof_probes_points_remove(cdev, &tkns[1], num_tkns);
 	if (!ret)
 		ret = count;
 
-- 
2.25.1

