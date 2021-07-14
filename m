Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F4B3C7CE0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E1D16A2;
	Wed, 14 Jul 2021 05:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E1D16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233045;
	bh=ndpeEnr8jRPyrnNwkyGJKXx2ztLwjgsxzgeBT2mIyU0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IcuzjhGai+YcdRupJAbJ1zigY6kLl1gDBdYSc7bhnr/EzrTCUqEzri8nxPJ1ZJF86
	 gTDHXQULG4mzjqiMC5TBdgpU3Wd6bNaGwHvoYTbILsOPi8ooE7wLMxDB0kB4oT3zb8
	 ugC6ZkZ6YoKrF0rMP8nMVK1NqTPI3z66hGD70SS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4CD4F802E7;
	Wed, 14 Jul 2021 05:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58023F8025B; Wed, 14 Jul 2021 05:22:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4720DF8011C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4720DF8011C
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086408"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818090"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/10] soundwire/ASoC: add mockup codec support
Date: Wed, 14 Jul 2021 11:21:59 +0800
Message-Id: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

Adding mockup SoundWire codec is useful to debug driver/topology changes
without having any actual device connected.

Bard Liao (2):
  soundwire: stream: don't abort bank switch on Command_Ignored/-ENODATA
  soundwire: stream: don't program mockup device ports

Pierre-Louis Bossart (8):
  ASoC: codecs: add SoundWire mockup device support
  ASoC: soc-acpi: cnl: add table for SoundWire mockup devices
  ASoC: soc-acpi: tgl: add table for SoundWire mockup devices
  ASoC: Intel: boards: sof_sdw: add SoundWire mockup codecs for tests
  soundwire: add flag to ignore all command/control for mockup devices
  soundwire: bus: squelch error returned by mockup devices
  soundwire: cadence: add debugfs interface for PDI loopbacks
  soundwire: cadence: override PDI configurations to create loopback

 drivers/soundwire/bus.c                       |  10 +-
 drivers/soundwire/cadence_master.c            | 174 ++++++++--
 drivers/soundwire/cadence_master.h            |   3 +
 drivers/soundwire/stream.c                    |   5 +-
 include/linux/soundwire/sdw.h                 |   3 +
 sound/soc/codecs/Kconfig                      |  18 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/sdw-mockup.c                 | 312 ++++++++++++++++++
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_sdw.c              |  41 +++
 sound/soc/intel/common/Makefile               |   3 +-
 .../intel/common/soc-acpi-intel-cnl-match.c   |  15 +
 .../common/soc-acpi-intel-sdw-mockup-match.c  | 166 ++++++++++
 .../common/soc-acpi-intel-sdw-mockup-match.h  |  17 +
 .../intel/common/soc-acpi-intel-tgl-match.c   |  23 ++
 15 files changed, 754 insertions(+), 39 deletions(-)
 create mode 100644 sound/soc/codecs/sdw-mockup.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h

-- 
2.17.1

