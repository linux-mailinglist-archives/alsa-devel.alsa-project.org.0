Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D3314414
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:39:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0C816A4;
	Tue,  9 Feb 2021 00:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0C816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827584;
	bh=ylUHfM+zRKkxJBR4BjrDQTB5XbllsFDaQlC7ZHbzgD8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OqXcAt1vPpoenb7BxNYYXFGxVezArI9vRfr+7C1NqB21stKj4u2lzyFOV5ehNdzsw
	 VP1d53x7ZwGid/rx1kccaSCEN5jCi8T6Hk7U6XNyDQqfjY1BE63q8FmxIdqNgdJC5B
	 v2PMT8NTz6PtQMlPO8UUeLp5N3C2el/4T4DOCdF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AFA1F804EB;
	Tue,  9 Feb 2021 00:34:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6353EF804DF; Tue,  9 Feb 2021 00:34:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 901B7F8028B
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:34:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 901B7F8028B
IronPort-SDR: cO65CEj+3sOEL2mykPr2jyXwCMrYPfiAaAlJeQK+jAdE3OMqLdr/kTlzk2XKjwT8mwoGd6OoI/
 qEWuXM593S6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168923521"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168923521"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:58 -0800
IronPort-SDR: wrk84wwP8hXPYhlkrFgZt/vt4QmZf5CjK8ULIDQh8OEYn6ZJa8JtkbpIVOlfIJb69J7HeNTFJ6
 whYQeP+HryyA==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="374741365"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:58 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/11] ASoC: SOF: Intel: HDA: don't keep a temporary
 variable
Date: Mon,  8 Feb 2021 17:33:35 -0600
Message-Id: <20210208233336.59449-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
References: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

fixup_tplg_name() doesn't need to keep the string, allocated for
filename - it's temporary.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
---
 sound/soc/sof/intel/hda.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4f7de3d12292..e8094be6bfc6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -531,22 +531,22 @@ static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *dmic_str)
 {
 	const char *tplg_filename = NULL;
-	char *filename;
-	char *split_ext;
+	char *filename, *tmp;
+	const char *split_ext;
 
-	filename = devm_kstrdup(sdev->dev, sof_tplg_filename, GFP_KERNEL);
+	filename = kstrdup(sof_tplg_filename, GFP_KERNEL);
 	if (!filename)
 		return NULL;
 
 	/* this assumes a .tplg extension */
-	split_ext = strsep(&filename, ".");
-	if (split_ext) {
+	tmp = filename;
+	split_ext = strsep(&tmp, ".");
+	if (split_ext)
 		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
 					       "%s%s%s.tplg",
 					       split_ext, idisp_str, dmic_str);
-		if (!tplg_filename)
-			return NULL;
-	}
+	kfree(filename);
+
 	return tplg_filename;
 }
 
-- 
2.25.1

