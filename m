Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4724ECDCF
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C70316DE;
	Wed, 30 Mar 2022 22:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C70316DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671766;
	bh=+CWO3E0FqqR57eXIy8K3/SJkwOMxql9KJrJ5lLu4+uU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUwx2NuyQcEs5UMoRVHQZMfoeso6nNmxmoJejzM72hux9FvBBLppmyZD7ndam1AvN
	 /ANnzrh+ERuJy+CXaJsQqID6seCi3DVYpk7B7bucG1lK5zTjnE4ZsuHdaG6QeVe9I/
	 aaCCuJK1ZOYpiUGh+2RiBB1Kv5x6kaLHkwHk9fkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E212F80534;
	Wed, 30 Mar 2022 22:19:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D0AFF8051A; Wed, 30 Mar 2022 22:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE8BF800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE8BF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AVnOn2EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671586; x=1680207586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CWO3E0FqqR57eXIy8K3/SJkwOMxql9KJrJ5lLu4+uU=;
 b=AVnOn2EWFapg48XzKz0LWWvbn3JpKgggYP6GotWZdmVESoDBWT1o+WOM
 nDaNVBBVUBTeUWIwXge3t/0dSEVJe4/KbX7o/8Bx/Vpt4Q9BawFO79SC+
 FNooaeHlHT+QI4HfJBw8WlNz7goiCpG+qEb7+4ZRBjJ1OmBDFJuModcG2
 cbDANNopkU/2g0EELcYx8NRs1eXDUc3IGpZGNFgfToTFZt1n+4P+TSuQy
 ghQUlIwC02x604M4NsK7ZYbkgq3+isEpw36mydOXc0k8TbgwFs1w5W3qg
 O8iyxBNtzHAs90ttN14cn8N/f+I/IHfjujJKwu12QGp/t5k6ptkEBrCXT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819832"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819832"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045039"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:37 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/11] ASoC: SOF: disable dma trace in s0ix
Date: Wed, 30 Mar 2022 13:19:22 -0700
Message-Id: <20220330201926.1330402-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Libin Yang <libin.yang@intel.com>

When system enters s0ix, the dma trace won't be used. Otherwise,
the DMA will access the host memory, which will prevent entering
S0ix. Driver has notified firmware not to send message through
dma trace. Let's also trigger stop dma trace in driver side.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index a1a645a13c6d..44008dd075c2 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -102,11 +102,18 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 
 	/*
 	 * Nothing further to be done for platforms that support the low power
-	 * D0 substate.
+	 * D0 substate. Resume trace and return when resuming from
+	 * low-power D0 substate
 	 */
 	if (!runtime_resume && sof_ops(sdev)->set_power_state &&
-	    old_state == SOF_DSP_PM_D0)
+	    old_state == SOF_DSP_PM_D0) {
+		ret = snd_sof_trace_resume(sdev);
+		if (ret < 0)
+			/* non fatal */
+			dev_warn(sdev->dev,
+				 "failed to enable trace after resume %d\n", ret);
 		return 0;
+	}
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
 
@@ -201,6 +208,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* Skip to platform-specific suspend if DSP is entering D0 */
 	if (target_state == SOF_DSP_PM_D0) {
+		snd_sof_trace_suspend(sdev, pm_state);
 		/* Notify clients not managed by pm framework about core suspend */
 		sof_suspend_clients(sdev, pm_state);
 		goto suspend;
-- 
2.25.1

