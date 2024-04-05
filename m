Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB589991F
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CBA2D1F;
	Fri,  5 Apr 2024 11:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CBA2D1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308474;
	bh=/l8JmGiEYsduQSPVUJfW308+QOvtWeS4SnQ3Hl92vdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDd3Ue+hSkGRT/7/N4qdczofcSX8hTRqe17xp7wdJa+etN9zcjytK7u1DgnmHkmty
	 rxvx7Layu30HWNoTgxH6FZ25TZS2dELhafYceGqc0KELZgdVWhi54r1uEnFE7uGfrY
	 TN/zX+oJWSZNCoQAYdD7D1lEVaq+ZtoDenLFbf9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E8D7F80818; Fri,  5 Apr 2024 11:10:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CB4F80808;
	Fri,  5 Apr 2024 11:10:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF187F8057A; Fri,  5 Apr 2024 11:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56E24F80568
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56E24F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hvlLXW/l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308107; x=1743844107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/l8JmGiEYsduQSPVUJfW308+QOvtWeS4SnQ3Hl92vdM=;
  b=hvlLXW/leqqtBNuL02Blcabm5zrai9528P96WcIkvBJgsZbWNgk5Fmo+
   KPjHk3nswM+5au0jhQxaSMMY8QC/GileaSoi0LcxtqWku3h/jLmLZlaxE
   c9Xbkw7yHHkuwH+8NDjXAD8v3f2uNA6rGZlpwt3twFr023VJ+tdmRJuUL
   IPf/wgcmT6vzpIV1oFfz0GMr6MDsh8jGTqc8Akc0RMjCQ6SLRPSP5F56K
   VOKwFLjfd5PP11fJs9ZBP8aBMOIrMvTwitPAEN7YNsrrVoOukMa4xR6AZ
   XA8lmSdGBApczpFeMdhLMpJgUU5xi0KM9ytgrmBmFTkMmp8HNW+gCxwxo
   g==;
X-CSE-ConnectionGUID: RAkWBRYbQASg9tiOc+PByA==
X-CSE-MsgGUID: mYHUOw/PS0GU3rVSJGFWzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787468"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787468"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:24 -0700
X-CSE-ConnectionGUID: nmem/xb6S6qGGj8tgyE1aQ==
X-CSE-MsgGUID: pV4bRyYsTg2Q8ULE1MHDGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042443"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:22 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/13] ASoC: Intel: avs: Remove dead code
Date: Fri,  5 Apr 2024 11:09:25 +0200
Message-Id: <20240405090929.1184068-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G4XPELPML7U4NYJUMWNETLJGSRY3M2YU
X-Message-ID-Hash: G4XPELPML7U4NYJUMWNETLJGSRY3M2YU
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4XPELPML7U4NYJUMWNETLJGSRY3M2YU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The result of list_next_entry()/list_last_entry() is never null.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 8dfd90587427..fa3fec339548 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -709,8 +709,6 @@ static int avs_path_pipeline_arm(struct avs_dev *adev,
 		/* bind current module to next module on list */
 		source = mod;
 		sink = list_next_entry(mod, node);
-		if (!source || !sink)
-			return -EINVAL;
 
 		ret = avs_ipc_bind(adev, source->module_id, source->instance_id,
 				   sink->module_id, sink->instance_id, 0, 0);
-- 
2.25.1

