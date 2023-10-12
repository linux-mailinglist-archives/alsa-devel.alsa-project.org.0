Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 247917C679E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 10:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372B5836;
	Thu, 12 Oct 2023 10:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372B5836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697099788;
	bh=tjV3ec6MZtfDcZWMfDvvXutFIPoJ3o2Mcw8IYSZMyMk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W9HywWzDV5fWdZV8SQYHZDIMy3Q6KrZr8kytHH1KdRf3xsW2Cz1usEnYaMTnc4UQ+
	 GFKRQkD177C5icEO2jJqESRKdK+DTiForz9Iy1sJDbZdXzhcx92siwpUIVzogbvcH6
	 3Tm1HKBUAu9VkyhzU8GGuBrHrzfP35JU/Bn91zrM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ADFEF80570; Thu, 12 Oct 2023 10:35:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A10F80563;
	Thu, 12 Oct 2023 10:35:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1999AF8055B; Thu, 12 Oct 2023 10:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9FB6F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 10:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9FB6F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=avIHUvOk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099714; x=1728635714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tjV3ec6MZtfDcZWMfDvvXutFIPoJ3o2Mcw8IYSZMyMk=;
  b=avIHUvOky9RmU/tN2qogpmifgsndIkEsCWkrqvwkNHsWCPSXzKxnRMmb
   5BslZcgyy4ey/cs0s12Y6iTgIL3kwwZihwe370ZReIrDWv3W4szz5mv9p
   TJ1UWoQuZczkDfrm0eRUqlfpZWg5Lld72XAuPJpPXDnS9LNt27uZmOLuI
   G7TGt+n1lMmZ6GU3p9v1nj9kqytyXjPYc5jmrrBly4MOCfo6pII8PiOu2
   Wgl2q1ul+0oe1Gv49A6EhFzD/5q+jFE50YZA8m1z76GdkvnwN8GCyKd1F
   yIrC8SuObBS0P/6cRyCFIKVoeeFxRi7ezYrCP002kZ31WztjoG0eWc3rQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6417190"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="6417190"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824516563"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="824516563"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 01:35:05 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 00/16] Harden SSP boards and add TDM support
Date: Thu, 12 Oct 2023 10:34:58 +0200
Message-Id: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RPJG33HOLQJBAUAP7Q4U3EQJVMXR6X3R
X-Message-ID-Hash: RPJG33HOLQJBAUAP7Q4U3EQJVMXR6X3R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPJG33HOLQJBAUAP7Q4U3EQJVMXR6X3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In quite a few places in code there are checks for number of SSPs
present on system, to reduce maintenance burden introduce helper
functions allowing to get SSP and TDM from machine board configuration.

Current mechanism replaces "%d" present in some routes and widget names
with SSP number. However there are also configurations which make use of
of TDM number, in which case expected behavior would be to have string
in form of SSP:TDM - see implementation of avs_i2s_platform_register()
in sound/soc/intel/avs/pcm.c. Implement custom function, which parses
string and make use of it when parsing topology. While at it make sure
that we generate dynamic names only if there is no multiple SSPs or TDMs
defined.

Migrate all boards to handle TDM if requested.

v2:
 - Fix header functions to be static

Amadeusz Sławiński (16):
  ASoC: Intel: avs: Only create SSP%d snd_soc_dai_driver when requested
  ASoC: Intel: avs: Introduce helper functions for SSP and TDM handling
  ASoC: Intel: avs: Improve topology parsing of dynamic strings
  ASoC: Intel: avs: i2s_test: Validate machine board configuration
  ASoC: Intel: avs: rt274: Validate machine board configuration
  ASoC: Intel: avs: rt5682: Validate machine board configuration
  ASoC: Intel: avs: max98357a: Validate machine board configuration
  ASoC: Intel: avs: rt298: Validate machine board configuration
  ASoC: Intel: avs: da7219: Validate machine board configuration
  ASoC: Intel: avs: es8336: Validate machine board configuration
  ASoC: Intel: avs: max98373: Validate machine board configuration
  ASoC: Intel: avs: max98927: Validate machine board configuration
  ASoC: Intel: avs: nau8825: Validate machine board configuration
  ASoC: Intel: avs: rt286: Validate machine board configuration
  ASoC: Intel: avs: rt5663: Validate machine board configuration
  ASoC: Intel: avs: ssm4567: Validate machine board configuration

 sound/soc/intel/avs/board_selection.c  |   2 +-
 sound/soc/intel/avs/boards/da7219.c    |  17 +++--
 sound/soc/intel/avs/boards/es8336.c    |  18 +++--
 sound/soc/intel/avs/boards/i2s_test.c  |  55 ++++++++-----
 sound/soc/intel/avs/boards/max98357a.c |  18 +++--
 sound/soc/intel/avs/boards/max98373.c  |  18 +++--
 sound/soc/intel/avs/boards/max98927.c  |  18 +++--
 sound/soc/intel/avs/boards/nau8825.c   |  18 +++--
 sound/soc/intel/avs/boards/rt274.c     |  18 +++--
 sound/soc/intel/avs/boards/rt286.c     |  19 +++--
 sound/soc/intel/avs/boards/rt298.c     |  18 +++--
 sound/soc/intel/avs/boards/rt5663.c    |  18 +++--
 sound/soc/intel/avs/boards/rt5682.c    |  18 +++--
 sound/soc/intel/avs/boards/ssm4567.c   |  18 +++--
 sound/soc/intel/avs/pcm.c              |  28 ++++---
 sound/soc/intel/avs/topology.c         | 102 +++++++++++++++++++------
 sound/soc/intel/avs/utils.h            |  65 ++++++++++++++++
 17 files changed, 346 insertions(+), 122 deletions(-)
 create mode 100644 sound/soc/intel/avs/utils.h


base-commit: 7cd4a5a1531109287d8d9d34144020189201c031
-- 
2.34.1

