Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7E896ABA
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E272C9D;
	Wed,  3 Apr 2024 11:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E272C9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136840;
	bh=3xPphXhzLbuA18UzOFb+kaXJTJ0k+ktqMIUg+a9AL6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oWqtKAMAWGmnQxpPRQBmZ7n0hwAaeHPwwuXAR8+uazcylHZK2/KS9ZxZfCA5t0Kwv
	 3P5AYmzZUl58FJX+keF/7sBOEUGTSqdluNHyJhjxiYKuZX3KKUofYEkgTvzzMSiQoi
	 GplX2f+Bvv2Y0E9FZVZc/HpxlnibIa16bkldtoLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1947FF806CB; Wed,  3 Apr 2024 11:31:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D530F806C5;
	Wed,  3 Apr 2024 11:31:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D2CAF805E6; Wed,  3 Apr 2024 11:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FD5EF80130
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD5EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MqDfsTaC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136688; x=1743672688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3xPphXhzLbuA18UzOFb+kaXJTJ0k+ktqMIUg+a9AL6M=;
  b=MqDfsTaCe6+2yIZ+5LIGPmElzRkLl+9vy3a+UH2hJVNjWNLHbojyrop6
   fRrbPuiYWksOlfV/jvqljNKJsWkaME3whOFkZ+dFXQWnWwcuC8GRc/aHD
   XHBFG0Jz22BA1m8vX+RklWbX0BCoDlmBKBDC2WPQ/+vOmUdTzOIlql5Gc
   k65NBgSj1m1mgale509AF1L2PNLe4PAAeuuxHuMaL32Lk62JP6NvPZ32I
   E6dI1ez/kT9yWPYkLgvWnBW9YcjvnJ3YhDhHBK29etP9010h5vMdVPO2c
   jUmeaSwG0xER5KiqwxYSVEZypYT/QvPjAg03XaWXGTX+ULxtewrHipEKU
   A==;
X-CSE-ConnectionGUID: HG5O838RSd+AoOAiD8u4Kw==
X-CSE-MsgGUID: LrQbjs3ZQre7DXFxsafMoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218708"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:25 -0700
X-CSE-ConnectionGUID: lWZ0R/YRQwSDZ/CPRdwftA==
X-CSE-MsgGUID: PjStveT4SzmSB5jAlV/MEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797557"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:23 -0700
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
Subject: [PATCH 06/10] ASoC: Intel: avs: rt274: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:41 +0200
Message-Id: <20240403093145.3375857-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JTLTJPAMS6SKJNMJP7QLIG3NMM6WNFU5
X-Message-ID-Hash: JTLTJPAMS6SKJNMJP7QLIG3NMM6WNFU5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTLTJPAMS6SKJNMJP7QLIG3NMM6WNFU5/>
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
 sound/soc/intel/avs/boards/rt274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 1cf5242160875..e3aa28780df5a 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -75,7 +75,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{"MIC", NULL, "Platform Clock"},
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

