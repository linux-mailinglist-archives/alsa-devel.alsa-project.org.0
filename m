Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 677776ADDE6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882CF1437;
	Tue,  7 Mar 2023 12:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882CF1437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678189714;
	bh=gSuzJkPCU9N2Ou2gzkkxQ2hOSp+VXrinHvAsjktSJw4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gTDSPy8iw29muTSGelgd74eFk1Skgj/A5i/+jqIUNhdfaUXf8Y4NownzyVVBTqOk+
	 afBsudSiGL7DIA2zAG2lb37pjbA6Aa+6n10a3HXb7FR6du1BPk0iHLaihDtTtKqy3C
	 oLKdnsEWKTlJDm/0TdO8nNXcNolPs//eKC5zKO+M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3157F804B1;
	Tue,  7 Mar 2023 12:46:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3DF3F8042F; Tue,  7 Mar 2023 12:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB3F6F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3F6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mNzs79nj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189605; x=1709725605;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gSuzJkPCU9N2Ou2gzkkxQ2hOSp+VXrinHvAsjktSJw4=;
  b=mNzs79njcEHILz+0N3886lx3JdK9DyQH4gfwUQVqueNuKP9LhzXy6Ua1
   FRK/M3uIP34X55JOXwZDR+FKv9ml3gtNBGP4awJ+XnD4bIE7JMS7l7DJT
   Vk31o6FxPSilEPkDobehfXGCAXWVWdsHxiJW+L55pRmoLaiGVOXdklzMK
   2sfQE2sMnzwvil1fymZ2p1WK1pDIC67cZXQLjjyHG50Y5/B2WuzXWdLEy
   0rFtnWjB5pf8lKgCJ5ONgpTGLH0hr8P1dIz7qSe1l/A/yxILDJJK03oDh
   dkulYVsLk0TmFW6x1zS/sXI/Tbwj+vgUkx9BfLZ7/ziQWfeTjBWfvkoEQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400652562"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="400652562"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669850987"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="669850987"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:46:37 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: sof-audio: don't squelch errors in WIDGET_SETUP
 phase
Date: Tue,  7 Mar 2023 13:46:59 +0200
Message-Id: <20230307114659.4614-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MZDIEX3MTZTMKXZMEXHGI7UGYESFMOSE
X-Message-ID-Hash: MZDIEX3MTZTMKXZMEXHGI7UGYESFMOSE
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZDIEX3MTZTMKXZMEXHGI7UGYESFMOSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When an IPC error happens while setting-up a widget during the FE
hw_params phase, the existing logic will unwind all previous
configurations but will overwrite the return status. The ALSA/ASoC
logic will then proceed with the prepare and trigger phases, even
though the firmware resources are not available.

Fix by returning the initial error code and ignoring the code returned
in the UNPREPARE phase.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d7df29f2ada8..6de388a8d0b8 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -610,8 +610,8 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 	ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
 					dir, SOF_WIDGET_SETUP);
 	if (ret < 0) {
-		ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
-						dir, SOF_WIDGET_UNPREPARE);
+		sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
+					  dir, SOF_WIDGET_UNPREPARE);
 		return ret;
 	}
 
-- 
2.39.2

