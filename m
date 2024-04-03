Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F76896AB3
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86ABC2C97;
	Wed,  3 Apr 2024 11:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86ABC2C97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136822;
	bh=xtNP8n0UaAOz/HWZrCRaOm/mAbqQPKVM9Ax+qaR6ZrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ksGJn3lJgeDntwPep0xvBcHDI3CCOptUzvHVbrWZAlpizgLujBxy9Z0gh4rs3ESMP
	 /MUHRDwQt+ces7At896lVbkOw4QPnw/yKDpR9OI/najMmIhfQ+pehAnRuh26DTRsVk
	 vuNBTTURPaKtXpzVJDQ/VbuS2F3SxXnn8Sb7QjCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C176F80689; Wed,  3 Apr 2024 11:31:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E0E6F80697;
	Wed,  3 Apr 2024 11:31:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 612C5F805C5; Wed,  3 Apr 2024 11:31:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49E6EF8016E
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49E6EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZOs+epNa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136688; x=1743672688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xtNP8n0UaAOz/HWZrCRaOm/mAbqQPKVM9Ax+qaR6ZrQ=;
  b=ZOs+epNaI57v8uv/9DiWZRnFjNeMruiRfCp0M1FQMneBkpGZxfGkmjKq
   3sETuk6picCi3W9BmeVnnNoxcexA9rvOslB2AfqqhuZMQEWD/P+xLiJOi
   Wq/1FqruRHFkY+r+RFligJKe4wcsVR0lL2K5TkXcSNMImRWzPG6VgtYI0
   uz97bHQdYFUZBzw6BNt1Yj/rpBzDjByn9ITA9GzcnMSqsDYfkYcbFVxpo
   BDTqTV+JEZSaWSgfYLVOViiMvhkmZM8SjBtlBeueStNkqkpDEWSYnSgup
   MnD9+WeTOe2BIXvV4JguAWAfPbGLli4d6q1hJrFzvNB0icZniKaDS1Q+Q
   g==;
X-CSE-ConnectionGUID: 2FAnSmdGQuW52f2nvPE15Q==
X-CSE-MsgGUID: /0lEvJIXSdeKy63FQ44NPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218717"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:27 -0700
X-CSE-ConnectionGUID: iCPtDgh2Re+f2VrhfT+/4g==
X-CSE-MsgGUID: VMTXgFl1TzuCpgh3VU2q4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797563"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:25 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 07/10] ASoC: Intel: avs: rt286: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:42 +0200
Message-Id: <20240403093145.3375857-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RBM72X5CWTSO4SAGIJ2U6VC5J3AVXSAX
X-Message-ID-Hash: RBM72X5CWTSO4SAGIJ2U6VC5J3AVXSAX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBM72X5CWTSO4SAGIJ2U6VC5J3AVXSAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

card_headset_pins is never modified, mark it const.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 4740bba105703..d24316fc4db9c 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -38,7 +38,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{"Speaker", NULL, "SPOL"},
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

