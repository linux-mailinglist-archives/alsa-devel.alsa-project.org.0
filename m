Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD47439E9C1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C03B1699;
	Tue,  8 Jun 2021 00:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C03B1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623106114;
	bh=sZpW1XxLdEWSR47quWfwdna2ic5oN/cRSah0FWlZau0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPjWjNnLdcygw4YWEILse/JPMC6wqxyZ7iS7SAkwvHfZ9zYUPDCXNxPhgWCZtdUYs
	 UcXyJ0OMPjpWAnZY6Sy7fgQTDlsvC2RHeOIMhqQ4haPQV2wklZ4oWLOoPt9wUrVK0Z
	 FRkuujhjYZ9E6dVZcbtAwM3urdQ7d/+rgoKvlyNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9794F804BD;
	Tue,  8 Jun 2021 00:47:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD0F2F8032D; Tue,  8 Jun 2021 00:47:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF069F800DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF069F800DF
IronPort-SDR: aAkAySJfov7JHQMGo7Q3B/vqq9eBAsqAec4TNnn9i0FSt78tSL8pFD7EXs9450Wo+IPqs4wgad
 lnzni8ozArcA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185102170"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185102170"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:47 -0700
IronPort-SDR: Zf+K+3mVLYaJ8ROT1aaUWWmsYvwuPJlrIE7iI6Oj2Zo1ruJqwgXuJFAXmRsHlgorXR2mAG978O
 3H2LFdW7dbgQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="637437073"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: Intel: machine driver corrections
Date: Mon,  7 Jun 2021 17:46:28 -0500
Message-Id: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Some of these patches dealing with Sparse warnings were submitted
earlier but not merged. I grouped them with a couple of fixes from
Kai.

Kai Vehmanen (3):
  ASoC: Intel: sof_sdw: use mach data for ADL RVP DMIC count
  ASoC: Intel: sof_sdw: remove hdac-hdmi support
  ASoC: Intel: skl_hda_dsp_generic: Update Kconfig documentation

Pierre-Louis Bossart (7):
  ASoC: Intel: sof_rt5682: shrink platform_id names below 20 characters
  ASoC: Intel: glk_rt5682_max98357a: shrink platform_id below 20
    characters
  ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20
    characters
  ASoC: Intel: sof_da7219_max98373: shrink platform_id below 20
    characters
  ASoC: Intel: sof_sdw: fix signed/unsigned warning
  ASoC: Intel: soc-acpi: add ull suffix for SoundWire _ADR values
  ASoC: Intel: use MODULE_DEVICE_TABLE with platform_device_id tables

 sound/soc/intel/boards/Kconfig                |  7 ++--
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  4 +-
 sound/soc/intel/boards/bxt_rt298.c            |  3 +-
 sound/soc/intel/boards/ehl_rt5660.c           |  2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  4 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  4 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  5 +--
 sound/soc/intel/boards/kbl_rt5660.c           |  2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  3 +-
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  2 +-
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  3 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  3 +-
 sound/soc/intel/boards/skl_rt286.c            |  3 +-
 sound/soc/intel/boards/sof_cs42l42.c          |  3 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |  6 +--
 sound/soc/intel/boards/sof_rt5682.c           | 20 +++-------
 sound/soc/intel/boards/sof_sdw.c              |  5 +--
 sound/soc/intel/boards/sof_sdw_common.h       |  1 -
 sound/soc/intel/boards/sof_sdw_hdmi.c         | 37 +-----------------
 .../intel/common/soc-acpi-intel-adl-match.c   | 28 +++++++-------
 .../intel/common/soc-acpi-intel-cml-match.c   | 20 +++++-----
 .../intel/common/soc-acpi-intel-cnl-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-glk-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-icl-match.c   | 12 +++---
 .../intel/common/soc-acpi-intel-jsl-match.c   |  6 +--
 .../intel/common/soc-acpi-intel-kbl-match.c   |  2 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   | 38 +++++++++----------
 27 files changed, 83 insertions(+), 144 deletions(-)

-- 
2.25.1

