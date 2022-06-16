Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A788C54EAE7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:20:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4BE1B0F;
	Thu, 16 Jun 2022 22:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4BE1B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655410831;
	bh=JPttLoo1e6ngS8OJt0II4U3qIJOTyL/KyoZn5sRtmCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=La+G0l8aP5gNbCmA9Tzd3NRJK4sWOkP8J8xAiuEHHWfPRqnqM3DHqa40gNCzY5NQ5
	 WYcDyTxNBF/apWRHjcvb/sHZoWW3vQIrJtC7/JQdYGRektfchdMnaWPuYMr6mWQS8P
	 w1RTuELDJ9CFMMzvOd2BQTD8/ZOmtdcLxHHL6rPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A198CF80529;
	Thu, 16 Jun 2022 22:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D32C0F804E0; Thu, 16 Jun 2022 22:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D51CEF801D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D51CEF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e0JxD/nF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655410727; x=1686946727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JPttLoo1e6ngS8OJt0II4U3qIJOTyL/KyoZn5sRtmCI=;
 b=e0JxD/nFz/GFsuCeFSs+SRtmL/608zexSFQh1AKTMrlEburMpR/4fIGH
 nALF5jSa3vpEPqZ10gSMo9s8KdNTf3x9P/v4mUCJ5qL1U87Yl6RsljyNC
 v9Z+Lty7NmEjprxlPNYR/YN666h89ojU4qIxzpiOaZpNB1j330DZudoIF
 iVJ8quXCEsqDWLr+zB3+aGB/ttB69avg5H8vSMBvfzH41e6o5Kxw+GggD
 LUEG7HUnl+Sfh+IBL0fC/eZWI/JJJKkjev8lF76dAMAvv7jOKy7v9fOZY
 RmAaAMTCJSE+1qxLuAwWpSyl8y3DJKOG5SuaZgSnGbgAMTfCC8LsbPywd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259803605"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259803605"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583771733"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: pm: add explicit behavior for ACPI S1 and S2
Date: Thu, 16 Jun 2022 15:18:16 -0500
Message-Id: <20220616201818.130802-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
References: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The existing code only deals with S0 and S3, let's start adding S1 and S2.

No functional change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 18eb327a57f03..239f39a5166a4 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -335,8 +335,18 @@ int snd_sof_prepare(struct device *dev)
 		return 0;
 
 #if defined(CONFIG_ACPI)
-	if (acpi_target_system_state() == ACPI_STATE_S0)
+	switch (acpi_target_system_state()) {
+	case ACPI_STATE_S0:
 		sdev->system_suspend_target = SOF_SUSPEND_S0IX;
+		break;
+	case ACPI_STATE_S1:
+	case ACPI_STATE_S2:
+	case ACPI_STATE_S3:
+		sdev->system_suspend_target = SOF_SUSPEND_S3;
+		break;
+	default:
+		break;
+	}
 #endif
 
 	return 0;
-- 
2.34.1

