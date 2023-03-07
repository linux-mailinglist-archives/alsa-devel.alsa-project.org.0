Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0E6ADEDE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 13:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B981451;
	Tue,  7 Mar 2023 13:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B981451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678192656;
	bh=9a9f+uNXjfvKS5jWdq5nB+pAeG97d22Y7plEqmDz724=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jKdU+6k4Vtsq1aNPPiV2TEXneLXtqKGKAtmb0f/yjXoKGl/kSnVgbnzCtDhQfEldW
	 lDAcLAxGQNhHSF1rj+8/U0i4Qy+qRrSWDXKUaHnfOWDIGokG+FBvby8ugspVSlFRai
	 km3BIu/s0w9KNg43iTJW379Dah1fEwm8XLwFAeO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BADC2F804FE;
	Tue,  7 Mar 2023 13:36:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56758F80482; Tue,  7 Mar 2023 13:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D7E4F80482
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 13:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7E4F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Gp3Iy1tt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678192558; x=1709728558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9a9f+uNXjfvKS5jWdq5nB+pAeG97d22Y7plEqmDz724=;
  b=Gp3Iy1ttJuCygelQCdAy3Dx4ygByrjsd0VFsbDRQTWa7ZJ1jG6gyEZSG
   BhuiNxo+n7B1rKvmt4U78VKVbUrBm8XP0xj+LrIFuXD3cKhRAFwwgbHuB
   11les58Ztgeti+HWiMz9Q3nK+1o2m0rzuPDtfSsJooxhUETjoSn8SS2Ab
   SE0RYXI+ofGKkKRYW+MYFlN73ffi88K1pCCLzpWT1AAjtQXtzwosZBbsB
   rGGPkVU+0GXto1SquLJTkZyXAeAWgzofdpMRklM1Vqn9DdzIbCwY+mPVR
   noDpL4WlAYk1QUJ0+E+BpG2uHLuPVwwEj/xUVsCxFAxPhW1WWese17ihf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315492800"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="315492800"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745444358"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="745444358"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: ipc4: Add macro to set the core_id in
 create_pipe message
Date: Tue,  7 Mar 2023 14:35:54 +0200
Message-Id: <20230307123556.31328-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
References: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UMVW3YGCWNDHEGIX7QWP6PBKQJ7IXSNN
X-Message-ID-Hash: UMVW3YGCWNDHEGIX7QWP6PBKQJ7IXSNN
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMVW3YGCWNDHEGIX7QWP6PBKQJ7IXSNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The create pipeline message can carry the target code_id which is set to
0 at the moment.

Add macros to set the core_id in the message extension.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index d31349bf011d..49ff1558a171 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -176,6 +176,10 @@ enum sof_ipc4_pipeline_state {
 #define SOF_IPC4_GLB_PIPE_EXT_LP_MASK		BIT(0)
 #define SOF_IPC4_GLB_PIPE_EXT_LP(x)		((x) << SOF_IPC4_GLB_PIPE_EXT_LP_SHIFT)
 
+#define SOF_IPC4_GLB_PIPE_EXT_CORE_ID_SHIFT	20
+#define SOF_IPC4_GLB_PIPE_EXT_CORE_ID_MASK	GENMASK(23, 20)
+#define SOF_IPC4_GLB_PIPE_EXT_CORE_ID(x)	((x) << SOF_IPC4_GLB_PIPE_EXT_CORE_ID_SHIFT)
+
 /* pipeline set state ipc msg */
 #define SOF_IPC4_GLB_PIPE_STATE_ID_SHIFT		16
 #define SOF_IPC4_GLB_PIPE_STATE_ID_MASK		GENMASK(23, 16)
-- 
2.39.2

