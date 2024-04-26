Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995168B3B26
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93589DEC;
	Fri, 26 Apr 2024 17:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93589DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714144957;
	bh=Bc9QP0c31IBlHyJP5tGfFWIZJj8F1WYLFIKBuzXx+B8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pZiTuC815NFpzLlTbroxMHb0Bz6IuiNBZzcQ2EGZDiux22p/UrRA9GaoNdaMZ5+Nt
	 0ebtc3V447RCXjAFCZqd/qf7umlmvfsUPz5jmpbqWplxGIEg/ZXuLhfN5NNC/NQYHa
	 u/adFa6UeApaRVJCYnM9XEzkTBcVg8+dTXk1sfZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71425F805B1; Fri, 26 Apr 2024 17:21:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25070F805B2;
	Fri, 26 Apr 2024 17:21:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 145BEF80568; Fri, 26 Apr 2024 17:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2FA9F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2FA9F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c8UhPiHs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144904; x=1745680904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Bc9QP0c31IBlHyJP5tGfFWIZJj8F1WYLFIKBuzXx+B8=;
  b=c8UhPiHsKWrvi+VuxCTMHK8FHwNAtp0V4D+BSf6CU2maf7VLh1tqw1kK
   4Sdu4OvXW8zDgGwi5spz5VTjNOG7Y/Z/wZKkUIYDEYKa+QAE4krlcwsvu
   f+JDY6vFQQJ141FWqpiM42bFwa4x3KGf3etetVke3DCepgyS8I2wiGgEG
   BngI8hDC/7hVKL4zirep4/hdU5fppE5JASMGjYRMtNzoi9Ngdq2OJRd7H
   U25du8HBfariNbmaeTqlzRq+H7k55JPGehnVjfzn/s7HuXAINO8wqpV/l
   j8e2CjZzYdSPhMumlfoZTwfG9EBBBxAKSEuT2qmQDM/oESzOIINbsij/V
   w==;
X-CSE-ConnectionGUID: ikpeUpeNRrCtIv/x/keasg==
X-CSE-MsgGUID: SumTQooJRty6RTob6IptVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290587"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:38 -0700
X-CSE-ConnectionGUID: j/FPtnQIQ7+uUjz4L6M29Q==
X-CSE-MsgGUID: EKH9C/YiS6Wenei928mHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259021"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part5
Date: Fri, 26 Apr 2024 10:21:11 -0500
Message-Id: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EXVN5CBMBI3DQWGH7MBIFXKMKNQKVTMF
X-Message-ID-Hash: EXVN5CBMBI3DQWGH7MBIFXKMKNQKVTMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXVN5CBMBI3DQWGH7MBIFXKMKNQKVTMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset corrects a couple of mistakes corrected, improves
snd_soc_card allocation.  The new functionality is mostly for
SoundWire platforms, with new SKUs for Dell and Acer, and support for
the Cirrus Logic bridge/sidecar amplifier topology.

Bard Liao (1):
  ASoC: Intel: sof_sdw: add a space before cfg-amp in components

Charles Keepax (2):
  ASoC: Intel: sof_sdw: Delay update of the codec_conf array
  ASoC: Intel: sof_sdw: Add callbacks to register sidecar devices

Mac Chiang (1):
  ASoC: Intel: soc-acpi-intel-lnl-match: adds RT714 and RT1318 support

Maciej Strozek (1):
  ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps

Peter Ujfalusi (3):
  ASoC: Intel: skl_hda_dsp_generic: Allocate snd_soc_card dynamically
  ASoC: Intel: skl_hda_dsp_generic: Use devm_kasprintf for the
    components string
  ASoC: Intel: sof_sdw: Allocate snd_soc_card dynamically

Pierre-Louis Bossart (4):
  ASoC: Intel: soc-acpi: mtl: add Dell SKU 0C64 and 0CC6
  ASoC: Intel: soc-acpi: mtl: add support for Acer Swift Go 14
  ASoC: Intel: sof-sdw: don't set card long_name
  ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/Makefile               |   1 +
 sound/soc/intel/boards/bridge_cs35l56.c       | 137 ++++++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_common.h   |   1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  50 +++----
 sound/soc/intel/boards/sof_sdw.c              | 106 ++++++++------
 sound/soc/intel/boards/sof_sdw_common.h       |  27 ++++
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  14 +-
 .../intel/common/soc-acpi-intel-lnl-match.c   |  52 +++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  83 ++++++++++-
 10 files changed, 397 insertions(+), 75 deletions(-)
 create mode 100644 sound/soc/intel/boards/bridge_cs35l56.c

-- 
2.40.1

