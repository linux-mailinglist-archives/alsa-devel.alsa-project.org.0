Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822940C52F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B0081868;
	Wed, 15 Sep 2021 14:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B0081868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708763;
	bh=dSU3BkXAKHnMKvViAjlw+O2xJogkgiJSTTp5FJj7dH4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNpfwxG1OooEFZWcfz6o+TJFvs8MV+sw6LrAcojoLa3+FVHxNMDbjMICFfBlRD7vH
	 1QuXwVPycKCK0HNdQjEb/555QbDk9sozLdyBgZtpX/vtIv/kcepD7kgUGxAQlsAbKR
	 fKR0SHQCL7xXSlJ6f0N3Z989lVCWmjNIYT00I17c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF1CF80527;
	Wed, 15 Sep 2021 14:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DDABF80517; Wed, 15 Sep 2021 14:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 087E4F804F2
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 087E4F804F2
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117527"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117527"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901637"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 10/12] ASoC: SOF: Intel: Provide debugfs_add_region_item ops
 for core
Date: Wed, 15 Sep 2021 15:21:14 +0300
Message-Id: <20210915122116.18317-11-peter.ujfalusi@linux.intel.com>
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
 sound/soc/sof/intel/apl.c     | 1 +
 sound/soc/sof/intel/bdw.c     | 1 +
 sound/soc/sof/intel/byt.c     | 2 ++
 sound/soc/sof/intel/cnl.c     | 1 +
 sound/soc/sof/intel/icl.c     | 1 +
 sound/soc/sof/intel/pci-tng.c | 1 +
 sound/soc/sof/intel/tgl.c     | 1 +
 7 files changed, 8 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index c7ed2b3d6abc..0da6f3528269 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -65,6 +65,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs),
 	.dbg_dump	= hda_dsp_dump,
 	.ipc_dump	= hda_ipc_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= hda_dsp_pcm_open,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 37fa4f976a11..a8063e9b3e00 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -635,6 +635,7 @@ static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	.debug_map  = bdw_debugfs,
 	.debug_map_count    = ARRAY_SIZE(bdw_debugfs),
 	.dbg_dump   = bdw_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= intel_pcm_open,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 8edaf6fdd218..d4e86f847ae6 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -249,6 +249,7 @@ static const struct snd_sof_dsp_ops sof_byt_ops = {
 	.debug_map	= byt_debugfs,
 	.debug_map_count	= ARRAY_SIZE(byt_debugfs),
 	.dbg_dump	= atom_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= intel_pcm_open,
@@ -326,6 +327,7 @@ static const struct snd_sof_dsp_ops sof_cht_ops = {
 	.debug_map	= cht_debugfs,
 	.debug_map_count	= ARRAY_SIZE(cht_debugfs),
 	.dbg_dump	= atom_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= intel_pcm_open,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index e115e12a856f..eeb95cbb77a1 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -270,6 +270,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs),
 	.dbg_dump	= hda_dsp_dump,
 	.ipc_dump	= cnl_ipc_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= hda_dsp_pcm_open,
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index ee095b8f2d01..f5e370c13fed 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -64,6 +64,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 	.debug_map_count	= ARRAY_SIZE(icl_dsp_debugfs),
 	.dbg_dump	= hda_dsp_dump,
 	.ipc_dump	= cnl_ipc_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= hda_dsp_pcm_open,
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 4bded668b672..c7a64a11e4ae 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -165,6 +165,7 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	.debug_map	= tng_debugfs,
 	.debug_map_count	= ARRAY_SIZE(tng_debugfs),
 	.dbg_dump	= atom_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= intel_pcm_open,
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 199d41a7dc9b..e91ea80f766f 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -60,6 +60,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs),
 	.dbg_dump	= hda_dsp_dump,
 	.ipc_dump	= cnl_ipc_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
 
 	/* stream callbacks */
 	.pcm_open	= hda_dsp_pcm_open,
-- 
2.33.0

