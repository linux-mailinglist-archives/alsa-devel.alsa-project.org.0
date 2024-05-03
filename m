Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2138BAE19
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:53:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BD3FE76;
	Fri,  3 May 2024 15:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BD3FE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714744398;
	bh=ba7469GmXgNCCk7oBXaSkrwJS7QxuRNqVCMVuKVzYAQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BB/0dtiYRcUwkIMC2Z0ZI/WJ5n2bh3nq6VmukIz1qhL8Awo8eWO3tLQYZUTp0irMi
	 YvKf5pesAnFBMb6A0khK8/yrUjrGI2HxNEgkhm1O2VvzshfVLaX5hwYmOAcP8Qx08h
	 AJ2cvVQmHwbDlKfHA5JgBEb5EJ3fl0vcNkcV90/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56146F80588; Fri,  3 May 2024 15:52:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09836F8057A;
	Fri,  3 May 2024 15:52:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E889F804FB; Fri,  3 May 2024 15:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8FC8F8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8FC8F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b3pegljw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744356; x=1746280356;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ba7469GmXgNCCk7oBXaSkrwJS7QxuRNqVCMVuKVzYAQ=;
  b=b3pegljwvjjwr/I4tJ21RQKp1XYVlB6Ix0VXpUtR2lQYUmr18ueJ1fum
   QZ1ed3PQL2pknsjEtVq3OE2X47r4ETm/82EKNVAace9gYNrUy9wXETGMc
   FUUQGESV/+YRc8o04mx5YrbYQ0RxIemTikuY+tMf6uYS01edpAxzMf3Hh
   0bokaHJ2rNmYiShNEFzdCnIWP7O43pJ51ltf89og6XuXRGrbzYJ02m0Bc
   tYCOBkdKcMnBHxdkhmB20n5nE8Ga4f3dVMD6N2Lh8EIQvP0YLXw4yA39t
   OwW8ERKDU302ydXNq/d6vaKR46vTRjF/q8M9HxoDpVLXM3LXQXL50NYuC
   A==;
X-CSE-ConnectionGUID: gTc0AALQTPOzoBEvDDGXQg==
X-CSE-MsgGUID: LASDYeBNRW6L6IjYPDFxmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029403"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="28029403"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:32 -0700
X-CSE-ConnectionGUID: L6dKMq7DR/i2L1kgc/9XSQ==
X-CSE-MsgGUID: Yn9Wl0GjTFGNlQ3SnROLPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27548701"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/7] ASoC: SOF: Intel: remove circular dependency for
 SoundWire BPT
Date: Fri,  3 May 2024 08:52:14 -0500
Message-Id: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QW6NPKHFQTFR66NXNS4HZLMEQ5BHLBH4
X-Message-ID-Hash: QW6NPKHFQTFR66NXNS4HZLMEQ5BHLBH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QW6NPKHFQTFR66NXNS4HZLMEQ5BHLBH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SoundWire BPT support will rely on the HDaudio DMA. This exposes a
circular dependency module dependency which has to be resolved by
splitting common parts used by HDaudio and SoundWire parts, and
'generic' parts used by HDaudio only.

This patchset does not change any functionality, it just moves code
around, exposes symbols that are used in the new module. The code has
been in use for more than one kernel cycle already so it really
shouldn't break any existing platforms.

The main issue with such code moves is that it makes backports or
fixes more complicated. That's the main reason why we held back these
patches until we were reasonably confident on the maturity of MTL and
LNL drivers.

Pierre-Louis Bossart (7):
  ASoC: SOF: Intel: hda-stream: export stream_get_position() helper
  ASoC: SOF: Intel: regroup all SoundWire/Intel functions in hda.c
  ASoC: SOF: Intel: start splitting top-level from common parts
  ASoC: SOF: Intel: move common code from hda.c
  ASoC: SOF: Intel: move tracepoint creation
  ASoC: SOF: Intel: remove circular dependency on
    hda_sdw_process_wakeen()
  ASoC: SOF: Intel: move hda.c to different module

 sound/soc/sof/intel/Kconfig          |  25 +-
 sound/soc/sof/intel/Makefile         |  23 +-
 sound/soc/sof/intel/apl.c            |   3 -
 sound/soc/sof/intel/cnl.c            |  15 +-
 sound/soc/sof/intel/hda-bus.c        |   2 +
 sound/soc/sof/intel/hda-common-ops.c |   1 +
 sound/soc/sof/intel/hda-ctrl.c       |  10 +
 sound/soc/sof/intel/hda-dai.c        |   6 +
 sound/soc/sof/intel/hda-dsp.c        | 502 ++++++++++++++++++++++
 sound/soc/sof/intel/hda-ipc.c        | 115 +++++
 sound/soc/sof/intel/hda-loader.c     |  45 +-
 sound/soc/sof/intel/hda-pcm.c        |   6 +
 sound/soc/sof/intel/hda-probes.c     |   2 +
 sound/soc/sof/intel/hda-stream.c     |  13 +
 sound/soc/sof/intel/hda-trace.c      |   3 +
 sound/soc/sof/intel/hda.c            | 605 +++------------------------
 sound/soc/sof/intel/hda.h            |  15 +
 sound/soc/sof/intel/icl.c            |   4 +-
 sound/soc/sof/intel/lnl.c            |   4 +-
 sound/soc/sof/intel/mtl.c            |  21 +-
 sound/soc/sof/intel/pci-apl.c        |   1 +
 sound/soc/sof/intel/pci-cnl.c        |   1 +
 sound/soc/sof/intel/pci-icl.c        |   2 +
 sound/soc/sof/intel/pci-lnl.c        |   3 +
 sound/soc/sof/intel/pci-mtl.c        |   1 +
 sound/soc/sof/intel/pci-skl.c        |   1 +
 sound/soc/sof/intel/pci-tgl.c        |   2 +
 sound/soc/sof/intel/shim.h           |   1 +
 sound/soc/sof/intel/telemetry.c      |   1 +
 sound/soc/sof/intel/tgl.c            |  10 +-
 sound/soc/sof/intel/tracepoints.c    |   5 +
 31 files changed, 811 insertions(+), 637 deletions(-)
 create mode 100644 sound/soc/sof/intel/tracepoints.c

-- 
2.40.1

