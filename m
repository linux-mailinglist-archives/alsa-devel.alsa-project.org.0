Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8937C5373
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 14:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5DD15AF;
	Wed, 11 Oct 2023 14:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5DD15AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697026694;
	bh=00zbyYRltCiVZ/ks7XjE1rWOHI8f3jdEG/5USA+G5j8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ceB6Mz8welPywVykPaxMhmB1O/H+5pL+LcUtnyAiTYQfGFHHvzUqiM4wyGHpcE6OO
	 Ox1zdpUPnfXnSYp2Bjmz90ejTw5MFgEn/pLjNFeAeKpRgo4BVcBp965glm9BhnxA7j
	 X+iek/mEYeJ81VJp0QtEJDG3a+H00Jik59Ey+y1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF43AF80567; Wed, 11 Oct 2023 14:17:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27CFAF80553;
	Wed, 11 Oct 2023 14:17:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25824F80536; Wed, 11 Oct 2023 14:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88D6AF80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 14:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D6AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gBDvinfK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697026628; x=1728562628;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=00zbyYRltCiVZ/ks7XjE1rWOHI8f3jdEG/5USA+G5j8=;
  b=gBDvinfKCJ3nCsNVWRoRmtIncCLwHWOzrdStE+S+GSd7DKaO/5ZeqhSY
   dIn+WTG8LDQVVYYXyiP8fUGN6zC7gXpX2CsyN6vWMeZKb1VJMz41q5uJn
   dg3TCwnei8QBB9NZTTxAMPYjECT8pO93j+IGgeHFALR5ZjXlwThI3Ltar
   CuL8lqJfGP259i/uDtYcezkw6N9G/iaTQ7/81cvzHUFhsQiK8t2AnAPoK
   RWK8eCTE0sV22RM+Hjvk0agNtnOBYzTGpwFKvAKxkISFLsvCQ+MLubaBL
   x4AG+wEq/97JpXKKxMbZHdU+y+GAEKd39pHTJgNN4hLErRkhQtivUQjDt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374988316"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="374988316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747428331"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="747428331"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 05:16:54 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 00/16] Harden SSP boards and add TDM support
Date: Wed, 11 Oct 2023 14:16:47 +0200
Message-Id: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LSEASUP4267QX44XRTWMMTOLEK7XVJSW
X-Message-ID-Hash: LSEASUP4267QX44XRTWMMTOLEK7XVJSW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSEASUP4267QX44XRTWMMTOLEK7XVJSW/>
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

-- 
2.34.1

