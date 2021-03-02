Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FA32956A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:33:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F043166C;
	Tue,  2 Mar 2021 01:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F043166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614645197;
	bh=4vy1igfSStw0BC+qgu7YzubJn/ACJT1DijZN79fSvHg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a3Z/ZLAi/ERe7A3ARBJ/Kn7uFJIRryb7cnAW6UU8r6ss5LisEwGUjfKHWg2gZS5dI
	 WRWlquVF5Ke0vTbtsduFufmvkHbHmp4PEZOgCeld6zUB2dDdJ21E7I99vB5pQZcY3Y
	 GEPJ331N7719wDD7tcWiAI7XUl5ezIr3/U+F5pfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E356F80275;
	Tue,  2 Mar 2021 01:31:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02F09F80272; Tue,  2 Mar 2021 01:31:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF05F80150
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF05F80150
IronPort-SDR: 6jiip5wiVHIQ0fZQr1yuhtRKpD9Ixe7WzIVfvvBxN8xnVx+y0qCHAcU7AubiSaILGEG7APaFaH
 014iK6aoRDjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248048761"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248048761"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:36 -0800
IronPort-SDR: MLUwJ95FeEVvg8YP2Bjf6BW0ZXOnbVmo1BXl6g8rAMIyw9E6N5hN2sTdF0DkKiu/OPJKp6MBTY
 Zf7ZppmRjmkw==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="444512500"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
Date: Mon,  1 Mar 2021 18:31:18 -0600
Message-Id: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: arnd@arndb.de, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org
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

In January, Intel kbuild bot and Arnd Bergmann reported multiple
issues with randconfig. This patchset builds on Arnd's suggestions to

a) expose ACPI and PCI devices in separate modules, while sof-acpi-dev
and sof-pci-dev become helpers. This will result in minor changes
required for developers/testers, i.e. modprobe snd-sof-pci will no
longer result in a probe. The SOF CI was already updated to deal with
this module dependency change and introduction of new modules.

b) Fix SOF/SoundWire/DSP_config dependencies by moving the code
required to detect SoundWire presence in ACPI tables to sound/hda.

Integration note:
This patchset touches directories maintained by Vinod, Takashi and
Mark in separate trees, and will impact additional changes to use the
auxiliary bus in drivers/soundwire/.
I can think of two options, both of which are fine:
1. Mark merges the patches with Vinod and Takashi Acked-by tags, then
Mark provides an immutable tag to Vinod.
2. Vinod merges the patches with Mark and Takashi Acked-by tags, then
Vinod provides an immutable tag to Mark

Acknowledgements:
Thanks to Arnd for suggesting fixes and testing these patches with
more randconfigs.
Thanks to Vinod Koul for his feedback on the move of this common
helper to sound/hda/

Arnd Bergmann (1):
  ASoC: SOF: ACPI: avoid reverse module dependency

Pierre-Louis Bossart (6):
  ASoC: soc-acpi: allow for partial match in parent name
  ASoC: SOF: pci: split PCI into different drivers
  ASoC: SOF: pci: move DSP_CONFIG use to platform-specific drivers
  ASoC: SOF: Intel: SoundWire: simplify Kconfig
  ALSA: hda: move Intel SoundWire ACPI scan to dedicated module
  ALSA: hda: intel-sdw-acpi: add missing include files

 drivers/soundwire/intel.h           |   2 -
 drivers/soundwire/intel_init.c      | 158 -------------
 include/linux/soundwire/sdw_intel.h |   2 +
 include/sound/soc-acpi.h            |   2 +-
 sound/hda/Kconfig                   |   4 +
 sound/hda/Makefile                  |   3 +
 sound/hda/intel-dsp-config.c        |   2 +-
 sound/hda/intel-sdw-acpi.c          | 179 +++++++++++++++
 sound/soc/sof/Kconfig               |  15 +-
 sound/soc/sof/Makefile              |   4 +-
 sound/soc/sof/intel/Kconfig         | 254 +++++++--------------
 sound/soc/sof/intel/Makefile        |  20 +-
 sound/soc/sof/intel/bdw.c           |  67 +++++-
 sound/soc/sof/intel/byt.c           | 106 ++++++++-
 sound/soc/sof/intel/hda.c           |  18 ++
 sound/soc/sof/intel/hda.h           |   3 +
 sound/soc/sof/intel/pci-apl.c       |  81 +++++++
 sound/soc/sof/intel/pci-cnl.c       | 104 +++++++++
 sound/soc/sof/intel/pci-icl.c       |  84 +++++++
 sound/soc/sof/intel/pci-tgl.c       | 121 ++++++++++
 sound/soc/sof/intel/pci-tng.c       |  70 ++++++
 sound/soc/sof/intel/shim.h          |   6 -
 sound/soc/sof/sof-acpi-dev.c        | 130 +----------
 sound/soc/sof/sof-acpi-dev.h        |  16 ++
 sound/soc/sof/sof-pci-dev.c         | 340 +---------------------------
 sound/soc/sof/sof-pci-dev.h         |  17 ++
 26 files changed, 998 insertions(+), 810 deletions(-)
 create mode 100644 sound/hda/intel-sdw-acpi.c
 create mode 100644 sound/soc/sof/intel/pci-apl.c
 create mode 100644 sound/soc/sof/intel/pci-cnl.c
 create mode 100644 sound/soc/sof/intel/pci-icl.c
 create mode 100644 sound/soc/sof/intel/pci-tgl.c
 create mode 100644 sound/soc/sof/intel/pci-tng.c
 create mode 100644 sound/soc/sof/sof-acpi-dev.h
 create mode 100644 sound/soc/sof/sof-pci-dev.h

-- 
2.25.1

