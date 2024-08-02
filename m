Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD584945E13
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563B64615;
	Fri,  2 Aug 2024 14:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563B64615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602832;
	bh=XBS9PxZs/DQyKy80vX3Y7aB81pdtJGCDeOOoRgQsmwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhNaxmCnbFIDsyJFqEGrY8fdG+Ed8dDKAan+dsvXsCmm/0bLX00KXMJCBfwn2Uh79
	 7OLlkyV5eqw08oZDRUZeZnWLOtEoo/toe62xjt3Fxt+lB67zPCHejq02hvSD/OUpeE
	 vaQMj999IoVSXGTMxbixmn0fTxnb1zHU+mYB/soY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6590AF805C6; Fri,  2 Aug 2024 14:46:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF02F805C2;
	Fri,  2 Aug 2024 14:46:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A28A0F8026A; Fri,  2 Aug 2024 14:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7250EF800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7250EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eq4zfuM9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602787; x=1754138787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XBS9PxZs/DQyKy80vX3Y7aB81pdtJGCDeOOoRgQsmwY=;
  b=eq4zfuM93k6UcPghiCKweXzHIWVU1urDKEOeDxk4qmZ+wFcqTVNs9b2f
   nDCicKfTxKcRuRZ5y6SGAScHd//Bjq7ocD4BzZEASpavO1KIaSy1uW+YE
   yBloBpvLZGY90s8LBJ2hBPAsOfL4CNAKf7xLgdenkzcXBk19zEv50ZOtT
   VNbD6FR56SxfrAFz9axERF0BneudKmzFvujm5UYgVpLLJPAZ1F/ShZtbc
   Z0W9L9+V0Vxv9dubWtvaaeVOJ9L9KpZYiQX87pImZ9qqQ9ppRxPRfE9f/
   aNYtFOHRrnHTsybXk4Vkt+b6SZjvUePQuxWzX3w7LCiwg0UrRif666IUw
   A==;
X-CSE-ConnectionGUID: zQTWJJMYQLyAA8pjU+YCvQ==
X-CSE-MsgGUID: W9npddkCT0WvOf0iFGpqYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199380"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="20199380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:46:24 -0700
X-CSE-ConnectionGUID: tOD1a0kvQaureISg0dzQ2A==
X-CSE-MsgGUID: fjelm9b1RTO/i455o8ZSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="60407845"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:46:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: sof-priv.h: optimize
 snd_sof_platform_stream_params
Date: Fri,  2 Aug 2024 14:46:06 +0200
Message-ID: <20240802124609.188954-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JNCQQBT4DSR2MII54GYUQU4CM7XABJ5S
X-Message-ID-Hash: JNCQQBT4DSR2MII54GYUQU4CM7XABJ5S
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNCQQBT4DSR2MII54GYUQU4CM7XABJ5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

reshuffle members to remove hole.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 4d6a1517f9b3..28179a573762 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -132,16 +132,17 @@ struct snd_sof_pdata;
 
 /**
  * struct snd_sof_platform_stream_params - platform dependent stream parameters
- * @stream_tag:		Stream tag to use
- * @use_phy_addr:	Use the provided @phy_addr for configuration
  * @phy_addr:		Platform dependent address to be used, if  @use_phy_addr
  *			is true
+ * @stream_tag:		Stream tag to use
+ * @use_phy_addr:	Use the provided @phy_addr for configuration
  * @no_ipc_position:	Disable position update IPC from firmware
+ * @cont_update_posn:	Continuous position update.
  */
 struct snd_sof_platform_stream_params {
+	u32 phy_addr;
 	u16 stream_tag;
 	bool use_phy_address;
-	u32 phy_addr;
 	bool no_ipc_position;
 	bool cont_update_posn;
 };
-- 
2.43.0

