Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23D88B395
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46591928;
	Mon, 25 Mar 2024 23:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46591928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404710;
	bh=YZrnm+5vAt2GVw94vUjSxAEtlbSPpE5bKQUqXDSqNLk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VybksK9TkD5ikApktgNKytxMalay/UH3v0HdfUYZLIFRvZ/WWGN4v9j2dIzv9q5Tq
	 OyyZrkfezD682CrxeP4Az8d76HEzf/XTMeCQA5uO7IvAmi36FZTKBFbEW2QgLFEmJQ
	 nd+ugqebfFVozK/QSmcMY1r4Xoqt7yDx5i3oqoqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BE06F80588; Mon, 25 Mar 2024 23:11:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DEBEF8059F;
	Mon, 25 Mar 2024 23:11:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D42FF80564; Mon, 25 Mar 2024 23:11:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 635FEF80093
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635FEF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dlND9Jfc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404680; x=1742940680;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YZrnm+5vAt2GVw94vUjSxAEtlbSPpE5bKQUqXDSqNLk=;
  b=dlND9JfcFhR80vQc2zENsUu3qs0fEe6eiZpnK0gRmQ1DY4AJIZkkwRc7
   +O9w7qW5MmNLK7GygvnthJNUyBRtby8QMNY9TTrYzFzhMeT+eaFoWovfa
   KKDrJ12NsLGP9lwKw29BneOjcdoIdS5ZfCzZfhl63CTvLoHNddVF9HDmy
   lVpPt/skVnNLZAAL9Ovjh1VLyxnHKCe/TD4j3vNsIS3mtGMtVPhCLMMmU
   jXwXQ88u+LsoQJKbtSx2qcliITmyDD75+ugfiRp7gAHKoCXiTHUgpHVZz
   x431F7abMaPxNAerCJ/Kk9285rk1dQmPaBoO0WxANDQsr2i2u/ZVjF/gx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643597"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722075"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/21] ASoC: Intel: boards: updates for 6.10 - part1
Date: Mon, 25 Mar 2024 17:10:38 -0500
Message-Id: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NVCHCBESADSTEB3TVVHTYXD7WP7YAMW4
X-Message-ID-Hash: NVCHCBESADSTEB3TVVHTYXD7WP7YAMW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVCHCBESADSTEB3TVVHTYXD7WP7YAMW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have quite a few machine driver patches, spread in 3 series of
about 20 patches each. This first part from Brent Lu adds common
helpers and board configurations to reduce the number of quirks.

Brent Lu (21):
  ASoC: Intel: board_helpers: support DAI link ID customization
  ASoC: Intel: sof_ssp_amp: use common module for DAI link generation
  ASoC: Intel: board_helpers: change dai link helpers to static function
  ASoC: Intel: sof_da7219: add rpl_mx98360_da7219 board config
  ASoC: Intel: sof_rt5682: support ALC5650 on RPL boards
  ASoC: Intel: sof_cs42l42: rename BT offload quirk
  ASoC: Intel: board_helpers: support sof_card_private initialization
  ASoC: Intel: sof_cs42l42: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_nau8825: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_rt5682: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_ssp_amp: use common module for sof_card_private
    initialization
  ASoC: Intel: sof_da7219: use common module for DAI link generation
  ASoC: Intel: sof_da7219: add codec exit function
  ASoC: Intel: sof_da7219: add SOF_DA7219_MCLK_EN quirk
  ASoC: Intel: sof_da7219: board id cleanup for jsl boards
  ASoC: Intel: sof_da7219: board id cleanup for adl boards
  ASoC: Intel: sof_da7219: board id cleanup for rpl boards
  ASoC: Intel: sof_rt5682: remove unnecessary idisp HDMI quirk
  ASoC: Intel: sof_ssp_amp: remove unnecessary idisp HDMI quirk
  ASoC: Intel: sof_nau8825: remove sof_nau8825 board id
  ASoC: Intel: sof_rt5682: board id cleanup for cml boards

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_board_helpers.c    | 146 ++++---
 sound/soc/intel/boards/sof_board_helpers.h    |  97 ++++-
 sound/soc/intel/boards/sof_cs42l42.c          |  72 +--
 sound/soc/intel/boards/sof_da7219.c           | 410 ++++++------------
 sound/soc/intel/boards/sof_nau8825.c          |  92 +---
 sound/soc/intel/boards/sof_rt5682.c           | 222 ++++------
 sound/soc/intel/boards/sof_ssp_amp.c          | 264 ++++-------
 .../intel/common/soc-acpi-intel-adl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |   6 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-rpl-match.c   |  12 +
 12 files changed, 518 insertions(+), 812 deletions(-)

-- 
2.40.1

