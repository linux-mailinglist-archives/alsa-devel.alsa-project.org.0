Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FFF8957FF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF022BC2;
	Tue,  2 Apr 2024 17:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF022BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071157;
	bh=yIECqiD3W2xpYuXanadiVDrfUeVTFKr9CBOkADPKmYM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dhTtGA2beu34VDBzsTTeF11h/GHiS4xMSV62V3ZyU8aY2mOKqpzqtpWBPPB2Y2uBW
	 xMTi/dvnN/H7Y0+CwXKM/Rif+tFz4YFqaszWmHp8rk/qZW8WSh7GG8ruZdPPk1de0g
	 gR2DGuGyMK19kg1O1BR0jcdlkUACFhffcrEldEKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65AE3F805B0; Tue,  2 Apr 2024 17:18:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A31FF8057E;
	Tue,  2 Apr 2024 17:18:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAB31F80568; Tue,  2 Apr 2024 17:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8861F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8861F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BFZUtJxG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071123; x=1743607123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yIECqiD3W2xpYuXanadiVDrfUeVTFKr9CBOkADPKmYM=;
  b=BFZUtJxGBbR1FfZWZKIcpDph75hFYYj2yW44Syhx8bAkuZpxc5Jcuzqs
   S6dmoWmxP92qZxpyYnRCFACsZIT3J6QRM8XcIRMBsdogf8BDdkVSbRM+l
   1SXjlY4bebzp+jqR93EmCF/MGxoQQxSWAEGZYb8f8pkhFJbdiG+fpWbud
   CqZxTGTOzAT6yv4RLWpCfIQvGai7L4faGHF+1VbR2PoBVfHKi+oWYfQR8
   KrmvJmneyABYWw3C71CK6RxJTnYZboAnW3/X6ejT3BoAlJohH0J+DHx3V
   FbCyncv6KufZjrSv48p0UNrFYaFxUdCwx1YJgAMDUyCzHAO5ODkZpo7KB
   w==;
X-CSE-ConnectionGUID: zS03gCDgRtu4Gtv2yeaqLA==
X-CSE-MsgGUID: 246W+pgQQSm6W09f8e1uxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729857"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729857"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:36 -0700
X-CSE-ConnectionGUID: FarfZ5wjRnWBUVS+3Ykwaw==
X-CSE-MsgGUID: VlVB21HDQXGHMePrZIu6CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796477"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/17] ASoC: SOF: Intel: improve SoundWire support for
 LunarLake
Date: Tue,  2 Apr 2024 10:18:11 -0500
Message-Id: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VXCMOHGLSD25IBIAPCYZAACWQPRB5UIR
X-Message-ID-Hash: VXCMOHGLSD25IBIAPCYZAACWQPRB5UIR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXCMOHGLSD25IBIAPCYZAACWQPRB5UIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset contains important updates for SoundWire support.

We initially implemented support for multiple amplifiers on different
links using a single HDaudio DMA transfer. To align with the other OS,
the 'aggregation' is now supported by the firmware. This change in
directions has kernel impacts, since we now have multiple HDaudio DMAs
to program and start, but since there are no platforms released so far
there's no end-user impact.

In addition, the behavior in case of xruns is improved by clearing the
PCM states and better handling of the hw_free case.

Note that the hw_free support will compile but will only be functional
with the companion patch "soundwire: intel: add intel_free_stream() back"
already applied in the SoundWire tree.

Bard Liao (5):
  Revert "ASoC: SOF: Intel: hda-dai-ops: reset device count for
    SoundWire DAIs"
  Revert "ASoC: SOF: Intel: hda-dai-ops: only allocate/release streams
    for first CPU DAI"
  ASoC: SOF: make dma_config_tlv be an array
  ASoC: SOF: Intel: hda-dai: set lowest N bits in ch_mask
  ASoC: SOF: Intel: hda-dai: set dma_stream_channel_map device

Pierre-Louis Bossart (10):
  ASoC: SOF: Intel: hda-dai: fix channel map configuration for
    aggregated dailink
  ASoC: SOF: Intel: hda-dai: add helpers to set dai config
  ASoC: SOF: Intel: set the DMA TLV device as dai_index
  ASoC: SOF: Intel: hda: extend signature of sdw_hda_dai_hw_params()
  ASoC: SOF: IPC4: extend dai_data with node_id
  ASoC: SOF: Intel: hda: move helper to static inline
  ASoC: SOF: sof-audio: revisit sof_pcm_stream_free() error handling and
    logs
  ASoC: SOF: pcm: simplify sof_pcm_hw_free() with helper
  ASoC: SOF: pcm: add pending_stop state variable
  ASoC: SOF: pcm: reset all PCM sources in case of xruns

Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda: Clear Soundwire node ID during BE DAI hw_free
  ASoC: SOF: ipc4-topology: Save the ALH DAI index during hw_params

 sound/soc/sof/intel/hda-dai-ops.c |  41 +---------
 sound/soc/sof/intel/hda-dai.c     | 124 +++++++++++++++++++++++-------
 sound/soc/sof/intel/hda.c         |  29 ++++++-
 sound/soc/sof/intel/hda.h         |  11 ++-
 sound/soc/sof/ipc4-topology.c     |  62 ++++++++++-----
 sound/soc/sof/ipc4-topology.h     |   3 +-
 sound/soc/sof/pcm.c               |  58 +++++++-------
 sound/soc/sof/sof-audio.c         |  29 +++++--
 sound/soc/sof/sof-audio.h         |   2 +
 9 files changed, 232 insertions(+), 127 deletions(-)

-- 
2.40.1

