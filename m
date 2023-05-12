Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6667005A9
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 12:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7761E3;
	Fri, 12 May 2023 12:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7761E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683887661;
	bh=Ftyf4sbuDJi3DulyOGGvMkBC2qDnzP+mxx8gm7PFVb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cGfmz8JbqLshzxbduflPgT3ucGXNEk7NDvtY8YqIS4FbUU2ap9tXI+syuhFftM2Pf
	 8HdHdpr7izJjCJa631kaweM9NsfelmyJDgc1veHcy9tOxd3M/AxThlLxDPDqm1VuWI
	 QUjmJ95qFEqapm0w4DM/42ro8siOFVFCczFtoJt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E49F8053D; Fri, 12 May 2023 12:32:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5391CF80549;
	Fri, 12 May 2023 12:32:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFDFFF8053B; Fri, 12 May 2023 12:32:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30BE9F80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 12:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30BE9F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E5BnOKMY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683887550; x=1715423550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ftyf4sbuDJi3DulyOGGvMkBC2qDnzP+mxx8gm7PFVb0=;
  b=E5BnOKMYr3q+UMf4Deqd10DtFa5UfAEKio0ejD4c/B1Z8YiahI7NQGXz
   VIeBOipWg7EmpcSx3/7QFHDgos0ZVH5PBuSVRqD/jHO9kU1RX8FAhT+Yt
   OJJNL2JyqIo8P2axNC8LWDiJ0qpKQBpP9OgW4R14K2FZw/NzFSti3mJAx
   opw0IJAxsfY9cI8FkMLnnmRDvNhWgnDUmpWEvMR14TqglYRvAyfygSNpZ
   bSxG2iLFTSY8mCjC94gQNG5ijXpiv+eIhL8FG9Q+vF/1XOTkP28pYsVSI
   2lLWPw/hbYXi/6l1CR/7FjZw6f+D+QwjhLo0BgBua5qcgng+Exz8yjhVH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416390479"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="416390479"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730774129"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="730774129"
Received: from nhanph1x-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.38.84])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 03:32:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com
Subject: [PATCH 1/3] ASoC: SOF: debug: conditionally bump runtime_pm counter
 on exceptions
Date: Fri, 12 May 2023 13:33:13 +0300
Message-Id: <20230512103315.8921-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512103315.8921-1-peter.ujfalusi@linux.intel.com>
References: <20230512103315.8921-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 37YVK2MGO2TU2LCWQ2KG6JNK5GNI7HZR
X-Message-ID-Hash: 37YVK2MGO2TU2LCWQ2KG6JNK5GNI7HZR
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37YVK2MGO2TU2LCWQ2KG6JNK5GNI7HZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When a firmware IPC error happens during a pm_runtime suspend, we
ignore the error and suspend anyways. However, the code
unconditionally increases the runtime_pm counter. This results in a
confusing configuration where the code will suspend, resume but never
suspend again due to the use of pm_runtime_get_noresume().

The intent of the counter increase was to prevent entry in D3, but if
that transition to D3 is already started it cannot be stopped. In
addition, there's no point in that case in trying to prevent anything,
the firmware error is handled and the next resume will re-initialize
the firmware completely.

This patch changes the logic to prevent suspend when the device is
pm_runtime active and has a use_count > 0.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index b42b5982cbbc..d547318e0d32 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -438,8 +438,8 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev, const char *msg)
 		/* should we prevent DSP entering D3 ? */
 		if (!sdev->ipc_dump_printed)
 			dev_info(sdev->dev,
-				 "preventing DSP entering D3 state to preserve context\n");
-		pm_runtime_get_noresume(sdev->dev);
+				 "Attempting to prevent DSP from entering D3 state to preserve context\n");
+		pm_runtime_get_if_in_use(sdev->dev);
 	}
 
 	/* dump vital information to the logs */
-- 
2.40.1

