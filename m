Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A894B0B91
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 11:57:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6620F16DB;
	Thu, 10 Feb 2022 11:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6620F16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644490642;
	bh=+resf7s8/0bfeptpaysoY6mJLYoPAYzroKommF5fV40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qn+ZEcmSQ1BEI8nLdp/IvWkmTAT0zCgLQJRVYOZEOIGehwndbfYS9UeYkOFcwb4NR
	 VLI63d7ZuiO0aIa8Y4jNTY3s4tWJuyrTPV6ZWP9Zcq5mv+PU+kNUhMtQG5Tsx4shzO
	 2xlu/Sz8MXwNmrsKX0X9l09dhynjIN7BUGFa0l3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF59F80508;
	Thu, 10 Feb 2022 11:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C074EF80423; Thu, 10 Feb 2022 11:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 451BBF8028B
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 11:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 451BBF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J8bLK2Jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490533; x=1676026533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+resf7s8/0bfeptpaysoY6mJLYoPAYzroKommF5fV40=;
 b=J8bLK2Jh7rzdf3miulHpOKsiRpgF7PtkwhoSwXDVeBUdzKF+K8TySmrM
 fEYkmpglq+T6pfR6dfm4xqrEvOZ7r/HSXRc7+Fr0/M6K3V10l+ZaZ8UnF
 eM9m3jiKlA7oNGtWM6ZDgIzJPTmo277fZmogoQZAkgYOSJkUFl5XiMBm0
 tTFafEEROod6jOMWQbWXUexhKKlqhsr7+mDQkeRJ8/4zSS1dxSzqM5nUA
 7GqiX2LtuIp9Z8zQCchK3BmVcRnytY7yOVBd8GB8tlu4s+cPJzCMxGQkv
 Q9FwMl6Fsd/9Cjld9P+o7prWzIbTNVtxXSmuMYzHf0U9XcRAYd32xexhF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310202841"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="310202841"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="679106848"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:26 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH 2/9] ASoC: SOF: Move the definition of enum
 sof_dsp_power_states to global header
Date: Thu, 10 Feb 2022 12:55:12 +0200
Message-Id: <20220210105519.19795-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Move the enum sof_dsp_power_states to include/sound/sof.h
to be accessible outside of the core SOF stack.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof.h      | 8 ++++++++
 sound/soc/sof/sof-priv.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 813680ab9aad..7cdfc954df12 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -39,6 +39,14 @@ enum sof_fw_state {
 	SOF_FW_CRASHED,
 };
 
+/* DSP power states */
+enum sof_dsp_power_states {
+	SOF_DSP_PM_D0,
+	SOF_DSP_PM_D1,
+	SOF_DSP_PM_D2,
+	SOF_DSP_PM_D3,
+};
+
 /*
  * SOF Platform data.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6358f8c84cce..2e474048d708 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -79,14 +79,6 @@ bool sof_debug_check_flag(int mask);
 /* max number of DSP cores */
 #define SOF_MAX_DSP_NUM_CORES 8
 
-/* DSP power state */
-enum sof_dsp_power_states {
-	SOF_DSP_PM_D0,
-	SOF_DSP_PM_D1,
-	SOF_DSP_PM_D2,
-	SOF_DSP_PM_D3,
-};
-
 struct sof_dsp_power_state {
 	u32 state;
 	u32 substate; /* platform-specific */
-- 
2.35.1

