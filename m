Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329282A5DA8
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 06:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BE9616A5;
	Wed,  4 Nov 2020 06:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BE9616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604467090;
	bh=W+tDL4U1poLesk5u4rdbLlFpNDFRp/SYOQi2jiZgarY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GEY8GORyKxfVMlflofst2SQLhvae0bAC8e1TbiqLvWhgq/rpk0HRLSks4f6yAN5oC
	 Gy1Dm6Mpj4BLK9YsM2rnYgZu05rVFq07yPynXAvlYvF+KVMw8izThTUab2nw+Cc3NO
	 F3KgAggYOlPmQ/qS0ErCNRSKkydIOSAeV0TTDD4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE6CEF80247;
	Wed,  4 Nov 2020 06:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C055BF8023E; Wed,  4 Nov 2020 06:16:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA34BF8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 06:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA34BF8015A
IronPort-SDR: hpHjfwxyGhkCRW2v4ofVFus2WM7DPsujjY9GWrpZWT/m+cxzoQEBJi0M2JrqD+VY854Vmi2pju
 9dbfNmWaVUAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="187025144"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="187025144"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 21:16:27 -0800
IronPort-SDR: 7uHtBrmbcbM7obVhPWTMSKrfggqF+bWqbpPKVWZWl8GDEFCozIqira4v28BVLg9cwqWSY08gCw
 A/BlucN5BXOg==
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="538764052"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 21:16:23 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Date: Wed,  4 Nov 2020 01:22:21 +0800
Message-Id: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

The MIPI SoundWire Device Class standard will define audio functionality
beyond the scope of the existing SoundWire 1.2 standard, which is limited
to the bus and interface.

The description is inspired by the USB Audio Class, with "functions",
"entities", "control selectors", "audio clusters". The main difference
with the USB Audio class is that the devices are typically on a motherboard
and descriptors stored in platform firmware instead of being retrieved
from the device.

The current set of devices managed in this patchset are conformant with the
SDCA 0.6 specification and require dedicated drivers since the descriptors
and platform firmware specification is not complete at this time. They do
however rely on the hierarchical addressing required by the SDCA standard.
Future devices conformant with SDCA 1.0 should rely on a class driver.

This series adds support for the hierarchical SDCA addressing and extends
regmap. It then provides 3 codecs for RT711-sdca headset codec, RT1316
amplifier and RT715-scda microphone codec.

Note that the release of this code before the formal adoption of the
SDCA 1.0 specification was formally endorsed by the MIPI Board to make
sure there is no delay for Linux-based support of this specification.

Jack Yu (1):
  ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sdca codec
    driver

Pierre-Louis Bossart (2):
  soundwire: SDCA: add helper macro to access controls
  regmap/SoundWire: sdw: add support for SoundWire 1.2 MBQ

Shuming Fan (2):
  ASoC/SoundWire: rt1316: Add RT1316 SDCA vendor-specific driver
  ASoC/SoundWire: rt711-sdca: Add RT711 SDCA vendor-specific driver

 drivers/base/regmap/Kconfig             |    6 +-
 drivers/base/regmap/Makefile            |    1 +
 drivers/base/regmap/regmap-sdw-mbq.c    |  101 ++
 include/linux/regmap.h                  |   35 +
 include/linux/soundwire/sdw_registers.h |   32 +
 sound/soc/codecs/Kconfig                |   20 +
 sound/soc/codecs/Makefile               |    6 +
 sound/soc/codecs/rt1316-sdw.c           |  756 ++++++++++++
 sound/soc/codecs/rt1316-sdw.h           |  115 ++
 sound/soc/codecs/rt711-sdca-sdw.c       |  424 +++++++
 sound/soc/codecs/rt711-sdca-sdw.h       |  101 ++
 sound/soc/codecs/rt711-sdca.c           | 1481 +++++++++++++++++++++++
 sound/soc/codecs/rt711-sdca.h           |  246 ++++
 sound/soc/codecs/rt715-sdca-sdw.c       |  278 +++++
 sound/soc/codecs/rt715-sdca-sdw.h       |  170 +++
 sound/soc/codecs/rt715-sdca.c           |  936 ++++++++++++++
 sound/soc/codecs/rt715-sdca.h           |  124 ++
 17 files changed, 4831 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-sdw-mbq.c
 create mode 100644 sound/soc/codecs/rt1316-sdw.c
 create mode 100644 sound/soc/codecs/rt1316-sdw.h
 create mode 100644 sound/soc/codecs/rt711-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt711-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt711-sdca.c
 create mode 100644 sound/soc/codecs/rt711-sdca.h
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt715-sdca.c
 create mode 100644 sound/soc/codecs/rt715-sdca.h

-- 
2.17.1

