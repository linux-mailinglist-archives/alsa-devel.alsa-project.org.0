Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF92605FD4
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2589A84F;
	Thu, 20 Oct 2022 14:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2589A84F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268025;
	bh=feLD7YiPxUiQB0ED7ZOaEMKrDM206gzeScQnXTpNJqE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQFeMMOkeXZ3PaW+Clt8+VKNUlTJeo/4lhnRfcy2sO9dvfNFFXJ862214PMUZK0y5
	 2sIjkZLfp1F93XY+i3jQ2vzKQn18xN/wlFY3z9Xs6aAbPx8NQ86XE6NLYuGp9MjDBy
	 BgtC0/7ofog3Qe/K8SLqc/WjR6K3GmhbjW8DbaWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A34DF80525;
	Thu, 20 Oct 2022 14:12:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E47B4F8050F; Thu, 20 Oct 2022 14:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D88F804D8
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D88F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AjOrriEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267942; x=1697803942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=feLD7YiPxUiQB0ED7ZOaEMKrDM206gzeScQnXTpNJqE=;
 b=AjOrriEFXaF4zD4+e7svqqK45tjouYLlJVxutfcraXfat21otrHevRbC
 ZLjZkYRhHVnt/SRYXTiWRncb0tzKdg3t32BJzncRm98uqNJu5mkEQUsWj
 sD5P69Gkf2qbaeKKk8bDoRh0L5yNhb3/E7LrS82SrLfkL7sw06dtShwGT
 MatJ25Z4JA5m/dgC7cGLFkWjIJzrfqZU6/RH7CE8qbj7otHqadSFh6kBQ
 MeEwvmrrK6w87ioaqr/gRvzjVjQvde1+Kb7MKfiUVmHuSyrFlWxqbUjCv
 1t1RuUouEu94L94NAq28DRF43iH6M4mtCLPSBwkeKgsxGR36g3I3rCaB5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256278"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256278"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009829"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009829"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 01/19] ASoC: SOF: loader: Set complete state before
 post_fw_run op
Date: Thu, 20 Oct 2022 15:12:20 +0300
Message-Id: <20221020121238.18339-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Set the FW state to complete right after boot is complete. This enables
sending IPC's in the post_fw_run op. This will be needed to support
reloading 3rd party module libraries after firmware boot.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 5f51d936b306..59e6be59258e 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -165,6 +165,9 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	if (sdev->fw_state == SOF_FW_BOOT_READY_FAILED)
 		return -EIO; /* FW boots but fw_ready op failed */
 
+	dev_dbg(sdev->dev, "firmware boot complete\n");
+	sof_set_fw_state(sdev, SOF_FW_BOOT_COMPLETE);
+
 	/* perform post fw run operations */
 	ret = snd_sof_dsp_post_fw_run(sdev);
 	if (ret < 0) {
@@ -172,9 +175,6 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	dev_dbg(sdev->dev, "firmware boot complete\n");
-	sof_set_fw_state(sdev, SOF_FW_BOOT_COMPLETE);
-
 	if (sdev->first_boot && sdev->ipc->ops->fw_loader->query_fw_configuration)
 		return sdev->ipc->ops->fw_loader->query_fw_configuration(sdev);
 
-- 
2.38.1

