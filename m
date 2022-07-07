Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EB569E40
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 11:05:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0661633;
	Thu,  7 Jul 2022 11:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0661633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657184700;
	bh=D/Z3jg8mUvi9rsToQV7j1faJzfJTLgmyvehdX2zqS6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dr0edmFH0E9deR9bWMXMGrKV4E8ysA9tGIsm4+YyXp6p2fa/FW/gQce/xTCudfuNl
	 trzCVZ4GVv4krk1lIZir7mO9P9bOUepA3Z/UQR1F7+uNQd5tAi5/zQUUd8fJ9yPrJc
	 83Jt1aiinHbIJGAS3/5Jyq0dE7s4mhZ9oZwQ1N7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70739F8028D;
	Thu,  7 Jul 2022 11:03:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B90C0F804FA; Thu,  7 Jul 2022 11:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DE8F8028D
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 11:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DE8F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UD/i1ZSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657184612; x=1688720612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/Z3jg8mUvi9rsToQV7j1faJzfJTLgmyvehdX2zqS6A=;
 b=UD/i1ZSPet5eLyJyY7AbOxWv7/FgxJFdxRVL+qyb73mxWq6Ep2zrjB04
 OAlTCL2ih+SOvN4DCZqcX3XrVnTHd42Tuow/Oaj4YIpLAn643JygdPvAR
 J+KL4Uzm+z8Xg4DJOcr3TQ0zzNVq4lVoS9E5DlvX6nNAv8KJnokRBE6pl
 xOTTN0joDrUuXRD6eYFVh2HkLYBj/72xgZA/Nbeuaf11KkUNPHkWIXfFI
 wOQoZS5jWyJDAxoW+AQbuIscYPlPbVrwpnIk8p24hIJwrOk6O/MmJK7bZ
 Dt6F7JtV1AqGGDi3OnprNuw40Oh8vyDSWkNNoXWuGOY26rPxut/Mh08g0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="263758618"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="263758618"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 02:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="770361205"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2022 02:03:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: andy@kernel.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Remove tokenize_input()
Date: Thu,  7 Jul 2022 11:13:01 +0200
Message-Id: <20220707091301.1282291-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707091301.1282291-1-cezary.rojewski@intel.com>
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
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

Now that we have strsplit_u32_user() tokenize_input() is needed no
longer. Remove it and update all occurrences of its usage.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/sof/sof-client-probes.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 48ebbe58e2b9..7a79a529e2b7 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -411,29 +411,6 @@ static const struct snd_compress_ops sof_probes_compressed_ops = {
 	.copy = sof_probes_compr_copy,
 };
 
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
@@ -508,7 +485,7 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 		return -ENOENT;
 	}
 
-	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	ret = strsplit_u32_user(from, count, ppos, ",", &tkns, &num_tkns);
 	if (ret < 0)
 		return ret;
 	bytes = sizeof(*tkns) * num_tkns;
@@ -563,7 +540,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		return -ENOENT;
 	}
 
-	ret = tokenize_input(from, count, ppos, &tkns, &num_tkns);
+	ret = strsplit_u32_user(from, count, ppos, ",", &tkns, &num_tkns);
 	if (ret < 0)
 		return ret;
 	if (!num_tkns) {
-- 
2.25.1

