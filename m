Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF78652F75
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C281516D4;
	Wed, 21 Dec 2022 11:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C281516D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618477;
	bh=fcHxp6xzffuBwUiPQ9VbkO96PvX/aCLLNmhxVnc0Eas=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RY4l0vDiKE71cGB18+Eqz8ijja3lYuRq6cxfoIb8iqjXSPmPUOKm7wnxV1lJYWsHC
	 BHLs50sphd/HPYGIHu8zqC6m1QzW6TGQcPtQJfRsdTa8TrT7/HO75OKyC6cgPOCUCs
	 kB+SAey6iX4L/jJaBBxnmRL/1pNaqI0+EETUQgAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDAEF80587;
	Wed, 21 Dec 2022 11:24:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A8FF80022; Wed, 21 Dec 2022 11:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49F9EF80022
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F9EF80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d3hl8VSA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618234; x=1703154234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcHxp6xzffuBwUiPQ9VbkO96PvX/aCLLNmhxVnc0Eas=;
 b=d3hl8VSAb7EZiLWy317/LToYtaa+hJZkYJCwnfXSgA8GpntPXahQaTz5
 U7gET1t6yvPC2GX7PdCS0rUTEMnX8Pj/C2iqXKlCON8p3Wq4E4UzZPl+O
 dgirxhZZet+BxVMTKObkA0iczSa4DxFwxD33KVFE9CyvRNSqCNsBuWpwP
 ABnDBwVaMiORyvnxnFMVYYEkrusE9/FOm7NvZvLQxH5MiB8uso6hVAPon
 yINKLhG9ByqlUZWy+ty1nszhYf1OEguEezzB+mFwNS8k26WrnAWQpUSI8
 p2m1DQcdXLzu73//9ORYO/NrlBJut+lLwT1XNS9DCu9ZW0nutbEqUp4lZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078715"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984443"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984443"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/11] ASoC: SOF: trace: No need to check for op pointer in
 sof_fw_trace_free()
Date: Wed, 21 Dec 2022 12:23:28 +0200
Message-Id: <20221221102328.9635-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the sdev->fw_trace_is_supported is true then we must have the fw_tracing
ops set, no need to check again.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 0e92269c4a00..b2ab51e5214a 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -20,7 +20,7 @@ int sof_fw_trace_init(struct snd_sof_dev *sdev)
 
 void sof_fw_trace_free(struct snd_sof_dev *sdev)
 {
-	if (!sdev->fw_trace_is_supported || !sdev->ipc->ops->fw_tracing)
+	if (!sdev->fw_trace_is_supported)
 		return;
 
 	if (sdev->ipc->ops->fw_tracing->free)
-- 
2.39.0

