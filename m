Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9684E5A2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44D1786F;
	Thu,  8 Feb 2024 17:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44D1786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411405;
	bh=ZO04wL1tfiNFuprBXPy/8XNgAqKDMvmp5LHnk4M/5d0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NXEUMqR7HHrpMW7d6LBSYUw1fAlgKIYntUTecg6azm4+stzHS3yb6VPzEFelOfK2f
	 9h15EfDlqzFlzftOlqpVgda69HFiWikf5Y44hJEvkh4ILXufagj3nOm5BwBJNWlEIg
	 6aQ7yfMFy21O4s53XEjpsyGDTTWllHFAZWToPIe4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B903CF805A0; Thu,  8 Feb 2024 17:56:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D6D8F80587;
	Thu,  8 Feb 2024 17:56:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0694FF800EE; Thu,  8 Feb 2024 17:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7DF6F800EE
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7DF6F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e6FohlSB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411361; x=1738947361;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZO04wL1tfiNFuprBXPy/8XNgAqKDMvmp5LHnk4M/5d0=;
  b=e6FohlSBOG5MnlAGJ/v+MlZ21Z7JM9SmdPgkaWqAKLG7vwdbZyxEAscw
   1QuXRaU7RGGHOWpjhwk0gqOG7wDs7S58mvwteTHdWbZASJOwe1Kjr59my
   i7u0MVq/1B+DByyksG8FIHX99C8s9rhSZfAf9RRQvW12bzTiPyrpXSu/y
   SzX1qu29HcCAbTDOpC1EfWdYBtDUrFsgoicrL6X5OYrE9SE88ePfWvbhQ
   QqkNBIfeLg0zp3yC4AYZNQbZaqAO1kvrzFg1yqcmfLim3tW/84De9DxGs
   Fm0ecWI63De3q0XU3dFqvDXEXGo7e4QYP2XBH+/XxdK9gj/eKLQ0HKbYb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675297"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675297"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690132"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:55 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/24] ASoC: Intel: Machine driver updates for 6.9
Date: Thu,  8 Feb 2024 10:55:21 -0600
Message-Id: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HABRWD3TALXGKBAOGHZMA7YBPFMHL4CF
X-Message-ID-Hash: HABRWD3TALXGKBAOGHZMA7YBPFMHL4CF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HABRWD3TALXGKBAOGHZMA7YBPFMHL4CF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A fairly large update this time, with Brent Lu's continued cleanup of
Chromebook cards, and updates for new SoundWire configurations.

Bard Liao (11):
  ASoC: Intel: sof_sdw: use single rtd_init for rt_amps
  ASoC: Intel: add get_codec_dai_by_name helper function
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: use helper to get codec dai
    by name
  ASoC: Intel: sof_sdw_rt711: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_rt712_sdca: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_rt700: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_cs42l42: use helper to get codec dai by name
  ASoC: Intel: sof_sdw_rt5682: use helper to get codec dai by name
  ASoC: Intel: sof_sdw: add common sdw dai link init
  ASoC: Intel: sof_sdw: remove .init callbacks
  ASoC: Intel: sof_sdw: starts non sdw BE id with the highest sdw BE id

Brent Lu (8):
  ASoC: Intel: sof_rt5682: board id cleanup for jsl boards
  ASoC: Intel: sof_rt5682: board id cleanup for tgl boards
  ASoC: Intel: sof_rt5682: board id cleanup for adl boards
  ASoC: Intel: sof_rt5682: board id cleanup for rpl boards
  ASoC: Intel: sof_rt5682: board id cleanup for mtl boards
  ASoC: Intel: sof_rt5682: dmi quirk cleanup for mtl boards
  ASoC: Intel: board_helpers: support DAI link order customization
  ASoC: Intel: sof_cs42l42: use common module for DAI link generation

Chao Song (2):
  ASoC: Intel: soc-acpi: add RT712 support for LNL
  ASoC: Intel: soc-acpi-intel-lnl-match: Add rt722 support

Charles Keepax (2):
  ASoC: Intel: ssp-common: Add stub for sof_ssp_get_codec_name
  ASoC: Intel: sof_sdw: Remove unused function prototypes

mosomate (1):
  ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710)
    laptops

 drivers/soundwire/dmi-quirks.c                |   8 +
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_board_helpers.c    | 225 ++++++++++++------
 sound/soc/intel/boards/sof_board_helpers.h    |  29 +++
 sound/soc/intel/boards/sof_cs42l42.c          | 224 +++++------------
 sound/soc/intel/boards/sof_rt5682.c           | 151 +-----------
 sound/soc/intel/boards/sof_sdw.c              | 106 +++++++--
 sound/soc/intel/boards/sof_sdw_common.h       |  82 ++-----
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  35 ++-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  25 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |   3 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |   4 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  35 ++-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  35 ++-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  19 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  39 ++-
 sound/soc/intel/boards/sof_sdw_rt715.c        |  12 +-
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c   |  12 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  53 +----
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  19 +-
 sound/soc/intel/boards/sof_ssp_common.h       |   8 +
 .../intel/common/soc-acpi-intel-adl-match.c   |  12 +-
 .../intel/common/soc-acpi-intel-jsl-match.c   |  10 +-
 .../intel/common/soc-acpi-intel-lnl-match.c   | 102 ++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-rpl-match.c   |   4 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |   6 +-
 27 files changed, 585 insertions(+), 678 deletions(-)

-- 
2.40.1

