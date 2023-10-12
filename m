Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D77C7669
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:10:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2216B829;
	Thu, 12 Oct 2023 21:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2216B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137800;
	bh=Q8HZSVtvBQ0/zuT5D+O30G41fLyZtkNOA5vOioL+BNc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qiiKW5eStuF2g48xj3jMMP3Xd/nXMR7Eg5zC6bdilDkD2jwAOBYO8CJHJBT79OJqZ
	 Vdb9litxL+9AC136wNJaqKHI7q97TJKUQ6nSVxt22yFWUybdU6rXK5UpkjnNmPsY/i
	 +waA87jEi+CbPmzmaVg/z0mB4yj8GjF+8LjfjS4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D3F3F80570; Thu, 12 Oct 2023 21:09:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB325F80571;
	Thu, 12 Oct 2023 21:09:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B25FF8019B; Thu, 12 Oct 2023 21:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7B88F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B88F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TrhlBr/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137736; x=1728673736;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q8HZSVtvBQ0/zuT5D+O30G41fLyZtkNOA5vOioL+BNc=;
  b=TrhlBr/IMJQJ8wUCb/AxkVSGWiXtFZAJroX3OFK52M3IpkCR6BzZsSGn
   Z5hDPUJPPx0gaauKfhPj4ZRyDnC86V4oh7qems46A6P14/WBcK8pK38si
   B0Cma9hzZodnpK2/0dZzjQZrQRR4n8LvBvDl7fCcKEpHMJ+3lGperu0YX
   4s+EyDB6Dwuq+P2DnDEtg7p3wN9G8dQ4PKUteDzTjND2T3Ew/gGIdvy7Z
   BKXzxoWui+dzN7XGnawPqSlCsXAjjj4Ml98xC4kLTnz6icVJBKyelrF/Z
   03Xj4tF7B1r0WMZaw9qCvvSOTGm4VeMGv9vh8qIMMMgAvKSnRmuV9ex88
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060163"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060163"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108039"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108039"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/23] ASoC: Intel: boards: updates for 6.7
Date: Thu, 12 Oct 2023 15:08:03 -0400
Message-Id: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZA4374PZVQLRFUBLK2CCSALURCQV3PTS
X-Message-ID-Hash: ZA4374PZVQLRFUBLK2CCSALURCQV3PTS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZA4374PZVQLRFUBLK2CCSALURCQV3PTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A couple of new boards, one DMI quirk fix and a nice cleanup from
Brent Lu to make all HDMI stuff common across drivers.

Balamurugan C (1):
  ASoC: Intel: MTL: Add entry for HDMI-In capture support to non-I2S
    codec boards.

Bard Liao (4):
  ASoC: Intel: soc-acpi-intel-rpl-match: add rt711-l0-rt1316-l12 support
  ASoC: Intel: soc-acpi-intel-mtl-match: add rt713 rt1316 config
  ASoC: Intel: sof_sdw_rt_sdca_jack_common: add rt713 support
  ASoC: Intel: sof_sdw_rt712_sdca: construct cards->components by
    name_prefix

Brent Lu (17):
  ASoC: Intel: sof_cs42l42: remove hdac-hdmi support
  ASoC: Intel: sof_da7219: remove hdac-hdmi support
  ASoC: Intel: sof_nau8825: remove hdac-hdmi support
  ASoC: Intel: sof_rt5682: remove hdac-hdmi support
  ASoC: Intel: sof_ssp_amp: remove hdac-hdmi support
  ASoC: Intel: sof_hdmi: add common header for HDMI
  ASoC: Intel: sof_cs42l42: use sof_hdmi_private to init HDMI
  ASoC: Intel: sof_da7219: use sof_hdmi_private to init HDMI
  ASoC: Intel: sof_nau8825: use sof_hdmi_private to init HDMI
  ASoC: Intel: sof_rt5682: use sof_hdmi_private to init HDMI
  ASoC: Intel: sof_sdw: use sof_hdmi_private to init HDMI
  ASoC: Intel: sof_ssp_amp: use sof_hdmi_private to init HDMI
  ASoC: Intel: board_helpers: new module for common functions
  ASoC: Intel: sof_cs42l42: use common module for HDMI link
  ASoC: Intel: sof_nau8825: use common module for HDMI link
  ASoC: Intel: sof_rt5682: use common module for HDMI link
  ASoC: Intel: sof_ssp_amp: use common module for HDMI link

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_sdw: update HP Omen match

 sound/soc/intel/boards/Kconfig                |  11 +-
 sound/soc/intel/boards/Makefile               |   3 +
 sound/soc/intel/boards/sof_board_helpers.c    | 112 +++++++++++
 sound/soc/intel/boards/sof_board_helpers.h    |  54 +++++
 sound/soc/intel/boards/sof_cs42l42.c          | 184 +++---------------
 sound/soc/intel/boards/sof_da7219.c           |  40 ++--
 sound/soc/intel/boards/sof_hdmi_common.h      |  24 +++
 sound/soc/intel/boards/sof_nau8825.c          | 124 +++---------
 sound/soc/intel/boards/sof_rt5682.c           | 184 ++++--------------
 sound/soc/intel/boards/sof_sdw.c              |  14 +-
 sound/soc/intel/boards/sof_sdw_common.h       |   4 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c         |  30 +--
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |   6 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |   8 +
 sound/soc/intel/boards/sof_ssp_amp.c          | 176 ++++-------------
 .../intel/common/soc-acpi-intel-mtl-match.c   |  72 +++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   |  25 +++
 17 files changed, 458 insertions(+), 613 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_board_helpers.c
 create mode 100644 sound/soc/intel/boards/sof_board_helpers.h
 create mode 100644 sound/soc/intel/boards/sof_hdmi_common.h

-- 
2.39.2

