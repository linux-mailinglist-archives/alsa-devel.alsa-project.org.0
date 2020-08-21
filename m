Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C624E17C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33FBD1689;
	Fri, 21 Aug 2020 21:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33FBD1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598039886;
	bh=u19TZLkZ+HyS5v5nfyykc2K63PRsekRJOxZt0+29jcU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uj3OiKSvAumzsHa7Br2iPeRAK5+Dykt6cXwlaafI4DiKRiccPTdMo1UGWL3YYi3WP
	 8BKNgBhhsagQtbkEm+M5G0OsHPgiv7AE4izDfSkZRySfe80p7O0RSq91HQEnIvj+I6
	 Mx2hKKQN037v/984ZfvzMErY5p1y1bOMu1QfmBxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47FB7F80260;
	Fri, 21 Aug 2020 21:56:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040BAF800C0; Fri, 21 Aug 2020 21:56:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70152F800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70152F800C0
IronPort-SDR: ngqQY6OqIiQx1d3RRmZVl2IxvgNq0moebSqb2xKIBeq+sVETaUk1WsmECq1fc6OR3ppkEFFSPt
 TP9QnA7LkIzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158535"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158535"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:14 -0700
IronPort-SDR: xKJ/JUkY8qj3M13lUR/PpivV5LFHC5ymtwTdS5AZnq6ExgKFw5xVTN1sVLhHjms60IAujISLwi
 53a8oSb9e+1w==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002384"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/14] ASoC: Intel: machine driver updates for 5.10
Date: Fri, 21 Aug 2020 14:55:47 -0500
Message-Id: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

This series updates the tables used to select SoundWire configurations
for CometLake and TigerLake, and adds support for SDCA (SoundWire
Device Class for Audio) codecs in the common machine driver. These
codec drivers are still being tested on early silicon/boards and will
be contributed at a later time.

For TigerLake Chromebooks a new DMI quirk is added, as well as a means
to override the topology names. A pm_runtime fix is also provided to
deal with playback/capture dependencies with an amplifier w/
feedback. I also included a minor codec correction for the TGL
amplifier.

Bard Liao (5):
  ASoC: Intel: modify SoundWire version id in acpi match table
  ASoC: Intel: sof_sdw: check SoundWire version when matching codec
  ASoC: Intel: sof_sdw: rename id as part_id
  ASoC: Intel: sof_sdw: add rt711 rt1316 rt714 SDCA codec support.
  ASoC: Intel: sof_sdw: clean-up inclusion of header files

Pierre-Louis Bossart (5):
  ASoC: Intel: soc-acpi: cnl: add support for rt5682 on SoundWire link2
  ASoC: Intel: sof-soundwire: add support for rt5682 on link2
  ASoC: Intel: soc-acpi: mirror CML and TGL configurations
  ASoC: Intel: soc-acpi: add support for SDCA boards
  ASoC: codecs: max98373-sdw: add missing test on resume

Rander Wang (2):
  ASoC: Intel: tgl_max98373: fix a runtime pm issue in multi-thread case
  ASoC: Intel: sof_sdw: Add support for product Ripto

Sathyanarayana Nujella (2):
  ASoC: Intel: sof_rt5682: override quirk data for tgl_max98373_rt5682
  ASoC: SOF: Add topology filename override based on dmi data match

 sound/soc/codecs/max98373-sdw.c               |   3 +
 sound/soc/intel/boards/Kconfig                |   3 +
 sound/soc/intel/boards/Makefile               |   7 +-
 sound/soc/intel/boards/sof_maxim_common.c     |   7 +-
 sound/soc/intel/boards/sof_rt5682.c           |  13 ++
 sound/soc/intel/boards/sof_sdw.c              |  98 +++++++---
 sound/soc/intel/boards/sof_sdw_common.h       |  22 ++-
 sound/soc/intel/boards/sof_sdw_dmic.c         |   1 +
 sound/soc/intel/boards/sof_sdw_max98373.c     |   2 +
 sound/soc/intel/boards/sof_sdw_rt1308.c       |   2 +
 sound/soc/intel/boards/sof_sdw_rt1316.c       | 113 ++++++++++++
 sound/soc/intel/boards/sof_sdw_rt5682.c       |   2 +
 sound/soc/intel/boards/sof_sdw_rt700.c        |   2 +
 sound/soc/intel/boards/sof_sdw_rt711.c        |   2 +
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c   | 174 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c   |  42 +++++
 .../intel/common/soc-acpi-intel-cml-match.c   |  79 +++++++-
 .../intel/common/soc-acpi-intel-cnl-match.c   |  33 +++-
 .../intel/common/soc-acpi-intel-icl-match.c   |  10 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   | 165 ++++++++++++++++-
 sound/soc/sof/intel/hda.c                     |   8 +-
 sound/soc/sof/sof-pci-dev.c                   |  24 +++
 22 files changed, 764 insertions(+), 48 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt711_sdca.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c


base-commit: fcea8b023a5f06ea0180ae65b01520b0414ee325
-- 
2.25.1

