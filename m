Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE176A328
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06CA382B;
	Mon, 31 Jul 2023 23:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06CA382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839850;
	bh=T7eZDF27bRlV7Ysq1nozDQWCv+2Itxzb3N/TMUzXoSs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JKkJLei/lkSZDo0k11sgxNAbWX5hsRmFh2W0yonNfQj28IgGfSvHq1X3vI9mvVMg2
	 1iepL6tz4SR+wBoX0drgrntvvqqlEXbK6aqIyUpcgR/ti0VuZQ0xDUF6r58L/OOpku
	 8hkp/fkcQkzKD9WBD5bZf75djzWStT38GizXz7ac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10321F80535; Mon, 31 Jul 2023 23:43:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95122F801D5;
	Mon, 31 Jul 2023 23:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B59B8F80425; Mon, 31 Jul 2023 23:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C391FF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C391FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ndN2BBRp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839792; x=1722375792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T7eZDF27bRlV7Ysq1nozDQWCv+2Itxzb3N/TMUzXoSs=;
  b=ndN2BBRpmm1gHRsv+oIW6XKz76+Kml/D0UxaTc4PfnmWnusZFxJBKcpy
   G/WnxSWEW784Zcvs/Gax/Awa4g0MAz9RZEZhBHCsUqffkw7GBsNU4YtUL
   e3BVW59XUxEwS0zzsWmb96giE/bwXvvUXf4oIlz4xUDAQQnhfBzK0X2sq
   ck/qt3XZ3HRsfJPtIBLHRt4fjOivhwKsmrAQaHq5ACnvb4eJNHQSZ16Qc
   wGEspBBOnI5Kege1eqCIFhbPyh69bGXsfvv7ZxRab3SFoin7Nx0NmvpKD
   0fTaXqnLU0c62apBuKdf8J3wNNiWFX1Tw2Bs9Nq/cXfdVXA/VuM3R/xJ8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449725"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449725"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523515"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523515"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/23] ASoC: Intel: machine driver updates for 6.6
Date: Mon, 31 Jul 2023 16:42:34 -0500
Message-Id: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IWMGLMSVEIGSWTVRSESCUSU2GRFGJNGO
X-Message-ID-Hash: IWMGLMSVEIGSWTVRSESCUSU2GRFGJNGO
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWMGLMSVEIGSWTVRSESCUSU2GRFGJNGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lots of small cleanups coming from Bard Liao and Charles Keepax for
SoundWire platforms, and minor additions for RVPs and Chromebooks.

Balamurugan C (1):
  ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at link 0 in RPL
    match table

Bard Liao (2):
  ASoC: Intel: sof_sdw: rename link_id to be_id
  ASoC: Intel: sof_sdw: break earlier when a adr link contains different
    codecs

Chao Song (1):
  ASoC: Intel: sof_sdw: add cs35l56 codec info

Charles Keepax (13):
  ASoC: intel: sof_sdw: Use consistent variable naming for links
  ASoC: intel: sof_sdw: Rename codec_idx to codec_dlc_index
  ASoC: intel: sof_sdw: Remove some extra line breaks
  ASoC: intel: sof_sdw: Use a module device table
  ASoC: intel: sof_sdw: Simplify find_codec_info_acpi
  ASoC: intel: sof_sdw: Constify parameter to find_codec_part_info
  ASoC: intel: sof_sdw: Minor tidy up of mc_probe
  ASoC: intel: sof_sdw: Remove redundant parameters in dai creation
  ASoC: intel: sof_sdw: Move amp_num initialisation to mc_probe
  ASoC: intel: sof_sdw: Allow direct specification of CODEC name
  ASoC: intel: sof_sdw: Clean up DAI link counting
  ASoC: intel: sof_sdw: Merge codec_conf_alloc into dailink_info
  ASoC: intel: sof_sdw: Move group_generated logic

Pierre-Louis Bossart (3):
  ASoC: Intel: sof_sdw: reorder SoundWire codecs in Kconfig
  ASoC: Intel: sof_sdw: allow mockup amplifier to provide feedback
  ASoC: Intel: sof_sdw: add support for SKU 0AFE

Terry Cheong (1):
  ASoC: Intel: sof_rt5682: add RPL support for MAX98357A speaker

Uday M Bhat (1):
  ASoC: Intel: sof_sdw: Update BT offload config for soundwire config

apoorv (1):
  ASoC: Intel: sof_rt5682 add support for HDMI_In capture

 sound/soc/intel/boards/Kconfig                |   5 +-
 sound/soc/intel/boards/Makefile               |   2 +-
 sound/soc/intel/boards/sof_rt5682.c           |  55 +++
 sound/soc/intel/boards/sof_sdw.c              | 404 +++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h       |   7 +
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  47 ++
 .../intel/common/soc-acpi-intel-adl-match.c   |   7 +
 .../intel/common/soc-acpi-intel-rpl-match.c   |  27 ++
 8 files changed, 342 insertions(+), 212 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs_amp.c

-- 
2.39.2

