Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51457602B67
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD9C39CC8;
	Tue, 18 Oct 2022 14:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD9C39CC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095182;
	bh=BqN7gRQsa18TgqZUb9aUZFP0EcjnlGVxeGv6SHagRIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEjXhKVteDENqVPQkFf8FKKjyElC2Er7AHFWBIIt3aLXxqets5eCCNIrnyxNyF4RY
	 Qwb4vfLvx4Uzv0LjWYqghnImRKsSqmtPdHKh8UgpiubdSH5U+X9bSS0P3cUV/thZKG
	 9Lspy8fgXwvDdjnHlGFsLqmkJZk60eCa0Xj/qcOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E64F805B1;
	Tue, 18 Oct 2022 14:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB520F80588; Tue, 18 Oct 2022 14:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9262F80567
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9262F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ePyOCXKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094970; x=1697630970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BqN7gRQsa18TgqZUb9aUZFP0EcjnlGVxeGv6SHagRIs=;
 b=ePyOCXKB7xWLo6jB+X1d7NgTQQo+DH3pEfS1ZuzZBHbwSsQqBQH43/vW
 3Ef+/+AFqe7CccvMgwg9hOcF67RODXr9b2EYboNiAPE/gPBXHTGiD4GUP
 y6QAxTNK9c/FV6YcOxsB6Rpyu0ZB4Mj6caUKh3nxTdYx9UUwddtwIkIJ5
 Az7Gpssiop/5CutA2dRgldByt2BHIUqrAROpMLGhhEWiGpKXO1IPGuk8+
 MMNbQcQ7TqY/s1K+ye67Ga0LwNdKKXXrI5jOH5daWP6NySBDQcH8gnkRU
 SPQZClx1M25rU0xXEz4ixJbV6pg+dCdBUQDjMA4Yt7uYc+rjA3DlzDvH/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452979"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452979"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757979"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757979"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library path
 for IPC4
Date: Tue, 18 Oct 2022 15:09:09 +0300
Message-Id: <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

The default path for the external firmware libraries are:
intel/avs-lib/<platform>
or
intel/sof-ipc4-lib/<platform>

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/pci-apl.c |  6 ++++++
 sound/soc/sof/intel/pci-cnl.c |  9 +++++++++
 sound/soc/sof/intel/pci-icl.c |  6 ++++++
 sound/soc/sof/intel/pci-mtl.c |  3 +++
 sound/soc/sof/intel/pci-tgl.c | 21 +++++++++++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 998e219011f0..69279dcc92dc 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -33,6 +33,9 @@ static const struct sof_dev_desc bxt_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/apl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/apl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -61,6 +64,9 @@ static const struct sof_dev_desc glk_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/glk",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/glk",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index c797356f7028..8db3f8d15b55 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -34,6 +34,9 @@ static const struct sof_dev_desc cnl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/cnl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/cnl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -62,6 +65,9 @@ static const struct sof_dev_desc cfl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/cnl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/cnl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -91,6 +97,9 @@ static const struct sof_dev_desc cml_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/cnl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/cnl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 48f24f8ace26..d6cf75e357db 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -34,6 +34,9 @@ static const struct sof_dev_desc icl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/icl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/icl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -62,6 +65,9 @@ static const struct sof_dev_desc jsl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/jsl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/jsl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 899b00d53d64..84445daf33af 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -34,6 +34,9 @@ static const struct sof_dev_desc mtl_desc = {
 	.default_fw_path = {
 		[SOF_INTEL_IPC4] = "intel/sof-ipc4/mtl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/sof-ipc4-lib/mtl",
+	},
 	.default_tplg_path = {
 		[SOF_INTEL_IPC4] = "intel/sof-ace-tplg",
 	},
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 2d63cc236a68..f9cbf3ad85b3 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -34,6 +34,9 @@ static const struct sof_dev_desc tgl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/tgl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/tgl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -62,6 +65,9 @@ static const struct sof_dev_desc tglh_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/tgl-h",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/tgl-h",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -90,6 +96,9 @@ static const struct sof_dev_desc ehl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/ehl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/ehl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -118,6 +127,9 @@ static const struct sof_dev_desc adls_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/adl-s",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/adl-s",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -146,6 +158,9 @@ static const struct sof_dev_desc adl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/adl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/adl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -174,6 +189,9 @@ static const struct sof_dev_desc rpls_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/rpl-s",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/rpl-s",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
@@ -202,6 +220,9 @@ static const struct sof_dev_desc rpl_desc = {
 		[SOF_IPC] = "intel/sof",
 		[SOF_INTEL_IPC4] = "intel/avs/rpl",
 	},
+	.default_lib_path = {
+		[SOF_INTEL_IPC4] = "intel/avs-lib/rpl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC] = "intel/sof-tplg",
 		[SOF_INTEL_IPC4] = "intel/avs-tplg",
-- 
2.38.0

