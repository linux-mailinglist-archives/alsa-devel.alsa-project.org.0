Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F040C530
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA41185F;
	Wed, 15 Sep 2021 14:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA41185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708782;
	bh=hh1CW2Bg4+t/PtYpW7wBgve77Pla5GF4GPUzsYA2a+E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcSoM+FqxwCSkn0E3AO9O3vXcCELmPqBQ5BV0kQ7IU9W5ZY+ul3Vha5/Y3ivr1WLc
	 evIZyCfPscmBcPzDxVyHhVONvXEFvsId+e2LLKvJQJ/QSnB8x0x16P4dHqdmXLh2Wr
	 i1khNnOhG7sr8RZF6iQI4AQ+V+k7W2GJMVblgSnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B0BF80534;
	Wed, 15 Sep 2021 14:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35FAF8051C; Wed, 15 Sep 2021 14:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE44FF8050F
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE44FF8050F
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117539"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117539"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901656"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 12/12] ASoC: SOF: debug: No need to export the
 snd_sof_debugfs_io_item()
Date: Wed, 15 Sep 2021 15:21:16 +0300
Message-Id: <20210915122116.18317-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@gmail.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The snd_sof_debugfs_io_item() only used within debug.c, no need to export
it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/debug.c    | 9 ++++-----
 sound/soc/sof/sof-priv.h | 4 ----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index c536ea71630f..af92baacd23e 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -546,10 +546,10 @@ static const struct file_operations sof_dfs_fops = {
 };
 
 /* create FS entry for debug files that can expose DSP memories, registers */
-int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
-			    void __iomem *base, size_t size,
-			    const char *name,
-			    enum sof_debugfs_access_type access_type)
+static int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
+				   void __iomem *base, size_t size,
+				   const char *name,
+				   enum sof_debugfs_access_type access_type)
 {
 	struct snd_sof_dfsentry *dfse;
 
@@ -586,7 +586,6 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_sof_debugfs_io_item);
 
 int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
 					  enum snd_sof_fw_blk_type blk_type, u32 offset,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 4f1dcfe4a7ec..d391fff1e02c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -522,10 +522,6 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev);
 void snd_sof_free_trace(struct snd_sof_dev *sdev);
 int snd_sof_dbg_init(struct snd_sof_dev *sdev);
 void snd_sof_free_debug(struct snd_sof_dev *sdev);
-int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
-			    void __iomem *base, size_t size,
-			    const char *name,
-			    enum sof_debugfs_access_type access_type);
 int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 			     void *base, size_t size,
 			     const char *name, mode_t mode);
-- 
2.33.0

