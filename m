Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082089990A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94DE52D10;
	Fri,  5 Apr 2024 11:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94DE52D10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308282;
	bh=ZgplaqLEKcHbdbGlQoIaQOYnXMm8Ux7CECBvT2X2vUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fH6Vtf2iUfWe3R15IVi90/HLu2BEaUu/6oknl/WgiP6CwvtuDKsg18oOn/ibqDIqf
	 q61QLHO3+ATz8AV2firWQ+Bzi87I0cFMK3CgQ2yVyeknp2OEeOjV7Roj+n/b6MzYpI
	 rS3ts7KBkeKjTm2zN6hxaPezoBGouMbGff3hQ2A8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A09BF805ED; Fri,  5 Apr 2024 11:10:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D78CFF805D3;
	Fri,  5 Apr 2024 11:10:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A35F8020D; Fri,  5 Apr 2024 11:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74B47F8020D
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B47F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GHUs50Uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308092; x=1743844092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZgplaqLEKcHbdbGlQoIaQOYnXMm8Ux7CECBvT2X2vUw=;
  b=GHUs50Uk+GyvgPL5d0RvMhFPyNS/lyCtBZlRM5Ixbo5e/E5w57ctUprk
   OB8rO08ewRcvIwNtNUHlykZoDeJTUXjGCzsBkDMlBx2TO9uFBPT5jbzK6
   hf/CWSlsV0lPpb+O9KL9FiezP1jtkhpk0QmMo8HZRilmp42ZvTTwLituZ
   mvChzdvvo8husUrSHXr1918gMEHb0TS82EN9x1mfzU7aCm5OJZqJtxNXa
   ftqz8KirKY3cfElx8dhMkPR2TsW1AkkDtsPLPcPgLPELm4Jjak8RHDo0c
   2CeEhiwGhT+BwER4oWZ71w6WQIOHSbIJwkLqX9HYaikpg5Z1iA22t4BRx
   Q==;
X-CSE-ConnectionGUID: 5pLu6OOCR0+px8f6aqT7jw==
X-CSE-MsgGUID: o2cHco8uR9CWzCH4eKDsiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787415"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:10 -0700
X-CSE-ConnectionGUID: 7wtEnBnqSO+hGljq1HrA+g==
X-CSE-MsgGUID: nZVPK7doQn+TTQ1mUsHP8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042415"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/13] ASoC: Intel: avs: Fix debug-slot offset calculation
Date: Fri,  5 Apr 2024 11:09:18 +0200
Message-Id: <20240405090929.1184068-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X4N5YS2ZIV7F6ODCM7R7T4W4ASNNCQXY
X-Message-ID-Hash: X4N5YS2ZIV7F6ODCM7R7T4W4ASNNCQXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4N5YS2ZIV7F6ODCM7R7T4W4ASNNCQXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For resources with ID other than 0 the current calculus is incorrect.

Fixes: 275b583d047a ("ASoC: Intel: avs: ICL-based platforms support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/icl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 9d9921e1cd4d..3e0716160f5a 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -66,7 +66,7 @@ struct avs_icl_memwnd2 {
 		struct avs_icl_memwnd2_desc slot_desc[AVS_ICL_MEMWND2_SLOTS_COUNT];
 		u8 rsvd[PAGE_SIZE];
 	};
-	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][PAGE_SIZE];
+	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][SZ_4K];
 } __packed;
 
 #define AVS_ICL_SLOT_UNUSED \
@@ -89,8 +89,7 @@ static int avs_icl_slot_offset(struct avs_dev *adev, union avs_icl_memwnd2_slot_
 
 	for (i = 0; i < AVS_ICL_MEMWND2_SLOTS_COUNT; i++)
 		if (desc[i].slot_id.val == slot_type.val)
-			return offsetof(struct avs_icl_memwnd2, slot_array) +
-			       avs_skl_log_buffer_offset(adev, i);
+			return offsetof(struct avs_icl_memwnd2, slot_array) + i * SZ_4K;
 	return -ENXIO;
 }
 
-- 
2.25.1

