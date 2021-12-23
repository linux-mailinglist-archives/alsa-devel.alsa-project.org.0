Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7474247E27C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:42:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12057189F;
	Thu, 23 Dec 2021 12:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12057189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259723;
	bh=F5BUmY1Q9kTtOuT+Dd5JDrs2iAcUGGecuB94UQmE+C0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Feaukj1BQK9Y95VD/qPoCoaOMWKMLMntDcvh01Op7B1HWc5GseT147hfwOqjf18/4
	 ldvd/bfKApTqBSEPuosmDtbhB+lZ8lMJe1dxeCKNKClYMOg2K/tjQ0s6+/KRLH1f0Q
	 7tuO+zQkycKcCLQHsrbYC/nlPydxYAKwXAbOmFVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5DAF80568;
	Thu, 23 Dec 2021 12:37:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B42EFF80567; Thu, 23 Dec 2021 12:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BDDFF80552
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDDFF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zp/ichvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259412; x=1671795412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5BUmY1Q9kTtOuT+Dd5JDrs2iAcUGGecuB94UQmE+C0=;
 b=Zp/ichvDUI1bveVA0yNZc0tGLUCeg5bzMJHmzFVGzjSt8NhrufO4bLlS
 oUaX4V8os/IzvmRBO4DNucH++wvKHgiynq/LxVNkOHtDkjR+7fiN07aDB
 HYCSJcoXkVzTQ9nvlBnu0v/u5djba/QSw3OPUrJMDxUTTmfcB6TfoqB7O
 3Tc7dm9QDzHlJkl7jRusdyZ8u+zxPdYS0jA4K7MAjQNz75HSFGKQQen7s
 aCuCGXb7fX058WC4k3ui6/0NkSdEhB872IfM7PiS83DzZwtsZLUqHmkCa
 9r9bkGZTddklMsix+n9YCiFKwBnLhs/K1gIl9OWCVrOEnOcTVyRQdY+DH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180850"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180850"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065223"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:43 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 15/20] ASoC: SOF: ops: Always print DSP Panic message but use
 different message
Date: Thu, 23 Dec 2021 13:36:23 +0200
Message-Id: <20211223113628.18582-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

Never suppress the DSP panic dump as it is always originates from an
assert() or panic() call within the firmware.

Use different message for DSP panics when there will be recovery attempt
going to be done compared to a definitive DSP panic.

Suggested-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ops.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index ed46f33ce72b..235e2ef72178 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -167,18 +167,21 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverabl
 			 __func__, sdev->dsp_oops_offset, offset);
 
 	/*
-	 * Only print the panic information if we have non recoverable panic or
-	 * if all dumps should be printed
+	 * Set the fw_state to crashed only in case of non recoverable DSP panic
+	 * event.
+	 * Use different message within the snd_sof_dsp_dbg_dump() depending on
+	 * the non_recoverable flag.
 	 */
-	if (non_recoverable || sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS)) {
-		/* We want to see the DSP panic! */
-		sdev->dbg_dump_printed = false;
-
+	sdev->dbg_dump_printed = false;
+	if (non_recoverable) {
 		snd_sof_dsp_dbg_dump(sdev, "DSP panic!",
 				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
-		if (non_recoverable)
-			sof_set_fw_state(sdev, SOF_FW_CRASHED);
+		sof_set_fw_state(sdev, SOF_FW_CRASHED);
 		snd_sof_trace_notify_for_error(sdev);
+	} else {
+		snd_sof_dsp_dbg_dump(sdev,
+				     "DSP panic (recovery will be attempted)",
+				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	}
 }
 EXPORT_SYMBOL(snd_sof_dsp_panic);
-- 
2.34.1

