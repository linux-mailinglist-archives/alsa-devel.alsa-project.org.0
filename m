Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA09602B72
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D20D9508;
	Tue, 18 Oct 2022 14:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D20D9508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095280;
	bh=tQ4RbW2+Kn5goqbs5MShmgH7IATwxOOmyZIKzzBmi38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKAIw3sLKRtJpWnwSbBvSG8iCFPMv11bCTGBnMUrl599YRS7BfMHyzjAXClkSJP8k
	 l86mIxlCz1fV6Q8ACieGRRhWX46TZrw5+dipNQKy/aMkgb3osVK6TrFZjmjlNShdNR
	 eMCJfV3h7B6RRO5C2cnppIepeu8iodkUjF5Z+IdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1713F805DA;
	Tue, 18 Oct 2022 14:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED134F805D9; Tue, 18 Oct 2022 14:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C9B2F805CB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C9B2F805CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Pof2EGOP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094984; x=1697630984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tQ4RbW2+Kn5goqbs5MShmgH7IATwxOOmyZIKzzBmi38=;
 b=Pof2EGOPvTQ8C6KBOSGCjNNdN2Kg0inZAmCK188ElHjU4bsZL40A3slT
 MqZZ5yhz80W2RGaInaRz6BmvMoLmw9maF6atzNmiCsWgsdMfPed8GYzkb
 V8MNjpIPvKM4nRgcDVKpZXABOmKpWgTx55CVg69DbsJ17+CAcccNSGxEQ
 mhIBILd4qLWQ1avnErRi9aanBVvjkoumM+C7FSjeokd/os4eKgqKiPaLf
 KdH6TAfACMjIo55sYyK4dbcUvflETajmxnsnBbFRyULgAzt9897H0iUQN
 UtAzs2qH1sVK+CeeWw2y/TncUqKm+wLIzxqSZyDsIi9wdMtAjEdFYzzIU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293453043"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293453043"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758083"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758083"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 18/19] ASoC: SOF: loader: Remove the query_fw_configuration ops
Date: Tue, 18 Oct 2022 15:09:15 +0300
Message-Id: <20221018120916.19820-19-peter.ujfalusi@linux.intel.com>
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

The query_fw_configuration callback is redundant and the only user of it
was converted to use the generic post_fw_boot ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/loader.c   | 10 ++--------
 sound/soc/sof/sof-priv.h |  4 ----
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index a1c4a51636c9..81d202e5ce53 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -174,14 +174,8 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	if (sdev->ipc->ops->post_fw_boot) {
-		ret = sdev->ipc->ops->post_fw_boot(sdev);
-		if (ret)
-			return ret;
-	}
-
-	if (sdev->first_boot && sdev->ipc->ops->fw_loader->query_fw_configuration)
-		return sdev->ipc->ops->fw_loader->query_fw_configuration(sdev);
+	if (sdev->ipc->ops->post_fw_boot)
+		return sdev->ipc->ops->post_fw_boot(sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index c7ab78b042aa..403e81220244 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -421,15 +421,11 @@ struct sof_ipc_pm_ops {
  *			DSP.
  *			The function implements generic, hardware independent way
  *			of loading the initial firmware and its modules (if any).
- * @query_fw_configuration: Optional function pointer to query information and
- *			configuration from the booted firmware.
- *			Executed after the first successful firmware boot.
  */
 struct sof_ipc_fw_loader_ops {
 	int (*validate)(struct snd_sof_dev *sdev);
 	size_t (*parse_ext_manifest)(struct snd_sof_dev *sdev);
 	int (*load_fw_to_dsp)(struct snd_sof_dev *sdev);
-	int (*query_fw_configuration)(struct snd_sof_dev *sdev);
 };
 
 struct sof_ipc_tplg_ops;
-- 
2.38.0

