Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BA709729
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6949C3E7;
	Fri, 19 May 2023 14:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6949C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684498667;
	bh=KLWKYCB/nHshPSwyWfJ/Ve6YZxIExZIJ6s1YfxN9jMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eUFDjlNocffOuVCiEUmy9R/lagadCzUA0FQhxPzB4DyVXNJgeRols4v1X3vsqXbcE
	 0hiJJKGb0GvZSOcnE+aLjSXc8ZVZmNB/3LBE6jUxrNmsCFE9jRlVJ+b0p9Pr8lvHiD
	 3rPcd8vxLNgqwxUjXIl3slRVeR1nAZARJuPY5Cpg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41330F80553; Fri, 19 May 2023 14:16:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CB7F80553;
	Fri, 19 May 2023 14:16:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6155F8053D; Fri, 19 May 2023 14:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1D15F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D15F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WROC+LGg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684498560; x=1716034560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KLWKYCB/nHshPSwyWfJ/Ve6YZxIExZIJ6s1YfxN9jMU=;
  b=WROC+LGg6Taqdqu2nbZuiFlx8o+fsVZtRxPhg/TJPBh2ZJdZxlOFqKwz
   5ZsFl52bWGYpbCG+tA5eZoi/tNRAmYLMHinteHR5OVCt3tLckhdF/hHFv
   Tu15NhM31fx32nP9xPn2UmzNqI0SAnPG4B5wz3EDCGxVrX5FCVlTgQPoG
   g4DHZ9Ky6Mel4ON4YH5vkTFkCJknF6LjFWJCGHLmVohUeU86ufoOheA6+
   Y2y+VdEN/bGtnBsc/F0dk1DkPBTmjnF1bYLps9EFIZhRXBHVzATJhisRw
   ZbXwBpLsGjQQJvKaUmx2IHZgIozGGp3ZXkPBzmIt/NKHTr76xZtfYbKXP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355584416"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="355584416"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733283666"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="733283666"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 05:15:55 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/7] ASoC: Intel: avs: Access path components under lock
Date: Fri, 19 May 2023 22:17:06 +0200
Message-Id: <20230519201711.4073845-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IVVRHHZJSC7O2ZKPZSSHJ4GW6RIHU2AD
X-Message-ID-Hash: IVVRHHZJSC7O2ZKPZSSHJ4GW6RIHU2AD
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVVRHHZJSC7O2ZKPZSSHJ4GW6RIHU2AD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Path and its components should be accessed under lock to prevent
problems with one thread modifying them while other tries to read.

Fixes: c8c960c10971 ("ASoC: Intel: avs: APL-based platforms support")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/apl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 02683dce277a..1860099c782a 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -169,6 +169,7 @@ static bool apl_lp_streaming(struct avs_dev *adev)
 {
 	struct avs_path *path;
 
+	spin_lock(&adev->path_list_lock);
 	/* Any gateway without buffer allocated in LP area disqualifies D0IX. */
 	list_for_each_entry(path, &adev->path_list, node) {
 		struct avs_path_pipeline *ppl;
@@ -188,11 +189,14 @@ static bool apl_lp_streaming(struct avs_dev *adev)
 				if (cfg->copier.dma_type == INVALID_OBJECT_ID)
 					continue;
 
-				if (!mod->gtw_attrs.lp_buffer_alloc)
+				if (!mod->gtw_attrs.lp_buffer_alloc) {
+					spin_unlock(&adev->path_list_lock);
 					return false;
+				}
 			}
 		}
 	}
+	spin_unlock(&adev->path_list_lock);
 
 	return true;
 }
-- 
2.34.1

