Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA64C4421
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 13:01:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBA8A1872;
	Fri, 25 Feb 2022 13:01:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBA8A1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645790516;
	bh=c9OWvqnyXVR2lKzdl+uG4oiVN1Rt9uUm7gcgYxiKaTY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F60aRGn0TD8vtjv/dk+MqBtMLoGqsG+o2bjP4LIFaS4qLnmnMF+D5FC+qANezjwwk
	 738yLO6B1K0xPJEGu+mcONhQMhKAim2/a/Mf8G3VGXGXAxpsYqFmXp0yUw9vkshsZT
	 QBVwj6HeQdDiUYYtSGu8UmFG7n982ooRGIj/Nlz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F2ACF80159;
	Fri, 25 Feb 2022 13:00:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 171B5F80132; Fri, 25 Feb 2022 13:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5953EF80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 13:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5953EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ayQ4jQsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645790437; x=1677326437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c9OWvqnyXVR2lKzdl+uG4oiVN1Rt9uUm7gcgYxiKaTY=;
 b=ayQ4jQsxtHHn9dLOmG1jWMzx5kadzVEJPNCtUJayZi1lCXoKXHSDtOmS
 CY3If90sEW36PCa+qYIZe3yC2qJuJXpMHNoI9JWf/9r8VR9t5l65baAVc
 XFN3AZCbYW86QdTAqw5aOVI8c+xFzQjfwgmI4xRwI88F2MBo/4QA3QFxO
 c9Xg9cnfytah+3W5o65r0IPdccMq7KU2ed1oHOztr1J5xOU0uKqjWk7Sy
 vKzqEsQL9IHHqe4uUnVSBye828pUkCfY2PUuczXnAD9KpsYfaa+tvrNbH
 DrZPZGBYbq6IMpw7/2WomLhslj//A+PqxfTGWb8UN7yOccM2M3SzgbDvc A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233107526"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="233107526"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 04:00:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549234257"
Received: from akarbown-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.45.25])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 04:00:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: sof-priv: Drop duplicate sof_compressed_ops
 declaration
Date: Fri, 25 Feb 2022 14:00:34 +0200
Message-Id: <20220225120034.11028-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

Other commit added the declaration of the sof_compressed_ops, drop the
instance which added it as Platform specific ops, which the
sof_compressed_ops is not.

76cdd90b27b4e ("ASoC: SOF: pcm: Add compress_ops for SOF platform component driver")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1cc6dce17582..2e19ac619ad5 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -561,11 +561,6 @@ int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
 		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
 		const char *name, enum sof_debugfs_access_type access_type);
 
-/*
- * Platform specific ops.
- */
-extern struct snd_compress_ops sof_compressed_ops;
-
 /*
  * DSP Architectures.
  */
-- 
2.35.1

