Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708888EB1D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:25:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928E42C13;
	Wed, 27 Mar 2024 17:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928E42C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556715;
	bh=ehVOa6dAhlhoKEdMKTbm6D7iGxqzbJC4ouF1GiS0TGw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o7/yAwmtJa78rmDr/OCTPRBVhRCzDd6iqUC4hFmb7VEclf54sbV4uQl2nsX/XAsVK
	 6oQI3HCvrXtwVvWGiiIDTNtg3mumBwN3Hg1ihC+cXgnAvwTMjeUcpvuIrbRRWHfRQl
	 8x7znouon1cZ0QSNNVtPBepwJBymuZXFeP7Eitcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F59CF80589; Wed, 27 Mar 2024 17:24:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D4AF805B5;
	Wed, 27 Mar 2024 17:24:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DAE1F80570; Wed, 27 Mar 2024 17:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AD9FF80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD9FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J4qFiI5P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556672; x=1743092672;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ehVOa6dAhlhoKEdMKTbm6D7iGxqzbJC4ouF1GiS0TGw=;
  b=J4qFiI5PA+Q0yXIKluutdqZ24fj0tbk44kM4mPS6JeGr+Ew3AkwdNXvd
   mhentb+HXInU09+z5Mvk4OZE7YTbJJztpieWAjl1fWNmvWrgs1C0he6Ff
   j8/wPIkKrk8jZV16EY4s5ASyu5BmT8vM9czgXbmSwx8EqadP2MSa5n+aV
   j36PoTTOeAJoISN9DiNkJdUGNRHr1tLI5Dc188rauFdIsh7Xe8ajGkLtl
   PltYBQ2EUxcOGLoPPQUZ7/D0zi3cLXWp7RappKB8ZocwsLt7qYNPbkVY2
   V1mwKQStel5/LQlGOMsXRemHCHPfeCrhNw+/SJLQC/TiHPEMfCFE3iUT5
   Q==;
X-CSE-ConnectionGUID: Jg/RYpCLRpeK6DsFhBGMuA==
X-CSE-MsgGUID: 1uDv0tDSTpa0vS4Di7gRzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221478"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221478"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821236"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/18] ASoC: Intel: boards: updates for 6.10 - part3
Date: Wed, 27 Mar 2024 11:23:50 -0500
Message-Id: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UOAKEF2YGODQN2DFJYM2SDGR3UEP7BC3
X-Message-ID-Hash: UOAKEF2YGODQN2DFJYM2SDGR3UEP7BC3
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOAKEF2YGODQN2DFJYM2SDGR3UEP7BC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This last part is the continuation of Brent Lu's cleanups. Multiple
quirks have been removed to use "default" configurations and
ACPI-based detection of codecs and selection of topology files.

This cleanup has been done in multiple steps/phases since Fall 2023,
thanks Brent for this contribution!

Brent Lu (18):
  ASoC: Intel: ssp-common: relocate source file
  ASoC: Intel: ssp-common: relocate header file
  ASoC: Intel: ssp-common: naming convention change
  ASoC: Intel: ssp-common: module name change
  ASoC: Intel: ssp-common: delete module
  ASoC: Intel: ssp-common: get codec tplg suffix function
  ASoC: SOF: Intel: support tplg suffix detection
  ASoC: Intel: sof_nau8825: mach cleanup for adl boards
  ASoC: Intel: sof_nau8825: mach cleanup for rpl boards
  ASoC: Intel: sof_nau8825: add mtl_nau8825_def for mtl boards
  ASoC: Intel: sof_rt5682: mach cleanup for tgl boards
  ASoC: Intel: sof_rt5682: mach cleanup for adl boards
  ASoC: Intel: sof_rt5682: mach cleanup for rpl boards
  ASoC: Intel: sof_rt5682: mach cleanup for mtl boards
  ASoC: Intel: sof_cs42l42: board id cleanup for adl boards
  ASoC: Intel: sof_cs42l42: mach cleanup for adl boards
  ASoC: Intel: sof_cs42l42: add rpl_cs42l42_def for rpl boards
  ASoC: Intel: sof_cs42l42: add mtl_cs42l42_def for mtl boards

 .../sound/soc-acpi-intel-ssp-common.h         |  22 ++-
 include/sound/soc-acpi.h                      |  12 ++
 sound/soc/intel/boards/Kconfig                |  13 +-
 sound/soc/intel/boards/Makefile               |   3 -
 sound/soc/intel/boards/sof_board_helpers.c    |  15 +-
 sound/soc/intel/boards/sof_board_helpers.h    |   6 +-
 sound/soc/intel/boards/sof_cirrus_common.h    |   2 +-
 sound/soc/intel/boards/sof_cs42l42.c          |  17 +-
 sound/soc/intel/boards/sof_maxim_common.h     |   2 +-
 sound/soc/intel/boards/sof_nau8825.c          |   7 +
 sound/soc/intel/boards/sof_nuvoton_common.h   |   2 +-
 sound/soc/intel/boards/sof_realtek_common.h   |   2 +-
 sound/soc/intel/boards/sof_ssp_common.c       | 122 --------------
 sound/soc/intel/common/Makefile               |   2 +
 .../intel/common/soc-acpi-intel-adl-match.c   | 139 ++++-----------
 .../intel/common/soc-acpi-intel-mtl-match.c   |  52 +++---
 .../intel/common/soc-acpi-intel-rpl-match.c   |  90 ++++------
 .../intel/common/soc-acpi-intel-ssp-common.c  | 159 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   |  50 ++----
 sound/soc/sof/intel/hda.c                     |  82 +++++++++
 20 files changed, 423 insertions(+), 376 deletions(-)
 rename sound/soc/intel/boards/sof_ssp_common.h => include/sound/soc-acpi-intel-ssp-common.h (66%)
 delete mode 100644 sound/soc/intel/boards/sof_ssp_common.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ssp-common.c

-- 
2.40.1

