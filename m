Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8509740C532
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E971853;
	Wed, 15 Sep 2021 14:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E971853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708819;
	bh=ME8arl/pgmUD5qvgYMQCZG/0zVpTzPDBaJPFvViEMmo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzGCclISV1VjUS1EJEZVEsuyxaJezznGhXeP4kheQzTslgeddRkLbFQm+zEJq4Mn3
	 p2VFb7YlniRePbwGtLvBBAWKC+oGlcU8P6sKkdwCiq9va7rB+YYURYFRDy7joD3n1e
	 4tSOxlfEd1OACO/0lfM+cecvfAWIuIDHx71EEYXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C57DF8053B;
	Wed, 15 Sep 2021 14:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C27F80533; Wed, 15 Sep 2021 14:21:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B595F804E7
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B595F804E7
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117524"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117524"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901622"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 09/12] ASoC: SOF: imx: Provide debugfs_add_region_item ops for
 core
Date: Wed, 15 Sep 2021 15:21:13 +0300
Message-Id: <20210915122116.18317-10-peter.ujfalusi@linux.intel.com>
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

Set the generic iomem callback for debugfs_add_region_item to avoid
regression when the core switches to use the generic interface for
the regions.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 2 ++
 sound/soc/sof/imx/imx8m.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 150f1bc3fb95..4423e0b63d7b 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -443,6 +443,7 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 
 	/* Debug information */
 	.dbg_dump = imx8_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* Firmware ops */
 	.arch_ops = &sof_xtensa_arch_ops,
@@ -489,6 +490,7 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 
 	/* Debug information */
 	.dbg_dump = imx8_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* Firmware ops */
 	.arch_ops = &sof_xtensa_arch_ops,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index be5ab9942fc8..b9f8a9e8cc3a 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -295,6 +295,7 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 
 	/* Debug information */
 	.dbg_dump = imx8_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* Firmware ops */
 	.arch_ops = &sof_xtensa_arch_ops,
-- 
2.33.0

