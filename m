Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE1785246
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860CE83B;
	Wed, 23 Aug 2023 10:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860CE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778108;
	bh=xYNNIyxVR7KiISqp+e+GiV75aUZndbayAZ3Z4C/kjFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p6c9+f1zATQzckNrVNWPnEdlIzyN6dwpD78APOL1E+ic1y1u+P7mqI/rzO6EimyHa
	 alEc76kZ1N/nxyyoFtrcLNHpJUBaYS5ftlK2RpMu0vIX6Pn6Vn8JhXXAslOD3k5S1Z
	 xfXz9+1pJlnO0I34kFMFkUykK0oq8iPuqV+ftt48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CF0EF804F3; Wed, 23 Aug 2023 10:07:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AE4F800F5;
	Wed, 23 Aug 2023 10:07:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F639F80536; Wed, 23 Aug 2023 10:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11516F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11516F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HIoERzz6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777971; x=1724313971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xYNNIyxVR7KiISqp+e+GiV75aUZndbayAZ3Z4C/kjFc=;
  b=HIoERzz61fUKNQlYb7GIaflFTznpkX5AlwZBogLEpQFyttKwHdbuIEHE
   ii8skXOpHTQj5t357Rjo+yVV5FfXCeRkrfL/aV6vIDv40lfxMIknfXTij
   q/LWLd58ccfxosc2OjdTJXrE0+ie6lZavRhMgh5b62fpvYsHsGne25Jhn
   nJyx5U7Xf/2dhs0t/7xihofVNfvNNVDUa1Az8wSODygzI8poNUIIPE/uO
   g7j+CwiXtL2I3f2IgkERKNL4NanThC2RdVvVNQYqfhZL1BhMy/koDHG1C
   35GMMCF+nCXXM/UepLjgI5r5r8XkJhupQUoe/rf/zgI3yDMaxMCCG8BSg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988001"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042651"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042651"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/17] ALSA: pcm: Honor subformat when configuring substream
Date: Wed, 23 Aug 2023 10:05:31 +0200
Message-Id: <20230823080546.2224713-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DKJPURGAETW2WAHWXR6KIIW2A7HIISF5
X-Message-ID-Hash: DKJPURGAETW2WAHWXR6KIIW2A7HIISF5
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKJPURGAETW2WAHWXR6KIIW2A7HIISF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Substream value is currently hardcoded to SNDRV_PCM_SUBFORMAT_STD.
Update the constraint procedure so that subformat selection is not
ignored.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/core/pcm_native.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 95fc56e403b1..01f2879ff8e2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2614,6 +2614,8 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	int err;
 	unsigned int mask = 0;
 
+	/* All PCMs support at least the default STD subformat. */
+	hw->subformats |= PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD);
         if (hw->info & SNDRV_PCM_INFO_INTERLEAVED)
 		mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_RW_INTERLEAVED);
         if (hw->info & SNDRV_PCM_INFO_NONINTERLEAVED)
@@ -2634,8 +2636,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
-					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
+	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT, hw->subformats);
 	if (err < 0)
 		return err;
 
-- 
2.25.1

