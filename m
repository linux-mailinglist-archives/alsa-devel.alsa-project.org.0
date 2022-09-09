Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2F15B36A1
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B6B169D;
	Fri,  9 Sep 2022 13:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B6B169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723979;
	bh=SNZvMwd7GF+jmUlOlTtY3JlosBF6qGxRjcAZHTB2jG0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFQvUxpDpHnLA0zTXqWCDzejUCheaQQVrwIwTbpS14lI1wzFBys2r6ziMzf9zlNhK
	 82U8Gfs4M0aVh7vKQAywWetIC+7CB+tyXyMe0o7K+nObDSLSc1Rya1n4m7dYOqEUkV
	 gzWXPv7+IYc7bIOVfqVsPc/G2MYqunlJUEzWB0M4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FEFF80557;
	Fri,  9 Sep 2022 13:43:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 054C8F8053B; Fri,  9 Sep 2022 13:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B614F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B614F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VOdpBFEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723829; x=1694259829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SNZvMwd7GF+jmUlOlTtY3JlosBF6qGxRjcAZHTB2jG0=;
 b=VOdpBFEhkjSWc6tz919e6ek6X6aBlMPgpIRRayBuilRDbR69ryI4cVB+
 yJkxehHiymorOJiu3195ARzRsCppuQ3w6ZoEIeYM0NN/7OaLzqibYwPB1
 mh23IFk+zxd99vu+mFtXjBVvh9lMeZKXDgel5o1196OXiavK7Xhr2/B20
 7xWRJAJK55XQs1ZzXc0UbeL8nD2ccaK99/Gve0FqynyIRdQ5ChFWjUuii
 oB8wDyitGAQtll71n47rKoZ9IH28CTT2UND5SY7aWe3dgW+ABMvyeLcnV
 Liqp4w5RPd6HMWjYGtJmR2dbNAYnE+5pIwsFT2//lZw6Eo+ndFZAW0OBx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180122"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180122"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613892"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:45 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 7/7] ASoC: SOF: Intel: Add mtrace type information for IPC4
Date: Fri,  9 Sep 2022 14:43:32 +0300
Message-Id: <20220909114332.31393-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

Set the mtrace type for platforms supported by IPC4.

Note: currently only SOF_IPC4_MTRACE_INTEL_CAVS_2 type is supported by
the ipc4-mtrace driver, which is used by CAVS 2.x platforms (ICL, TGL, ADL)
and ACE (MTL).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c | 2 ++
 sound/soc/sof/intel/cnl.c | 2 ++
 sound/soc/sof/intel/icl.c | 2 ++
 sound/soc/sof/intel/mtl.c | 2 ++
 sound/soc/sof/intel/tgl.c | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 084c245a9522..295df44be271 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -57,6 +57,8 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 		ipc4_data = sdev->private;
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
+		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_5;
+
 		/* doorbell */
 		sof_apl_ops.irq_thread	= hda_dsp_ipc4_irq_thread;
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index a064453f0bc3..0bb91df27280 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -366,6 +366,8 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 		ipc4_data = sdev->private;
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
+		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_8;
+
 		/* doorbell */
 		sof_cnl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 6a8af2d3b580..59ce3132fada 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -125,6 +125,8 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 		ipc4_data = sdev->private;
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
+		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
+
 		/* doorbell */
 		sof_icl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 96239ebb1eed..1cc1398336e1 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -764,6 +764,8 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 	ipc4_data = sdev->private;
 	ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
+	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
+
 	/* set DAI ops */
 	hda_set_dai_drv_ops(sdev, &sof_mtl_ops);
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 6dfb4786c782..017bf331ed5a 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -80,6 +80,8 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 		ipc4_data = sdev->private;
 		ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
 
+		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
+
 		/* doorbell */
 		sof_tgl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
-- 
2.37.3

