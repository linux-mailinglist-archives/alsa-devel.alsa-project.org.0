Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D94602B4E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B20439CC3;
	Tue, 18 Oct 2022 14:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B20439CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095025;
	bh=KUkMosUmcIXe6nSf2iPg5oP3WjFAeuf3wUSvoiwGZMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z00oXc3oQQPDvjYsI5VzsZtZZXtAGXp2E6N3AGY0cnUDBQDPhLeQzXEbEnGDgJlmq
	 e80f0xgzdPLq2/Jh2VtjaZvnzzw281zr8RC5bOjE6fT58SdA9cVOw0+W3F6htaYbp+
	 hgWAF6WnuWYmLJyhFnTAegQFQJbyiRfzpyLPxjxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98708F8053B;
	Tue, 18 Oct 2022 14:09:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21929F8053B; Tue, 18 Oct 2022 14:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66EB4F80166
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EB4F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CGcfrwjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094942; x=1697630942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KUkMosUmcIXe6nSf2iPg5oP3WjFAeuf3wUSvoiwGZMU=;
 b=CGcfrwjhn/i0BIZyRC8XNDv8Js6bfF1ePKQBG4+tnjtavl0CFrsrBQFx
 JN949RLGdEpChoQrgImEGC2au5Bp5U9DE9aXfajfrJGox7GaOSeMQ9XyC
 2gDTp9WS9cInY2EfxPO/AePGhYygxBnLLmpa5EeMuhBpO3iN094tdMXSH
 /V2s5MXNR7b3P73acZV1jqgKerUbepOoNcaxP4MYLtD233ijqGcJRxJb4
 l95YD7o8d0fubxnmi/iaTsvcFITT2KpjxN2F8upZKzI9V1bqujkQ+Vs+1
 PB0i3Ib9IB5QXSLKObpH2VQKhpkN53E2+JcTj7TKHhTOdP7qTAKUGYkyM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303697445"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="303697445"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:08:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757771"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757771"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:08:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 01/19] ASoC: SOF: loader: Set complete state before
 post_fw_run op
Date: Tue, 18 Oct 2022 15:08:58 +0300
Message-Id: <20221018120916.19820-2-peter.ujfalusi@linux.intel.com>
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
2.38.0

