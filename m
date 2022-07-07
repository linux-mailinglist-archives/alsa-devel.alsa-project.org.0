Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1556A206
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B1B2AE8;
	Thu,  7 Jul 2022 14:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B1B2AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197180;
	bh=ronQZ58/aFgrCDHwVB+d0ImxLvXec4YmLyhAlHjogIM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DtjGg0nktmb1XFZUxuhWwNA4qR21bJbGQueFgybpAgI4dOB5B7JnKfGmhCSY8/hVR
	 jk3zelJb0RYrfxms27bhOJgtBn1kVqwrSX6RDtcLUPkakvzzYecDeUDfAJd8LVcdKf
	 ssJz1GkQy3uenaeVutS9JkxU6nEjFfF8ildMOICE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6DA6F804FB;
	Thu,  7 Jul 2022 14:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48BA4F8028D; Thu,  7 Jul 2022 14:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82329F800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82329F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aUZxjTIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197114; x=1688733114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ronQZ58/aFgrCDHwVB+d0ImxLvXec4YmLyhAlHjogIM=;
 b=aUZxjTIkApytHXalvJvUg3zh1KUmipyFeajLcilEsp/SJlRRkApDPcSA
 K9yVZ4R516ZGvsRFpRTcSQjEELd+lB4FQPyC9LufztCbtuq/VK5GzTKSG
 9JEXTll3W7rhagaqwJHamEXzLsdmqOtjO447cpEvSdjqp+Ve3rD6Tkhco
 4aq/WKzZzXyaQegFTcrWeSN4mdR7hkY+ZfWgv95vgzTGpJiJQj5PXqGDU
 D54BUWCGg5DJX6l/7Y/hONDZjI8gPHk7clLQtie48JlvgM0pTGrgziplL
 Ohit+HMCr99eTmthdwj3r3DlFnK/IJIN6UM1oyn2xR/yV6swI3kZEyLTa Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805879"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805879"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720543"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/12] ASoC: Intel: avs: Updates and cleanups
Date: Thu,  7 Jul 2022 14:41:41 +0200
Message-Id: <20220707124153.1858249-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Series consists of loosely connected patches and does not concentrate on
one specific subject.

First, as generic HDAudio codec driver is now part of ASoC, avs-driver
core is updated to register missing ext_bus operations. This completes
driver's core implementation.

The next change adds the last missing piece for port descriptions coming
from topology in formatted string format e.g.: ssp%d have full
effect. To do that, the port value needs to be provided to respective
copier configuration.

Third change relaxes core transition timings so that scenarios where
modules are interfering with each other while being on separate cores
are not occasionally causing trouble.

All other changes are addressing warnings, cleaning things up a little
and protecting driver from invalid firmware behavior - while not
expected in release binaries, does not hurt to add them.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Set max DMA segment size
  ASoC: Intel: avs: Use helper function to set up DMA

Cezary Rojewski (10):
  ASoC: Intel: avs: Register HDAudio ext-bus operations
  ASoC: Intel: avs: Assign I2S gateway when parsing topology
  ASoC: Intel: avs: Relax DSP core transition timings
  ASoC: Intel: avs: Copy only as many RX bytes as necessary
  ASoC: Intel: avs: Shield LARGE_CONFIG_GETs against zero payload_size
  ASoC: Intel: avs: Block IPC channel on suspend
  ASoC: Intel: avs: Recognize FW_CFG_RESERVED
  ASoC: Intel: avs: Replace hardcodes with SD_CTL_STREAM_RESET
  ASoC: Intel: avs: Lower UNLOAD_MULTIPLE_MODULES IPC timeout
  ASoC: Intel: avs: Update AVS_FW_INIT_TIMEOUT_US declaration

 sound/soc/intel/Kconfig        |  2 +-
 sound/soc/intel/avs/cldma.c    | 12 ++++++------
 sound/soc/intel/avs/core.c     | 13 ++++++-------
 sound/soc/intel/avs/dsp.c      | 11 +++++++++--
 sound/soc/intel/avs/ipc.c      |  1 +
 sound/soc/intel/avs/loader.c   |  2 +-
 sound/soc/intel/avs/messages.c | 18 +++++++++++++-----
 sound/soc/intel/avs/topology.c | 27 +++++++++++++++++++++++++++
 8 files changed, 64 insertions(+), 22 deletions(-)

-- 
2.25.1

