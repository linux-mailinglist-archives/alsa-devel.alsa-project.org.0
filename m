Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BF779520
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0527483B;
	Fri, 11 Aug 2023 18:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0527483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772668;
	bh=wkVDeR69FMQA4gkSRHESBBOC4GbH7mEOC7WoBsnNr+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QvY/dR1h+LMYIUXCxdJN7S4Kl+tXYJtpBOEpAfCt2qVn2U/OmiBt7R15SH9Mx8QlO
	 X1z+AtvwKxNsbqwyuK4trUgT8rA3TJnYU/4S2gt1NgVFKlzkfPP8hunFn1rlaKYzLg
	 wzFuCZEBol0ugfRASWI4b+HKZAjFTbvDQ5kcVhfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7914CF8055A; Fri, 11 Aug 2023 18:49:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EFBAF80553;
	Fri, 11 Aug 2023 18:49:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A2F3F801EB; Fri, 11 Aug 2023 18:49:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D416F80016
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D416F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jzwqbA2m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772558; x=1723308558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wkVDeR69FMQA4gkSRHESBBOC4GbH7mEOC7WoBsnNr+Q=;
  b=jzwqbA2mupMSDwu4Kx2Xq5G1Dhgbnuj8HyT/eNR8cxmEztqfONENaYb5
   sCLeMloieEWro8r+FdS2fsPuFVy+8d74WmoyZ4CrJn4VPOlsiUNpWICv7
   JbUKjDkFulN/ANQowhi9GsBiOJ1ESceI3fozxK8WapLxwWfKVtpk15CEi
   5nJQUj2Lm5eiy3y5Pt0EpisM/IWFYY2eH9DSpyJwzJ74rG8m2YTq74Fit
   AgR742hQ3a1pEtd6dnx1mopvO9wd2GvsbTxUuxun/8+Cn54zJkuvIyLwC
   xqpURhuRyZs/VGdMc+WmzaWXwZXJi4QW/PmMNN57UoAhiBf8OpzNHLpsG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725027"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725027"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842755"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842755"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 02/17] ALSA: pcm: Honor subformat when configuring
 substream
Date: Fri, 11 Aug 2023 18:48:38 +0200
Message-Id: <20230811164853.1797547-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VRTUG34ZMPSMTBAZOUPPWWLXIBKZ6M55
X-Message-ID-Hash: VRTUG34ZMPSMTBAZOUPPWWLXIBKZ6M55
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRTUG34ZMPSMTBAZOUPPWWLXIBKZ6M55/>
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
index 39a65d1415ab..cb2745f80af3 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2618,6 +2618,8 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	int err;
 	unsigned int mask = 0;
 
+	/* All PCMs support at least the default STD subformat. */
+	hw->subformats |= PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD);
         if (hw->info & SNDRV_PCM_INFO_INTERLEAVED)
 		mask |= PARAM_MASK_BIT(SNDRV_PCM_ACCESS_RW_INTERLEAVED);
         if (hw->info & SNDRV_PCM_INFO_NONINTERLEAVED)
@@ -2638,8 +2640,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
-					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
+	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT, hw->subformats);
 	if (err < 0)
 		return err;
 
-- 
2.25.1

