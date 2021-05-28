Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DA39447B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:50:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449F416D6;
	Fri, 28 May 2021 16:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449F416D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622213416;
	bh=MaKmSClpVc19kyZ540PyAhe+bVMzTCR/sPP+MzMeGBA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uZxl4Dmt0KmIZnFTQzRUZdMp8VUBMIihEhmd9H5YgjarZa3KPR/n7/KDtdT/dRxNG
	 9d8oMkbs86fHl3m2azvC0S0zVS10a+dJiIL+mYNLlhmts4Lgr4YCQyNmoi6ep8xAwJ
	 3BGxNEWEqu9oqUA/Fhks/Kc/299FEaDKzJbuGHsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BECCF802BE;
	Fri, 28 May 2021 16:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7406EF804AC; Fri, 28 May 2021 16:48:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 133EFF804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133EFF804A9
IronPort-SDR: +ksTakcWsOIlV48xY6TELI6HIWHwiEMyrlwy8E99E61T1swTd7JNGC1vwx5IgQj61IFdzc/5u7
 WKdQJuNQuR2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9998"; a="266852823"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="266852823"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 07:48:30 -0700
IronPort-SDR: 7lGGprA4F4EPPv4zpfrB7xj5WgcwZiSf0gqLn/yHkqSiMcdOk3OzNU3jI0lb/pFPsIx4jHXs+g
 OsOOIN1DEvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="548001427"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 28 May 2021 07:48:27 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: reset enabled_cores state at suspend
Date: Fri, 28 May 2021 17:43:30 +0300
Message-Id: <20210528144330.2551-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

The recent changes to use common code to power up/down DSP cores also
removed the reset of the core state at suspend. It turns out this is
still needed. When the firmware state is reset to
SOF_FW_BOOT_NOT_STARTED, also enabled_cores should be reset, and
existing DSP drivers depend on this.

BugLink: https://github.com/thesofproject/linux/issues/2824
Fixes: 42077f08b3 ("ASoC: SOF: update dsp core power status in common APIs")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index fd265803f7bc..c83fb6255961 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -256,6 +256,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* reset FW state */
 	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+	sdev->enabled_cores_mask = 0;
 
 	return ret;
 }

base-commit: 058efb40641845432c52777443b3372dbc97c032
-- 
2.31.1

