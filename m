Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC0896AAA
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0CC42CAA;
	Wed,  3 Apr 2024 11:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0CC42CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136769;
	bh=FTDH1oQvlp5NP1lmkejXPGpJ6yiFZuoKf7yu4Nvt+hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ACyAQSnt5VN/Aj0f4qAIV0gnkVseU/NqD7oV6aHwsui9/jgaenV0hGzuyMoK9X2ZC
	 uRMM5MUGTgzOjUQfx926SD1PYKsWhvak0uOKJtIBb5o2VdnabvaXLeQ3WCX541TyjV
	 CaFLFUuSOvgjoTbD3Ut/WWxKJzh3S8SCfdPmwWeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59568F8062D; Wed,  3 Apr 2024 11:31:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 323FDF805EA;
	Wed,  3 Apr 2024 11:31:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54973F80568; Wed,  3 Apr 2024 11:31:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72675F80238
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72675F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JNYBiHqj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136683; x=1743672683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FTDH1oQvlp5NP1lmkejXPGpJ6yiFZuoKf7yu4Nvt+hQ=;
  b=JNYBiHqjGq6I5z1UR5IYRGj8YE0qqDzN7sf9NYXdp9qlej/agsMm5huv
   Xw6Y50Bbz0w8Q0INF8mCqJkKMW8yAFkXe98VrBxBsy4YeNhL3d9OT9eac
   dSh07he3bjZVlr8gQpk6XOAVMDbG3CLw1N/fWq7O8dD79zDXnhCr0ay+y
   VjV0a3xLiH0KOE6Eb40Ll0TQm5R4gg/d+rkhkzfVfhFRWCCbAhQPZgIah
   2hlGE2vOiQi+dJlxybp8/TNYccWa5zDis/lzotRaIJz8Wmc7fIQUx0oub
   dJQImQ2sHYR826Owr9SQ3F6/tSuZgMT6xOBd9tWtgq3nbqDOYg5pi+Hcg
   Q==;
X-CSE-ConnectionGUID: 38984UkvQuSotbtGrGI/Ww==
X-CSE-MsgGUID: HiVwhW6aRwSuWBcannkSvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218697"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218697"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:21 -0700
X-CSE-ConnectionGUID: 4noLoxgzS8qG2ti1B+o6GQ==
X-CSE-MsgGUID: FdVRklATQ4OXsRArR76EWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797545"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:19 -0700
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
Subject: [PATCH 04/10] ASoC: Intel: avs: es8336: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:39 +0200
Message-Id: <20240403093145.3375857-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UXF6SH7SUOEAJ4ISFD5NZN3T5DHY4DAJ
X-Message-ID-Hash: UXF6SH7SUOEAJ4ISFD5NZN3T5DHY4DAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXF6SH7SUOEAJ4ISFD5NZN3T5DHY4DAJ/>
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
 sound/soc/intel/avs/boards/es8336.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 5c90a60075773..ff3bd15132694 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -85,7 +85,7 @@ static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Internal Mic"),
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

