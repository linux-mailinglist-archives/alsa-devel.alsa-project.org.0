Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F81896AAE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79B22CC2;
	Wed,  3 Apr 2024 11:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79B22CC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136803;
	bh=7TaebfQkikL01h/Xt59bLY/GpqScWWg7l2TJk8s/O2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SzQT/Tnp/GXaP13S4GRM/RIyUnS0+2mfMeihXFxjLXEZgAWdChXbf0MCDT7OWRuu6
	 iwDLfb0fv+Mm8IWn0Kj7+eesTh2qGH9Xa6fQZft+bo3S+b+ndZfmKXQJAj9LMa0LBv
	 D8EVN8xbt/Bpnt/URCh01RqZ78DcVIHbKfht9aaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0C5BF80676; Wed,  3 Apr 2024 11:31:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D98F8067C;
	Wed,  3 Apr 2024 11:31:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33EB7F80579; Wed,  3 Apr 2024 11:31:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B167F80236
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B167F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F80nIcX2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136684; x=1743672684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7TaebfQkikL01h/Xt59bLY/GpqScWWg7l2TJk8s/O2U=;
  b=F80nIcX2viNAvL3QIhKBZaRkStzmm+w6SAEYXVZSPQsK11mPnV7l5WG0
   auxU9BhoRuFx9nX4Wrc0/wJI1m8h75UGFULwvIS1nXJiadYWbl0tsLWiq
   cd9j4wcHJ0CUfNzCvBFdhgJsbwiegEO82/ClkXgzSt697j7U37mn0LMSL
   Ua7pG0rWIPuocEBK6zlalGBTqZACpI1T4RB9Ntx169lqysMSmO0sp+0tI
   gFDDdcRcbSBnI2o10gKgFXYRvQ/J54Dv3Y48hmYTDJmSsMedFwPM0ylsw
   0NwAy9+1dderWib6A3DJZ6fuHPYXCW+k1wh0jGp5GKK8qXyluzoB3jNeS
   A==;
X-CSE-ConnectionGUID: 2mk1qXzWRzKs+Uh+ZaUwPg==
X-CSE-MsgGUID: 99n87wO2RoaZDil1AjUpLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218703"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:23 -0700
X-CSE-ConnectionGUID: MN8P8KzkTMaI6od6ijiikw==
X-CSE-MsgGUID: mjFkUyOSRAy3IC+qNb9djQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797551"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:21 -0700
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
Subject: [PATCH 05/10] ASoC: Intel: avs: nau8825: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:40 +0200
Message-Id: <20240403093145.3375857-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LM6CK276YSJ7QBQP56Q3B25OFUHJH3TZ
X-Message-ID-Hash: LM6CK276YSJ7QBQP56Q3B25OFUHJH3TZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LM6CK276YSJ7QBQP56Q3B25OFUHJH3TZ/>
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
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 55db75efae414..3164745b15167 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -67,7 +67,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{ "Headset Mic", NULL, "Platform Clock" },
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

