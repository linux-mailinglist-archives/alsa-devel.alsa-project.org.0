Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3997730F0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:11:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0E1D82C;
	Mon,  7 Aug 2023 23:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0E1D82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442709;
	bh=W8ooNiYBjHMyOWKbUXLQ/7pF3tde9CtK1CcCLiWk7aw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=maco4R9b33vU8buxtyGI4kL8dti7p0M7D8SRZivXoDLP9Vj999Ct/82KMuRs09UuD
	 +ibjlIn4W9buL1NJmrD+G8M+6yxz3HTZJ/p0FGH7gNZzMixaMyEzRGJL5kO+RfT2fY
	 QVKBuFK3vXP+zPAybO01NWBotsjo56SMuWCDzsc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBAC9F8055A; Mon,  7 Aug 2023 23:10:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A89C2F8055A;
	Mon,  7 Aug 2023 23:10:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0D3BF80548; Mon,  7 Aug 2023 23:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C3DCF80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C3DCF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kPm7s4zZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442615; x=1722978615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W8ooNiYBjHMyOWKbUXLQ/7pF3tde9CtK1CcCLiWk7aw=;
  b=kPm7s4zZpF1WtF2uZUPtcAD2Y2pVgp95Kf0es0D+LnRDaxbk44Epr8XP
   aFCQga2JNMsMHw2f5dNOOSeuJqxcypjsryIPHIOS/yRKv2o2THfxZ4+Ra
   qWUGmj2bI2y2iOGcY9rNA1cmDjyRmUjHpA2fdV6Xx2DSMmRY/f7ic+J7b
   V+ddbLTHeBtEcxAziv0YK3TdPr5NzHecldoAbI3q8hWjLSvd6W1YEiVo2
   +XJpA7isFTiNhj1ovhfnye7ifG7D5IcFLyVGgNqIgqGebiu/DG23KITUj
   lvj8hxU2MhH9TSi1b0CzlDbTdu1PxDDo8z3mhSDoUi79VrLsPTPwum6gv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244297"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244297"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465138"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465138"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/20] ASoC: SOF: Intel: add LunarLake support
Date: Mon,  7 Aug 2023 16:09:39 -0500
Message-Id: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F3WQESAH2GNFYQ2RYZRQIC7PRCXBY6VC
X-Message-ID-Hash: F3WQESAH2GNFYQ2RYZRQIC7PRCXBY6VC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

IMPORTANT NOTE: this patchset is dependent on Takashi's hda-intel-6.6
tag. The PCI parts will not compile without merging this tag into the
ASoC tree.

This patchset first fixes a number of errors made in the hda-mlink
support, then adds Lunar Lake definitions. The main contribution is
the hda-dai changes where the HDaudio DMA is now used for SSP, DMIC
and SoundWire. In previous hardware the GPDMA (aka DesignWare) was
used and controlled by the audio firmware. The volume of code is
minimized with the abstraction added in previous kernel cycles.

Due to cross-dependencies between ASoC and SoundWire trees, the full
support for jack detection will be deferred to the next kernel
cycle. There's not much point to ask for a sync of the two trees to
support one patch for each tree - we are at -rc5 already.

Pierre-Louis Bossart (18):
  ASoC: SOF: Intel: hda-mlink: fix off-by-one error
  ASoC: SOF: Intel: fix u16/32 confusion in LSDIID
  ASoC: SOF: ipc4-topology: restore gateway config length
  ASoC: SOF: Intel: hda: add interface definitions for ACE2.x
  ASoC: SOF: Intel: split MTL and LNL operations
  ASoC: SOF: Intel: LNL: enable DMIC/SSP offload in probe/resume
  ASoC: SOF: Intel: hda-dai-ops: add/select DMA ops for SSP
  ASoC: SOF: Intel: hda-dai: add ops for SSP
  ASoC: SOF: Intel: hda-dai: add DMIC support
  ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams for first
    CPU DAI
  ASoC: SOF: Intel: hda-dai-ops: add ops for SoundWire
  ASoC: SOF: Intel: hda-dai: add helpers for SoundWire callbacks
  ASoC: SOF: Intel: hda: add hw_params/free/trigger callbacks
  ASoC: SOF: Intel: add abstraction for SoundWire wake-ups
  ASoC: SOF: Intel: hda-mlink: add helper to get sublink LSDIID register
  ASoC: SOF: Intel: hda-dai-ops: reset device count for SoundWire DAIs
  ASoC: SOF: IPC4: clarify 'pipeline_ids' usage and logs
  ASoC: SOF: Intel: hda-mlink: add sublink to dev_dbg() log

Ranjani Sridharan (2):
  ASoC: SOF: ipc4: avoid uninitialized default instance 0
  ASoC: SOF: Intel: LNL: Add support for Lunarlake platform

 include/sound/hda-mlink.h         |   4 +
 sound/soc/sof/intel/Kconfig       |  16 +++
 sound/soc/sof/intel/Makefile      |   4 +-
 sound/soc/sof/intel/cnl.c         |   2 +
 sound/soc/sof/intel/hda-dai-ops.c | 179 ++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-dai.c     | 211 +++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-mlink.c   |  45 ++++++-
 sound/soc/sof/intel/hda.c         |  58 +++++++-
 sound/soc/sof/intel/hda.h         |  21 +++
 sound/soc/sof/intel/icl.c         |   1 +
 sound/soc/sof/intel/lnl.c         | 189 ++++++++++++++++++++++++++
 sound/soc/sof/intel/mtl.c         |  23 ++--
 sound/soc/sof/intel/mtl.h         |  22 +++-
 sound/soc/sof/intel/pci-lnl.c     |  71 ++++++++++
 sound/soc/sof/intel/shim.h        |   1 +
 sound/soc/sof/intel/tgl.c         |   4 +
 sound/soc/sof/ipc4-pcm.c          |  21 +--
 sound/soc/sof/ipc4-topology.c     |   7 +
 sound/soc/sof/ipc4-topology.h     |   4 +-
 sound/soc/sof/topology.c          |   2 +
 20 files changed, 842 insertions(+), 43 deletions(-)
 create mode 100644 sound/soc/sof/intel/lnl.c
 create mode 100644 sound/soc/sof/intel/pci-lnl.c

-- 
2.39.2

