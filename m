Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9DB374244
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:47:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A631753;
	Wed,  5 May 2021 18:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A631753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233231;
	bh=mEJUhd80WJV8cWHLN+8wZLPKU4vMm5MpmNVnndf+HsY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hmc1AmpXnZcM/7MBHev6e3osS6dyVH7HFnVoMQj5BtstXYkTe8t5Ttjf4OF0oQNVC
	 K2ipCeKNcB1wAXHega+4uqRbprkwyJ5bcbiQR/d5ayVW+6D7BrOfeVIRI2WkAWxD9H
	 cr6NfjV3cmbjR5s6Ryxu359IdoYX/58pBOh8Q3ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D23C5F80424;
	Wed,  5 May 2021 18:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BC8BF805A8; Wed,  5 May 2021 18:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87E7CF8057A
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E7CF8057A
IronPort-SDR: 1KB22TRdpQvw5knXRge0/J4mTV/rH/o2JkEs/Nfxvk26MNYlufNSe1zCWYh+QY2HfBsnLAkMqS
 oiaSjP8nvmMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219139"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:17 -0700
IronPort-SDR: B3BS7VFbvEYXMkHA9S4bb4N64S6EwO1nu9bgQUo5FWrcMGEqum/4wEs4QJFNmdJ8ky0hVbnFxs
 bRSBrBc3qcpA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458799989"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ASoC: Intel: machine driver updates for 5.14
Date: Wed,  5 May 2021 11:36:52 -0500
Message-Id: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some of the patches in this series for TigerLake and AlderLake
SoundWire/Bluetooth support were missed in a previous submission,
resend them as is, and add new patches for the CS42L42 machine driver.

Brent Lu (3):
  ASoC: Intel: maxim-common: support max98357a
  ASoC: Intel: add sof-cs42l42 machine driver
  ASoC: Intel: sof_rt5682: code refactor for max98357a

Libin Yang (1):
  ASoC: Intel: sof_sdw: add SOF_RT715_DAI_ID_FIX for AlderLake

Pierre-Louis Bossart (4):
  ASoC: Intel: sof_sdw: add mutual exclusion between PCH DMIC and RT715
  ASoC: Intel: boards: handle hda-dsp-common as a module
  ASoC: Intel: boards: create sof-maxim-common module
  ASoC: Intel: boards: remove .nonatomic for BE dailinks

Vamshi Krishna Gopal (2):
  ASoC: Intel: soc-acpi: add entries for i2s machines in ADL match table
  ASoC: Intel: boards: add support for adl boards in sof-rt5682

Yong Zhi (3):
  ASoC: Intel: Boards: tgl_max98373: Add BT offload support
  ASoC: Intel: sof_sdw: add support for Bluetooth offload
  ASoC: Intel: sof_rt5682: Enable Bluetooth offload on tgl and adl

 sound/soc/intel/boards/Kconfig                |  36 +-
 sound/soc/intel/boards/Makefile               |  30 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |   1 +
 sound/soc/intel/boards/bxt_rt298.c            |   1 +
 sound/soc/intel/boards/bytcht_cx2072x.c       |   1 -
 sound/soc/intel/boards/bytcht_da7213.c        |   1 -
 sound/soc/intel/boards/bytcht_es8316.c        |   1 -
 sound/soc/intel/boards/bytcht_nocodec.c       |   1 -
 sound/soc/intel/boards/bytcr_rt5640.c         |   1 -
 sound/soc/intel/boards/bytcr_rt5651.c         |   1 -
 sound/soc/intel/boards/bytcr_wm5102.c         |   1 -
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   1 -
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   1 -
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |   1 +
 sound/soc/intel/boards/ehl_rt5660.c           |   2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c |   1 +
 sound/soc/intel/boards/hda_dsp_common.c       |   5 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |   1 +
 sound/soc/intel/boards/sof_cs42l42.c          | 509 ++++++++++++++++++
 sound/soc/intel/boards/sof_da7219_max98373.c  |   1 +
 sound/soc/intel/boards/sof_maxim_common.c     |  84 ++-
 sound/soc/intel/boards/sof_maxim_common.h     |  14 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   2 +-
 sound/soc/intel/boards/sof_rt5682.c           | 119 +++-
 sound/soc/intel/boards/sof_sdw.c              |  55 +-
 sound/soc/intel/boards/sof_sdw_common.h       |   8 +
 sound/soc/intel/boards/sof_sdw_max98373.c     |   4 +-
 sound/soc/intel/boards/sof_wm8804.c           |   1 -
 .../intel/common/soc-acpi-intel-adl-match.c   |  26 +
 .../intel/common/soc-acpi-intel-glk-match.c   |  10 +
 30 files changed, 861 insertions(+), 59 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_cs42l42.c

-- 
2.25.1

