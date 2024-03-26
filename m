Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438B688C882
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7047F2BC9;
	Tue, 26 Mar 2024 17:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7047F2BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469179;
	bh=wRhfhjToHakmSR9CRlNx8W6ivELTkONsuiwLnu/7+sU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eGeuOiDbrTJmBB10DvYE+rz1nTq3vyQkIrUP4zAaIuH/YRlnuSJtL5aaCSAaWBFuc
	 7aVNerbaP3UH3au/yiClavBnNzHKB5L2b0sDPsRX1gfY9lDj4zYX4X8NL/xKPEFqdv
	 DcLPdtq5frXrXWGVGfpD5FMX0bVCaUd8C4QUc424=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA29F805B3; Tue, 26 Mar 2024 17:05:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4CA4F80580;
	Tue, 26 Mar 2024 17:05:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92CC3F8057D; Tue, 26 Mar 2024 17:05:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 088DAF801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088DAF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MbQKIPkm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469126; x=1743005126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wRhfhjToHakmSR9CRlNx8W6ivELTkONsuiwLnu/7+sU=;
  b=MbQKIPkmHnjxFty4szXJVlzo6tZbus4sKyWnWZHggShTdcpmFnwpfnSz
   /XrZ/LzI9D1UJQF0ESMaL9dX500A0SBJq8Cyr2EtLBMYkPYOQO7Dsz7I+
   GcRXYf/I3I6XsLcA2UU6fX8SMIBI8XrGq1TBlq6/SZLf5E5vcTVRKbZZh
   dzCDPNU3YhRTPDxEV55bOBzrtnOBFUXMXF61hm0vSiNW53lq0C3BkDUBa
   oJ8bNNWL6ayCq+NIMEOt97KPdW/5ebgsaH/B5KA/xLio0ymOZ2r8jTEmN
   Ndj8qcZALWOFJrFeUqpTtecDRtCObeE7VY4DLC4OQnrvJOS8t6D0vMQ1+
   Q==;
X-CSE-ConnectionGUID: 8HfvzHbiT0aBdrl1sZ9SBA==
X-CSE-MsgGUID: DKNHdoY6SkGpS9fzSuAheA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260327"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482091"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/34]  ASoC: Intel: boards: updates for 6.10 - part2
Date: Tue, 26 Mar 2024 11:03:55 -0500
Message-Id: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RXH7SM2JMGPHHKXZV3YLHEAMCNWOAZJ5
X-Message-ID-Hash: RXH7SM2JMGPHHKXZV3YLHEAMCNWOAZJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXH7SM2JMGPHHKXZV3YLHEAMCNWOAZJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This second part provides SoundWire-related cleanups and extensions
required by Realtek RT722 and Cirrus Logic codecs.

Also included is a cleanup of the RT715-sdca DAI naming and new tables
for ACPI-based board detections.

Balamurugan C (1):
  ASoC: Intel: soc-acpi-intel-arl-match: Add rt711 sdca codec support

Bard Liao (7):
  ASoC: Intel: sof_sdw: use generic rtd_init function for Realtek SDW
    DMICs
  ASoC: Intel: sof_sdw: remove unused rt dmic rtd_init
  ASoC: Intel: sof_sdw_rt722_sdca: set rtd_init in codec_info_list[]
  ASoC: Intel: sof_sdw_rt722_sdca: use rt_dmic_rtd_init
  ASoC: rt715-sdca: rename dai name with rt715-sdca prefix
  ASoC: Intel: sof_sdw: change rt715-sdca dai name
  ASoC: Intel: change cs35l56 name_prefix

Charles Keepax (26):
  ASoC: intel: sof_sdw: Make find_codec_info_part() return a pointer
  ASoC: intel: sof_sdw: Make find_codec_info_acpi() return a pointer
  ASoC: intel: sof_sdw: Make find_codec_info_dai() return a pointer
  ASoC: intel: sof_sdw: Only pass codec_conf pointer around
  ASoC: intel: sof_sdw: Set channel map directly from endpoints
  ASoC: Intel: sof_sdw: Move get_codec_dai_by_name() into sof_sdw itself
  ASoC: Intel: sof_sdw: Move flags to private struct
  ASoC: Intel: sof_sdw: Only pass dai_link pointer around
  ASoC: Intel: sof_sdw: Use for_each_set_bit
  ASoC: Intel: sof_sdw: Factor out SSP DAI creation
  ASoC: Intel: sof_sdw: Factor out DMIC DAI creation.
  ASoC: Intel: sof_sdw: Factor out HDMI DAI creation
  ASoC: Intel: sof_sdw: Factor out BlueTooth DAI creation
  ASoC: Intel: sof_sdw: Factor out codec name generation
  ASoC: Intel: sof_sdw: Remove no longer supported quirk
  ASoC: intel: soc-acpi: Add missing cs42l43 endpoints
  ASoC: Intel: sof-sdw: Add new code for parsing the snd_soc_acpi
    structs
  ASoC: Intel: sof_sdw: Move counting and codec_conf to new parsing
  ASoC: Intel: sof_sdw: Move ignore_pch_dmic to new parsing
  ASoC: Intel: sof_sdw: Move append_dai_type to new parsing
  ASoC: Intel: sof_sdw: Move generation of DAI links to new parsing
  ASoC: intel: sof_sdw: Factor out SoundWire DAI creation
  ASoC: Intel: sof_sdw: Don't pass acpi_link_adr to init functions
  ASoC: Intel: sof_sdw: Remove redundant initialisations
  ASoC: Intel: sof_sdw: Add quirk for optional codec speakers
  ASoC: Intel: sof_sdw: Add support for cs42l43 optional speaker output

 sound/soc/codecs/rt715-sdca.c                 |    4 +-
 sound/soc/intel/boards/Kconfig                |    1 -
 sound/soc/intel/boards/Makefile               |    4 +-
 sound/soc/intel/boards/sof_board_helpers.c    |   18 -
 sound/soc/intel/boards/sof_board_helpers.h    |    3 -
 sound/soc/intel/boards/sof_sdw.c              | 1118 ++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h       |   42 +-
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |    1 -
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |   50 +
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |    1 -
 sound/soc/intel/boards/sof_sdw_maxim.c        |    1 -
 sound/soc/intel/boards/sof_sdw_rt5682.c       |    1 -
 sound/soc/intel/boards/sof_sdw_rt700.c        |    1 -
 sound/soc/intel/boards/sof_sdw_rt711.c        |    2 -
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |   25 -
 sound/soc/intel/boards/sof_sdw_rt715.c        |   26 -
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c   |   26 -
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |   38 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |    1 -
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |   54 +
 .../boards/sof_sdw_rt_sdca_jack_common.c      |    4 +-
 sound/soc/intel/boards/sof_ssp_common.h       |    7 -
 .../intel/common/soc-acpi-intel-arl-match.c   |   24 +
 .../intel/common/soc-acpi-intel-mtl-match.c   |   35 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   |   35 +-
 25 files changed, 753 insertions(+), 769 deletions(-)
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715.c
 delete mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt_dmic.c

-- 
2.40.1

