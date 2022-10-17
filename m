Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE0601A7C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37888A49;
	Mon, 17 Oct 2022 22:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37888A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039282;
	bh=9qU6/DMMnPckObhDJwEVPQtloEL5V4+TzV3lSsMMdA8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ugTJzJeMUl3CmXgixtfXAiqBIrI90HDED8EoyL2EhRLRSVp+VBKqx0TbsBFQMGfc3
	 N+Dn6uwjmuTlaeBfgD8b3oq912lUmqeaejAK0fgdifSwhOw74TkdxOIX64o8mCif/F
	 OMUQTjwGqhm1J8rc4VPZGZCtdF64D4whkc86IGYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11310F800AA;
	Mon, 17 Oct 2022 22:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBB2DF8025E; Mon, 17 Oct 2022 22:40:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66716F800AA
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66716F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eHZfm1is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039219; x=1697575219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9qU6/DMMnPckObhDJwEVPQtloEL5V4+TzV3lSsMMdA8=;
 b=eHZfm1isrzNkqwfUQGstsc3WIpPP06F2MxBLW3gPU+dxEwyd2+/g5Th4
 m4tFv3PWvMDV++pXOeDKYTic7Ks5jtZxpsRdx4jZ2jho0DHY9eTrFWKSO
 VoVna5YrRdg7SjNP1SJz4AgyiQurslWRCxizLtie5OsbSqZdv3Tv37QBl
 rjE1HgK3QC9B287VRE34zwN3MXW+QLGzFNfl4S9Dk0fe7ZbbukNvTrehH
 4sBPDReq6tD2XswPGpKKsHnwVipexsy8m7a3wqxEoznd4kcQbcW2fZx9G
 RE/uHFdg17gQ5DejRB6NbRxArSs+w+ukXcq1Lqz0Hv3+Ey33E7F00gQmB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286305774"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="286305774"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:40:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="753766943"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="753766943"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:40:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: pci-mtl: fix firmware name
Date: Mon, 17 Oct 2022 15:40:04 -0500
Message-Id: <20221017204004.207446-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>
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

Initial IPC4 tests used the same conventions as previous reference
closed-source firmware, but for MeteorLake the convention is the same
as previous SOF releases (sof-<platform>.ri). Only the prefix changes
to avoid confusions between IPC types.

This change has no impact on users since the firmware has not yet been
released.

Fixes: 064520e8aeaa2 ("ASoC: SOF: Intel: Add support for MeteorLake (MTL)")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/pci-mtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 899b00d53d64f..9f39da984e9fa 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -38,7 +38,7 @@ static const struct sof_dev_desc mtl_desc = {
 		[SOF_INTEL_IPC4] = "intel/sof-ace-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_INTEL_IPC4] = "dsp_basefw.bin",
+		[SOF_INTEL_IPC4] = "sof-mtl.ri",
 	},
 	.nocodec_tplg_filename = "sof-mtl-nocodec.tplg",
 	.ops = &sof_mtl_ops,
-- 
2.34.1

