Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD918361175
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6370B1682;
	Thu, 15 Apr 2021 19:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6370B1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618509188;
	bh=c9yDkirQPnv8xuZqPDAU6S7QxFOtyI4bGUOnJC4rrRk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IzNAii4qzKV/1rnxfjIw4juFxhG7o0uOWL6MncMapxGTU1MEBgJeN5gva6VndBVXH
	 S/83fr8nFuABBQP/k1PHYNRrcwL4rTwP67yham6hLCMOgVrrJiuNnN7Fb8VzuBewOU
	 xzDHl4+uJgvNau0ietSjYjjd6Zd/4WmUg0IVpYgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01DB1F80260;
	Thu, 15 Apr 2021 19:50:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6A4CF8042F; Thu, 15 Apr 2021 19:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A36F3F8022B
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36F3F8022B
IronPort-SDR: H/cV91bZSpmjdVpcwjbyeTB05QGohzH+RkqxVyf6KceRzkWgRCz2A+fp9jo+yQLShpzdgdG2LU
 5elf/p+iBi9A==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174400785"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="174400785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:33 -0700
IronPort-SDR: mB2UInlcWpC6c6qdaFFmSvU7KPKcE0T7YC6c134pFrzoJH6KWGysUn/pQxpBbzAfLI86gCCfu3
 QdNocalx6zHg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382804624"
Received: from lesterhu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/9] ASoC: Intel: add new TGL/ADL configurations
Date: Thu, 15 Apr 2021 12:50:04 -0500
Message-Id: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
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

Very little code but quite a few descriptors to add TigerLake (TGL)
/AlderLake (ADL) ACPI match tables for I2S and SoundWire devices, new
dailinks for Bluetooth offload. Some day this will be read from
platform firmware.

Also clarify how microphones are handled for SoundWire devices, and
create modules to avoid linking the same code multiple times.

Pierre-Louis Bossart (5):
  ASoC: Intel: soc-acpi: add ADL SoundWire base configurations
  ASoC: Intel: soc-acpi: add ADL jack-less SoundWire configurations
  ASoC: Intel: sof_sdw: add mutual exclusion between PCH DMIC and RT715
  ASoC: Intel: boards: handle hda-dsp-common as a module
  ASoC: Intel: boards: create sof-maxim-common module

Vamshi Krishna Gopal (3):
  ASoC: Intel: soc-acpi: add entries for i2s machines in ADL match table
  ASoC: Intel: sof_sdw: add quirk for new ADL-P Rvp
  ASoC: Intel: boards: add support for adl boards in sof-rt5682

Yong Zhi (1):
  ASoC: Intel: Boards: tgl_max98373: Add BT offload support

 sound/soc/intel/boards/Kconfig                |  18 ++
 sound/soc/intel/boards/Makefile               |  28 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |   1 +
 sound/soc/intel/boards/bxt_rt298.c            |   1 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |   1 +
 sound/soc/intel/boards/ehl_rt5660.c           |   1 +
 sound/soc/intel/boards/glk_rt5682_max98357a.c |   1 +
 sound/soc/intel/boards/hda_dsp_common.c       |   5 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |   1 +
 sound/soc/intel/boards/sof_da7219_max98373.c  |   1 +
 sound/soc/intel/boards/sof_maxim_common.c     |  24 +-
 sound/soc/intel/boards/sof_maxim_common.h     |   6 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   1 +
 sound/soc/intel/boards/sof_rt5682.c           |  67 ++++-
 sound/soc/intel/boards/sof_sdw.c              |  32 ++-
 sound/soc/intel/boards/sof_sdw_common.h       |   1 +
 sound/soc/intel/boards/sof_sdw_max98373.c     |   4 +-
 .../intel/common/soc-acpi-intel-adl-match.c   | 249 ++++++++++++++++++
 18 files changed, 415 insertions(+), 27 deletions(-)

-- 
2.25.1

