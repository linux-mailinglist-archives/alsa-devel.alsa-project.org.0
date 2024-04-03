Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E59896ABE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F70A1FF;
	Wed,  3 Apr 2024 11:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F70A1FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136855;
	bh=YMdEHr0zD4bfppwoJREpSdpNbg1nvju3vBIFu7zwGzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RyB+09rYg+/hHsEmYY22d6+ALRLSIYxxDnN+MUaR5RR6EeWKhe+U/sVSCv2x8gH0a
	 XdqK6XHng3haIUYCdjREzfpgc59bZ51ap9Fc8S6twe0/Cwq7DZbZN3X2r5BFhwOvZn
	 vi3/zK7D5HT53ukmsWgGwL0RrK6jHZA9eLoHp1V0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FBE8F8056F; Wed,  3 Apr 2024 11:31:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DF3F806DA;
	Wed,  3 Apr 2024 11:31:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC55F80607; Wed,  3 Apr 2024 11:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D5CEF8057D
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D5CEF8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fqbFyRJI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136690; x=1743672690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YMdEHr0zD4bfppwoJREpSdpNbg1nvju3vBIFu7zwGzk=;
  b=fqbFyRJIBFibbhW3S5AxZT1SAu0J3kze7dza9JKxfhqIUi4snj6TaGvn
   NAl+G9Q6NMARb9esCqjgyjMNhIkNOgt4w6CFtv/0ZeQu60u/c00b7Ti00
   +PCBC52LcpkkxSxqwxLfVm9w8QNzOdvmZvNLE/1Q7npsUhXISEjZEtbjo
   H5XkkkYRcI/q5rGMepmkj9sV2lqkRgA4Te/qtNc6Tq0P/0MwT7yBsLMvE
   ytJ6qwkA3pWRZv3/hMPr/mHwOSTIwCC26keRM25O0pR3xssLAhqnUiRvu
   7UToYw95n4pb6wba/2iPtEArVrCEaW3X0sZAbsuNmzUWpMcSRkiLinL17
   w==;
X-CSE-ConnectionGUID: gT1JmgOYS9ar17rGElF3oA==
X-CSE-MsgGUID: CZP0Zy7TQ/66LNfsMYHR1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218725"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:29 -0700
X-CSE-ConnectionGUID: QwRajnwCQTOeHs5ORRd2Aw==
X-CSE-MsgGUID: Sa7tiJlHQdShmZNT/dNz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797569"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:27 -0700
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
Subject: [PATCH 08/10] ASoC: Intel: avs: rt298: Constify card_headset_pins
Date: Wed,  3 Apr 2024 11:31:43 +0200
Message-Id: <20240403093145.3375857-9-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6D6B7UDMRCIDG3CTI5C75Y7CXXDLPUEB
X-Message-ID-Hash: 6D6B7UDMRCIDG3CTI5C75Y7CXXDLPUEB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6D6B7UDMRCIDG3CTI5C75Y7CXXDLPUEB/>
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
 sound/soc/intel/avs/boards/rt298.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 6e409e29f6974..7fd28544f7869 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -49,7 +49,7 @@ static const struct snd_soc_dapm_route card_base_routes[] = {
 	{"Speaker", NULL, "SPOL"},
 };
 
-static struct snd_soc_jack_pin card_headset_pins[] = {
+static const struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
-- 
2.34.1

