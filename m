Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA3896ABF
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25B52CCE;
	Wed,  3 Apr 2024 11:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25B52CCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136868;
	bh=/0HwR9BeGlHT/8EimwBOYK6tvT4kTu02wjjOYw0tNGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bvBImMIKFDkuK8lEK/l1MfozqIRixeAXJFKk9gB5iVuHMt3CZ/AqLTeAGMps2LCEv
	 XL1e6f8Ibp17qYOegiuCgORvihzypJ9fmwONkDt5Sqgm8Hl0sJ/kk8Ru53XFSnte0S
	 VZOqrqzAYEnIk/V4eOYDT7mvX5wTzdjbHPpjwXuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45DE2F8071C; Wed,  3 Apr 2024 11:31:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0C3F806D6;
	Wed,  3 Apr 2024 11:31:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0D3AF80611; Wed,  3 Apr 2024 11:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C8A5F805E7
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C8A5F805E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ah6Q8iWk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136694; x=1743672694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0HwR9BeGlHT/8EimwBOYK6tvT4kTu02wjjOYw0tNGk=;
  b=Ah6Q8iWk9yqUcD9N6QQovBW64REe1fb8r4rYay85VaP9NgancIIPEGdd
   ciMW1TCp9DRN9Zv6bihYAsA3Zx9n/TrKoUQY7J05yy9QXDOoEt+izrrCZ
   wDOExgNp+cwmPBkuG8xPowzI/SeCAXpulI3cSaUes5/zhyPPCf/184ycD
   Fhh95pMP9IHlQe1BT4OZm22m7e7BdeCVpXTRwYyI5/HKSDNEsYgn4gFZi
   9/AAMeFLge2NJ0xsp4kWYNvPhmniJP28bSEltB3NN09yve0e6QktE+X2z
   Z9RJFXELEPRNXPCiTDmHctKId8ibDobh+1QywUGhyjUnG4xlb2MCanoB1
   w==;
X-CSE-ConnectionGUID: lI37R0hjQY+jTGIQDRxMOQ==
X-CSE-MsgGUID: 3gF9g7ewSZu4rXsWmY4bMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218749"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:32 -0700
X-CSE-ConnectionGUID: 1zKRmFJ1R/e8oauVacYm8g==
X-CSE-MsgGUID: phKU8EAhThiVGTLk/yTDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797585"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:31 -0700
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
Subject: [PATCH 10/10] ASoC: Intel: avs: rt5682: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:45 +0200
Message-Id: <20240403093145.3375857-11-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2Y5X4DBRZ5FNO5I3AYSHU6KQQML35FFN
X-Message-ID-Hash: 2Y5X4DBRZ5FNO5I3AYSHU6KQQML35FFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Y5X4DBRZ5FNO5I3AYSHU6KQQML35FFN/>
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
 sound/soc/intel/avs/boards/rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 594a971ded9eb..823f04dba2f76 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -80,7 +80,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static struct snd_soc_jack_pin card_jack_pins[] = {
+static const struct snd_soc_jack_pin card_jack_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

